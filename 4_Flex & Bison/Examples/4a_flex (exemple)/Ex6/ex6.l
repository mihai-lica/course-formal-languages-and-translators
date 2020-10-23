%{
    #include<string.h>
	#include <ctype.h>
%}

%%

[a-zA-Z][a-zA-Z0-9]*/[ \t\n]*[{]   {yytext[0]=(char)toupper(yytext[0]); fprintf(yyout, "%s", yytext);}
[a-zA-Z][a-zA-Z0-9]*   {yytext[0]=(char)tolower(yytext[0]); fprintf(yyout, "%s", yytext);}
. ECHO;
\n ECHO;

%%
