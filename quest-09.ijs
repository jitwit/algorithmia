S =: 1 3 5 10 NB. stamps
X =: 2 4 7 16 NB. sparkleballs
X =: ". ;._1 LF,1!:1 < 'input/09a.in'
M =: 0,(>./X) $ _ NB. memo
dp =: 3 : 0
for_s. S do. for_i. s+i.(#M)-s do. M =: ((i{M)<.1+(i-s){M) i}M end. end.
)
dp'' NB. setup dp table
+/ X { M
