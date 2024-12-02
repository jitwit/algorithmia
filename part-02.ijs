eg1 =: 0 : 0
WORDS:THE,OWE,MES,ROD,HER

AWAKEN THE POWER ADORNED WITH THE FLAMES BRIGHT IRE
)
in1 =: 1!:1 < 'input/02a.in'

B =: {.@:I.@:(LF&=)             NB. index of first line break
R =: [: <;._1 ',',6}.({.~ B)    NB. drop 'WORDS:' and list runic words
H =: }.~ B                      NB. helmet inscription

NB. solution to part i:
+/ , E.&(H in1) &> R in1

eg2 =: 0 : 0
WORDS:THE,OWE,MES,ROD,HER,QAQ

AWAKEN THE POWE ADORNED WITH THE FLAMES BRIGHT IRE
THE FLAME SHIELDED THE HEART OF THE KINGS
POWE PO WER P OWE R
THERE IS THE END
QAQAQ
)
in2 =: 1!:1 < 'input/02b.in'

NB. runic symbols for a given word and its reverse
S =: {{ +./ (-i.#y) |."0 _ y E. x }}
NB. solution to part ii:
+/ +./ (H in2)&S &> (,|.&.>) R in2

