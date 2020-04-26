%{
#include "y.tab.h"
extern FILE* yyin;
%}

%%
main                    {return MAIN; }
if 						{return IF; }
then					{return THEN; }
else					{return ELSE; }
while					{return WHILE; }
true                    {return TRUE;}
false                   {return FALSE;}
[0-9]+					{return INTEGER; }
[a-zA-Z][0-9a-zA-Z]*	{return ID; }
[ \t\n]					{; }
.						{return yytext[0]; }
%%