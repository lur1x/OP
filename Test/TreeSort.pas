PROGRAM TreeSort(INPUT, OUTPUT);
TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               Key: CHAR;
               RLink, LLink: Tree
             END;
PROCEDURE Insert(VAR Ptr: Tree; VAR Data: CHAR);
BEGIN
  IF Ptr = NIL
  THEN
    BEGIN
      NEW(Ptr);
      Ptr^.Key := Data;
      Ptr^.RLink := NIL;
      Ptr^.LLink := NIL
    END
  ELSE
    IF Data > Ptr^.Key
    THEN
      Insert(Ptr^.RLink, Data)
    ELSE
      Insert(Ptr^.LLink, Data)
END;

PROCEDURE PrintTree(Ptr: Tree);
BEGIN
  IF Ptr <> NIL
  THEN
    BEGIN
      PrintTree(Ptr^.LLink);
      WRITE(Ptr^.Key);
      PrintTree(Ptr^.RLink)
    END
END;

VAR
  Root : Tree;
  Ch: CHAR;
BEGIN
  Root := NIL;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Insert(Root, Ch)
    END;
  PrintTree(Root);
  WRITELN
END.
