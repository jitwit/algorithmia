B =: {.@:I.@:(LF&=)             NB. index of first line break
R =: [: <;._1 ',',6}.({.~ B)    NB. drop 'WORDS:' and list runic words
H =: }.~ (2+B)                      NB. helmet inscription

NB. solution to part i:
+/ , E.&(H in1) &> R in1 =: 1!:1 < 'input/02a.in'

NB. runic symbols for a given word and its reverse
S =: {{ +./ (-i.#y) |."0 _ y E. x }}
NB. solution to part ii:
+/ +./ (H in2)&S &> (,|.&.>) R in2 =: 1!:1 < 'input/02b.in'

eg3 =: 0 : 0
WORDS:THE,OWE,MES,ROD,RODEO

HELWORLT
ENIGWDXL
TRODEOAL
)

in3 =: 1!:1 < 'input/02c.in'
G =: ];._2 H in3

NB. like S, but looping around
A =: {{ +./ (-#x) ]\ +./ (-i.#y) |."0 _ y E. x,x }}
hor =: +./ {{ G A"1 _ y }} &> (,|.&.>) R in3
ver =: |: +./ {{ (|:G) S"1 _ y }} &> (,|.&.>) R in3
NB. NB! correct on sample input... but missing some on test input
+/ , hor +. ver
