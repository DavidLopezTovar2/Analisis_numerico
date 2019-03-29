#Reto Perro
#Interpolacion Lagrange Baricentrico 
#Karen Celis, CAmilo MUñoz, David Lopez
#          1    2     3     4     5     6     7     8     9     10    11    12    13    14     15    16    17   18    19    20    21    22    23    24    25    26    27    28  29   30   

rm(list=ls())
y1=c(3,3.7,3.9,4.5,5.7,6.69,7.12,6.7,4.45,7,6.1,5.6,5.87,5.15,4.1,4.3,4.1,3)                                                                                                       
x1=c(1,2,5,6,7.5,8.1,10,13,17.6,20,23.5,24.5,25,26.5,27.5,28,29,30)     
length(x1)
length(y1)
plot(x1,y1, pch=19, cex=0.5, col = "red", asp=1,xlab="X", ylab="Y", main="Diagrama original")
Sys.sleep(4)
#          1    2     3     4     5     6     7     8     9     10    11    12    13    14     15    16    17   18    19    20    21    22    23    24    25    26    27    28  29   30   
x <- c ( 0.40, 0.72, 1.46, 2.27, 4.55, 6.38, 7.42, 7.79, 8.41, 9.17, 9.75, 10.52,11.26,11.94,12.40,12.96,13.25,12.82,12.36,11.52,10.34,9.57, 7.48, 6.38, 5.42,  4, 2.83, 1.80,  1, 0.42)
y <- c ( 1.26, 1.56, 1.54, 1.62, 3.19, 2.68, 2.06, 2.46, 2.96, 3.29, 3.10, 2.56, 2.56, 2.52, 1.94, 1.78, 1.36, 1.08, 1.26, 1.14, 1.04, 1.12, 1.16, 1.06, 1.06,  1, 1.06, 1.08,  1, 1.16)
  
require(pracma)
length(x)
plot(x,y, pch=20, cex=1, col = "brown", asp=1,xlab="X", ylab="Y", main="Nuestro diagrama")
GraficarP<-function(x0, xn)
{
  Sys.sleep(0.5)
  xi = x[x0:xn]
  yi = y[x0:xn]
  x <- seq(x[x0], x[xn], len=15)
  y <- barylag(xi, yi, x)
  lines(x, y, col="brown")
}
GraficarP (1, 4)
GraficarP (4, 7)
GraficarP (7, 10)
GraficarP (10, 12)
GraficarP (12, 13)
GraficarP (13, 15)
GraficarP (14, 15)
GraficarP (15, 16)
GraficarP (16,17)
GraficarP (17,18)
GraficarP (18, 19)
GraficarP (19, 21)
GraficarP (21, 23)
GraficarP (23, 26)
GraficarP (26, 27)
GraficarP (27, 29)
GraficarP (29,30)


