
# 13

def funcion(x,y,redondeo):
    return round(x**y,redondeo)
def raizenesima(numero, ind, redondeo, intervalo1, intervalo2):
    if(numero==1):
        return 1
    valor=round((intervalo1+intervalo2)/2, redondeo)
    resultado=funcion(valor, ind, redondeo)
    if(abs(numero-resultado)<=1*(10**-4)):
        return valor
    else:
        if(resultado>numero):
            return raizenesima(numero, ind, redondeo, intervalo1, round((intervalo1+intervalo2)/2,redondeo))
        else:
            return raizenesima(numero,ind, redondeo,round((intervalo1+intervalo2)/2, redondeo), intervalo2)
    return valor
    
valor=float(input("Ingrese el valor del radicando, (a lo que se le calculara la raiz enesima)"))
indice=int(input("Ingrese el indice"))
intervalo1=float(input("Ingrese el intervalo derecho"))
intervalo2=float(input("Ingrese el intervalo izquierdo"))
redondeo=int(input("Ingrese el valor de la precision (ejemplo, 1(entero), 2(1 decimal), etc.)"))
print(raizenesima(valor,indice,redondeo,intervalo1,intervalo2))




# 14

def evaluar( valorX ):
    resultado = valorX **3 + 4 * valorX
    return resultado

print ("Ingrese el error que desea: ")
error = input()
print ("Ingrese el valor inicial del intervalo: ")
valorInicial = input()
print ("Ingrese el valor final del intervalo: ")
valorFinal = input()
valorFinal = float(valorFinal)
valorInicial = float(valorInicial)
error = float(error)
incremento = (valorFinal-valorInicial)/10
if(evaluar(valorInicial) * evaluar(valorFinal) < 0)
    while incremento > error:
        if evaluar(valorInicial) > 0:
          while evaluar(valorInicial) > 0:
                valorInicial = valorInicial + incremento
            valorInicial = valorInicial - incremento
            incremento = incremento/10    
        else:
            while evaluar(valorInicial) < 0: 
                valorInicial = valorInicial + incremento
            valorInicial = valorInicial - incremento
            incremento = incremento/10
    print ("El valor en el que la función da 0 es: ", valorInicial, " con un error de: ", error)
else:
print("No hay raíz en el intervalo.")
