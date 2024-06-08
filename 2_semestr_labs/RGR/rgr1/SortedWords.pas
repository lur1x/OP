UNIT SortedWords;

INTERFACE {INTERFACE}
  TYPE
    Tree = ^Node;
    Node = RECORD
             Words: STRING;
             Counter: INTEGER;
             LLink, RLink: Tree
           END; 
  PROCEDURE Insert(VAR Data: STRING);
  PROCEDURE PrintStatistic(VAR OutFile: TEXT); 
  {Вставляем слово в подходящее место (сортируем)}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
  VAR
    Root: Tree; 
  PROCEDURE CompareWords(VAR Ptr: Tree; VAR Data: STRING; VAR IsBigger: INTEGER);
  VAR
    I: INTEGER;
    Ch1, Ch2: CHAR;
  BEGIN
    IsBigger := 0;
    I := 1;
    WHILE (IsBigger = 0) AND (I <= Length(Data)) AND (I <= Length(Ptr^.Words)) 
    DO
      BEGIN
        Ch1 := Data[I];
        Ch2 := Ptr^.Words[I];
        IF NOT ((Ch1 = 'ё') AND (Ch2 = 'ё'))
        THEN
          BEGIN
            IF ((Ch1 = 'ё') AND ('a' <= Ch2) AND (Ch2 <= 'е'))
            THEN
              IsBigger := 1
            ELSE 
              IF ((Ch2 = 'ё') AND ('a' <= Ch1) AND (Ch1 <= 'е')) 
              THEN
                IsBigger := 2
              ELSE 
                IF Ch1 < Ch2
                THEN
                  IsBigger := 2
                ELSE
                  IF Ch1 > Ch2
                  THEN
                    IsBigger := 1
          END;   
        I := I + 1;
      END;
    IF IsBigger = 0
    THEN
      BEGIN
        IF Length(Data) < Length(Ptr^.Words)
        THEN
          IsBigger := 2;
        IF Length(Data) > Length(Ptr^.Words)
        THEN
          IsBigger := 1  
      END;
  END;
  PROCEDURE Insert(VAR Data: STRING);        
  PROCEDURE Ins(VAR Ptr: Tree; VAR Data: STRING);
  VAR
    IsBigger: INTEGER;
  BEGIN {Ins}
    IF Ptr = NIL
    THEN
      BEGIN
        NEW(Ptr);
        Ptr^.Words := Data;
        Ptr^.Counter := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL
      END
    ELSE
      BEGIN 
        CompareWords(Ptr, Data, IsBigger);
        IF IsBigger = 1
        THEN 
          Ins(Ptr^.RLink, Data) 
        ELSE
          IF IsBigger = 2
          THEN  
            Ins(Ptr^.LLink, Data)
          ELSE
            Ptr^.Counter := Ptr^.Counter + 1 
      END
  END; {Ins}
  BEGIN {Insert}
    Ins(Root, Data)
  END; {Insert}
  
  PROCEDURE PrintStatistic(VAR OutFile: TEXT);
  PROCEDURE PrintStat(VAR OutFile: TEXT; Root: Tree);
  BEGIN {PrintStat}
    IF Root <> NIL
    THEN
      BEGIN
        PrintStat(OutFile, Root^.LLink);
        WRITELN(OutFile, Root^.Words, ' ', Root^.Counter);
        PrintStat(OutFile, Root^.RLink)
      END
  END; {PrintStat}
  BEGIN {PrintStatistic}
    PrintStat(OutFile, Root)
  END; {PrintStatistic}
  
{IMPLEMENTATION}

BEGIN {SortedWords}
END. {SortedWords}
