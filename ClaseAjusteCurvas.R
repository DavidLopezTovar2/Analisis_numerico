rm()

# https://rpubs.com/joser/logistica
datos=read.table('http://verso.mat.uam.es/~joser.berrendero/datos/challenger.txt',header=TRUE)
table(datos$defecto)

colores <- NULL
colores[challenger$defecto==0] <- 'green'
colores[challenger$defecto==1] <- 'red'
plot(challenger$temp, challenger$defecto, pch = 21, bg = colores, xlab = 'Temperatura', ylab = 'Probabilidad de defectos')
legend('bottomleft', c('No defecto', 'Si defecto'), pch = 21, col = c('green', 'red'))
# -------------------------

#Ejercicio aparte 
x <- c(32,64,96,118,126,144,152.5,158)
y <- c(99.5,104.8,108.5,100,86,64,35.3,15)

plot(x,y,pch=20)
#lm = linear model
fit <- lm(y~x)
#Resumen del model lineal
summary(fit)
#Coheficientes
fit$coefficients
#Grado 2
fit2 <- lm(y~poly(x,2,raw=TRUE))
summary(fit2)
#Grado 3
fit3 <- lm(y~poly(x,3,raw=TRUE))
summary(fit3)
fit3$residuals
#Grado 4
fit4 <- lm(y~poly(x,4,raw=TRUE))
summary(fit4)

