%{
	#include "y.tab.h"

	int lineNo = 1;
	int colNo = 1;
%}

%%
"+"				{ colNo++; return TOK_PLUS; }
"-"				{ colNo++; return TOK_MINUS; }
"*"				{ colNo++; return TOK_MULTIPLY; }
"/"				{ colNo++; return TOK_DIVIDE; }
"("				{ colNo++; return TOK_LEFT; }
")"				{ colNo++; return TOK_RIGHT; }
";"				{ colNo++; return ';'; }
"="				{ colNo++; return '='; }
0|[1-9][0-9]*	{ 	yylloc.first_line = lineNo; 
					yylloc.first_column = colNo; 
					colNo+=strlen(yytext); 
					yylval.val = atoi(yytext); 
					return TOK_NUMBER; }
"var"			{ colNo+=3; return TOK_DECLARE; }
"print"			{ colNo+=5; return TOK_PRINT; }
[a-zA-Z][a-zA-Z0-9]* { 	yylloc.first_line = lineNo; 
						yylloc.first_column = colNo; 
						colNo+=strlen(yytext); 
						yylval.sir = new char[strlen(yytext)+1]; 
						strcpy(yylval.sir,yytext); 
						return TOK_VARIABLE;}
[ ]				{ colNo++; }
\r\n			{ lineNo++; colNo=1; }
\n				{ lineNo++; colNo=1; }
.				{ colNo++; return TOK_ERROR; }
%%
