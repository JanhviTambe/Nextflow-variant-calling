process FASTQC_TRIMMED {
    container 'quay.io/biocontainers/fastqc:0.12.1--hdfd78af_0'
    publishDir "${params.outdir}/fastqc/trimmed", mode: 'copy'

    input:
    path trimmed

    output:
    path "*_fastqc.*"

    script:
    """
    fastqc $trimmed
    """
}

