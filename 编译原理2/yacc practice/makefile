.PHONY: expr, operator, clean
expr:
	bison -d yacc.y
	gcc -o yacc yacc.tab.c
operator:
	bison -d trans.y
	gcc -o trans trans.tab.c
clean:
	rm -fr *.out
