PROGRAM TreeSort(INPUT, OUTPUT);
TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               Ch: CHAR;
               LLink, RLink: Tree
             END;
PROCEDURE Insert(VAR Ptr: Tree; VAR Data: CHAR);
BEGIN
  IF Ptr = NIL
  THEN
    BEGIN
      NEW(Ptr);
      Ptr^.Ch := Data;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL
    END
  ELSE
    IF Data < Ptr^.Ch
    THEN
      Insert(Ptr^.LLink, Data)
    ELSE
      Insert(Ptr^.RLink, Data)
END;

PROCEDURE PrintTree(VAR Ptr: Tree);
BEGIN
  IF Ptr <> NIL
  THEN
    BEGIN
      PrintTree(Ptr^.LLink);
      WRITE(Ptr^.Ch);
      PrintTree(Ptr^.RLink)
    END          
END;
             
VAR
  Root: Tree;
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
