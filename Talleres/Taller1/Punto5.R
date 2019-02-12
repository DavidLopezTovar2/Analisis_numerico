t = function(maxiter = 100)
{
  n = 0;
  while(1.0+(maxiter*0.5) > 1.0)
  {
    n=n+1
    maxiter = maxiter*0.5
  }
  cat("Epsilon de la maquina en forma hexadecimal = ", maxiter, "\n")
  cat("Epsilon de la maquina en forma binaria = 2^-", n, "\n")
  suma = 1
  i = 1
  while(i<=1000){
    suma = suma + 0.40000000000
    i = i + 1
  }
  maxiter = 10000 * 0.40000000000 + 1
  
  cat("El error acumulado es  = ", suma, "\n")
}
t(1.0)
