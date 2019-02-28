
#include <iostream>
#include <iomanip>
#include <math.h>
#include <string.h>

#define NUMERO 3
#define _USE_MATH_DEFINES

using namespace std;
void imprimirMatriz(float matriz[][NUMERO], float resultado[]);
void asignarFila(float matriz[][NUMERO], float fila[], int n);
void sumarFila(float matriz[][NUMERO], float fila[], float resultado[], int n, int filaOriginal);
void matrizIdentidad(float matriz[][NUMERO], float resultado[]);
void asignarNumerosSumarFila(int asfila, int sumFilas[]);
void separarCadena(char* str);
void organizarMatriz(float matriz[][NUMERO], float resultado[], int n);
void moverFilas(float matriz[][NUMERO], float resultado[], int n1, int n2);

int cantidadMulti = 0;

int main()
{
    int cantidad;
    char buffer[100];
    string lectura;


    //  ex    + piy = 0.5
    //  0.33x + 0.2y = 4
    //float matriz[NUMERO][NUMERO] = {{M_E,M_PI},{0.333,0.2}};
    //float resultado[NUMERO] = {(0.5),4};

    //float matriz[NUMERO][NUMERO] = {{8,2,3,3,9},{2,-4,8,1,4},{-2,5,7,8,3},{-4,-7,6,-8,-9},{9,2,4,7,5}};
    //float resultado[NUMERO] = {10,12,25,30,16};

    /*
    //  7x +  0.5y + 3z = 4
    //  4x +       + 2z = 6
    //  1x + 0.25y + 1z = 0
    float matriz[NUMERO][NUMERO] = {{7,0.5,3},{4,0,2},{1,0.25,1}};
    float resultado[NUMERO] = {4,6,0};
    */


    /*
    //    + 0.5y + 3z = 4
    // 4x +      + 2z = 6
    // 1x + 0.25y +   = 2
    float matriz[NUMERO][NUMERO] = {{0,0.5,3},{4,0,2},{1,0.25,0}};
    float resultado[NUMERO] = {4,6,2};
    */


    /*
    //  -3x + 3y + 2z = 1
    //   4x + y  - z  = 2
    //    x - 2y + z  = 3
    float matriz[NUMERO][NUMERO] = {{-3,3,2},{4,1,-1},{1,-2,1}};
    float resultado[NUMERO] = {1,2,3};
    */


    /*
    //  2x + 3y  = 16
    //  1x + 10y = 25

    float matriz[NUMERO][NUMERO] = {{2,3},{1,10}};
    float resultado[NUMERO] = {16,25};
    */



    //    x + 2y - 3z = -16
    //    3x + y - 2z = -10
    //    2x -3y + 1  = -4
    //float matriz[3][3] = {{1,2,-3},{3,1,-2},{2,-3,1}};
    //float resultado[3] = {-16,-10,-4};



    /*
    //   x - 3y  + 4z = 21
    //  3x +  y  -  z = -18
    //  2x -  y  + 3z = 12
    float matriz[3][3] = {{1,-3,4},{3,1,-1},{2,-1,3}};
    float resultado[3] = {21,-18,12};
    */


    /*
    //   x +   y +   z = 1
    //  2x +  3y + -4z = 9
    //  2x + -1y +  1z = -1
    float matriz[3][3] = {{1,1,1},{2,3,-4},{2,-1,1}};
    float resultado[3] = {1,9,-1};
    */
    imprimirMatriz(matriz, resultado);
    organizarMatriz(matriz, resultado, 0);


    float fila[NUMERO] = {0,0};
    int divisor = 0, multi = 0, n =0, asfila = 0;
    int sumFilas[NUMERO];
    for(int i=0; i<NUMERO; i++){
        //imprimirMatriz(matriz, resultado);
        matrizIdentidad(matriz, resultado);
        asignarNumerosSumarFila(asfila, sumFilas);
        asignarFila(matriz,fila,asfila);
        for(int j=0; j<NUMERO-1; j++){
            sumarFila(matriz,fila,resultado,sumFilas[j],asfila);
            //imprimirMatriz(matriz, resultado);
        }
        asfila++;
    }

    cout<<endl<<"*********FINAL*********"<<endl;
    imprimirMatriz(matriz, resultado);
    cout<<endl<<"Cantidad multiplicaciones "<<cantidadMulti<<endl;
    return 0;
}

void separarCadena(char* str){
  char * pch;
  cout<<str<<endl;
  cout<<"Splitting string \"%s\" into tokens:\n"<<str<<endl;
  pch = strtok (str," x");   // Aqui deja solo la coma
  while (pch != NULL)
  {
    cout<<"%s\n"<<pch<<endl;     // Aqui deberias guardar tu dato en el array!
    pch = strtok (NULL, " yz");  // Aca tambien iria solo la coma.!!
  }
}

void organizarMatriz(float matriz[][NUMERO], float resultado[], int n){
    int ceros = 0;
    for(int i=0; i<NUMERO; i++){
        if(matriz[i][i]==0){
            ceros++;
        }
    }

    if(ceros == 0){
        return;
    }
    else{
        moverFilas(matriz,resultado,n%NUMERO,(n+1)%NUMERO);
        organizarMatriz(matriz, resultado, n+1);
    }
}

void moverFilas(float matriz[][NUMERO], float resultado[],int n1, int n2){
    float n=0, nr=0;
    for(int i=0; i<NUMERO; i++){
        n = matriz[n1][i];
        matriz[n1][i] = matriz[n2][i];
        matriz[n2][i] = n;
    }
    nr = resultado[n1];
    resultado[n1] = resultado[n2];
    resultado[n2] = nr;
}

void asignarNumerosSumarFila(int asfila, int sumFilas[]){
    //De agregarse otra fila, se pondria aca}
    int n=0;
    for(int i=0; i<NUMERO; i++){
        if(i != asfila){
            sumFilas[n] = i;
            n++;
        }
    }

}

void matrizIdentidad(float matriz[][NUMERO], float resultado[]){
    float divisor=0;
    int n=0;
    for(int i=0; i<NUMERO; i++){
        divisor = matriz[i][n];
        for(int j=0; j<NUMERO; j++){
            matriz[i][j]= matriz[i][j]/divisor;
        }
        resultado[i] = resultado[i]/divisor;
        n++;
    }
}

void asignarFila(float matriz[][NUMERO], float fila[], int n){
    for(int i=0; i<NUMERO; i++){
        fila[i]=matriz[n][i];
    }
}

void imprimirMatriz(float matriz[][NUMERO], float resultado[]){
    cout<<fixed<<setprecision(4)<<endl;
    for(int i=0; i<NUMERO; i++){
        cout<<" | ";
        for(int j=0; j<NUMERO; j++){
            cout<<matriz[i][j]<<" ";
        }
        cout<<"| "<<fixed<<setprecision(4)<<resultado[i]<<endl;
    }

}

void sumarFila(float matriz[][NUMERO], float fila[], float resultado[], int n, int filaOriginal){
    float nuevaFila[NUMERO], multiplicador = 0;

    multiplicador = -matriz[n][filaOriginal];
    for(int i=0; i<NUMERO; i++){
        nuevaFila[i]=fila[i]* multiplicador;
    }
    cantidadMulti++;
    for(int i=0; i<NUMERO; i++){
        matriz[n][i]= matriz[n][i] + nuevaFila[i];
    }
    resultado[n] = resultado[n]+(resultado[filaOriginal]*multiplicador);
}
