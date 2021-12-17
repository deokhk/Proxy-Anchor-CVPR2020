#!/bin/bash 
python train.py --gpu-id -1 \
                --loss Proxy_Anchor \
                --model resnet50_cgd \
                --embedding-size 64 \
                --batch-size 120 \
                --lr 1e-4 \
                --dataset cub \
                --warm 5 \
                --bn-freeze 1 \
                --lr-decay-step 5 \
                --gd_config SMG \
                --use_addition_for_GD True \
                --experiment_name resnet50_cgd_addition_64
