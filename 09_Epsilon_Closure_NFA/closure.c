#include<stdio.h>
#include<string.h>
char states[20][20],copy[6],result[20][20];

void addstate(char a[3],int j)
{
	strcpy(result[j],a);
}

void display(int j)
{
	int i=0;
	printf("Epsilon closure of %s:{",copy);
	while(i<j)
	{
		printf("%s",result[i]);
		i++;
		
	}
	printf("}\n");
}

void main()
{
	int i,j,n,end;
	char initial[6],input[3],output[6],state[6];
	FILE *fp1;
	fp1=fopen("table.dat","r");
	printf("Enter the number of states:");
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		printf("Enter the state[%d]:",i+1);
		scanf("%s",states[i]);
	}
	for(i=0;i<n;i++)
	{
		j=0;
		strcpy(state,states[i]);
		strcpy(copy,state);
		addstate(state,j++);
		while(1)
		{
			end=fscanf(fp1,"%s%s%s",initial,input,output);
			if(end==EOF)
				break;
			if(strcmp(state,initial)==0)
			{
				if(strcmp(input,"e")==0)
				{
					addstate(output,j++);
					strcpy(state,output);
				}
			}
		}
		display(j);
		rewind(fp1);
	}
}
/*
OUTPUT
======
Enter the number of states:3
Enter the state[1]:q0
Enter the state[2]:q1
Enter the state[3]:q2
Epsilon closure of q0:{q0q1q2}
Epsilon closure of q1:{q1q2}
Epsilon closure of q2:{q2}
*/