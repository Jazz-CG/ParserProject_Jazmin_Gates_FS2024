import sys
from io import StringIO
from antlr4 import *
from project_deliverable_1Lexer import project_deliverable_1Lexer
from project_deliverable_1Parser import project_deliverable_1Parser
from antlr4.tree.Trees import Trees

filepath = "./parse_python_test_code.py"

def main():
	
    s = FileStream(filepath)
    
    
    lexer = project_deliverable_1Lexer(s)
    stream = CommonTokenStream(lexer)
    parser = project_deliverable_1Parser(stream)
        
    tree = parser.prog()
        
    if parser.getNumberOfSyntaxErrors() > 0:
            print("failed")
    else:
            print("passed")

main()