%{
	#include <stdio.h>
       int EsteCorecta = 1;
%}

%token TOK_PLUS TOK_MINUS TOK_MULTIPLY TOK_DIVIDE TOK_LEFT TOK_RIGHT TOK_ERROR
%token TOK_NUMBER

%start S

%left TOK_PLUS TOK_MINUS
%left TOK_MULTIPLY TOK_DIVIDE

%define parse.lac full
%define parse.error verbose

%%
S : 
    |
    E ';' S
    | 
    error ';' S { EsteCorecta = 0; }
    ;
E : E TOK_PLUS E
    |
    E TOK_MINUS E
    |
    E TOK_MULTIPLY E
    |
    E TOK_DIVIDE E
    | 
    TOK_LEFT E TOK_RIGHT
    |
    TOK_NUMBER
    ;
%%

int main()
{
	yyparse();
	
	if(EsteCorecta == 1)
	{
		printf("CORECTA\n");		
	}	

       return 0;
}

int yyerror(const char *msg)
{
	printf("Error: %s\n", msg);
	return 1;
}