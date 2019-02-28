

library(Matrix)
A = matrix(c(-8.1, -7, 6.123, -2,
             -1, 4,-3, -1,
             0, -1, -5, 0.6,
             -1, 0.33, 6, 1/2), nrow=n, byrow=TRUE)
A <- matrix( c ( 1, 2, 2, 1 ), nrow=2, byrow=TRUE)
luA <- lu.decomposition( A )
L <- luA$L
U <- luA$U
print( L )
print( U )
print( L %*% U )
print( A )
gs <- gramSchmidt(A)
(Q <- gs$Q); (R <- gs$R)
print(Q)
print(R)
print(Q %*% R) # = A