%option noyywrap

%{
#include <math.h>
%}

/* definitions */
L_COMMENT   "//".*
N_COMMENT	"/*"([^*]|"*"+[^/*])*"*"+"/"
DIGIT		[0-9]
ID			[a-z|A-Z][a-z0-9A-Z]*
EQUAL 		=
L_PAREN		"("
R_PAREN		")"
L_BRACKET 	"{"
R_BRACKET	"}"
L_SQUARE    "["
R_SQUARE    "]"
COMMA		","
SEMICOLON	";"
INT 		[+|-]?(0|[1-9][0-9]*)
FLOAT 		[+|-]?[1-9][0-9]*"."[0-9]*
KEYWORD		if|else|for|while|do|switch|return|null|NULL|int|float|double|string|bool|break|case|void|#include|printf|scanf
ARITH_OP 	"+"|"-"|"*"|"/"|"%"
REL_OP 		"<"|"<="|"=="|"!="|">="|">"|"?"|":"	
LOGIC_OP	"&&"|"||"
INCLUDES	"<".*">"
STRING   	"\"".*"\""
ADR_VAR		"&"{ID}	

/* rules */
%%
{L_COMMENT} { }
{N_COMMENT} { }
{INCLUDES}	{ printf("[ INCLUDE: %s ]\n", yytext); }
{EQUAL}		{ printf("[ EQUAL: %s ]\n", yytext);}
{COMMA}		{ printf("[ COMMA: %s ]\n", yytext);}
{SEMICOLON}	{ printf("[ SEMICOLON: %s ]\n", yytext);}
{FLOAT} 	{ printf("[ FLOAT: %s ]\n", yytext); }
{INT} 		{ printf("[ INT: %s ]\n", yytext); }
{KEYWORD} 	{ printf("[ KEYWORD: %s ]\n", yytext); }
{ID}		{ printf("[ ID: %s ]\n", yytext);}
{ARITH_OP}  { printf("[ ARITH_OP: %s ]\n", yytext); }
{REL_OP} 	{ printf("[ REL_OP: %s ]\n", yytext); }
{LOGIC_OP}	{ printf("[ LOGIC_OP: %s ]\n", yytext); }
{L_PAREN} 	{ printf("[ L_PAREN: %s ]\n", yytext); }
{R_PAREN} 	{ printf("[ R_PAREN: %s ]\n", yytext); }
{L_BRACKET} { printf("[ L_BRACKET: %s ]\n", yytext); }
{R_BRACKET} { printf("[ R_BRACKET: %s ]\n", yytext); }
{L_SQUARE} 	{ printf("[ L_SQUARE: %s ]\n", yytext); }
{R_SQUARE} 	{ printf("[ R_SQUARE: %s ]\n", yytext); }
{STRING}	{ printf("[ STRING: %s ]\n", yytext); }
{ADR_VAR}	{ printf("[ ADDRESS: %s ]\n", yytext); }

[ \t\n]+	
.	printf("Caractere nao reconhecido: %s\n", yytext);

%%

int main(int argc, char *argv[]){
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	return 0;
}
