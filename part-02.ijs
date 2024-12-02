eg1 =: 0 : 0
WORDS:THE,OWE,MES,ROD,HER

AWAKEN THE POWER ADORNED WITH THE FLAMES BRIGHT IRE
)
in1 =: 1!:1 < 'input/02a.in'

B =: {.@:I.@:(LF&=)             NB. index of first line break
R =: [: <;._1 ',',6}.({.~ B)    NB. drop 'WORDS:' and list runic words
I =: }.~ B                      NB. helmet inscription

R in1
I eg1
R eg1
