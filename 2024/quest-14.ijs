in =: <;._1 ',',1!:1<'input/14a.in'
M =: (,-) =/~ i.3 NB. movement vectors
D =: M {~ 'FRUBLD'&i. NB. parse direction into vector
S =: >:@i.@".@}. */ D@{. NB. parse instruction into segments
G =: 3 : 0 NB. grow a tree
 t =. ,: z =. 0 0 0
 for_g. y do. t =. t,({:t) +"1 S > g end.
)
{: >./ G in NB. part a

in =: {{< G <;._1',',y}};._2 ] 1!:1<'input/14b.in'
<: # ~. ; in NB. part b

in =: {{< G <;._1',',y}};._2 ] 1!:1<'input/14c.in'
L =: {: &> in NB. leaves
T =: ~. ; in
(<'output/leaves.txt') 1!:2~ ;LF,"1~ ,/ > 8!:0 L
(<'output/tree.txt') 1!:2~ ;LF,"1~ ,/ > 8!:0 T
