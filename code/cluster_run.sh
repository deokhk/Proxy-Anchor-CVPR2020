#!/bin/bash

#SBATCH -J proxy_anchor_101_c # job name
#SBATCH -o sbatch_output_log/output_%x_%j.out # standard output and error log
#SBATCH -p titanxp # queue name or partiton name
#SBATCH -t 72:00:00 # Run time (hh:mm:ss)
#SBATCH  --gres=gpu:1
#SBATCH  --nodes=1
#SBATCH  --ntasks=1
#SBATCH  --tasks-per-node=1
#SBATCH  --cpus-per-task=2

srun -l /bin/hostname
srun -l /bin/pwd
srun -l /bin/date

ml purge
date
sh run-003.sh;
date