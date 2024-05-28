PROGRAM Test(INPUT, OUTPUT);
VAR
  F: TEXT;
PROCEDURE CopySurname(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopySurname}
  IF NOT EOLN(InFile)
  THEN
    READ(InFile, Ch);
  WHILE (Ch <> ' ')
  DO
    BEGIN 
      WRITE(OutFile, Ch);
      READ(InFile, Ch)
    END;
END; {CopySurname}
BEGIN
  REWRITE(F);
  CopySurname(INPUT, F);
  RESET(F);
  CopySurname(F, OUTPUT);
  WRITE('A');
  
END.
