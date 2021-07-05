cwlVersion: v1.0
label: "BlastFilter"

class: CommandLineTool
baseCommand: MegaBlastFilter
arguments: ['-len', '50']
inputs:
  unfiltered:
    type: File
    inputBinding:
      position: 1
  out_file_name:
    type: string

outputs:
  filtered:
    type: stdout

stdout: $(inputs.out_file_name)
