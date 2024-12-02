eg1 =: 0 : 0
..........
..###.##..
...####...
..######..
..######..
...####...
..........
)
in1 =: LF,~1!:1 < 'input/03a.in'
G =: '#'&= ;._2 in1

Mv =: [: *./ _1 1 |./"0 _ ]      NB. check vertical directions
Mh =: Mv &.|:                    NB. horizontal directions
M =: Mv *. Mh                    NB. mineable squares
D =: +M@(=>./@:,)                NB. dig
NB. solution to part i:
+/,D^:_ G

in2 =: LF,~1!:1 < 'input/03b.in'
G =: '#'&= ;._2 in2
NB. solution to part ii:
+/,D^:_ G

eg3 =: 0 : 0
..........
..###.##..
...####...
..######..
..######..
...####...
..........
)

