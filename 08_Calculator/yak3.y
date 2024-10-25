%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror();
%}
%token NUM NL
%left '+''-'
%left '*''/''%'
%left '('')'
%%
expr:e NL {
	printf("\nResult=%d\n",$$);
	exit(0);
}
e: e'+'e {$$=$1+$3;}|e'-'e {$$=$1-$3;}|e'*'e {$$=$1*$3;}|e'/'e {$$=$1/$3;}|e'%'e {$$=$1%$3;}|'('e')' {$$=$2;}|NUM {$$=$1;};
%%

int main()
{
	int yychar;
	printf("\nEnter the arithmetic expression:");
	yyparse();
	return 0;
}
int yyerror()
{
	printf("\nInvalid expression\n");
	exit(0);
}