%{
	#include "y.tab.h"
	extern int yylval;

	int lineNo = 1;
	int colNo = 1;
%}

%%
"+"		{ colNo++; return TOK_PLUS; }
"-"		{ colNo++; return TOK_MINUS; }
"*"		{ colNo++; return TOK_MULTIPLY; }
"/"		{ colNo++; return TOK_DIVIDE; }
"("		{ colNo++; return TOK_LEFT; }
")"		{ colNo++; return TOK_RIGHT; }
";"		{ colNo++; return ';'; }
0|[1-9][0-9]*	{ 	colNo+=strlen(yytext); 
					yylloc.first_line = lineNo; 
					yylloc.first_column = colNo; 
					yylval = atoi(yytext); 
					return TOK_NUMBER; }
.		{ colNo++; return TOK_ERROR; }
\n		{ lineNo++;colNo=1; }
%%
