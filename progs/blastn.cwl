cwlVersion: v1.0
label: "blastn"

class: CommandLineTool
baseCommand: blastn
arguments: ['-outfmt', '6', '-perc_identity', '90.0']
requirements:
  EnvVarRequirement:
    envDef:
      BLASTDB: $(inputs.db_dir)

inputs:
  query:
    type: File
    inputBinding:
      prefix: -query
  db:
    type: string
    inputBinding:
      prefix: -db
  db_dir: string

# From https://www.commonwl.org/user_guide/rec-practices/:
# Don't overcomplicate your tool descriptions with options that you don't need/use.
#
#  evalue:
#    type: float?
#    default: 0.01
#    inputBinding:
#      prefix: -evalue
#  max_target_seqs:
#    type: int?
#    default: 250
#    inputBinding:
#      prefix: -max_target_seqs
#  soft_masking:
#    type: string?
#    default: 'true'
#    inputBinding:
#      prefix: -soft_masking
#  task:
#    type: string?
#    default: blastn
#    inputBinding:
#      prefix: -task
#  word_size:
#    type: int?
#    default: 12
#    inputBinding:
#      prefix: -word_size
#  best_hit_overhang:
#    type: float?
#    inputBinding:
#        prefix: -best_hit_overhang
#  best_hit_score_edge:
#    type: float?
#    inputBinding:
#        prefix: -best_hit_score_edge
#  dust:
#    type: string?
#    inputBinding:
#        prefix: -dust
#  perc_identity:
#    type: float?
#    inputBinding:
#      prefix: -perc_identity
  out_file_name:
    type: string?
    default: '-'
    inputBinding:
      prefix: -out

outputs:
  out_file:
    type: File
    outputBinding:
      glob: $(inputs.out_file_name)

