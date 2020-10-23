%{
int charcount=0,linecount=0,wordcount=0;
%}
letter [^ \t\n]

%%

{letter}+ {wordcount++; charcount+=yyleng;}
. charcount++;
\n {linecount++; charcount++;}

%%
int main()
{
yylex(); // End-of-File Ctrl+D
printf("There were %d word with %d characters in %d lines\n", wordcount,charcount,linecount);
return 0;
}
