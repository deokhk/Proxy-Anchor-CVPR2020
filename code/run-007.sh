#!/bin/bash 
python train.py --gpu-id -1 \
                --loss Proxy_Anchor \
                --model googlenet_cgd \
                --embedding-size 512 \
                --batch-size 120 \
                --lr 1e-4 \
                --dataset cub \
                --warm 5 \
                --bn-freeze 1 \
                --lr-decay-step 5 \
                --gd_config SG \ 
                --experiment_name googlenet_SG
