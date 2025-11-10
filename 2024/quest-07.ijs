C =: {."1 in =: ];._2 ','-.~1!:1<'input/07a.in'
P =: <: '-=+' i. 2}."1 in
C \: ([:+/10+[:+/\10&$)"1  P

T =: ];. _2 ] 0 : 0
=-=++=-==++=++=-=+=-=+=+=--=-=++=-==++=-+=-=+=-=+=+=++=-+==++=++=-=-=--
-                                                                     -
=                                                                     =
+                                                                     +
=                                                                     +
+                                                                     =
=                                                                     =
-                                                                     -
--==++++==+=+++-=+=-=+=-+-=+-=+-=+=-=+=--=+++=++=+++==++==--=+=++==+++-
)

T =: (10*#T)$T =. <:'-=+'i.(}.{.T),(}.{.|.|:T),(}.|.{:T),(}.|.{.|:T)
C =: {."1 in =: ];._2 ','-.~1!:1<'input/07b.in'
P =: <: '-=+' i. 2}."1 in
C \: ([:+/10+[:+/\T+(T=0)*(#T)&$)"1 P

NB. takes like 6 seconds to compute so, i'm caching to plans.txt
NB. (,LF,~"1 ~.(i.!11) A. '+++++---===') 1!:2 < 'plans.txt'
NB. track length is 340, lcm of 11 and that is 3740
NB. need to have way of reading track now...
T =: <:'-=+'i.LF-.~1!:1 < 'output/trackloop.txt'
P =: <:'-=+'i.];._2 ] 1!:1 < 'output/plans.txt' NB. precomputed plans using A.
A =: <:'-=+'i.(LF,',A:')-.~1!:1 < 'input/07c.in' NB. opposing plan
T =: T$~N =: 11 *. # T NB. period
S =: ([:+/10+[:+/\T+(T=0)*(#T)&$)"1 P NB. scores
+/ S > (P i. A) { S
