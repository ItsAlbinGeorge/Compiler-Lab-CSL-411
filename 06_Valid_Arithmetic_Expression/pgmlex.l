%{
#include<stdio.h>
#include"y.tab.h"
extern int yylval;
%}
%%
[0-9]+ {
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
