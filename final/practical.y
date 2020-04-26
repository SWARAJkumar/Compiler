%{
#include <stdio.h>
int yylex(void);
void yyerror(char*);
extern FILE* yyin;
%}
%token ID INTEGER IF THEN ELSE WHILE TRUE FALSE MAIN

%%
start:		MAIN '(' ')' '{'program	'}'		{printf(".....PARSING COMPLETED.....\n ");}
program:	stmt program
			|
			;

stmt:		assignment
			| cond
			| loop
			;

assignment:		ID '=' expr ';'
			;

cond:		IF '(' expr ')' stmt
			| IF '(' expr ')' stmt ELSE stmt
			;

loop:		WHILE '(' expr ')' stmt
			;

expr:		expr '+' expr
			| expr '-' expr
			| expr '*' expr
			| expr '/' expr
			| '(' expr ')'
			| INTEGER
			| ID
			| TRUE
			| FALSE
			;

%%
int main(void)
{
	yyin=fopen("input.cpp","r");
	yyparse();
}

void yyerror(char* str)
{
	printf("%s",str);
}