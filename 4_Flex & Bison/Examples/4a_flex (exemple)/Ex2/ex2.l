%{
#include<iostream>
using namespace std;
%}

%%

. {cout << "CAR";}
\n {char* s = new char[4];}

%%

int main(void)
{
cout<<"Incepe:";
yylex();
cout<<"Gata.";
return 0;
}
