rm(list=ls())
a<-0.5
f=function(x) sin(x)
h=c(1e-1,1e-2,1e-3,1e-4,1e-5,1e-6)

derivada<-function(a,h,f)
{
  Err=c()
  cat("h","\t","f(a+h)-f(a))/(h)","\t","Error")
  for (i in 0:6)
  {
    der<-(f(a+h[i])-f(a))/(h[i])
    Err[i]<-(f(a)-(f(a+h[i])-f(a))/(h[i]))
    cat(h[i],"\t",der,"\t",Err[i],"\n")
  }
  #Grafica del error vs h.
  plot(h,Err, pch=19, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main="Error")
}
options(digits = 10)
derivada(a,h,f)
