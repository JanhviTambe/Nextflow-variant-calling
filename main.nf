#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.fastq  = "data/sample.fastq"
params.ref    = "reference/chr22.fa"

include { FASTQC_RAW }      from './modules/fastqc_raw'
include { TRIM_READS }      from './modules/trim_reads'
include { FASTQC_TRIMMED }  from './modules/fastqc_trimmed'
include { ALIGN_READS }     from './modules/align_reads'
include { SAM_TO_BAM }      from './modules/sam_to_bam'
include { SORT_INDEX_BAM }  from './modules/sort_index_bam'
include { VARIANT_CALLING } from './modules/variant_calling'

workflow {
    
    fastq_ch = Channel.fromPath(params.fastq, checkIfExists: true)
    ref_ch   = Channel.fromPath(params.ref, checkIfExists: true)

    FASTQC_RAW(fastq_ch)
    trimmed = TRIM_READS(fastq_ch)
    FASTQC_TRIMMED(trimmed)
    aligned = ALIGN_READS(trimmed, ref_ch)
    bam = SAM_TO_BAM(aligned)
    sorted_obj = SORT_INDEX_BAM(bam)
    VARIANT_CALLING(sorted_obj.bam, ref_ch)
}
