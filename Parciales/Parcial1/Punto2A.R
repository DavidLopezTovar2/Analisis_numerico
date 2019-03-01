#Punto 2
#Solución a la parte A

rm(list=ls())
raices<-function(xn,x0,E,Fx)
{
  error=1000
  cat("\t","x_k","\t","f(x_k)","\t","Error est.","\n")
  xn<-xn-1
  F2<-xn-(Fx(xn)*((xn-x0))/(Fx(xn)-Fx(x0)))
  repeat
  {
    if (error<E)
      break
    error=(xn-x0)/(xn)
    cat("\t",x0,"\t",xn,"\t",error,"\n")
    x0=xn
    xn=F2
    F2<-xn-f(xn)*(xn-x0)/(f(xn)-f(x0))
  }
}
f=function(x)tan(pi*x)  #Funcion f
g=function(x)sin(pi*x)  #Funcion g
Fx=function(x)g(x)-f(x) #(f-g)(x)
options(digits = 5)
raices(2,-2,1e-9,Fx)  #Llamado a función
