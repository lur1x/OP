PROGRAM CheckReadNumber(INPUT, OUTPUT);
VAR
  Number, Base: INTEGER;

PROCEDURE ReadDigit(VAR F: TEXT; VAR Digit: INTEGER);
{Считывает текущий символ из файл. Если он - цифра, возвращает его 
 преобразуя в значение типа INTEGER. Если считанный символ не цифра
 возвращает -1}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  IF NOT EOLN(F)
  THEN
    BEGIN
     READ(F, Ch);
     IF Ch = '0' THEN Digit := 0 ELSE
     IF Ch = '1' THEN Digit := 1 ELSE    
     IF Ch = '2' THEN Digit := 2 ELSE
     IF Ch = '3' THEN Digit := 3 ELSE
     IF Ch = '4' THEN Digit := 4 ELSE
     IF Ch = '5' THEN Digit := 5 ELSE
     IF Ch = '6' THEN Digit := 6 ELSE
     IF Ch = '7' THEN Digit := 7 ELSE
     IF Ch = '8' THEN Digit := 8 ELSE
     IF Ch = '9' THEN Digit := 9
     ELSE  
       Digit := -1
    END
  ELSE
    Digit := -1  
END; {ReadDigit}

PROCEDURE ReadNumber(VAR F: TEXT; VAR Number, Base: INTEGER);
VAR
  Digit: INTEGER;
BEGIN {ReadNumber}
  Number := -1;
  Digit := 0;
  IF NOT EOLN(F)
  THEN
    BEGIN
      ReadDigit(F, Digit);
      IF Digit <> -1
      THEN
        Number := 0;
      WHILE ((Digit <> -1) AND (Number <> -2))
      DO
        BEGIN
          IF ((Number >= (MaxInt DIV 10)) AND (Digit > (MaxInt MOD 10))) OR (Number > (MaxInt DIV 10))
          THEN
            Number := -2
          ELSE
            Number := Number * Base + Digit;
          ReadDigit(F, Digit)                               
        END
    END
END; {ReadNumber}

BEGIN {CheckReadNumber}
  Base := 10;
  ReadNumber(INPUT, Number, Base);
  WRITELN(Number)
END. {CheckReadNumber}



