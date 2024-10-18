#include <stdio.h>
#include <ctype.h>
#include <string.h>
char keywords[10][20]={"int","main","include","float","if","else","for","while","return","char"};
int isKeyword(char token[]) 
{
    int i;
    for(i=0;i<10;i++)
    {
        if(strcmp(token,keywords[i])==0) 
        {
            return 1;
        }
    }
    return 0;
}
int isOperator(char ch) 
{
    int i;
    char operators[]="+-*/=<>!&|";
    for(i=0;i<strlen(operators);i++) 
    {
        if(ch==operators[i]) 
        {
            return 1;
        }
    }
    return 0;
}
int isSeparator(char ch) 
{
    int i;
    char separators[]="(){}[],;";
    for(i=0;i<strlen(separators);i++) 
    {
        if(ch==separators[i]) 
        {
            return 1;
        }
    }
    return 0;
}
int main() 
{
    int i=0;
    char ch,token[100];
    FILE *inputFile,*outputFile;
    inputFile=fopen("input.txt","r");
    outputFile=fopen("output.txt","w");
    while((ch=fgetc(inputFile))!=EOF) 
    {
        if(ch==' '||ch=='\t'||ch=='\n') 
        {
            continue;
        }
        if(ch=='/') 
        {
            ch=fgetc(inputFile);
            if(ch=='/') 
            { 
                while((ch=fgetc(inputFile))!=EOF&&ch!='\n');
            } 
            else if(ch=='*') 
            {
                while((ch=fgetc(inputFile))!=EOF) 
                {
                    if(ch=='*'&&(ch=fgetc(inputFile))=='/') 
                        break;
                }
            }
            else
            {
                ungetc(ch,inputFile);
                ch='/';
            }
        }
        if(isalpha(ch)||ch=='_') 
        {
            i=0;
            token[i++]=ch;
            ch=fgetc(inputFile);
            while(isalnum(ch)||ch=='_') 
            {
                token[i++]=ch;
                ch=fgetc(inputFile);
            }
            token[i]='\0';
            if(isKeyword(token))
            {
                fprintf(outputFile,"Keyword: %s\n",token);
            } 
            else 
            {
                fprintf(outputFile,"Identifier: %s\n",token);
            }
            ungetc(ch,inputFile);
        }
        else if(isdigit(ch))
        {
            i=0;
            token[i++]=ch;
            ch=fgetc(inputFile);
            while(isdigit(ch)||ch=='.') 
            {
                token[i++]=ch;
                ch=fgetc(inputFile);
            }
            token[i]='\0';
            fprintf(outputFile,"Number: %s\n",token);
            ungetc(ch,inputFile);
        }
        else if(isOperator(ch)) 
        {
            fprintf(outputFile,"Operator: %c\n",ch);
        }
        else if(isSeparator(ch)) 
        {
            fprintf(outputFile,"Separator: %c\n",ch);
        }
    }
    fclose(inputFile);
    fclose(outputFile);
    printf("Lexical analysis complete. Check 'output.txt' for tokens.\n");
    return 0;
}
/*
OUTPUT
======
Lexical analysis complete. Check 'output.txt' for tokens.
 */
