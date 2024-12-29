NB. F: iterate a termite population on table like
NB.    t_i p_i
NB.     .   .
NB.     .   .
NB.     .   .
NB. where t_i is ith termite and p_i is number of such termites.
F =: {{ y=.;,.&.>/"1 (G{~{."1 y),.<"0{:"1 y
        ({."1 y) ({.@,,{:@(+/))/. y }}
NB. P iterate F x times 
P =: {{ {: +/ F^:x 1 ,.~ T i. y }}	

in =: {{<;._1','-.~':',y}};._1 LF,1!:1<'input/11a.in'
T =: ;{."1 in           NB. termites
G =: T&i. &.> {:"1 in   NB. adjacency list
4 P 'A'

in =: {{<;._1','-.~':',y}};._1 LF,1!:1<'input/11b.in'
T =: ;{."1 in
G =: T&i. &.> {:"1 in
10 P 'Z'

in =: {{<@(_3]\]);._1','-.~':',y}};._1 LF,1!:1<'input/11c.in'
T =: ,/>{."1 in
G =: T&i. &.> {:"1 in
(>./ - <./) 20 P"1 T
