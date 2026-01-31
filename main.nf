
include { MY_PIPELINE }  from './workflows/workflow.nf'

workflow {    
    fastq_ch = Channel.fromPath(params.fastq, checkIfExists: true)
    ref_ch   = Channel.fromPath(params.ref, checkIfExists: true)

    MY_PIPELINE(fastq_ch, ref_ch)
}
