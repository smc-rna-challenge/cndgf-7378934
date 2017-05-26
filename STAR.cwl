arguments:
- {position: 0, prefix: --genomeDir, valueFrom: '$(inputs.index.listing[0].path)'}
baseCommand: [STAR]
class: CommandLineTool
cwlVersion: v1.0
doc: 'STAR: Alignment'
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/cndgf-7378934-star:1.0.0'}
inputs:
- id: align2
  inputBinding: {position: 13}
  type: ['null', int]
- id: align3
  inputBinding: {position: 14}
  type: ['null', int]
- id: align4
  inputBinding: {position: 15}
  type: ['null', int]
- id: alignIntronMax
  inputBinding: {position: 9, prefix: --alignIntronMax}
  type: ['null', int]
- id: alignMatesGapMax
  inputBinding: {position: 8, prefix: --alignMatesGapMax}
  type: ['null', int]
- id: alignSJDBoverhangMin
  inputBinding: {position: 7, prefix: --alignSJDBoverhangMin}
  type: ['null', int]
- id: alignSJstitchMismatchNmax
  inputBinding: {position: 12, prefix: --alignSJstitchMismatchNmax}
  type: ['null', int]
- id: chim2
  inputBinding: {position: 11}
  type: ['null', int]
- id: chimJunctionOverhangMin
  inputBinding: {position: 6, prefix: --chimJunctionOverhangMin}
  type: ['null', int]
- id: chimSegmentMin
  inputBinding: {position: 5, prefix: --chimSegmentMin}
  type: ['null', int]
- id: chimSegmentReadGapMax
  inputBinding: {position: 10, prefix: --chimSegmentReadGapMax}
  type: ['null', string]
- id: fastq1
  inputBinding: {position: 1, prefix: --readFilesIn}
  type: File
- id: fastq2
  inputBinding: {position: 2}
  type: File
- {id: index, type: Directory}
- id: limitBAMsortRAM
  inputBinding: {position: 17, prefix: --limitBAMsortRAM}
  type: ['null', string]
- id: outReadsUnmapped
  inputBinding: {position: 4, prefix: --outReadsUnmapped}
  type: ['null', string]
- id: outSAMsecond
  inputBinding: {position: 19}
  type: ['null', string]
- id: outSAMtype
  inputBinding: {position: 18, prefix: --outSAMtype}
  type: ['null', string]
- id: runThreadN
  inputBinding: {position: 16, prefix: --runThreadN}
  type: ['null', int]
- id: twopassMode
  inputBinding: {position: 3, prefix: --twopassMode}
  type: ['null', string]
outputs:
- id: output
  outputBinding: {glob: Chimeric.out.junction}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: ResourceRequirement, coresMin: 2, ramMin: 32000}
