#include <iostream>
using namespace std;
int multiplicacion(int x, int y){//%i0, %i1 
	int temp=0;//%O0
	int temp2;//%O1
	int i=0;//%l6
	int iaux;//%l7
	if(y<0){//si y es negativo, para garantizar resultado negativo
		iaux=0-x;
		x=iaux;
		iaux=0-y;
		y=iaux;
	}
	while(i<y){
		temp2=temp+x;
		temp=temp2;//sumar 'y' veces 'x'//mov %l0, %O0
		iaux=i+1;
		i=iaux;
	}
	return temp;//%O0
}

int potencia(int base, int exponente){//%i1, %i2
	int temp=1;//%O0
	int i=0;//%l5
	int iaux;//%l7
	int x;
	while(i<exponente){
		x=temp;//%i0
		temp=multiplicacion(x, base);//%i0, %i1
		iaux=i+1;
		i=iaux;
	}
	return temp;//%O0
}

int polinomio(int n, int x){//%i3, %i4
	int k[n+1];
	int temp=2;//valor que multiplicará cada valor del polinomio//%O2
	int temp2;//%O3
	int i=0;//%l4
	int iaux;//%l7
	k[0]=temp;
	iaux=i+1;
	i=iaux;
	temp2=temp-3;
	temp=temp2;
	while(i<=n){//construye polinomio
		//cout<<"ingrese valor para vector k["<<i<<"]"<<endl;
		//cin>>temp;
		k[i]=multiplicacion(temp,i);
		temp2=temp-3;//para asi permitir que sea 1+2x+3x^2
		temp=temp2;
		iaux=i+1;
		i=iaux;
	}
	//Esto no hace parte de maquina, solo para mostrar en alto nivel el contenido
	cout<<"Polinomio formado"<<endl;
	cout<<k[0];
	for(int ii=1; ii<=n; ii++){
		cout<<"+"<<k[ii]<<"x^"<<ii;
	}
	cout<<endl;
	
	i=0;//%l4
	iaux=0;//%l7
	temp2;//Sera resultado del call de mas adelante//%O0, 
	temp=k[i];//%O2
	iaux=i+1;
	i=iaux;
	while(i<=n){//opera polinomio
		temp2=multiplicacion(k[i], potencia(x, i));
		iaux=temp+temp2;
		temp=iaux;
		iaux=i+1;
		i=iaux;
	}
	return temp;
}

int main(){
	int x=-4, y=7, iaux;//%l0, %l1
	cout<<"Efectuando "<<x<<"*"<<y<<endl;
	cout<<"Resultado "<<x<<"*"<<y<<"="<<multiplicacion(x,y)<<endl;
	if(y<0){//garantiza exponente positivo
		iaux=0-y;
		y=iaux;
	}
	cout<<"Efectuando "<<x<<"^"<<y<<endl;
	cout<<"Resultado "<<x<<"^"<<y<<"="<<potencia(x,y)<<endl;
	if(x<0){//garantiza n positivo
		iaux=0-x;
		x=iaux;
	}
	
	cout<<"Efectuando polinomio de grado n="<<x<<", valor x="<<y<<endl;
	cout<<"Resultado "<<polinomio(x, y)<<endl;
	return 1;
}