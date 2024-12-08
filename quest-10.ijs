in0 =: ] ;._2 ] 0 : 0
**PCBS**
**RLNW**
BV....PT
CR....HZ
FL....JW
SG....MN
**FTZV**
**GMJH**
)

in =: ];._1 LF,1!:1<'input/10a.in'
R =: {{ '.' -.~ x {~ {. y }}
C =: {{ '.' -.~ x {~"1 {: y }}
L =: R (e.#[) C
S =: {{ y (<"1 V)}~ , (y&L)"1 V =. 4$.$.'.'=y }}
A =: {{ ,y&L"1]4$.$.'.'=y }}
A in

in =: -.&' ';._1 LF,(#~[:-.(LF,LF)&E.) 1!:1<'input/10b.in' NB. ayayay
P =: [: +/ (i.@#) *&>: AZ&i.
+/ ,(8 8,:8 8) P@A;._3 in
