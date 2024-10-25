%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror();
%}
%token CHAR NL
%%
expr:e NL {
	printf("\nValid Identifier\n");
	exit(0);
}
e: CHAR;
%%

int main()
{
	int yychar;
	printf("\nEnter the identifier:");
	yyparse();
	return 0;
}
int yyerror()
{
	printf("\nInvalid identifier\n");
	exit(0);
}