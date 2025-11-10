P =: 0 1 3 5 {~ 'ABCD' i. -.&'x' NB. potions (including part b's dragonfly)
NB. solution to part i:
+/ P 1!:1 < 'input/01a.in'

B =: P + (_1+#) - (+/@:('x'&=))   NB. potions for a given battle
NB. solution to part ii:
+/ , _2 B\ 1!:1 < 'input/01b.in'

NB. B general enough to also handle part iii:
+/ , _3 B\ 1!:1 < 'input/01c.in'
