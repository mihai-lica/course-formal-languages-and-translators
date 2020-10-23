%{ 
int lineno; 
%} 

%%

^(.*)\n fprintf(yyout, "%4d\t%s", ++lineno, yytext); 

%% 
int main(int argc, char *argv[]) { 
yyin = fopen(argv[1], "r"); 
yyout = fopen(argv[2], "w"); 
yylex(); 
fclose(yyin); 
fclose(yyout);
} 
