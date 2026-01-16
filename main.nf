
params.fastq  = "data/sample.fastq"
params.ref    = "reference/chr22.fa"

include { MY_PIPELINE }  from './worklfow'

workflow {    
    fastq_ch = Channel.fromPath(params.fastq, checkIfExists: true)
    ref_ch   = Channel.fromPath(params.ref, checkIfExists: true)

    MY_PIPELINE(fastq_ch, ref_ch)
}
