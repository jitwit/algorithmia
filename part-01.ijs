in1 =: 1!:1 < 'input/01a.in'

P =: 0 1 3 5 {~ 'ABCD' i. -.&'x' NB. potions (including part b's dragonfly)
NB. solution to part i:
+/ P in1

in2 =: 1!:1 < 'input/01b.in'

B =: P + (_1+#) - (+/@:('x'&=))   NB. potions for a given battle

NB. solution to part ii:
+/ , _2 B\ in2

in3 =: 1!:1 < 'input/01c.in'

NB. B general enough to also handle part iii.
+/ , _3 B\ in3
