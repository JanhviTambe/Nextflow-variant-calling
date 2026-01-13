process VARIANT_CALLING {
    container 'quay.io/biocontainers/bcftools:1.17--h3cc50cf_1'
    publishDir "../results/variants", mode: 'copy'

    input:
    path bam
    path ref

    output:
    path "variants.vcf"

    script:
    """
    bcftools mpileup -f $ref $bam | bcftools call -mv -o variants.vcf
    """
}

