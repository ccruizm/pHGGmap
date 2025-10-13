#!/bin/bash

#SBATCH --job-name=nmf_job
#SBATCH --output=nmf_%A_%a.out
#SBATCH --error=nmf_%A_%a.err
#SBATCH --time=48:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=120GB
#SBATCH --partition=fat
#SBATCH --array=1-77  # Replace N with the number of unique samples

singularity exec --bind /projects/0/einf2548,/home/cruiz2/ \
                /projects/0/einf2548/shared/singularity_images/sc_genomics.sif Rscript \
                /projects/0/einf2548/cruiz/dmg/notebooks/nmf/scripts/myeloid/run_nmf.R ${SLURM_ARRAY_TASK_ID}