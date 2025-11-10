in =: >2}.in [X =: >{. in =: <;._1 LF,1!:1<'input/19a.in'
LR =: (;|.) 0 1 2 5 8 7 6 3 NB. L,R rotations represented as cycles
R =: {{u ixs}~ (LR{~'LR'i.x) C. u{~ixs=.<"1 y+"1,/,"0/~i:1}}
D =: {{b =. # ins=. x$~# ixs=.(1+[:,/,"0/&i.&(_2&+))/$y
       for_i. i.b do. y =. (ins{~b|i) y R ixs{~b|i end.}}
X D in

in =: >2}.in [X =: >{. in =: <;._1 LF,1!:1<'input/19b.in'
N =: 100 [rho =:,X D ($$[:i.(*/)@$) in
($in) $ ({/ (#:N) # {~^:(i.-##:N) rho) { ,in

in =: >2}.in [X =: >{. in =: <;._1 LF,1!:1<'input/19c.in'
N =: 1048576000 [rho =:,X D ($$[:i.(*/)@$) in
img =: ($in) $ ({/ (#:N) # {~^:(i.-##:N) rho) { ,in
}. (,img) #~ 1 = +/\ (,img) e. '<>'
