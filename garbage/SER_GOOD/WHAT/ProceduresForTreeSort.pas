UNIT ProceduresForTreeSort;

INTERFACE {INTERFACE} 
TYPE 
  Tree = ^NodeType;
  NodeType = RECORD
               Key: CHAR;
               LLink, RLink: Tree
             END;

PROCEDURE Insert(VAR Ptr: Tree; Data: CHAR);
{Сортирует символы, расоплагая их в нужном месет дерева}
PROCEDURE PrintTree(Ptr: Tree);
{Печатает дерево}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}      
PROCEDURE Insert(VAR Ptr: Tree; Data: CHAR);
{Сортирует символы, расоплагая их в нужном месет дерева}
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {Создаем лист со значением Data}
      NEW(Ptr);
      Ptr^.Key := Data;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
    END
  ELSE
    IF Ptr^.Key > Data
    THEN
      Insert(Ptr^.LLink, Data)
    ELSE
      Insert(Ptr^.RLink, Data)
END; {Insert}

PROCEDURE PrintTree(Ptr: Tree);
{Печатает дерево}
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      PrintTree(Ptr^.LLink);
      WRITE(Ptr^.Key);
      PrintTree(Ptr^.RLink);
    END
END; {PrintTree}
{IMPLEMENTATION}

BEGIN {ProceduresForTreeSort}
END. {ProceduresForTreeSort}
