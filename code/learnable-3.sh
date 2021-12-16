#!/bin/bash 
python train.py --gpu-id -1 \
                --loss Proxy_Anchor \
                --model resnet50_learnable-3 \
                --embedding-size 512 \
                --batch-size 120 \
                --lr 1e-4 \
                --dataset cub \
                --warm 5 \
                --bn-freeze 1 \
                --lr-decay-step 5 \
                --experiment_name rtx_resnet101_plain