UNIT ConstsUnit;
INTERFACE {INTERFACE}
CONST 
  UpperLetters: SET OF CHAR = ['A' .. 'Z', 'À' .. 'ß', '¨'];
  LowerLetters: SET OF CHAR = ['a' .. 'z', 'à' .. 'ÿ', '¸'];
  ConnectingSigns: SET OF CHAR = ['''', '-'];
  CorrectChars: SET OF CHAR =  UpperLetters + LowerLetters + ConnectingSigns; 
  InputFile = 'INPUT.TXT';
  StatisticFile = 'OUTPUT.TXT';
  MaxWords = 10000;
TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;
           Counter: INTEGER;
           LLink, RLink: Tree
         END;

VAR
  WordTemp: STRING;
  InFile, OutFile: TEXT;
  Root: Tree;
  CounterWords: INTEGER;
{INTERFACE}
END. {ConstUnit}
