process MULTIQC {
      container 'quay.io/biocontainers/multiqc:1.14--pyhdfd78af_0'
      publishDir "../results/multiqc", mode: 'copy'

      input:
      path '*' 

      output:
      path "multiqc_report.html"

      script:
      """
      multiqc .
      """
}
