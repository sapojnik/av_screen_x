#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  fasta: File
  blast_db: string
  blast_db_dir: string

outputs:
  filtered_hits:
    type: File
    outputSource: filter/filtered

steps:
  blast:
    run: vescreen.cwl
    in:
      query: fasta
      db: blast_db
      db_dir: blast_db_dir
      out_file_name: {default: 'vs_unfiltered.hit'}
    out: [out_file]

  filter:
    run: VecscreentFilter.cwl
    in:
      unfiltered: blast/out_file
      out_file_name: {default: 'vs_filtered.hit'}
    out: [filtered]
