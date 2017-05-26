baseCommand: [gunzip, -c]
class: CommandLineTool
cwlVersion: v1.0
doc: 'command line: gunzip. Note: gunzip is not a well behaved program by CWL standards.
  It creates a file in the input directory (not the output directory) and deletes
  the original file. Both of these are generally not allowed by CWL. This is a version
  of gunzip wrapper that works.'
hints: []
inputs:
- id: input
  inputBinding: {position: 1}
  type: File
outputs:
- id: output
  outputBinding: {glob: '$(inputs.input.path.split("/").slice(-1)[0].split(".").slice(0,-1).join("."))'}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
stdout: $(inputs.input.path.split("/").slice(-1)[0].split(".").slice(0,-1).join("."))
