process FASTQC_RAW {
    container 'quay.io/biocontainers/fastqc:0.12.1--hdfd78af_0'
    publishDir "${params.outdir}/fastqc/raw", mode: 'copy'

    input:
    path fastq

    output:
    path "*_fastqc.*"

    script:
    """
    fastqc $fastq
    """
}
