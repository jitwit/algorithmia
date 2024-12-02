ina =: 1!:1 < 'input/01a.in'
eg1 =: 'ABBAC'

P =: 0 1 3 5 {~ 'ABCD' i. -.&'x' NB. potions (including part b's dragonfly)
NB. solution to part i:
+/ P ina

inb =: 1!:1 < 'input/01b.in'
eg2 =: 'AxBCDDCAxD'

B =: P + (_1+#) - (+/@:('x'&=))   NB. potions for a given battle

NB. solution to part ii:
+/ , _2 B\ inb

inc =: 1!:1 < 'input/01c.in'
eg3 =: 'xBxAAABCDxCC'

NB. B general enough to also handle part iii.
+/ , _3 B\ inc
