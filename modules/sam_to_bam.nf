process SAM_TO_BAM {
    container 'quay.io/biocontainers/samtools:1.17--h00cdaf9_0'
    publishDir "../results/bam", mode: 'copy'

    input:
    path sam

    output:
    path "sample.bam"

    script:
    """
    samtools view -Sb $sam > sample.bam
    """
}
