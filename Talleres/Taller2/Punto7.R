#Barzilai-Borwein se usa para resolver el sistema no lineal de ecuaciones, y para optimizar las funciones objetivas no lineales sujetas a restricciones simples. Es especialmente útil en problemas donde los algoritmos son propensos a experimentar dificultades en la convergencia.
```{r, echo=T}
trigexp = function(x) {
  n = length(x)#n es el tamaño de x
  F = rep(NA, n)#replica los valores
  F[1] = 3*x[1]^2 + 2*x[2] - 5 + sin(x[1] - x[2]) * sin(x[1] + x[2])
  tn1 = 2:(n-1)
  F[tn1] = -x[tn1-1] * exp(x[tn1-1] - x[tn1]) + x[tn1] *
    ( 4 + 3*x[tn1]^2) + 2 * x[tn1 + 1] + sin(x[tn1] -
                                               x[tn1 + 1]) * sin(x[tn1] + x[tn1 + 1]) - 8
  F[n] = -x[n-1] * exp(x[n-1] - x[n]) + 4*x[n] - 3
  F
}
n = 10000
p0 = runif(n) # n initial random starting guesses
#BBsolve es especialmente útil en problemas donde los algoritmos son propensos a experimentar dificultades en la convergencia
sol = BBsolve(par=p0, fn=trigexp)
sol$par
```