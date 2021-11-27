#!/bin/bash 
CUDA_VISIBLE_DEVICES=7,6 \
python train.py --gpu-id -1 \
                --loss Proxy_Anchor \
                --model resnet50 \
                --embedding-size 512 \
                --batch-size 180 \
                --lr 1e-4 \
                --dataset cub \
                --warm 1 \
                --bn-freeze 1 \
                --lr-decay-step 10