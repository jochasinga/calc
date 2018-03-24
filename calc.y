%{
#include <stdio.h>
%}

/* list of tokens */				 
%token NUMBER
%token ADD SUB MUL DIV PER PIP AMP
%token EOL

%%

calclist: /* nothing */
| calclist exp EOL { printf("= %d\n", $2); }
;
exp: factor
| exp PIP factor { $$ = $1 | $3; }	
| exp AMP factor { $$ = $1 & $3; }	
| exp ADD factor { $$ = $1 + $3; }
| exp SUB factor { $$ = $1 - $3; }
;
factor: term
| factor MUL term { $$ = $1 * $3; }
| factor DIV term { $$ = $1 / $3; }
| factor PER term { $$ = $1 % $3; }	
;
term: NUMBER
| PIP term { $$ = $2 >= 0? $2 : - $2; }
;

%%
main(int argc, char **argv)
{
    yyparse();
}
yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
