%{
#include<stdio.h>
int count=0,consonants=0;
%}

%%
[aeiouAEIOU] {
  count++;
}
[a-zA-Z] {
  consonants++;
}
. ;
%%
int main()
{
  printf("Enter inputs:");
  yylex();
  printf("Vowels count:%d\n",count);
  printf("Consonants count:%d\n",consonants);
  return 0;
}
int yywrap()
{
  return 1;
}