int multiplicacion(int x, int y){//%i0, %i1 
	int temp=0;//%O0
	int temp2=0;//%O1
	int i=0//%l7
	int iaux=0//%l6
	for(;i<y;){
		temp2=temp+x
		temp=temp2;//sumar 'y' veces 'x'//mov %l0, %O0
		iaux=i+1;
		i=iaux;
	}
	return temp;//%O0
}

int potencia(int base, int exponente){//%i1, %i2
	int temp=1;//%O0
	int temp2=1;//%O1
	int i=0//%l5
	int iaux=0//%l4
	int x;
	for(;i<exponente;){
		x=temp;//%i0
		temp=multiplicacion(x, base);
		iaux=i+1;
		i=iaux;
	}
	return temp;//%O0
}

int polinomio(int n, int x){//%i3, %i4
	int k[n+1];
	int temp=10;//valor que multiplicará cada valor del polinomio//%O2
	int temp2=0//%O3
	int i=0;//%l3
	int iaux=0;//%l2
	for(;i<=n;){
		//cout<<"ingrese valor para vector k["<<i<<"]"<<endl;
		//cin>>temp;
		k[i]=multiplicacion(temp,i);
		temp2=temp-1;//para asi permitir que sea 1+2x+3x^2
		temp=temp2;
		iaux=i+1;
		i=iaux;
	}
	
	cout<<"Polinomio formado"<<endl;
	cout<<k[0];
	for(int ii=1; ii<n+1; ii++){
		cout<<"+"<<k[ii]<<"x^"<<ii;
	}
	cout<<endl;
	
	i=0;//%l3
	iaux=0;//%l2
	temp2=0//%O3
	temp=k[i];
	int contArray=0;//%O4
	for(; i<=n;){
		temp2=potencia(x, i);
		contArray=k[i];
		temp=temp+multiplicacion(, temp2);
		iaux=i+1;
		i=iaux;
	}
	return temp;
}

int main(){
	int x=3, y=3, z=0;
	/*
	cout<<"Efectuando x^y"<<endl;
	cout<<"Ingrese valor x"<<endl;
	cin>>x;
	cout<<"Ingrese valor y"<<endl;
	cin>>y;
	*/
	cout<<"Resultado "<<x<<"*"<<y<<"="<<potencia(x,y)<<endl;
	/*
	cout<<"Efectuando polinomio de grado n, valor x"<<endl;
	cout<<"Ingrese valor x"<<endl;
	cin>>x;
	cout<<"Ingrese valor n"<<endl;
	cin>>y;
	*/
	cout<<"Resultado "<<polinomio(y, x)<<endl;