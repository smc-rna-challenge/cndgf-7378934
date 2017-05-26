baseCommand: [fusion.pl]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: csin
  inputBinding: {position: 2}
  type: File
- {id: fusionout, type: string}
- id: starin
  inputBinding: {position: 1}
  type: File
outputs:
- id: fusionres
  outputBinding: {glob: $(inputs.fusionout+'.bedpe')}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: nccu/cn_chimerascan}
- class: EnvVarRequirement
  envDef:
  - {envName: PYTHONPATH, envValue: /opt/chimerascan/lib64/python2.7/site-packages}
  - {envName: PATH, envValue: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bowtie:/opt/chimerascan/bin:/work'}
stdout: $(inputs.fusionout+'.bedpe')
