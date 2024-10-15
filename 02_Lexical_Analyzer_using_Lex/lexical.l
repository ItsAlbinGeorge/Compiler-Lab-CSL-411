%{
#include<stdio.h>
%}
%%
"if"|"else"|"else if"|"while"|"return"|"do"|"int"|"float"|"char"|"break"|"jump" {
  printf("Keyword:%s\n",yytext);
}
"=" {
  printf("Assignment:%s\n",yytext);
}
"-" {
  printf("Operator:%s\n",yytext);
}
"[""]" {
  printf("Punctuators:%s\n",yytext);
}
[< > = !][=]* {
  printf("Comparison:%s\n",yytext);
}
[< { ( ' "][> } )  ' "] {
  printf("Punctuators:%s\n",yytext);
}
[+ * / %] {
  printf("Operators:%s\n",yytext);
}
[+][+] {
  printf("Increment:%s\n",yytext);
}
[-][-] {
  printf("Decrement:%s\n",yytext);
}
[0-9] {
  printf("Digit:%s\n",yytext);
}
[0-9]+ {
  printf("Number:%s\n",yytext);
}
[a-zA-Z_][a-zA-Z0-9_]* {
  printf("Identifier:%s\n",yytext);
}
[\t\n]+;
. {
  printf("Uknown character:%s\n",yytext);
}
%%
int main()
{
  printf("Enter inputs:");
  yylex();
  return 0;
}
int yywrap()
{
  return 1;
}