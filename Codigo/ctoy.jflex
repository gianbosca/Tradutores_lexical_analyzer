/*
	C Toy - Example of JFlex usage for generating a simple C language lexer class

	Tradutores - Ciência da Computação, Unisinos - 2019

	Alunos:
		- Bruno Vieira
		- Gian Boschetti
		- Joice Gomes
		- Orlando Rodrigues

*/
import java.util.HashMap;
import java.util.Map;

%%

%class CToy
%standalone
%unicode
%line
%column

%{
	final Map<String, Integer> map = new HashMap<>();

	public void printID(String identifier) {
		String text = "";
		
		if (map.containsKey(identifier)) {
			final int position = map.get(identifier);

			text = "[ Identifier referenced ] : " + position + " - " + identifier;
		} else {
			final int size = map.size();

			map.put(identifier, size);
			text = "[ New Identifier ] : " + size + " - " + identifier;
		}

		System.out.println(text);

	}
%}

/* definitions */
L_COMMENT   = "//".*
N_COMMENT	= "/*"([^*]|"*"+[^/*])*"*"+"/"
DIGIT		= [0-9]
ID			= [a-z|A-Z][a-z0-9A-Z]*
EQUAL 		= =
L_PAREN		= "("
R_PAREN		= ")"
L_BRACKET 	= "{"
R_BRACKET	= "}"
L_SQUARE    = "["
R_SQUARE    = "]"
COMMA		= ","
SEMICOLON	= ";"
INT 		= [+|-]?(0|[1-9][0-9]*)
FLOAT 		= [+|-]?[1-9][0-9]*"."[0-9]*
KEYWORD		= if|else|for|while|do|switch|return|null|NULL|int|float|double|string|bool|break|case|void|#include|printf|scanf
ARITH_OP 	= "+"|"-"|"*"|"/"|"%"
REL_OP 		= "<"|"<="|"=="|"!="|">="|">"|"?"|":"	
LOGIC_OP	= "&&"|"||"
INCLUDES	= "<".*">"
STRING   	= "\"".*"\""
ADR_VAR		= "&"{ID}	


/* rules */
%%
{L_COMMENT} { }
{N_COMMENT} { }
{INCLUDES}	{ System.out.println("[ INCLUDE: " + yytext() + " ] "); }
{EQUAL}		{ System.out.println("[ EQUAL: " + yytext() + " ] ");}
{COMMA}		{ System.out.println("[ COMMA: " + yytext() + " ] ");}
{SEMICOLON}	{ System.out.println("[ SEMICOLON: " + yytext() + " ] ");}
{FLOAT} 	{ System.out.println("[ FLOAT: " + yytext() + " ] "); }
{INT} 		{ System.out.println("[ INT: " + yytext() + " ] "); }
{KEYWORD} 	{ System.out.println("[ KEYWORD: " + yytext() + " ] "); }
{ID}		{ printID(yytext());}
{ARITH_OP}  { System.out.println("[ ARITH_OP: " + yytext() + " ] "); }
{REL_OP} 	{ System.out.println("[ REL_OP: " + yytext() + " ] "); }
{LOGIC_OP}	{ System.out.println("[ LOGIC_OP: " + yytext() + " ] "); }
{L_PAREN} 	{ System.out.println("[ L_PAREN: " + yytext() + " ] "); }
{R_PAREN} 	{ System.out.println("[ R_PAREN: " + yytext() + " ] "); }
{L_BRACKET} { System.out.println("[ L_BRACKET: " + yytext() + " ] "); }
{R_BRACKET} { System.out.println("[ R_BRACKET: " + yytext() + " ] "); }
{L_SQUARE} 	{ System.out.println("[ L_SQUARE: " + yytext() + " ] "); }
{R_SQUARE} 	{ System.out.println("[ R_SQUARE: " + yytext() + " ] "); }
{STRING}	{ System.out.println("[ STRING: " + yytext() + " ] "); }
{ADR_VAR}	{ System.out.println("[ ADDRESS: " + yytext() + " ] "); }