#!/bin/bash

#SBATCH -J Proxy_anchor_1024 # job name
#SBATCH -o sbatch_output_log/output_%x_%j.out # standard output and error log
#SBATCH -p titanrtx # queue name or partiton name
#SBATCH -t 72:00:00 # Run time (hh:mm:ss)
#SBATCH  --gres=gpu:1
#SBATCH  --nodes=1
#SBATCH  --ntasks=1
#SBATCH  --tasks-per-node=1
#SBATCH  --cpus-per-task=4

srun -l /bin/hostname
srun -l /bin/pwd
srun -l /bin/date

ml purge 
date
sh run-041.sh;
sh run-042.sh;
sh run-043.sh;
sh run-044.sh;
sh run-045.sh;
sh run-046.sh;
sh run-047.sh;
sh run-048.sh;
date