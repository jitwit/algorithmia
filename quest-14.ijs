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
in =: {{< G <;._1',',y}};._2 ] 1!:1<'small.in'
in =: {{< G <;._1',',y}};._2 ] 1!:1<'tiny.in'
L =: {: &> in NB. leaves
NB. need to actually search tree instead of L1 distance...
Mu =: {{ +/ , | L -"1 y }} NB. murkiness
T =: ; in
Tr =: /:~ ~. T #~ 0 0 -:"1 ] 0 1 {"1 T
<./ Mu"1 Tr
