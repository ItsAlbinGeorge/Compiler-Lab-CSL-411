%{
#include<stdio.h>
#include"y.tab.h"
extern int yylval;
%}
%%
[a-z A-Z _][a-z A-Z 0-9 _]* {
	return CHAR;
}
[\t];
"\n" {
	return NL;
}
. {
	return yytext[0];
}
%%
