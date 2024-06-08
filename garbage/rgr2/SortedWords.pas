UNIT SortedWords;

INTERFACE  {INTERFACE}
  TYPE
    Tree = ^Node;
    Node = RECORD
             Word: STRING;
             LLink, RLink: Tree;
             Counter: INTEGER
           END;
    TreeFile = FILE OF Node;
  PROCEDURE Insert(VAR Data: STRING);
  {Вставялем слово в подходящее место, тем самым сортируем наши слова}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
  VAR
    IsBigger: INTEGER;
    Root: Tree;
  PROCEDURE CompareWords(VAR Ptr: Tree; VAR Data: STRING; VAR IsBigger: INTEGER);
  {Сравнить слова посимвольно}
  VAR
    I: INTEGER;
    Ch1, Ch2: CHAR;
  BEGIN
    IsBigger := 0;
    I := 1;
    WHILE (IsBigger = 0) AND (I <= Length(Data)) AND (I <= Length(Ptr^.Word)) 
    DO
      BEGIN
        Ch1 := Data[I];
        Ch2 := Ptr^.Word[I];
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
        IF Length(Data) < Length(Ptr^.Word)
        THEN
          IsBigger := 2;
        IF Length(Data) > Length(Ptr^.Word)
        THEN
          IsBigger := 1  
      END;
  END;
  
  PROCEDURE Insert(VAR Data: STRING);          
  PROCEDURE Ins(VAR Ptr: Tree; VAR Data: STRING);  
  {Вставялем слово в подходящее место, тем самым сортируем наши слова}
  VAR
    IsBigger: INTEGER;
  BEGIN {Ins}
    IF Ptr = NIL
    THEN
      BEGIN
        NEW(Ptr);
        Ptr^.Word := Data;
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
  END;{Ins}
  BEGIN {Insert}
    Ins(Root, Data)
  END; {Insert}

{IMPLEMENTATION}

BEGIN{SortedWords}
END. {SortedWords}
