%{
#include<stdio.h>
#include"y.tab.h"
extern int yylval;
%}
%%
[0-9]+ {
	yylval=atoi(yytext);
	return NUM;
}
[\t];
"\n" {
	return NL;
}
. {
	return yytext[0];
}
%%
