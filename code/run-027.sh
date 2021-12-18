#!/bin/bash 
python train.py --gpu-id -1 \
                --loss Proxy_Anchor \
                --model bn_inception_cgd \
                --embedding-size 512 \
                --batch-size 180 \
                --lr 1e-4 \
                --dataset cub \
                --warm 1 \
                --bn-freeze 1 \
                --lr-decay-step 10 \
                --gd_config SG \
                --experiment_name cse_bn_inception_cgd_new_version_SG