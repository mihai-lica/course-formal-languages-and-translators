%{
	#include <stdio.h>
    int EsteCorecta = 1;
	char msg[50];
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
    E ';' S { printf("= %d\n", $1); }
    | 
    error ';' S { EsteCorecta = 0; }
    ;
E : E TOK_PLUS E { $$ = $1 + $3; }
    |
    E TOK_MINUS E { $$ = $1 - $3; }
    |
    E TOK_MULTIPLY E { $$ = $1 * $3; }
    |
    E TOK_DIVIDE E 
	{ 
	  if($3 == 0) 
	  { 
	      sprintf(msg,"%d:%d Eroare semantica: Impartire la zero!", @1.first_line, @1.first_column);
	      yyerror(msg);
	      YYERROR;
	  } 
	  else { $$ = $1 / $3; } 
	}
    | 
    TOK_LEFT E TOK_RIGHT {$$ = $2;}
    |
    TOK_NUMBER { $$ = $1; }
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
