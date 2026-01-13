process TRIM_READS {
    container 'quay.io/biocontainers/cutadapt:4.4--py39hf95cd2a_1'
    publishDir "${params.outdir}/trimmed", mode: 'copy'

    input:
    path fastq

    output:
    path "sample_trimmed.fastq"

    script:
    """
    cutadapt -a AGATCGGAAGAGC -o sample_trimmed.fastq $fastq
    """
}
