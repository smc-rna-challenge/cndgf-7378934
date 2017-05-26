arguments:
- {position: 0, valueFrom: '$(inputs.csindex.listing[0].path)'}
baseCommand: [/opt/chimerascan/bin/chimerascan_run.py]
class: CommandLineTool
cwlVersion: v1.0
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/cndgf-7378934-cn_chimerascan:1.0.0'}
inputs:
- {id: csindex, type: Directory}
- id: fastq1
  inputBinding: {position: 1}
  type: File
- id: fastq2
  inputBinding: {position: 2}
  type: File
- id: outputname
  inputBinding: {position: 3}
  type: string
outputs:
- id: csout
  outputBinding: {glob: $(inputs.outputname+'/chimeras.bedpe')}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
