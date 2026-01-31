process VARIANT_CALLING {
    container 'quay.io/biocontainers/bcftools:1.17--h3cc50cf_1'
    publishDir "${params.outdir}/variants", mode: 'copy'

    input:
    path bam
    path ref

    output:
    path "variants.vcf"

    script:
    """
    ${params.bcftools_bin} mpileup -f $ref $bam | bcftools call -mv -o variants.vcf
    """
}

