process SORT_INDEX_BAM {
    container 'quay.io/biocontainers/samtools:1.17--h00cdaf9_0'
    publishDir "${params.outdir}//bam", mode: 'copy'

    input:
    path bam

    output:
    path "sample_sorted.bam", emit: bam
    path "sample_sorted.bam.bai", emit: bai

    script:
    """
    ${params.samtools_bin} sort $bam -o sample_sorted.bam
    ${params.samtools_bin} index sample_sorted.bam
    """
}
