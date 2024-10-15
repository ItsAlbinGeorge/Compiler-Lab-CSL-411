%{
#include<stdio.h>
int l=0,w=0,ch=0;
%}

%%
[ ] {
	w++;
}
[\n] {
	l++;
	w++;
}
[a-zA-Z] {
	ch++;
}
%%
int main()
{
	printf("Enter the input:");
	yylex();
	printf("\n");
	printf("Number of lines:%d\n",l);
	printf("Number of words:%d\n",w);
	printf("Number of characters:%d\n",ch);
	return 0;
}
int yywrap()
{
	return 1;
}