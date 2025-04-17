# DeepFastGBS
A high-throughput genotyping-by-sequencing (GBS) pipeline integrating DeepVariant and GLnexus for accurate variant calling in plant genomics.




DeepFastGBS is an enhanced version of the FastGBS pipeline that integrates Google's DeepVariant for superior variant calling accuracy. This pipeline streamlines the processing of genotyping-by-sequencing (GBS) data, from raw sequences to high-quality variant calls.

## Features

- Complete GBS data processing pipeline
- Integration with DeepVariant for accurate variant calling
- GLnexus-based cohort variant calling
- Support for both single-end and paired-end sequencing
- Automatic handling of ILLUMINA and IONTORRENT data
- Parallel processing capabilities
- Comprehensive logging and quality control
- Automated sample filtering based on read depth
- Built-in imputation using BEAGLE 5.0

## Prerequisites

- Linux operating system
- Singularity (for running DeepVariant and GLnexus containers)
- Required software modules:
  - sabre (v1.000)
  - cutadapt (v3.2)
  - bwa (v0.7.17)
  - samtools (v1.8)
  - vcftools (v0.1.16)
  - java (v1.8.0)
  - beagle (v5.0)
  - python (v3.7)
  - htslib (v1.8)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/FastGBS-DV.git
cd FastGBS-DV
```

2. Make the scripts executable:
```bash
chmod +x fastgbs_dv.sh
chmod +x Summary4VCF.py
```

## Usage

1. Configure your parameters in `parameters_V2.txt`:
```bash
; Edit parameters according to your data
LOGFILE=logfile_fastgbs.log
FLOWCELL=your_flowcell_id
...
```

2. Run the pipeline using SLURM:
```bash
sbatch SLURM_GBS.sh
```

Or run directly:
```bash
./fastgbs_dv.sh parameters_V2.txt
```

## Pipeline Steps

1. Demultiplexing (sabre)
2. Adapter trimming (cutadapt)
3. Read alignment (BWA-MEM)
4. BAM processing (samtools)
5. Variant calling (DeepVariant)
6. Variant merging (GLnexus)
7. Variant filtering and imputation (vcftools, BEAGLE)
8. Summary statistics generation

## Output Files

- Demultiplexed and trimmed FASTQ files
- Aligned BAM files
- Variant calls in VCF format
- Imputed genotypes
- Summary statistics for variants and samples

## Configuration

The pipeline is configured through the `parameters_V2.txt` file. Key parameters include:

- Sequencing technology (ILLUMINA/IONTORRENT)
- Sequence type (SE/PE)
- Reference genome
- Processing threads
- DeepVariant model type
- GLnexus settings
