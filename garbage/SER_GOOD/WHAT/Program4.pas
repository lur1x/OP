PROGRAM InsertionSort(INPUT, OUTPUT);
CONST
  Max = 16;
  ListEnd = 0;
TYPE
  RecArray = ARRAY [1 .. Max] OF 
               RECORD
                 Key: CHAR;
                 Next: 0 .. Max
               END;
VAR
  Arr: RecArray;
  First, Index: 0 .. Max;
  Prev, Curr: 0 .. Max;  
  Extra: CHAR;
  Found: BOOLEAN;
BEGIN 
  First := 0;
  Index := 0;
  WHILE NOT EOLN      
  DO
    BEGIN
      Index := Index + 1;
      IF Index > Max
      THEN
        BEGIN
          READ(Extra);
          WRITELN('Cooбщение содержит: ', Extra, ' - Переполнение.');
        END
      ELSE
        BEGIN
          READ(Arr[Index].Key);
          WRITE(Arr[Index].Key)
        END
    END;
 WRITELN
END.


