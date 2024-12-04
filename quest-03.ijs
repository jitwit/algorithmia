G =: '#'&= ;._2 LF,~1!:1 < 'input/03a.in'
Mv =: [: *./ _1 1 |./"0 _ ]      NB. check vertical directions
Mh =: Mv &.|:                    NB. horizontal directions
M =: Mv *. Mh                    NB. mineable squares
D =: +M@(=>./@:,)                NB. dig
NB. solution to part i:
+/,D^:_ G

G =: '#'&= ;._2 LF,~1!:1 < 'input/03b.in'
NB. solution to part ii:
+/,D^:_ G

G =: '#'&= ;._2 LF,~1!:1 < 'input/03c.in'

P =: 0&, @ ,&0                                            NB. pad
NB. need all equal and > 0 to dig further
M =: (1 1,:3 3) {{(*d)**./y=d=.>./y=.,y}};._3 (P"1 @ P)   NB. mine
NB. solution to part iii:
+/ ,  (+M) ^:_ G
