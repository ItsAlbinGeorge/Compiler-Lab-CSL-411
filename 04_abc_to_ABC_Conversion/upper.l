%{
#include<stdio.h>
#include<string.h>
int l,i;
%}
%%
[a-z A-Z]* {
	l=strlen(yytext);
	for(i=0;i<l;i++)
	{
		if(yytext[i]=='a'&&yytext[i+1]=='b'&&yytext[i+2]=='c')
		{
			yytext[i]='A';
			yytext[i+1]='B';
			yytext[i+2]='C';
		}
	}
	printf("The converted string is:%s\n",yytext);
}
%%
int main()
{
	printf("Enter the string:");
	yylex();
	return 0;
}
int yywrap()
{
	return 1;
}