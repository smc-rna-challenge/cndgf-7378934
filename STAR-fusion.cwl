arguments:
- {position: 0, prefix: --genome_lib_dir, valueFrom: '$(inputs.index.listing[0].path)'}
baseCommand: [STAR-Fusion]
class: CommandLineTool
cwlVersion: v1.0
doc: STAR Fusion Detection
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/cndgf-7378934-star:1.0.0'}
inputs:
- id: J
  inputBinding: {position: 1, prefix: -J}
  type: File
- {id: index, type: Directory}
- id: output_dir
  inputBinding: {position: 2, prefix: --output_dir}
  type: string
- id: threads
  inputBinding: {position: 2, prefix: --CPU}
  type: ['null', int]
outputs:
- id: output
  outputBinding: {glob: $(inputs.output_dir+'/star-fusion.fusion_candidates.final.abridged')}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
