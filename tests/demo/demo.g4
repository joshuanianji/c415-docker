grammar demo;

file: value*? EOF;

value
  : INT
  | STR;

STR: [a-zA-Z]+;
INT: [0-9]+;

WS: [ \t\r\n]+ -> skip;
