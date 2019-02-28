




rm(list=ls())

library(pracma)
library(Matrix)

n = 4 #Tamanio de la matriz
D1<-eye(n, m = n)
D2<-ones(n, m = n)
D3<-zeros(n, m = n)
#Matriz A
A = matrix(c(-8.1, -7, 6.123, -2,
              -1, 4,-3, -1,
              0, -1, -5, 0.6,
              -1, 0.33, 6, 1/2), 
              nrow=n, byrow=TRUE)
#Matriz B
b = matrix(c(1.45,3,5.12,-4), nrow=n, byrow=TRUE)

diagonal <- function(M) 
{
  M[col(M)!=row(M)] <- 0
  return(M)
}

D = diagonal(A)
L = tril(A,k=-1,diag = FALSE)
U = triu(A,k=1,diag = FALSE)
T = (-solve(D))%*%(L+U)
print(T)
print(round(norm(T,"F"),3))


