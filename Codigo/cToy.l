/* Scanner para uma linguagem C simplificado */
/* "{"[\^{}}\n]*"}"	 old code*/

%option noyywrap

%{

#include <math.h>

%}

/* tokens */
DIGIT		[0-9]
ID			[a-z][a-z0-9]*
EQUAL 		[=]
L_PAREN		[(]
R_PAREN		[)]
L_BRACKET 	[{]
R_BRACKET	[}]
COMMA		[,]
SEMICOLON	[;]

/* rules */
%%
{DIGIT}+ 			{printf("[Número inteiro, %s (%d)]\n", yytext, atoi(yytext));}

{DIGIT}"."{DIGIT}* 	{printf("[Número float, %s (%f)]\n", yytext, atof(yytext));}

if|else|int|char|float|	{
					printf("[Palavra reservada, %s]\n ", yytext);}

{ID}				{printf("[Identificador, %s]\n", yytext);}

{EQUAL}				{printf("[EQUAL, %s]\n", yytext);}

{L_PAREN}			{printf("[L_PAREN, %s]\n", yytext);}

{R_PAREN}			{printf("[R_PAREN, %s]\n", yytext);}

{L_BRACKET}			{printf("[L_BRACKET, %s]\n", yytext);}

{R_BRACKET}			{printf("[R_BRACKET, %s]\n", yytext);}

{COMMA}				{printf("[COMMA, %s]\n", yytext);}

{SEMICOLON}			{printf("[SEMICOLON, %s]\n", yytext);}

"+"|"-"|"*"|"/" 	{printf("[Operador encontrado, %s]\n", yytext);}

[ \t\n]+		

.	printf("Caractere nao reconhecido: %s\n", yytext);

%%

int main(int argc, char *argv[]){
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	return 0;
}
