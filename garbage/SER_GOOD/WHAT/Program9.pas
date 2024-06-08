PROGRAM TreeSort(INPUT, OUTPUT);
USES ProceduresForTreeSort;
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
END. {TreeSort}

