%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror();
%}
%token NUM NL
%left '+''-'
%left '*''/'
%left '('')'
%%
expr:e NL {
	printf("\nValid arithmetic expression\n");
    exit(0);
}
e: e'+'e|e'-'e|e'*'e|e'/'e|'('e')'|NUM;
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