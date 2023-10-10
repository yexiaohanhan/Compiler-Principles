%{

#include<stdio.h>
#include<stdlib.h>
#include <ctype.h>  //导入isdigit()函数

#ifndef YYSTYPE
#define YYSTYPE double 
#endif
int yylex();

extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
%}

//结合性和优先级
%token NUMBER
%token ADD
%token SUB
%token MUL
%token DIV
%token LEFT_PAR
%token RIGHT_PAR

%left ADD SUB
%left MUL DIV
%right UMINUS // 取负

%%

// 处理输入的一行以分号结束的简单表达式
lines :    lines expr ';' { printf("%f\n", $2); } 
      |    lines ';'
      |
      ;

expr  :    expr ADD expr  { $$ = $1 + $3; } 
      |    expr SUB expr  { $$ = $1 - $3; }
      |    expr MUL expr  { $$ = $1 * $3; }
      |    expr DIV expr  { $$ = $1 / $3; }
      |    LEFT_PAR expr RIGHT_PAR   { $$ = $2; }
      |    '-'expr %prec UMINUS  { $$ =-$2; }  
      ;
%%

// programs section

// yylex函数：实现词法分析功能
int yylex()
{
    // place you tiken retrieving code here
    int t;
    while (1) {
        t = getchar();
        if (t==' ' || t=='\t' || t=='\n'){
            // do nothing
        }
        else if (isdigit(t)) {
            yylval = 0;
            while (isdigit(t)) {
                yylval = yylval * 10 + t - '0';
                t = getchar();
            }
            ungetc(t, stdin);
            return NUMBER;
        }
        else if(t=='+') {
            return ADD;  
        }
        else if(t=='-'){
            return SUB;
        }
        else if(t=='*'){
            return MUL;
        }
        else if(t=='/'){
            return DIV;
        }
        else if(t=='('){
            return LEFT_PAR;
        }
        else if(t==')'){
            return RIGHT_PAR;
        }
        else {
            return t;
        }
    }
}

int main(void)
{
    yyin = stdin;
    do{
        yyparse();
    } while(!feof(yyin));
    return 0;
}

void yyerror(const char* s){
    fprintf(stderr, "Parse error: %s\n", s);
    exit(1);
}
