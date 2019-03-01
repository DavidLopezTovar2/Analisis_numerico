#Punto 1
#Solución a la parte B 
rm(list=ls())
library(pracma)
library(Matrix)
A = matrix(c(4,-1,-1,-1,
              -1, 4,-1,-1,
              -1,-1,4,-1,
              -1,-1,-1,4), nrow=4, byrow=TRUE)
b = c(-exp(1),5,6,0)

A1 = matrix(c(4,-1.15,-1,-1,
             -1, 4,-1,-1,
             -1,-1,4,-1,
             -1,-1,-1,4), nrow=4, byrow=TRUE)
b = c(-exp(1),5,6,0)

#Resultado matriz original
solve(A,b)
#Resultado matriz modificada
solve(A1,b)
sol = itersolve(A, b, tol=0.001 , method = "Gauss-Seidel")
print(sol)
sol = itersolve(A1, b, tol=0.001, method = "Gauss-Seidel")
print(sol)
