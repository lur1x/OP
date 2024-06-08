PROGRAM WordsStatistics(INPUT, OUTPUT);
CONST 
  UpperLetters: SET OF CHAR = ['A' .. 'Z', 'А' .. 'Я', 'Ё'];
  LowerLetters: SET OF CHAR = ['a' .. 'z', 'а' .. 'я', 'ё'];
  ConnectingSigns: SET OF CHAR = ['''', '-'];
  CorrectChars: SET OF CHAR =  UpperLetters + LowerLetters + ConnectingSigns; 
TYPE
  Tree = ^Node;
  Node = RECORD
           Word: CHAR;
           Counter: INTEGER;
           LLink, RLink: Tree
         END;

VAR
  Ch: CHAR;
  InFile, OutFile: TEXT;
  Root: Tree;
             
PROCEDURE Insert(VAR Root: Tree; VAR Data: CHAR);
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
 
BEGIN {WordsStatistics}
  ASSIGN(InFile, 'INPUT1.TXT');
  ASSIGN(OutFile, 'OUTPUT.TXT');
  RESET(InFile);
  REWRITE(OutFile);
  Root := NIL;
  WHILE NOT EOF(InFile)
  DO
    BEGIN
      WHILE NOT EOLN(InFile)
      DO
        BEGIN 
          READ(InFile, Ch);
          IF Ch IN CorrectChars
          THEN
            Insert(Root, Ch)
        END;
      READLN(InFile);
    END;
  PrintTree(OutFile, Root)
END. {WordsStatistics}  
