UNIT TreeProcessing;
INTERFACE

TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;
           LLink, RLink: Tree;
           Counter: INTEGER
         END;
  TreeFile = FILE OF Node;

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);
PROCEDURE DestroyTree(VAR Root: Tree);
IMPLEMENTATION

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN 
      NEW(Ptr);
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
      Ptr^.Word := Data;
      Ptr^.Counter := 1
    END
  ELSE
    IF Ptr^.Word > Data
    THEN
      Insert(Ptr^.LLink, Data)
    ELSE
      IF Ptr^.Word < Data
      THEN
        Insert(Ptr^.RLink, Data)
      ELSE
        Ptr^.Counter := Ptr^.Counter + 1; 
END;  {Insert}

PROCEDURE DestroyTree(VAR Root: Tree);
{Разрушение дерева}
BEGIN
  IF Root <> NIL
  THEN
    BEGIN
      DestroyTree(Root^.LLink);
      DestroyTree(Root^.RLink);
      DISPOSE(Root);
      Root := NIL
    END
END;
BEGIN
END.
