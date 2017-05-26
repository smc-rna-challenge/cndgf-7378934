class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': cndgf@synapse.org,
  'foaf:name': cndgf}
doc: 'SMC-RNA challenge fusion detection submission

  Gene fusion detection workflow using STAR fusion (Thomas Yu, Ryan Spangler, Kyle
  Ellrot) and Chimerascan 0.4.5 (nccu/cn_chimerascan) - Requirements: 1- Download/untar
  SMC provided star_index.tar.gz (syn5987269) and chimerascan_bowtie1_index.tar.gz
  (syn7217759) 2- Create json/jaml input file using parameters specified in the workflow
  inputs section: csindex, starindex, fastq, fqstq2 eg. json: { ''csindex'': {''class'':
  ''File'',''path'': ''chimerascan_bowtie1_index.tar.gz''}. ''starindex'': {''class'':
  ''File'',''path'': ''star_index.tar.gz''}, ''TUMOR_FASTQ_1'': {''class'': ''File'',''path'':
  ''sim1_mergeSort_1.fq.gz''}, ''TUMOR_FASTQ_2'': {''class'': ''File'',''path'': ''sim1_mergeSort_2.fq.gz''}
  } - Usage: cwl-runner comb-workflow-v1.cwl your_input.json'
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: csindex, type: File}
- {id: starindex, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: result/fusionres, type: File}
steps:
- id: chimerascan
  in:
  - {id: csindex, source: cstar/output}
  - {id: fastq1, source: gunzip1/output}
  - {id: fastq2, source: gunzip2/output}
  - {default: sim, id: outputname}
  out: [csout]
  run: csv1.cwl
- id: converttobedpe
  in:
  - {id: input, source: starfusion/output}
  - {default: output.bedpe, id: output}
  out: [fusionout]
  run: converter.cwl
- id: cstar
  in:
  - {id: input, source: csindex}
  out: [output]
  run: tar.cwl
- id: gunzip1
  in:
  - {id: input, source: TUMOR_FASTQ_1}
  out: [output]
  run: gunzip.cwl
- id: gunzip2
  in:
  - {id: input, source: TUMOR_FASTQ_2}
  out: [output]
  run: gunzip.cwl
- id: result
  in:
  - {id: csin, source: chimerascan/csout}
  - {default: final, id: fusionout}
  - {id: starin, source: converttobedpe/fusionout}
  out: [fusionres]
  run: result.cwl
- id: star
  in:
  - {default: -1, id: align2}
  - {default: 5, id: align3}
  - {default: 5, id: align4}
  - {default: 200000, id: alignIntronMax}
  - {default: 200000, id: alignMatesGapMax}
  - {default: 10, id: alignSJDBoverhangMin}
  - {default: 5, id: alignSJstitchMismatchNmax}
  - {default: 3, id: chim2}
  - {default: 12, id: chimJunctionOverhangMin}
  - {default: 12, id: chimSegmentMin}
  - {default: parameter, id: chimSegmentReadGapMax}
  - {id: fastq1, source: gunzip1/output}
  - {id: fastq2, source: gunzip2/output}
  - {id: index, source: startar/output}
  - {default: '31532137230', id: limitBAMsortRAM}
  - {default: None, id: outReadsUnmapped}
  - {default: SortedByCoordinate, id: outSAMsecond}
  - {default: BAM, id: outSAMtype}
  - {default: 5, id: runThreadN}
  - {default: Basic, id: twopassMode}
  out: [output]
  run: STAR.cwl
- id: starfusion
  in:
  - {id: J, source: star/output}
  - {id: index, source: startar/output}
  - {default: starOut, id: output_dir}
  - {default: 5, id: threads}
  out: [output]
  run: STAR-fusion.cwl
- id: startar
  in:
  - {id: input, source: starindex}
  out: [output]
  run: tar.cwl
