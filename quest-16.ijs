in =: <;._1 LF,1!:1<'input/16a.in'
dX =: ".;._1 ',',>{.in
M =: #&> in =: ([:<>@(-.&a:))"1 |: _4(<@-.&' ')\"1 ' ',~"1>2}.in
,' ',"1~(M|100*dX) ({>)"0 in

in =: <;._1 LF,1!:1<'input/16b.in'
dX =: ".;._1 ',',>{.in
M =: #&> in =: }:([:<>@(-.&a:))"1 |: _4(<@-.&' ')\"1 ' ',~"1>2}.in
M | (*./M)*dX
NB. todo: score coins, group by lcm of wheel lengths, then calc
