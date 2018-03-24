%{
#include "calc.tab.h"
char *ptr;
%}

%%

"+"          { return ADD; }
"-"          { return SUB; }
"*"          { return MUL; }
"/"          { return DIV; }
"%"          { return PER; }
"|"          { return PIP; }
"&"          { return AMP; }
"~"          { return TIL; }
"("          { return LP; }
")"          { return RP; }
#.*\n        { /* ignore comment */ }
-{0,1}[0-9]+ { yylval = atoi(yytext); return NUMBER; }
0x[a-f0-9]+  { yylval = strtol(yytext, &ptr, 16); return NUMBER; }
\n           { return EOL; }
[ \t]        { /* ignore whitespace */ }
.            { printf("Mystery character %c\n", *yytext); }

%%

