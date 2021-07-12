#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: "file concatenation"


baseCommand: cat

inputs:
  hit_files:
    type: File[]
    inputBinding:
      position: 1
  out_file_name:
    type: string

outputs:
  calls:
    type: stdout

stdout: $(inputs.out_file_name)
