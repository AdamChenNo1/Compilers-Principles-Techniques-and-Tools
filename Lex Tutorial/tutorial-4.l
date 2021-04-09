%{
    /* 复制文件，并将新文件中每个非空的空白符序列替换为单个空格 */
    #include <string.h>
    int yylineno;
%}
%%
[ \t]+ fprintf(yyout," ", yytext);
. ECHO;
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