UNIT WordReader;
INTERFACE {INTERFACE}
{INTERFACE}
IMPLEMENTATION {IMPLEMENTATION}
CONST 
  UpperLetters: SET OF CHAR = ['A' .. 'Z', 'А' .. 'Я', 'Ё'];
  LowerLetters: SET OF CHAR = ['a' .. 'z', 'а' .. 'я', 'ё'];
  ConnectingSigns: SET OF CHAR = ['''', '-'];
  CorrectChars: SET OF CHAR =  UpperLetters + LowerLetters + ConnectingSigns; 
TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;
           Counter: INTEGER;
           LLink, RLink: Tree
         END;

VAR
  Ch: CHAR;
  WordTemp: STRING;
  InFile, OutFile: TEXT;
  Root: Tree;

PROCEDURE ReadWord(VAR InFile: TEXT; VAR WordTemp: STRING);
VAR
  Ch: CHAR;
BEGIN
  WordTemp := '';
  IF NOT EOLN(InFile)
  THEN
    READ(InFile, Ch);
  WHILE (NOT EOLN(InFile)) AND (Ch IN CorrectChars)
  DO
    BEGIN
      WordTemp := WordTemp + Ch;
      READ(InFile, Ch)
    END
END;
             
PROCEDURE Insert(VAR Root: Tree; VAR Data: STRING);
BEGIN {Insert}
  IF Root= NIL
  THEN
    BEGIN {Создаем лист со значением Data}
      NEW(Root);
      Root^.Word := Data;
      Root^.Counter := 1;
      Root^.LLink := NIL;
      Root^.RLink := NIL
    END
  ELSE
    IF Root^.Word > Data
    THEN
      Insert(Root^.LLink, Data)
    ELSE
      IF Root^.Word < Data
      THEN 
        Insert(Root^.RLink, Data)
      ELSE
        Root^.Counter := Root^.Counter + 1
END; {Insert}

PROCEDURE PrintTree(VAR OutFile: TEXT; Root: Tree);
BEGIN {PrintTree}
  IF Root <> NIL
  THEN
    BEGIN
      PrintTree(OutFile, Root^.LLink);
      WRITELN(OutFile, Root^.Word, ' ', Root^.Counter);
      PrintTree(OutFile, Root^.RLink)
    END
END; {PrintTree}
{IMPLEMENTATION}
BEGIN {WordReader}
END. {WordReader}

