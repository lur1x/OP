PROGRAM RecordWords;
CONST
  Len = 50; 
  UpperLetters: SET OF CHAR = ['A' .. 'Z', 'А' .. 'Я'];
  LowerLetters: SET OF CHAR = ['a' .. 'z', 'а' .. 'я'];
  LinkingChars: SET OF CHAR = [ '-', CHR(39)];
  ProperChars: SET OF CHAR =  UpperLetters + LowerLetters + LinkingChars; 
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Lenght = 0 .. Len;
  Tree = ^Node;
  Node = RECORD
           Word: Str;
           LLink, RLink: Tree;
           Counter: INTEGER;
           WordLenght: Lenght;
         END;
VAR
  Ch: CHAR;
  InFile, OutFile: TEXT;
  Root: Tree;
  
PROCEDURE WriteWord(VAR Root: Tree; VAR OutFile: TEXT);
{Печатает слово}
VAR
  Index: 0 .. Root^.WordLenght;
BEGIN
  FOR Index := 0 TO (Root^.WordLenght - 1)
  DO
    BEGIN
      WRITE(OutFile, Root^.Word[Index])
    END
END; 

PROCEDURE Insert(VAR Root: Tree; Data: CHAR);
BEGIN {Insert}
  IF Root = NIL
  THEN
    BEGIN {Создаем лист со значением Data}
      NEW(Root);
      Root^.Ch :=
      Root^.LLink := NIL;
      Root^.RLink := NIL
    END
  ELSE
    IF Ptr^.Ch > Data
    THEN
      Insert(Ptr^.LLink, Data)
    ELSE
      Insert(Ptr^.RLink, Data)
END; {Insert}

PROCEDURE PrintTree(Root: Tree; VAR OutFile: TEXT);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      PrintTree(Root^.LLink, OutFile);
      WriteWord(Root, OutFile);
      WRITELN(' ', Root^.Counter);
      PrintTree(Root^.RLink, OutFile)
    END
END; {PrintTree} 

BEGIN
  ASSIGN(InFile, 'INPUT.TXT');
  ASSIGN(OutFile, 'OUTPUT.TXT');
  RESET(InFile);
  REWRITE(OutFile);
  WordLenght := 0;
  NEW(Root);
  WHILE NOT EOF(InFile)
  DO
    BEGIN
      WHILE NOT EOLN(InFile)
      DO
        BEGIN
          READ(InFile, Ch);
          IF Ch IN CorrectChars
          THEN
            Root^.Word[WordLenght] := Ch
          ELSE
            Root^.Word[WordLenght] := ' ';
          WordLenght := WordLenght + 1
        END;
      READLN(OutFile);
    END;
  PrintTree(Root, OutFile);
END.
