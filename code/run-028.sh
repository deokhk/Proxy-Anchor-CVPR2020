#!/bin/bash 
python train.py --gpu-id 0 \
                --loss Proxy_Anchor \
                --model resnet101_cgd \
                --embedding-size 512 \
                --batch-size 120 \
                --lr 1e-4 \
                --dataset cub \
                --warm 5 \
                --bn-freeze 1 \
                --lr-decay-step 5 \
                --gd_config sg \
                --experiment_name rtx_resnet101_cgd-sg
