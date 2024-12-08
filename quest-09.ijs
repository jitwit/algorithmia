S =: 1 3 5 10 NB. stamps
X =: ". ;._1 LF,1!:1 < 'input/09a.in'
dp =: 3 : 0
M =: 0,(>./X) $ _ NB. memo
for_s. S do. for_i. s+i.(#M)-s do. M =: ((i{M)<.1+(i-s){M) i}M end. end. 'dp''d'
)
dp'' NB. setup dp table
+/ X { M

S =: 1 3 5 10 15 16 20 24 25 30
X =: ". ;._1 LF,1!:1 < 'input/09b.in'
dp''
+/ X { M

S =: 1 3 5 10 15 16 20 24 25 30 37 38 49 50 74 75 100 101
X =: ". ;._1 LF,1!:1 < 'input/09c.in'
NB. to split sparkleball, difference in dots of 100 at most means we
NB. can search in region (X/2) +/- 50.
dp''
F =: {{ <./ +/"1 M {~ (,. y&-)(<.y%2)+i:50 }}"0
+/ F X
