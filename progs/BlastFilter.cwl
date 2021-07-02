cwlVersion: v1.0
label: "BlastFilter"

class: CommandLineTool
baseCommand: MegaBlastFilter
arguments: ['-len', '50']
inputs:
  in:
    type: File
    inputBinding:
      position: 1

outputs:
  out:
    type: stdout

