import java_cup.runtime.*;

%%
%class Scanner
%line
%column
%cup
%unicode

%{
StringBuffer stringBuffer = new StringBuffer();
private Symbol symbol(int type) {
   return new Symbol(type, yyline, yycolumn);
}
private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
}
%}

LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f]
Identifier = [:jletter:] [:jletterdigit:]*  /* letter followed by a combination of letters and/or digits */
Definition = ")"{WhiteSpace}*"{"            /* the pattern ') {' differentiates the function definition from the function call */

%state STRING

%%

<YYINITIAL> {
    "+"            { return symbol(sym.CONCAT); }
    "("            { return symbol(sym.LPAREN); }
    ")"            { return symbol(sym.RPAREN); }
    "}"            { return symbol(sym.RBRACK); }
    ","            { return symbol(sym.COMMA);  }
    "if"           { return symbol(sym.IF);     }
    "else"         { return symbol(sym.ELSE);   }
    "reverse"      { return symbol(sym.REVERSE);}
    "prefix"       { return symbol(sym.PREFIX); }
    \"             { stringBuffer.setLength(0); yybegin(STRING); }
    {WhiteSpace}   { /* just skip what was found, do nothing */ }
    {Identifier}   { return symbol(sym.IDENTIFIER, yytext()); }
    {Definition}   { return symbol(sym.DEFINITION);   }
}

<STRING> {
    \"             { yybegin(YYINITIAL); return symbol(sym.STRING_LITERAL, stringBuffer.toString()); }
    [^\n\r\"\\]+   { stringBuffer.append( yytext() ); }
    \\t            { stringBuffer.append('\t'); }
    \\n            { stringBuffer.append('\n'); }
    \\r            { stringBuffer.append('\r'); }
    \\\"           { stringBuffer.append('\"'); }
    \\             { stringBuffer.append('\\'); }
}

[^] { throw new Error("Illegal character <"+yytext()+">"); }