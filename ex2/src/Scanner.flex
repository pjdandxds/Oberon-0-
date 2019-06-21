import java_cup.runtime.*;
import java.io.*;

%%

/*少一些*/
%public
%class Scanner
%cup
%unicode
%line 
%column
%debug

%{

int get_line(){	return yyline;}
int get_column(){	return yycolumn;}


private java_cup.runtime.Symbol symbol(int type) 
{
	return new java_cup.runtime.Symbol(type);
}
private java_cup.runtime.Symbol symbol(int type, Object value)
{
	return new java_cup.runtime.Symbol(type, value);
}
%}

Comment		= "(*"~"*)"
WhiteSpace 	= " "|\t|\b|\f|\r|\n|\r\n
Identifier		= [:jletter:]+[:jletterdigit:]*
Number		= {Decimal} | {Octal}
Decimal		= 0 | [1-9]+[0-9]*
Octal		= 0[0-7]*

%%

<YYINITIAL>
{
"+"		{return symbol(sym.PLUS);}
"-"		{return symbol(sym.MINUS);}
"*"		{return symbol(sym.TIMES);}
"DIV"		{return symbol(sym.DIVIDE);}
"MOD"		{return symbol(sym.MOD);}
":="		{return symbol(sym.ASSIGN);}

"="		{return symbol(sym.EQ);}
"#"		{return symbol(sym.NEQ);}
"<"		{return symbol(sym.LT);}
"<="		{return symbol(sym.LE);}
">"		{return symbol(sym.GT);}
">="		{return symbol(sym.GE);}
"OR"		{return symbol(sym.OR);}
"&"		{return symbol(sym.AND);}
"~"		{return symbol(sym.NOT);}

";"		{return symbol(sym.SEMI);}
":"		{return symbol(sym.COLON);}
","		{return symbol(sym.COMMA);}
"."		{return symbol(sym.PERIOD);}
"["		{return symbol(sym.LBRACKET);}
"]"		{return symbol(sym.RBRACKET);}
"("		{return symbol(sym.LPAREN);}
")"		{return symbol(sym.RPAREN);}

"IF"		{return symbol(sym.IF);}
"THEN"		{return symbol(sym.THEN);}
"ELSIF"		{return symbol(sym.ELSIF);}
"ELSE"		{return symbol(sym.ELSE);}
"WHILE"		{return symbol(sym.WHILE);}    
"DO"		{return symbol(sym.DO);}
"BEGIN"		{return symbol(sym.BEGIN);}
"CONST"		{return symbol(sym.CONST);}
"END"		{return symbol(sym.END);}
"MODULE"	{return symbol(sym.MODULE);}
"OF"		{return symbol(sym.OF);}
"PROCEDURE"	{return symbol(sym.PROCEDURE);}
"RECORD"		{return symbol(sym.RECORD);}
"ARRAY"		{return symbol(sym.ARRAY);}
"VAR"		{return symbol(sym.VAR);}
"TYPE"		{return symbol(sym.TYPE);}
"READ"		{return symbol(sym.READ);}
"WRITE"		{return symbol(sym.WRITE);}
"writeln"		{return symbol(sym.WRITELN);}
"INTEGER"	{return symbol(sym.INTEGER);}
"BOOLEAN"	{return symbol(sym.BOOLEAN);}




{WhiteSpace}	{/*Do nothing*/}
{Comment}	{/*Do nothing*/}
{Number}		{
			if (yylength() > 12)
				;/*异常*/

			return symbol(sym.NUMBER, yytext());
		}
{Identifier}		{
			if (yylength() > 24)
				;/*异常*/
			return symbol(sym.IDENTIFIER, yytext());
		}
}
[^]		{/*异常*/}
