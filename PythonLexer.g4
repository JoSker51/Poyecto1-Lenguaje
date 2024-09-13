lexer grammar PythonLexer;

@header {
    import sys
}

@members {
    # Abre el archivo de salida al iniciar el lexer
    output_file = open("tokens_output.txt", "w")

    # Función para escribir el token en el archivo
    def write_token(self, token_text, token_type, line):
        output_file.write(f"Palabra: {token_text}, Token: {token_type}, Línea: {line}\n")

    # Cierra el archivo al finalizar
    def close_output(self):
        output_file.close()
}

FALSE:     'false' { self.write_token('false', self.get_token_line()) };
NONE:      'none'  { self.write_token('none', self.get_token_line()) };
TRUE:      'true'  { self.write_token('true', self.get_token_line()) };
AND:       'and'   { self.write_token('and', self.get_token_line()) };
AS:        'as'    { self.write_token('as', self.get_token_line()) };
ASSERT:    'assert' { self.write_token('assert', self.get_token_line()) };
ASYNC:     'async' { self.write_token('async', self.get_token_line()) };
AWAIT:     'await' { self.write_token('await', self.get_token_line()) };
BREAK:     'break' { self.write_token('break', self.get_token_line()) };
CLASS:     'class' { self.write_token('class', self.get_token_line()) };
CONTINUE:  'continue' { self.write_token('continue', self.get_token_line()) };
DEF:       'def' { self.write_token('def', self.get_token_line()) };
DEL:       'del' { self.write_token('del', self.get_token_line()) };
ELIF:      'elif' { self.write_token('elif', self.get_token_line()) };
ELSE:      'else' { self.write_token('else', self.get_token_line()) };
EXCEPT:    'except' { self.write_token('except', self.get_token_line()) };
FINALLY:   'finally' { self.write_token('finally', self.get_token_line()) };
FOR:       'for' { self.write_token('for', self.get_token_line()) };
FROM:      'from' { self.write_token('from', self.get_token_line()) };
GLOBAL:    'global' { self.write_token('global', self.get_token_line()) };
IF:        'if' { self.write_token('if', self.get_token_line()) };
IMPORT:    'import' { self.write_token('import', self.get_token_line()) };
IN:        'in' { self.write_token('in', self.get_token_line()) };
IS:        'is' { self.write_token('is', self.get_token_line()) };
LAMBDA:    'lambda' { self.write_token('lambda', self.get_token_line()) };
NONLOCAL:  'nonlocal' { self.write_token('nonlocal', self.get_token_line()) };
NOT:       'not' { self.write_token('not', self.get_token_line()) };
OR:        'or' { self.write_token('or', self.get_token_line()) };
PASS:      'pass' { self.write_token('pass', self.get_token_line()) };
RAISE:     'raise' { self.write_token('raise', self.get_token_line()) };
RETURN:    'return' { self.write_token('return', self.get_token_line()) };
TRY:       'try' { self.write_token('try', self.get_token_line()) };
WHILE:     'while' { self.write_token('while', self.get_token_line()) };
WITH:      'with' { self.write_token('with', self.get_token_line()) };
YIELD:     'yield' { self.write_token('yield', self.get_token_line()) };

ID:        [a-zA-Z_][a-zA-Z0-9_]* { self.write_token('IDENTIFIER', self.get_token_line()) };

INTEGER:   ('0' [bB][01]+ | '0' [oO]?[0-7]+ | '0' [xX][0-9a-fA-F]+ | [0-9]+) { self.write_token('INTEGER_LITERAL', self.get_token_line()) };
FLOAT:     ([0-9]+ '.' [0-9]* ([eE] [+-]? [0-9]+)? | [0-9]+ [eE] [+-]? [0-9]+) { self.write_token('FLOAT_LITERAL', self.get_token_line()) };

STRING:    '"' ('[^\\"]' | '\\'.)* '"' | '\'' ('[^\\\']' | '\\'.)* '\'' { self.write_token('STRING_LITERAL', self.get_token_line()) };

COMMENT:   '#' ~[\n]* -> skip;

PLUS:      '+' { self.write_token('PLUS', self.get_token_line()) };
MINUS:     '-' { self.write_token('MINUS', self.get_token_line()) };
STAR:      '*' { self.write_token('STAR', self.get_token_line()) };
SLASH:     '/' { self.write_token('SLASH', self.get_token_line()) };
PERCENT:   '%' { self.write_token('PERCENT', self.get_token_line()) };
DOUBLESTAR: '**' { self.write_token('DOUBLESTAR', self.get_token_line()) };
DOUBLESLASH: '//' { self.write_token('DOUBLESLASH', self.get_token_line()) };

LPAREN:    '(' { self.write_token('LPAREN', self.get_token_line()) };
RPAREN:    ')' { self.write_token('RPAREN', self.get_token_line()) };
LBRACE:    '{' { self.write_token('LBRACE', self.get_token_line()) };
RBRACE:    '}' { self.write_token('RBRACE', self.get_token_line()) };

COLON:      ':' { write_token('COLON', self.line) };
COMMA:      ',' { write_token('COMMA', self.line) };
EQUALS:     '=' { write_token('EQUALS', self.line) };
DOT:        '.' { write_token('DOT', self.line) };


WHITESPACE: [ \t\r\n]+ -> skip;

