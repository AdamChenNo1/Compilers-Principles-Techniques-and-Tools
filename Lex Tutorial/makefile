COMMONFILE = lex.yy.c

t-1:tutorial-1.l
	lex $<
	cc $(COMMONFILE) -o $@.exe

t-2:tutorial-2.l
	lex $<
	cc $(COMMONFILE) -o $@.exe

clean:
	rm -f *.exe *.c