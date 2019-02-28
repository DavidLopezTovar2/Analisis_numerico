



rm(list=ls())
library(pracma)
library(Matrix)
n=4 #Tamanio de la matriz

A = matrix(c(-8.1, -7, 6.123, -2,
             -1, 4,-3, -1,
             0, -1, -5, 0.6,
             -1, 0.33, 6, 1/2), nrow=n, byrow=TRUE)

b = matrix(c(1.45,3,5.12,-4), nrow=n, byrow=TRUE)

#Punto B
tol = 1e-8
sol = itersolve(A, b, x0=c(1,2,1,1), tol=1e-8 , method = "Gauss-Seidel")
print(sol)

#Punto C
sol = itersolve(A, b, x0=c(1,2,1,1), 5, method = "Jacobi")
print(sol)
