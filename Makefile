calc:	calc.l calc.y
	bison -d calc.y
	flex calc.l
	cc -o $@ calc.tab.c lex.yy.c -ll
