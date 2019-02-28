```{r}
#Es un método iterativo que se utiliza para resolver un sistema lineal de ecuaciones. Es similar al método Jacobi. Aunque se puede aplicar a cualquier matriz con elementos distintos de cero en las diagonales, la convergencia sólo se garantiza si la matriz es diagonal dominante o simétrica y positiva definida.

library(MASS) # package needed for ginv() function 

A=cbind(c(4,8),c(8,30)) # coefficient matrix
b<-t(t(c(12,39))) # b-vector
x0<-t(t(c(0,0)))  # starting vector
iter<-10          # number of Gauss-Seidel iterations to run

L<-lower.tri(A)*A  # lower triang. A
U<-upper.tri(A)*A  # upper triang. A
D<-diag(diag(A))   # diag of A

# plot points 
xc<-c(0,1,2,5)
yc<-c(0,3,3,6)
plot(xc,yc,
     col='red',
     xlab="X-Values",
     ylab="Y-Values",
     bty='n')
title(main="OLS Estimados")
legend("bottomright",
       c("Datos","Estimados","Linea Original"),
       lty=c(0,1,1),
       pch=c(1,NA,NA),
       col=c("red","blue","green"),
       bty='n')

# create color palette - lines will get darker with each iter
pal<-colorRampPalette(c("#f2f2f2", "Blue"))
colors<-pal(iter) # creates color palette of length(iter)

# plot true line
abline(a=1.0714,b=.8571,col='green')

n<-1
while(n<=iter){
  print(x0)
  
  # Gauss-Seidel formula
  x1<-(ginv((L+D)))%*%((-U%*%x0)+b)
  x0<-x1
  n=n+1
  
  # plot estimated line  
  abline(a=as.numeric(x0[2,1]), # slope of estimated line
         b=as.numeric(x0[1,1]), # y-intercept of estimated line
         col=colors[n]) # pick nth color in palette
}
```