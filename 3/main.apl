2⊥(0=S)×2⊥S←⊃⊃0.5<(1÷≢A)×+⌿A←'1'=⊃⎕FIO[49]'input.txt'

⍝ Part 1 decompressed:
⍝ I←⎕FIO[49]'input.txt' ⍝ read file
⍝ A←'1'=⊃I ⍝ Create the matrix convert it to boolean, with trues where char equals '1'
⍝ C←(1÷≢A)×+/¨⊂⍉A ⍝ C is a row of average values in rows of the original matrix
⍝ S←0.5<C
⍝ ⎕←'Part 1 result:', 2⊥↑S × 2⊥↑ 0 = S
