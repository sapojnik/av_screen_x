#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

requirements:
  - class: ScatterFeatureRequirement
  - class: SubworkflowFeatureRequirement

#  - class: InlineJavascriptRequirement

inputs:
  fasta: File
  blast_dbs: string[]
  blast_db_dir: string

outputs:
  calls:
    type: File
    outputSource: make_calls/calls

steps:
  blast_and_filter:
    run: blast_and_filter_workflow.cwl
    scatter: blast_db
    in:
      fasta: fasta
      blast_db: blast_dbs
      blast_db_dir: blast_db_dir
    out: [filtered_hits]
  make_calls:
    run: make_calls.cwl
    in:
      hit_files: blast_and_filter/filtered_hits
      out_file_name: {default: 'combined.calls'}
    out: [calls]

