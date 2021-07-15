cwlVersion: v1.0
label: "VecscreentFilter"

class: CommandLineTool
baseCommand: VSlistTo1HitPerLine.awk
arguments: ['suspect=0', 'weak=0', 'no_hits=0']

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
