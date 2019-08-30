/* Scanner para uma linguagem C simplificado */
/* {L_PAREN}	{printf("[L_PAREN, %s]\n", yytext);}*/
/* {R_PAREN}	{printf("[R_PAREN, %s]\n", yytext);}*/
/* {L_BRACKET}	{printf("[L_BRACKET, %s]\n", yytext);}*/
/* {R_BRACKET}	{printf("[R_BRACKET, %s]\n", yytext);}*/
/* {COMMA}		{printf("[COMMA, %s]\n", yytext);}*/
/* {SEMICOLON}	{printf("[SEMICOLON, %s]\n", yytext);}*/

%option noyywrap

%{

#include <math.h>

%}


DIGIT		[0-9]
ID			[a-z][a-z0-9]*
EQUAL 		=
L_PAREN		'('
R_PAREN		)
L_BRACKET 	{
R_BRACKET	}
COMMA		,
SEMICOLON	;


%%

{EQUAL}		{printf("[EQUAL, %s]\n", yytext);}





{DIGIT}+ { printf("Numero inteiro encontrado: %s (%d)\n", yytext, atoi(yytext));}

{DIGIT}"."{DIGIT}* {printf("Numero float encontrado: %s (%f)\n", yytext, atof(yytext));}

if|then|begin|procedure|function	{
		printf("Palavra reservada encontrada: %s\n ", yytext);}

{ID}	{printf("Identificador encontrado: %s\n", yytext);}


"+"|"-"|"*"|"/" {printf("Operador encontrado: %s\n", yytext);}

"("  {printf("l_parent: %s\n", yytext);}

"{"[\^{}}\n]*"}"	

[ \t\n]+		

.	printf("Caractere nao reconhecido: %s\n", yytext);

%%

int main(int argc, char *argv[]){
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	return 0;
}
