#include <iostream>
#include <math.h>

#define E 2.71828182845904523536

using namespace std;
void biseccion(long double, long double, long double, long double);
long double sacarError(long double actual, long double anterior);

int main() {
    int inferior=0, superior=2;
    cout<<"("<<inferior<<","<<superior<<")"<<endl;
	biseccion(inferior,superior,100,0);
}

void biseccion(long double a, long double b, long double errorAnterior,long double iteraccion){
    long double a1= a, b1= b, m, n1, n2, n3, error;
    //Se pone el error que se quiera 10^-2 = 0,01   10^-3 = 0,001
    long double cantidadError = pow(10,-5);
    iteraccion++;
    //Se saca el medio
    m=(a+b)/2;

    //Validacion primera iteracion. En la primera no existe un punto anterior con lo que comparar.
    if(errorAnterior!=100){
        error = sacarError(m,errorAnterior);
        cout<<error<<endl;
        if(error/cantidadError >= 1 && error/cantidadError <=10){
            cout<<"Iteraccion "<<iteraccion<<" ";
            cout<<"Raiz "<<m<<endl;
            cout<<"Error deseado "<<cantidadError<<"%"<<endl;
            cout<<"Error obtenido "<<error<<"%"<<endl;
            return;
        }
    }
    //Función
    n1= m*pow(E,m)-atan(1)*4; //Se representa pi de tal manera
    n2= a1*pow(E,a1)-atan(1)*4;
    n3= b1*pow(E,b1)-atan(1)*4;

    /*
    n1= pow(m,4)+3*pow(m,3)-2;
    n2= pow(a1,4)+3*pow(a1,3)-2;
    n3= pow(b1,4)+3*pow(b1,3)-2;
    */
    if(n1*n2>0){
        error = m;
        biseccion(m,b1,error,iteraccion);
    }
    else if(n1*n3>0){
        error = m;
        biseccion(a1,m, error, iteraccion);
    }

}

long double sacarError(long double actual, long double anterior){
    long double resultado;
    resultado = ((actual - anterior)/actual)*100;
    //Valor absoluto
    if(resultado<0){
        return -resultado;
    }

    return resultado;
}
