#!/bin/bash
#SBATCH --job-name=f250_Re4K_86K      # Job name
#SBATCH --output=f250_Re4K_86K.out     # Standard output and error log
#SBATCH --error=f250_Re4K_86K.err      # Error log
#SBATCH --nodes=1                   # Number of nodes
#SBATCH --ntasks=1                  # Number of tasks (processes)
#SBATCH --cpus-per-task=32           # Number of CPU cores per task
#SBATCH --time=10:00:00            # Time limit (hh:mm:ss)
#SBATCH --partition=long  # Specify your partition
#SBATCH --qos=long

# Load necessary modules
module load codes/Ansys-2024R1               # Adjust based on your module file
cd $SLURM_SUBMIT_DIR

# mkdir -p results
# Run ANSYS
#fluent 2ddp -g t4 -b -i f250_Re4K_86K.h5 -o SJ_output1.txt
# fluent 2ddp -g  -t16 -i journal.jou > SJ_output1.txt 2>&1
fluent 2ddp -g -t32 -cflush -i journal.jou > f250_Re4K_86K.txt 2>&1


# Optionally check output
cat f250_Re4K_86K.txt
