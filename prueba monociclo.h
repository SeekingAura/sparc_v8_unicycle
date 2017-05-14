int multiplicacion(int x, int y){
	int temp=0;//%0
	int temp2=0;//%l0
	//int iaux=0//%
	for(int i=0/*%l7*/; i<y; i++){
		temp2=temp+x
		temp=temp2;//sumar 'y' veces 'x'//mov %l0, %O0
		/*iaux=i+1;
		i=iaux;
		*/
	}
	return temp;
}

int potencia(int base, int exponente){
	int temp=1;//%O1
	for(int i=0; i<exponente; i++){
		temp=multiplicacion(temp, base);
	}
	return temp;
}

int polinomio(int n, int x){
	int k[n+1];
	int temp=3;
	for(int i=0; i<n+1; i++){
		//cout<<"ingrese valor para vector k["<<i<<"]"<<endl;
		//cin>>temp;
		k[i]=temp*i;
		temp--;
	}
	/*
	cout<<"Polinomio formado"<<endl;
	cout<<k[0];
	for(int i=1; i<n+1; i++){
		cout<<"+"<<k[i]<<"x^"<<i;
	}
	cout<<endl;
	*/
	temp=k[0];
	for(int i=1; i<n+1; i++){
		temp=temp+multiplicacion(k[i], potencia(x, i));
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