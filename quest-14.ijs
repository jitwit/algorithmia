in =: <;._1 ',',1!:1<'input/14a.in'
M =: (,-) =/~ i.3 NB. movement vectors
D =: M {~ 'FRUBLD'&i.
S =: >:@i.@".@}. */ D@{. NB. parse segment
G =: 3 : 0 NB. grow a tree
 t =. ,: z =. 0 0 0
 for_g. y do. t =. t,({:t) +"1 S > g end.
)
{: >./ G in
