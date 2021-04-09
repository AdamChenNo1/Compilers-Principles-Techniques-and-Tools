COMMONFILE = lex.yy.c

t-1:tutorial-1.l
	lex $<
	cc $(COMMONFILE) -o $@.exe

t-2:tutorial-2.l
	lex $<
	cc $(COMMONFILE) -o $@.exe

t-3:tutorial-3.l
	lex $<
	cc $(COMMONFILE) -o $@.exe

t-4:tutorial-4.l
	lex $<
	cc $(COMMONFILE) -o $@.exe
clean:
	rm -f *.exe *.c