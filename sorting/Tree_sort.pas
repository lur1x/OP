PROGRAM TreeSort(INPUT, OUTPUT);
TYPE  
  Tree = ^NodeType;
  NodeType = RECORD
               Ch: CHAR;
               LLink, RLink: Tree
             END;
             
PROCEDURE Insert(VAR Ptr: Tree; Data: CHAR);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {������� ���� �� ��������� Data}
      NEW(Ptr);
      Ptr^.Ch := Data;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL
    END
  ELSE
    IF Ptr^.Ch > Data
    THEN
      Insert(Ptr^.LLink, Data)
    ELSE
      Insert(Ptr^.RLink, Data)
END; {Insert}
PROCEDURE PrintTree(Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      PrintTree(Ptr^.LLink);
      WRITE(Ptr^.Ch);
      PrintTree(Ptr^.RLink)
    END
END; {PrintTree}

VAR
  Root: Tree;
  Ch: CHAR;
BEGIN {TreeSort}
  Root := NIL;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Insert(Root, Ch)
    END;
  PrintTree(Root);
  WRITELN
END.  {TreeSort}


