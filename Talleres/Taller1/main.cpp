#include <iostream>
#include <math.h>

using namespace std;
int resultado(int coeficiente, int exponente, int valor, int& cantidadOperaciones, int& multiplicaciones);
void imprimir(string nombre, int datos[], int cantidad);

int main()
{



    cout<<"2x^3 + 5x^2 + 2x - 2"<<endl;
    int exponente[] = {4,3,2,1,0};
    int coeficiente[]= {2,0,-3,3,-4};
/*
    cout<<"7x^5 + 6x^4 - 6x^3 + 3x -4"<<endl;
    int exponente[] = {5,4,3,2,1,0};
    int coeficiente[]= {7,6,-6,0,3,-4};

    cout<<"-5x^6 + 3x^4 + 2x^2 - 4x"<<endl;
    int exponente[] = {6,5,4,3,2,1,0};
    int coeficiente[]= {-5,0,3,0,2,-4,0};
*/

    int multiplicaciones = 0;
    int x=0, total=0, cantidadOperaciones = 0;
    cout<<"Valor inicial: ";
    cin>>x;

    int cantidadTotal = (sizeof coeficiente / sizeof *coeficiente);
    int cantidad = (sizeof exponente / sizeof *exponente);
    imprimir("Exponente: ", exponente,  cantidad);
    imprimir("Coeficiente: ", coeficiente,  cantidad);
    cout<<endl;
    for(int i=0; i<cantidadTotal; i++){
        if(coeficiente[i]<0 && i == 0){
            cantidadOperaciones++;
        }
        total += resultado(coeficiente[i], exponente[i], x, cantidadOperaciones, multiplicaciones);
    }
    cout<<endl<<"Resultado total: "<<total<<endl;
    cout<<"Cantidad de operaciones: "<<cantidadOperaciones-1<<endl;
    cout<<"Numero de multiplicaciones: "<<multiplicaciones<<endl;
    return 0;
}

int resultado(int coeficiente, int exponente, int valor, int& cantidadOperaciones, int& multiplicaciones){
    int r;
    if(coeficiente!=0){
        cantidadOperaciones++;
         if(exponente!=0){
            cantidadOperaciones = cantidadOperaciones + exponente;
            multiplicaciones += exponente;
        }
    }
    r = pow(valor, exponente);
    r = r*coeficiente;
    return r;
}

void imprimir(string nombre, int datos[], int cantidad){
    cout<<endl<<nombre<<" ";
    for(int i =0; i<cantidad; i++){
        cout<<datos[i]<<" ";
    }

}
