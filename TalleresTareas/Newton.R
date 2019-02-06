
newtonDN = function(f,  x0, tol, maxiter)
{
  # Derivada numérica  con diferencia central
  k=0
  fp = function(x) 
  { h = 1e-15
  (f(x+h) - f(x-h)) / (2*h)
  }
  
  
  #Par imprimir estado
  cat("---------------------------------------------------------------------------\n") 
  cat(formatC( c("x_k"," f(x_k)","Error est."), width = -20, format = "f", flag = " ","\n"))
  cat("---------------------------------------------------------------------------\n")
  repeat
  {
    correccion = f(x0)/fp(x0)
    x1 = x0 - correccion
    dx = abs(correccion)
    # Imprimir iteraciones
    cat(formatC( c(x1 ,f(x1), dx), digits=15, width = -15, format = "f", flag = " "), "\n") 
    x0 = x1
    k = k+1
    # until
    if(dx <= tol || k > maxiter ) break;
  } 
  cat("---------------------------------------------------------------------------\n") 
  if(k > maxiter)
  {
    cat("Se alcanzó el máximo número de iteraciones.\n")
    cat("k = ", k, "Estado: x = ", x1, "Error estimado <= ", correccion) 
  } 
  else 
  {
    cat("k = ", k, " x = ", x1, " f(x) = ", f(x1), " Error estimado <= ", correccion) 
  }
}
## --- Pruebas
f  = function(x) exp(0)^x-pi*x
options(digits = 15)
newtonDN(f, 0.5, 1e-10, 10)


