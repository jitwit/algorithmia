in =: >2}.in [X =: >{. in =: <;._1 LF,1!:1<'input/19a.in'
LR =: 1 2 5 0 4 8 3 6 7 ,: 3 0 1 6 4 2 7 8 5
R =: {{u ixs}~ (LR{~'LR'i.x) { u{~ixs=.<"1 y+"1,/,"0/~i:1}}
D =: {{b =. # ins=. x$~# ixs=.(1+[:,/,"0/&i.&(_2&+))/$y
       for_i. i.b do. y =. (ins{~b|i) y R ixs{~b|i end.}}
X D in

in =: >2}.in [X =: >{. in =: <;._1 LF,1!:1<'input/19b.in'
N =: 100 [rho =:,X D ($$[:i.(*/)@$) in
($in) $ (C./ (#:N) # C.~^:(i.-##:N) rho) C. ,in

in =: >2}.in [X =: >{. in =: <;._1 LF,1!:1<'input/19c.in'
N =: 1048576000 [rho =:,X D ($$[:i.(*/)@$) in
img =: ($in) $ (C./ (#:N) # C.~^:(i.-##:N) rho) C. ,in
}. (,img) #~ 1 = +/\ (,img) e. '<>'
