#!/bin/bash

#SBATCH -J GBS
#SBATCH -o gbs-%j.out
#SBATCH -c 4
#SBATCH --mail-type=ALL
#SBATCH --mail-user=<put your email here>
#SBATCH --time=1-00:00
#SBATCH --mem=25G

# Basic tools
module load sabre/1.000
module load cutadapt/3.2
module load bwa/0.7.17
module load samtools/1.8
module load vcftools/0.1.16
module load java/jdk/1.8.0_102
module load beagle/5.0
module load python/3.7
module load htslib/1.8

# Required for DeepVariant/GLnexus
module load singularity

ulimit -S -n 40000

./fastgbs_dv.sh parameters_DV.txt
