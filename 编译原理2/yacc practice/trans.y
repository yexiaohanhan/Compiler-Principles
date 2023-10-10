%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
#pragma warning(disable:4996)

char idStr[100];
char numStr[100];
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
%}

//DONE TODO:给每个符号定义一个单词类别
%token ADD MINUS MULT DIVI
%token NUMBER
%token ID
%token LEFT_PAR
%token RIGHT_PAR
%left ADD MINUS
%left MULT DIVI
%right UMINUS         

%%


lines   :       lines expr ';' { printf("%s\n", $2); }
        |       lines ';'
        |
        ;
//DONE TODO:完善表达式的规则
expr    :       expr ADD expr   { $$ = (char*)malloc(100*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"+"); }
        |       expr MINUS expr { $$ = (char*)malloc(100*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"- "); }  
	|       expr MULT expr  { $$ = (char*)malloc(100*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"* "); }
	|       expr DIVI expr  { $$ = (char*)malloc(100*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"/ "); }
        |       LEFT_PAR expr RIGHT_PAR   { $$ = $2; }	
        |       MINUS expr %prec UMINUS   { $$ = (char*)malloc(100*sizeof(char)); strcpy($$,"- "); strcat($$,$2); }
        |       NUMBER  {$$ = (char*)malloc(100*sizeof(char)); strcpy($$,$1); strcat($$," "); }
	|       ID  {$$ = (char*)malloc(100*sizeof(char)); strcpy($$,$1); }
	// test string
        ;

%%

int yylex()
{
    int t;
    while(1){
        t=getchar();
        if(t==' ' || t=='\t'||t=='\n')
            ;
        
        // NUMBER 的翻译模式执行动作就修改为将yylval的值拷贝给 NUMBER
        // 因为 yacc 默认将 yylval 的值赋给了识别出的标识符完成了赋值
        else if (isdigit(t)){
            int t0=0;
            while(isdigit(t)){
                numStr[t0]=t;
                t=getchar();
                t0++;
            }
            // 在字符串最后添加结束符\0
            numStr[t0]='\0';
            yylval=numStr;
            ungetc(t,stdin);
            return NUMBER;
        }
        
        // 读一个字符为字母或下划线
        else if (isalpha(t)||(t=='_')){
            int ti=0;
            while(isalpha(t)||(t=='_')||isdigit(t)){
                idStr[ti]=t;
                ti++;
                t=getchar();
            }
            idStr[ti]='\0';
            yylval=idStr;
            ungetc(t,stdin);
            return ID;
        }
        else if(t=='+') {
            return ADD;  
        }
        else if(t=='-'){
            return MINUS;
        }
        else if(t=='*'){
            return MULT;
        }
        else if(t=='/'){
            return DIVI;
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
