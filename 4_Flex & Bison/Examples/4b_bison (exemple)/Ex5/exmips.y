%{
	#include <stdio.h>

	int yylex();
	int yyerror(const char *msg);

	FILE * yyies = NULL;

     int EsteCorecta = 1;
	char msg[50];

	int Prima = 0;
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
	{ 
		fprintf(yyies,"\tla\t$a0, egal\n\tli\t$v0, 4\n\tsyscall\n\tmove\t$a0, $t1\n\tli\t$v0, 1\n\tsyscall\n");
		fprintf(yyies, "\tla\t$a0, linie_noua\n\tli\t$v0, 4\n\tsyscall\n"); 
		Prima = 0;
	}
    | 
    error ';' S
       { EsteCorecta = 0; }
    ;
E : E TOK_PLUS E 
	{ 
		fprintf(yyies, "\tadd\t$t1,$t1,$t2\n");
		Prima = 1;

	}
    |
    E TOK_MINUS E
	{
		fprintf(yyies, "\tsub\t$t1,$t1,$t2\n");
		Prima = 1;
	}
    |
    E TOK_MULTIPLY E 
	{
		if(Prima == 2)
		{
			fprintf(yyies, "\tmult\t$t1,$t2\n");
			fprintf(yyies, "\tmflo\t$t1\n");
		}
		else 
		{
			fprintf(yyies, "\tmult\t$t2,$t3\n");
			fprintf(yyies, "\tmflo\t$t2\n");
		}
		Prima = 1;
	}

    |
    E TOK_DIVIDE E 
	{ 
	  if($3 == 0) 
	  { 
	      sprintf(msg,"%d:%d Eroare semantica: Impartire la zero!", @1.first_line, @1.first_column);
	      yyerror(msg);
	      YYERROR;
	  } 
	  else
	  {
		if(Prima == 2)
		{
			fprintf(yyies, "\tdiv\t$t1,$t2\n");
			fprintf(yyies, "\tmflo\t$t1\n");
		}
		else
		{
			fprintf(yyies, "\tdiv\t$t2,$t3\n");
			fprintf(yyies, "\tmflo\t$t2\n");
		}
		Prima = 1;
	  }
	}
    | 
    TOK_LEFT E TOK_RIGHT { $$ = $2; }
    |
    TOK_NUMBER 
	{ 
		if(Prima == 0)
		{
			fprintf(yyies, "\tli\t$t1, %d\n", $1); 
			Prima = 1;
		}
		else if(Prima == 1)
		{
			fprintf(yyies, "\tli\t$t2, %d\n", $1); 
			Prima = 2;
		}
		else
		{
			fprintf(yyies, "\tli\t$t3, %d\n", $1); 
			Prima = 3;
		}
	}
    ;
%%

int main()
{
	yyies = fopen("math.s","w");
	fprintf(yyies, "\t.text\n\t.globl main\nmain:\n");

	yyparse();
	
	fprintf(yyies,"\tli\t$v0, 10\n\tsyscall\n\t.data\negal:\t\t.asciiz	\"=\"\nlinie_noua:\t.asciiz\t\"\\n\"");
	fclose(yyies);

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
