#!/bin/bash

#SBATCH -J proxy_anchor_256_1024 # job name
#SBATCH -o sbatch_output_log/output_%x_%j.out # standard output and error log
#SBATCH -p A100-pci # queue name or partiton name
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
sh run-017.sh;
sh run-018.sh;
sh run-019.sh;
sh run-020.sh;
sh run-021.sh;
sh run-022.sh;
sh run-023.sh;
sh run-024.sh;
sh run-41.sh;
sh run-42.sh;
sh run-43.sh;
sh run-44.sh;
sh run-45.sh;
sh run-46.sh;
sh run-47.sh;
sh run-48.sh;

date