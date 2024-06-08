PROGRAM PseudoGraphicPrinting(INPUT, OUTPUT); 
CONST
  Line = 5;
  Column = 5;
  Count = 10;
TYPE
  BunchOfDigits = SET OF 0 .. (Line * Column * Count);
VAR
  B: SET OF 0 .. 1000;
PROCEDURE SearchBunch(VAR InF: TEXT; VAR Bunch: BunchOfDigits; VAR Ch: CHAR); 
VAR
  Letter: CHAR;
  FileL: TEXT;
  Find: BOOLEAN;
  Num, Position, NewPosition, L, C: INTEGER;
BEGIN{SearchBunch}
  ASSIGN(FileL, 'Letters.txt');
  RESET(FileL);
  Bunch := [];
  Num := 1;
  Find := TRUE;
  WHILE NOT EOLN(InF) AND Find
  DO
    BEGIN
      Find := FALSE;
      READ(InF, Ch);
      IF Num > 10
      THEN
        Ch := ' ';
      RESET(FileL);
      WHILE NOT(Find) AND NOT EOF(FileL)
      DO
        BEGIN
          READ(FileL, Letter);
          IF Ch = Letter
          THEN
            Find := TRUE
          ELSE
            READLN(FileL)
        END; 
      IF Find
      THEN
        BEGIN
          WHILE NOT EOLN(FileL)
          DO
            BEGIN
              READ(FileL, Position);
              NewPosition := ((Position - 1) MOD Column + 1 + (Column * (Num - 1))) + Column * Count * ((Position - 1) DIV Line);
              Bunch := Bunch + [NewPosition];
            END; 
          Num := Num + 1
        END  
      ELSE
        Bunch := [0];
    END     
END;{SearchBunch}
PROCEDURE Printing(Bunch: BunchOfDigits; VAR OuF: TEXT);
VAR
  I, J: INTEGER;
BEGIN{Printing}
  FOR I := 1 TO Line
  DO
    BEGIN
      FOR J := 1 TO (Column * Count)
      DO
        IF (J MOD Column = 1) AND (J <> 1)
        THEN
          IF (J + Column * Count * (I - 1)) IN Bunch
          THEN
            WRITE(OuF, ' #')
          ELSE
            WRITE(OuF, '  ')
        ELSE
          IF (J + Column * Count * (I - 1)) IN Bunch
          THEN
            WRITE(OuF, '#')
          ELSE
            WRITE(OuF, ' ');
      WRITELN(OuF)    
    END
END;{Printing}
PROCEDURE PGPrinting(VAR InF, OuF: TEXT); 
VAR
  Bunch: BunchOfDigits;
  Ch: CHAR;
BEGIN{PGPrinting}
  SearchBunch(InF, Bunch, Ch);
  IF NOT(0 IN Bunch)
  THEN
    Printing(Bunch, OuF)
  ELSE
    IF Ch <> ' '
    THEN
      WRITELN('Нет схемы для буквы ', Ch)
    ELSE
      WRITELN('Вы ввели слишком много символов');
  WRITELN    
END;{PGPrinting}  
BEGIN{PseudoGraphicPrinting}
  PGPrinting(INPUT, OUTPUT)
END.{PseudoGraphicPrinting}

