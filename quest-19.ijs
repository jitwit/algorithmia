in =: <;._1 LF,1!:1<'small.in'
in =: <;._1 LF,1!:1<'input/19a.in'
X =: >{.in
in =: >2}.in
X =: X$~_2+{:$in
LR =: 1 2 5 0 4 8 3 6 7 ,: 3 0 1 6 4 2 7 8 5
R =: {{u ixs}~ (LR{~'LR'i.x) { u{~ixs=.<"1 y+"1,/,"0/~i:1}}
A =: {{for_i. i.#X do. y =. (i{X) y R 1,1+i end.}}
A in

in =: <;._1 LF,1!:1<'input/19b.in'
X =: >{.in
in =: >2}.in
B =: {{ ixs=.(1+[:,/,"0/&i.&(_2&+))/$y
        b=.#ins=.X$~#ixs
        for_i. i.100*#ins do. y =. (ins{~b|i) y R ixs{~b|i end. }}
B in
