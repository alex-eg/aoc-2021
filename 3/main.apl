⎕←'Part 1 result:', 2⊥(0=S)×2⊥S←⊃⊃0.5<(1÷≢A)×+⌿A←'1'=⊃⎕FIO[49]'input.txt'

⍝ Part 1 decompressed:
⍝ I←⎕FIO[49]'input.txt' ⍝ read file
⍝ A←'1'=⊃I ⍝ Create the matrix convert it to boolean, with trues where char equals '1'
⍝ C←(1÷≢A)×+/¨⊂⍉A ⍝ C is a row of average values in rows of the original matrix
⍝ S←0.5<C
⍝ ⎕←'Part 1 result:', 2⊥↑S × 2⊥↑ 0 = S

∇ A←MOSTFREQUENT MAT
  A←0.5≤(2⌷⍴MAT)÷⍨+/MAT
∇

∇ A←LEASTFREQUENT MAT
  A←0.5>(2⌷⍴MAT)÷⍨+/MAT
∇

∇ A←MAT NTHROW N; L
  L←2⌷⍴MAT
  N←N-1
  A←(L×N)↓(L×N+1)↑,MAT
∇

∇ A←MAT NTHCOL N
  A←⍉(⍉MAT NTHROW N)
∇

∇ A←FUN PART2 MAT; F; ANS; L; I
  ANS←MAT
  L←2⌷⍴MAT
  I←1
Do:
  F←⍎FUN, ' ANS'
  ANS←((I⌷F)=ANS NTHROW I)/ANS
  I←I+1
  →(1=2⌷⍴ANS)/Final
  →Do
Final:
  A←2⊥ANS
∇

B←⍉⊃A
O2←'MOSTFREQUENT' PART2 B
⎕←'O2', O2
CO2←'LEASTFREQUENT' PART2 B
⎕←'CO2', CO2
⎕←'Part 2 result:', O2×CO2
