grammar project_deliverable_1;
//Github Repo https://github.com/Jazz-CG/ParserProject_Jazmin_Gates_FS2024
//Name: Jazmin Gates
//PawPrint: jcgnfd
//Student ID: 18203238

//  Parser Rules  //
//entry point and definitoin of programn
prog:   instr+ EOF;

instr: expr
    | if_block
    | elif_block
    | else_block
    | assignment;

if_block: 'if' expr ':' block (elif_block)* (else_block)?;
elif_block: 'elif' expr ':' block;
else_block: 'else' ':' block;
block: NEWL IND instr+ DEDNT;

//define expressions
expr: assignment
    | expr ('+' | '-' | '*' | '/' | '%') expr
    | expr ('<' | '<=' | '>' | '>=' | '==' | '!=') expr 
    | expr ('and' | 'or' | 'not') expr
    | VARNAME
    | NUM
    | STR
    | array
    | BOOL;

//define assignments
assignment: VARNAME ('=' | '+=' | '-=' | '*=' | '/=') expr;

//define aray
array: '[' (expr ( ',' expr)*)? ']';

//  Tokens  //
VARNAME: [a-z_][a-zA-Z0-9_]*; //python vars can only start with lowercase characters or underscore
NUM: [0-9]+ ('.' [0-9]+)?;  //allows for int and float/double types
STR: '"' (~[\n"])* '"' //accounts for strings with single and double quotes. accepts any characters other than newline and or another double quote
    | '\'' (~[\n"])* '\'';
BOOL: 'True' | 'False';
NEWL: ('\r'? '\n' | '\r');

WS: [ \r\n]+ -> skip;

IND: [ ]{4};
DEDNT: [ ]{0,3} -> skip;
