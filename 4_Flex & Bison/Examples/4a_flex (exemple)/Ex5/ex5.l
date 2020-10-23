%{
#include<string.h>
int second_file = 0;
char *nume2;
int lineno;
%}

%% 

^(.*)\n fprintf(yyout, "%4d\t%s", ++lineno, yytext); 

%% 

int main(int argc, char *argv[]) { 
nume2=(char*)malloc(sizeof(char)*(strlen(argv[2])+1));
strcpy(nume2, argv[2]);
yyin = fopen(argv[1], "r");
yyout = fopen(argv[3], "w");
yylex(); 
fclose(yyin); 
fclose(yyout);
} 

int yywrap()
{
if(second_file == 0)
{
fclose(yyin);
yyin = fopen(nume2, "r"); 
second_file = 1;
return 0;
}
else
return 1;
}
