process SAM_TO_BAM {
    container 'quay.io/biocontainers/samtools:1.17--h00cdaf9_0'
    publishDir "${params.outdir}/bam", mode: 'copy'

    input:
    path sam

    output:
    path "sample.bam"

    script:
    """
    ${params.samtools_bin} view -Sb $sam > sample.bam
    """
}
