
include { FASTQC_RAW }      from '../modules/fastqc_raw'
include { TRIM_READS }      from '../modules/trim_reads'
include { FASTQC_TRIMMED }  from '../modules/fastqc_trimmed'
include { ALIGN_READS }     from '../modules/align_reads'
include { SAM_TO_BAM }      from '../modules/sam_to_bam'
include { SORT_INDEX_BAM }  from '../modules/sort_index_bam'
include { VARIANT_CALLING } from '../modules/variant_calling'
include { MULTIQC }         from '../modules/multiqc'

workflow MY_PIPELINE {
    take:
        fastq_input
        ref_input

    main:
        raw_qc      = FASTQC_RAW(fastq_input)
        trimmed_fq  = TRIM_READS(fastq_input)
        trimmed_qc  = FASTQC_TRIMMED(trimmed_fq)
        aligned_sam     = ALIGN_READS(trimmed_fq, ref_input)
        raw_bam         = SAM_TO_BAM(aligned_sam)
        sorted_bam_obj  = SORT_INDEX_BAM(raw_bam)
        vcf_results  = VARIANT_CALLING(sorted_bam_obj.bam, ref_input)

        all_qc_logs = raw_qc.mix(trimmed_qc).mix(vcf_results).collect()
        MULTIQC(all_qc_logs)
}
