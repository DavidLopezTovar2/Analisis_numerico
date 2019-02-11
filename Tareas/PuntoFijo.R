puntofijo =function(g, x0, tol=1e-9, maxIter=100){
  k = 1
  repeat
  {
    x1 = g(x0)
    dx = abs(x1 - x0)
    x0 = x1
    cat("x_", k, "= ", x1, "\n")
    k = k+1
    
    if(dx< tol|| k > maxIter) break;
  }
  if( dx > tol ){
    cat("No hubo convergencia ")
    #retornaNULL)
  } else{
    cat("x* es aproximadamente ", x1, " con error menor que ", tol)
  }
}
phi = function(x) exp(0)^x-pi*x
curve(phi, 0, 4); abline(h=0, v=0, lty=3)
curve(1*x, 0,4, col="red", add=TRUE)
puntofijo(phi, 2.5, 1e-7, 10)
