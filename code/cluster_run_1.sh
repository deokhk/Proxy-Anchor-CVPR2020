#!/bin/bash

#SBATCH -J proxy_anchor_64_128 # job name
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
sh run-001.sh;
sh run-002.sh;
sh run-003.sh;
sh run-004.sh;
sh run-005.sh;
sh run-006.sh;
sh run-007.sh;
sh run-008.sh;
sh run-009.sh;
sh run-010.sh;
sh run-011.sh;
sh run-012.sh;
sh run-013.sh;
sh run-014.sh;
sh run-015.sh;
sh run-016.sh;

date