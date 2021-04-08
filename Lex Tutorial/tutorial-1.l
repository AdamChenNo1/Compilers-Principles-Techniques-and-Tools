%%
    /* 将标准输入直接打印至标准输出 */
.|\n ECHO;
%%
int yywrap(void) {
    return 1;
}
int main(void) {
    yylex();
    return 0;
}