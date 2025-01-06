in =: <;._1 LF,1!:1<'small.in'
in =: <;._1 LF,1!:1<'input/19a.in'
X =: >{.in
in =: >2}.in
X =: X$~_2+{:$in
LR =: 1 2 5 0 4 8 3 6 7 ,: 3 0 1 6 4 2 7 8 5
NB. x is L or R y is index
R =: {{in ixs}~ (LR{~'LR'i.x) { in{~ixs=.<"1,/(i.3),"0/y+i:1}}
D =: 3 : 0
for_i. i.#X do.
 in =: (i{X) R 1+i
end.
)
D ''
