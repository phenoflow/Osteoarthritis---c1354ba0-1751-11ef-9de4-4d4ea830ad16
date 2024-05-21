cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  osteoarthritis-excl-spine-joint---primary:
    run: osteoarthritis-excl-spine-joint---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  osteoarthritis-excl-spine-osteoarthrosis---primary:
    run: osteoarthritis-excl-spine-osteoarthrosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-joint---primary/output
  osteoarthritis-excl-spine-specified---primary:
    run: osteoarthritis-excl-spine-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-osteoarthrosis---primary/output
  unilateral-osteoarthritis-excl-spine---primary:
    run: unilateral-osteoarthritis-excl-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-specified---primary/output
  osteoarthritis-excl-spine-forearm---primary:
    run: osteoarthritis-excl-spine-forearm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: unilateral-osteoarthritis-excl-spine---primary/output
  pelvic-osteoarthritis-excl-spine---primary:
    run: pelvic-osteoarthritis-excl-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-forearm---primary/output
  osteoarthritis-excl-spine---primary:
    run: osteoarthritis-excl-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: pelvic-osteoarthritis-excl-spine---primary/output
  primary-osteoarthritis-excl-spine---primary:
    run: primary-osteoarthritis-excl-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine---primary/output
  arthropathy-osteoarthritis-excl-spine---primary:
    run: arthropathy-osteoarthritis-excl-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: primary-osteoarthritis-excl-spine---primary/output
  osteoarthritis-excl-spine-heberdens---primary:
    run: osteoarthritis-excl-spine-heberdens---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: arthropathy-osteoarthritis-excl-spine---primary/output
  osteoarthritis-excl-spine-coxarthrosis---primary:
    run: osteoarthritis-excl-spine-coxarthrosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-heberdens---primary/output
  osteoarthritis-excl-spine-ankle---primary:
    run: osteoarthritis-excl-spine-ankle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-coxarthrosis---primary/output
  osteoarthritis-excl-spine-gonarthrosis---primary:
    run: osteoarthritis-excl-spine-gonarthrosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-ankle---primary/output
  osteoarthritis-excl-spine-polyarthrosis---primary:
    run: osteoarthritis-excl-spine-polyarthrosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-gonarthrosis---primary/output
  osteoarthritis-excl-spine-wrist---primary:
    run: osteoarthritis-excl-spine-wrist---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-polyarthrosis---primary/output
  secondary-osteoarthritis-excl-spine---primary:
    run: secondary-osteoarthritis-excl-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-wrist---primary/output
  osteoarthritis-excl-spine-elbow---primary:
    run: osteoarthritis-excl-spine-elbow---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: secondary-osteoarthritis-excl-spine---primary/output
  osteoarthritis-excl-spine-finger---primary:
    run: osteoarthritis-excl-spine-finger---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-elbow---primary/output
  multiple-osteoarthritis-excl-spine---primary:
    run: multiple-osteoarthritis-excl-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-finger---primary/output
  osteoarthritis---primary:
    run: osteoarthritis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: multiple-osteoarthritis-excl-spine---primary/output
  other-osteoarthritis-excl-spine---primary:
    run: other-osteoarthritis-excl-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: osteoarthritis---primary/output
  osteoarthritis-excl-spine-bouchard---primary:
    run: osteoarthritis-excl-spine-bouchard---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: other-osteoarthritis-excl-spine---primary/output
  lower-osteoarthritis-excl-spine---primary:
    run: lower-osteoarthritis-excl-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-bouchard---primary/output
  osteoarthritis-excl-spine-generalised---primary:
    run: osteoarthritis-excl-spine-generalised---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: lower-osteoarthritis-excl-spine---primary/output
  osteoarthritis-excl-spine-shoulder---primary:
    run: osteoarthritis-excl-spine-shoulder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-generalised---primary/output
  osteoarthritis-excl-spine-history---primary:
    run: osteoarthritis-excl-spine-history---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule27
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-shoulder---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule28
      potentialCases:
        id: potentialCases
        source: osteoarthritis-excl-spine-history---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
  inputModule27:
    id: inputModule27
    doc: Python implementation unit
    type: File
  inputModule28:
    id: inputModule28
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
