/* Scanner para uma linguagem C simplificado */
%option noyywrap

%{
#include <math.h>
%}

/* definitions */
DIGIT		[0-9]
ID			[a-z][a-z0-9]*
EQUAL 		=
L_PAREN		"("
R_PAREN		")"
L_BRACKET 	"{"
R_BRACKET	"}"
COMMA		","
SEMICOLON	";"
INT 		[+|-]?(0|[1-9][0-9]*)
FLOAT 		[+|-]?[1-9][0-9]*"."[0-9]*
KEYWORD		if|else|for|while|do|switch|return|null|int|float|double|string|bool|break|case
ARITH_OP 	"+"|"-"|"*"|"/"|"%"
REL_OP 		"<"|"<="|"=="|">="|">"

/* rules */
%%

{EQUAL}		{ printf("[EQUAL, %s]\n", yytext);}
{COMMA}		{ printf("[COMMA, %s]\n", yytext);}
{SEMICOLON}	{ printf("[SEMICOLON, %s]\n", yytext);}
{FLOAT} 	{ printf("[FLOAT, %s]\n", yytext); }
{INT} 		{ printf("[INT, %s]\n", yytext); }
{KEYWORD} 	{ printf("[KEYWORD, %s]\n", yytext); }
{ID}		{ printf("[ID, %s]\n", yytext);}
{ARITH_OP}  { printf("[ARITH_OP, %s]\n", yytext); }
{REL_OP} 	{ printf("[REL_OP, %s]\n", yytext); }
{L_PAREN} 	{ printf("L_PAREN, %s]\n", yytext); }
{R_PAREN} 	{ printf("R_PAREN, %s]\n", yytext); }
{L_BRACKET} { printf("L_BRACKET, %s]\n", yytext); }
{R_BRACKET} { printf("R_BRACKET, %s]\n", yytext); }

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
