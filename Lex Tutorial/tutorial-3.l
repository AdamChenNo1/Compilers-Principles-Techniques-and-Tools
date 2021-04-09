%{
    /* 复制文件，并在新文件的每一行前面插入行号 */
    #include <string.h>
    int yylineno;
%}
%%
^(.*)(\n)? fprintf(yyout,"%4d\t%s", yylineno++, yytext);/*在每一行前加行号并输出至文件*/
%%
int yywrap(void) {
    return 1;
}
int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    char *filename = strcat(argv[1],"-1");
    yyout = fopen(filename,"w+");
    yylex();
    fclose(yyin);
    fclose(yyout);
}