%{
#include <string.h>
#include <ctype.h>
%}
%s CLASSDEF

%% 

<INITIAL>[a-zA-Z][a-zA-Z0-9]* { yytext[0]=(char)tolower(yytext[0]); fprintf(yyout, "%s", yytext); }
<INITIAL>"class"[ ]+ { ECHO; BEGIN CLASSDEF; }
<CLASSDEF>[a-zA-Z][a-zA-Z0-9]*  {yytext[0]=(char)toupper(yytext[0]); fprintf(yyout, "%s", yytext); BEGIN INITIAL; }
. ECHO;
\n ECHO;

%%
