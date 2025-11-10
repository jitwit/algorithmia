in =: ];._1 LF,1!:1<'input/10a.in'
R =: {{ '.' -.~ x {~ {. y }}           NB. grab letters from x on row by y
C =: {{ '.' -.~ x {~"1 {: y }}         NB. grab letters from x on col by y
L =: R (e.#[) C                        NB. find unique letter in x by y
A =: {{ ,y&L"1]4$.$.'.'=y }}           NB. runic word
A in

in =: -.&' ';._1 LF,(#~[:-.(LF,LF)&E.) 1!:1<'input/10b.in' NB. ayayay
P =: [: +/ (i.@#) *&>: AZ&i.           NB. power of runic word
+/ ,(2 2$8) P@A;._3 in
