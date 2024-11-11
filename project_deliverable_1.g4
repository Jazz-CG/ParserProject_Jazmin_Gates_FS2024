grammar project_deliverable_1;

//Name: Jazmin Gates
//PawPrint: jcgnfd
//Student ID: 18203238

//  Parser Rules  //
//entry point and definitoin of programn
prog:   expr+ EOF;

//define expressions
expr: assignment
    | expr ('+' | '-' | '*' | '/' | '%') expr 
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


WS: [ \t\r\n]+ -> skip;
