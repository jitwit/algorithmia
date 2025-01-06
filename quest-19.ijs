in =: <;._1 LF,1!:1<'small.in'
in =: <;._1 LF,1!:1<'input/19a.in'
X =: >{.in
in =: >2}.in
X =: X$~_2+{:$in
LR =: 1 2 5 0 4 8 3 6 7 ,: 3 0 1 6 4 2 7 8 5
R =: {{u ixs}~ (LR{~'LR'i.x) { u{~ixs=.<"1 y+"1,/,"0/~i:1}}
D =: {{ ixs=.(1+[:,/,"0/&i.&(_2&+))/$y
        b=.#ins=.x$~#ixs
        for_i. i.#ins do. y =. (ins{~b|i) y R ixs{~b|i end. }}
X D in

in =: <;._1 LF,1!:1<'input/19b.in'
X =: >{.in
in =: >2}.in
B =: {{ ixs=.(1+[:,/,"0/&i.&(_2&+))/$y
        b=.#ins=.X$~#ixs
        for_i. i.100*#ins do. y =. (ins{~b|i) y R ixs{~b|i end. }}
X&D^:100 in

load'algorithmia.ijs'
in =: <;._1 LF,1!:1<'input/19c.in'
X =: >{.in
in =: >2}.in
NB. first ideas: brent on whole the lcm of brent on each square... slow!
NB. new idea, view thing as permutation of itself, ie, fill it with
NB. ints and see what 1 step of process amounts to as a permutation
NB. then take calculate power of permuation in log(N) time.
lim =: 1048576000
rho =:,X D ($$[:i.(*/)@$) in
($in)$(C./(|.#:lim)#C.~^:(i.##:lim)rho)C.,in
