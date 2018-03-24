calc:  	hexc.l hexc.y
	bison -d hexc.y
	flex hexc.l
	gcc -o $@ hexc.tab.c lex.yy.c -ll
