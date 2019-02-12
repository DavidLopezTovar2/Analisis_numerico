#Grafica
polar <- function (theta, r, color=4){
  y <- 0
  x <- 0
  ejex <- 1
  
  for (i in 1:length(r)){
    if(is.nan(r[i])== T){
      r[i] <- 0
    }
  }
  
  angulo <- seq(-max(theta),max(theta),by=theta[2]-theta[1])
  y <- r*sin(theta)
  x <- r*cos(theta)
  plot.new()
  plot.window(xlim = c(-max(r), max(r)), ylim = c(-max(r), max(r)), asp = 1)
  
  aux <- max(r)
  
  # Dibuja los ejes.
  while (aux > 0){
    fi <- aux*sin(angulo)
    cir <- aux*cos(angulo)
    points(cir,fi,pch="-",col="gray",cex=0.3)
    text(ejex+0.2,-0.2,ejex,col="gray")
    ejex <- ejex + 1
    aux <- aux - 1
  }
  
  abline(v=((max(cir)+min(cir))/2),col="gray")
  abline(h=((max(cir)+min(cir))/2),col="gray")
  segments(-max(r)+0.5,-max(r)+0.5,max(r)-0.5,max(r)-0.5,col="gray")
  segments(-max(r)+0.5,max(r)-0.5,max(r)-0.5,-max(r)+0.5,col="gray")
  
  points(x,y,pch=20,col=color,cex=1)
}


#funcion
funcion<-function(x)
{
  fx<-2*cos(x)+sin(x)
  return (fx)
}

#derivada
derivada<-function(x)
{
  fd<-(-2*sin(x)+cos(x))
  return (fd)
}

#Newton
newton<- function(x,y,z)
{
  cat("\n")
  rF<-funcion(x)
  rD<-derivada(x)
  cat("rF ",rF," - rD",rD,"\n");
  
  x1<-x-(rF/rD)
  cat("x1 ",x1,"\n")

  if(y==0){
    y<-x1
    newton(x1,y,z)
  }
  else{
    if(z==0.0009){
      return (round(x1,4))
    }
    if((x1-y)<z){
      newton(x1,y,z/10)
    }
  }
  
}

#main
newton(0.63,0,0.9);

dim <- seq(-pi, pi, by=pi/300) 
r=cos(2*dim)
polar(dim,r,"blue")
