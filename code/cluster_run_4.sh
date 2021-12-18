#!/bin/bash

#SBATCH -J bn_inception_new # job name
#SBATCH -o sbatch_output_log/output_%x_%j.out # standard output and error log
#SBATCH -p titanxp # queue name or partiton name
#SBATCH -t 72:00:00 # Run time (hh:mm:ss)
#SBATCH  --gres=gpu:2
#SBATCH  --nodes=1
#SBATCH  --ntasks=1
#SBATCH  --tasks-per-node=1
#SBATCH  --cpus-per-task=4

srun -l /bin/hostname
srun -l /bin/pwd
srun -l /bin/date

ml purge 
date
sh run-025.sh;
sh run-026.sh;
sh run-027.sh;
sh run-028.sh;
sh run-029.sh;
sh run-030.sh;
sh run-031.sh;

date