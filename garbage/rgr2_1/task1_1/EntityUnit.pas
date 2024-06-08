UNIT EntityUnit;
USES ConstsUnit;

INTERFACE {INTERFACE}
  PROCEDURE Insert(VAR Root: Tree; VAR Data: STRING);
  {Вставляем слово в подходящее место (сортируем)}
  PROCEDURE PrintStatistic(VAR OutFile: TEXT; Root: Tree);
  {Печатаем статистику}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
  PROCEDURE Insert(VAR Root: Tree; VAR Data: STRING);
  {Вставляем слово в подходящее место (сортируем)}
  VAR
    What: INTEGER;
    I: INTEGER;
    Ch1, Ch2: CHAR;
  BEGIN {Insert}
    IF Root= NIL
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
            IF ((Ch1 = 'ё') AND (Ch2 <= 'е') AND ('a' <= Ch2))
            THEN
              Ch1 := 'ж';
            IF ((Ch2 = 'ё') AND (Ch1 <= 'е') AND ('a' <= Ch1)) 
            THEN 
              Ch2 := 'ж';
            IF (Ch1 <> 'ё') AND (Ch2 <> 'ё')
            THEN
              IF Ch1 < Ch2
              THEN
                What := 2
              ELSE
                IF Ch1 > Ch2
                THEN
                  What := 1;
            I := I + 1;
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
  END; {Insert}

  PROCEDURE PrintStatistic(VAR OutFile: TEXT; Root: Tree);
  {Печатаем статистику}
  BEGIN {PrintStatistic}
    IF Root <> NIL
    THEN
      BEGIN
        PrintStatistic(OutFile, Root^.LLink);
        WRITELN(OutFile, Root^.Word, ' ', Root^.Counter);
        PrintStatistic(OutFile, Root^.RLink)
      END
  END; {PrintStatistic}
{IMPLEMENTATION}

BEGIN {EntityUnit}
END. {EntityUnit}
