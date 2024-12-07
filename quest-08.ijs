NB. sum of first n odd numbers is n^2
n=.>.%: N =: 4097737
(_1+2*n)*(N-~n*n)

N =: 947      NB. modulus
A =: 1111     NB. priest accolytes
B =: 20240000 NB. available blocks
L =: 200x     NB. iteration limit
n =: B I.~ X =: +/\ (1+2*i.L) * N A&|@^ i. L
(B-~n{X)*(1+2*n)
