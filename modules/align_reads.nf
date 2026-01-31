process ALIGN_READS {
    container 'quay.io/biocontainers/bwa:0.7.17--hed695b0_7'
    publishDir "${params.outdir}/alignment", mode: 'copy'

    input:
    path trimmed
    path ref

    output:
    path "sample_aligned.sam"

    script:
    """
    ${params.bwa_bin} index $ref
    ${params.bwa_bin} mem $ref $trimmed > sample_aligned.sam
    """
}
