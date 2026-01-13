process ALIGN_READS {
    container 'quay.io/biocontainers/bwa:0.7.17--hed695b0_7'
    publishDir "../results/alignment", mode: 'copy'

    input:
    path trimmed
    path ref

    output:
    path "sample_aligned.sam"

    script:
    """
    bwa index $ref
    bwa mem $ref $trimmed > sample_aligned.sam
    """
}
