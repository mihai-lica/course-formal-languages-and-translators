%{
	#include "y.tab.h"
%}

%%

"+"		{ return TOK_PLUS; }
"-"		{ return TOK_MINUS; }
"*"		{ return TOK_MULTIPLY; }
"/"		{ return TOK_DIVIDE; }
"("		{ return TOK_LEFT; }
")"		{ return TOK_RIGHT; }
";"		{ return ';'; }
[1-9][0-9]*|0	{ return TOK_NUMBER; }
.		{ return TOK_ERROR; }

%%
