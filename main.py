from antlr4 import *
from PythonLexer import PythonLexer

# Función para escribir el token en el archivo
def write_token(token_type, line_number):
    with open("tokens_output.txt", "a") as f:
        f.write(f"Token: {token_type}, Line: {line_number}\n")

def main():
    # Lee el archivo de entrada
    input_stream = FileStream("input.txt")

    # Inicializa el lexer
    lexer = PythonLexer(input_stream)

    # Asigna la función write_token como método del lexer
    lexer.write_token = write_token

    # Crea el token stream
    token_stream = CommonTokenStream(lexer)

    # Llena el token stream
    token_stream.fill()

    

if __name__ == "__main__":
    main()

