in =: <;._1 LF,1!:1<'input/16a.in'
dX =: ".;._1 ',',>{.in
M =: #&> in =: ([:<>@(-.&a:))"1 |: _4(<@-.&' ')\"1 ' ',~"1>2}.in
,' ',"1~(M|100*dX) ({>)"0 in

NB. ohhhhhh it's only 0,2 for each face that matters
in =: <;._1 LF,1!:1<'input/16b.in'
dX =: ".;._1 ',',>{.in
N =: *./ M =: #&> in =: }:([:<>@(-.&a:))"1|:_4(<@-.&' ')\"1 ' ',~"1>2}.in
F =: {{+/0>._2+#/.~(1~:3|i.#y)#y=.y-.' '}} NB. score coins
W =: 1 |. F"1,/"2(M|"1(i.N)*/dX) (({>)"0)"1 in
lim =: 202420242024
(+/(N|lim){.W)+(<.lim%N)*+/W
