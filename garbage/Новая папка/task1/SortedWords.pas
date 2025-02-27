UNIT SortedWords;

INTERFACE

TYPE
  Tree = ^Node;
  Node = RECORD
            Word: STRING;
            Counter: INTEGER;
            LLink, RLink: Tree
          END;
PROCEDURE Insert(VAR Root: Tree; VAR Data: STRING);


IMPLEMENTATION
  
PROCEDURE Insert(VAR Root: Tree; VAR Data: STRING);
  {��������� ����� � ���������� ����� (���������)}
VAR
  What: INTEGER;
  I: INTEGER;
  Ch1, Ch2: CHAR;
BEGIN {Insert}
  IF Root = NIL
  THEN
    BEGIN
      NEW(Root);
      Root^.Word := Data;
      Root^.Counter := 1;
      Root^.LLink := NIL;
      Root^.RLink := NIL
    END
  ELSE
    BEGIN
      What := 0;
      I := 1;
      WHILE (What = 0) AND (I <= Length(Data)) AND (I <= Length(Root^.Word)) 
      DO
        BEGIN
          Ch1 := Data[I];
          Ch2 := Root^.Word[I];
          IF ((Ch1 = '�') AND (Ch2 <= '�') AND ('a' <= Ch2))
          THEN
            Ch1 := '�';
          IF ((Ch2 = '�') AND (Ch1 <= '�') AND ('a' <= Ch1)) 
          THEN 
            Ch2 := '�';
          IF (Ch1 <> '�') AND (Ch2 <> '�')
          THEN
            IF Ch1 < Ch2
            THEN
              What := 2
            ELSE
              IF Ch1 > Ch2
              THEN
                What := 1;
          I := I + 1
        END; 
      IF What = 0
      THEN
        Root^.Counter := Root^.Counter + 1 
      ELSE
        IF What = 1
        THEN 
          Insert(Root^.RLink, Data)
        ELSE
          Insert(Root^.LLink, Data) 
    END
END;{Insert}

BEGIN {SortedWords}
END. {SortedWords}
