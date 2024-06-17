PROGRAM InsertionSort(INPUT, OUTPUT);
CONST
  Max = 60;
  LastEnd = 0;
TYPE
  RecArray = ARRAY [1 .. Max] OF
             RECORD
               Ch: CHAR;
               Next: 0 .. Max
             END;
VAR
  Arr: RecArray;
  Prev, Curr: 0 .. Max;
  Index, First: 0 .. Max;
  Extra: CHAR;
  Found: BOOLEAN;
BEGIN
  Index := 0;
  First := 0;
  WHILE NOT EOLN
  DO
    BEGIN
      Index := Index + 1;
      IF Index > Max
      THEN
        BEGIN
          Read(Extra);
          WRITELN('Символ ', Extra, ' не записан')
        END
      ELSE
        BEGIN
          READ(Arr[Index].Ch);
          Prev := 0;
          Curr := First;
          Found := FALSE;
          WHILE (Curr <> 0) AND NOT Found
          DO
            BEGIN
              IF Arr[Index].Ch > Arr[Curr].Ch
              THEN
                BEGIN
                  Prev := Curr;
                  Curr := Arr[Curr].Next
                END
              ELSE
                Found := TRUE
            END;
          Arr[Index].Next := Curr;
          IF Prev = 0
          THEN
            First := Index
          ELSE
            Arr[Prev].Next := Index
        END
    END;
  Index := First;
  WHILE Index <> LastEnd
  DO
    BEGIN
      WRITE(Arr[Index].Ch);
      Index := Arr[Index].Next
    END;
  WRITELN
END.
