#!/bin/bash
# You need to modify the dataset path. 
CPICKLE_DIR="/vol/vssp/msos/audioset/packed_features"

# You can to modify to your own workspace. 
WORKSPACE=`pwd`

# Train & predict. 
THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 python main.py train --cpickle_dir=$CPICKLE_DIR --workspace=$WORKSPACE

# Compute averaged stats. 
python main.py get_avg_stats --cpickle_dir=$CPICKLE_DIR --workspace=$WORKSPACE

###
# If you extracted feature for new audio, you may do prediction using:
THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 python predict_new.py --workspace=$WORKSPACE --model_name=md20000_iters.p
