# Variant Calling Pipeline (Nextflow)

This repository contains a complete single-end variant calling pipeline automated using **Nextflow**.  
The pipeline identifies SNPs and small INDELs by comparing sequencing reads against a reference genome.

---

## Input Files
- Single-end FASTQ file (`sample.fastq`)
- Reference genome FASTA (`chr22.fa`)

---

## Tools Used
- FastQC
- Cutadapt
- BWA
- Samtools
- BCFtools
- Nextflow

---

## Pipeline Steps

### 1. Initial Quality Control
Quality assessment of raw sequencing reads using **FastQC**.

### 2. Adapter Trimming
Removal of Illumina adapter sequences using **Cutadapt**.

### 3. Quality Control After Trimming
Quality reassessment of trimmed reads using **FastQC**.

### 4. Read Alignment
Alignment of cleaned reads to the reference genome using **BWA-MEM**.

### 5. SAM to BAM Conversion
Conversion of SAM alignment file to BAM format using **Samtools view**.

### 6. BAM Sorting and Indexing
Sorting and indexing of BAM file using **Samtools sort** and **Samtools index**.

### 7. Variant Calling
Identification of SNPs and small INDELs using **BCFtools mpileup** and **BCFtools call**.

---

## Output Files
- FastQC HTML and ZIP reports
- Trimmed FASTQ file
- Aligned SAM and BAM files
- Sorted and indexed BAM file
- Variant Call Format (VCF) file

---

## How to Run

1. Setup
Ensure you have Nextflow and Docker installed. Place your input data in the appropriate folders:

     Raw reads: data/sample.fastq
     Reference: reference/chr22.fa


2. Execute Pipeline
Run the pipeline from the project root directory:

     nextflow run main.nf


3. Resume Execution
If the pipeline stops or you need to re-run it after a change, use the -resume flag to skip successfully completed steps:

     nextflow run main.nf -resume
