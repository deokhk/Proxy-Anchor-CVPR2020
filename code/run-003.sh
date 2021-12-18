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
                --gd_config SMG \
                --fusion_type concat \
                --experiment_name resnet101_cgd_concat
