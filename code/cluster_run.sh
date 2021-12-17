#!/bin/bash

#SBATCH -J proxy_anchor_BN_new_test # job name
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


date
sh run-025.sh;
sh run-026.sh;
sh run-027.sh;
sh run-028.sh;
sh run-029.sh;
sh run-030.sh;
sh run-031.sh;
sh run-033.sh;
sh run-034.sh;
sh run-035.sh;
sh run-036.sh;
sh run-037.sh;
sh run-038.sh;
sh run-039.sh;

date