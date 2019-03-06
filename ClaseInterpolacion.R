



A = matrix(c(4,-1,-1,-1,
             -1, 4,-1,-1,
             -1,-1,4,-1,
             -1,-1,-1,4), nrow=4, byrow=TRUE)
b = c

A = matrix(c(1,0,0,0,
             1,1,1,1,
             1,2,4,8,
             1,3,9,3), nrow=4, byrow=TRUE)
b = c(0.5,1,7,25)
solve (A,b)





rm(list=ls())
x1 = c(6,8,10,12,14,16,18,20) 
y1 = c(7,9,12,18,21,19,15,10)
plot(x1,y1, pch=19, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main="Temperatura a travez del tiempo")
DatosX = x1[1:8]; DatosY = y1[1:8]
Ajuste_Polinomio = poly.calc(DatosX,DatosY)
Ajuste_Polinomio
plot(x1,y1, pch=19, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main="Mano derecha")
points(DatosX,DatosY, pch=19, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main="Mano derecha")
curve(Ajuste_Polinomio,add=T,from =5,to =20)

#Hallar la temperatura para los datos que no esten ahi, realizar tabla.

grados=c()
tiempo=c()
Ajuste_Polinomio(7)

for(i in 5:20)
{
  cat(i,"  ",Ajuste_Polinomio(i),"\n")
  grados[i]<-Ajuste_Polinomio(i)
  tiempo[i]<-i
}
tabla = data.frame (rbind(tiempo,grados))
options(digits = 3)
tabla
