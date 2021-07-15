cwlVersion: v1.0
label: "vecscreen"

class: CommandLineTool
baseCommand: vecscreen
arguments: ['-f', '3']
requirements:
  EnvVarRequirement:
    envDef:
      BLASTDB: $(inputs.db_dir)

inputs:
  query:
    type: File
    inputBinding:
      prefix: -i
  db:
    type: string
    inputBinding:
      prefix: -d
  db_dir: string

  out_file_name:
    type: string?
    default: '-'
    inputBinding:
      prefix: -o

outputs:
  out_file:
    type: File
    outputBinding:
      glob: $(inputs.out_file_name)

