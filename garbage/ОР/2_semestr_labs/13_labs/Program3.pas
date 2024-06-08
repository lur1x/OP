PROGRAM PrintScreen(INPUT, OUTPUT);
VAR
  F1, F2, F3, F4: TEXT;
PROCEDURE PrintString(VAR F1, F2, F3, InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN{PrintString}
  IF NOT EOLN(InFile)
  THEN
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch);
      
    END 
END;{PrintString}
PROCEDURE PrintObject(VAR F1: TEXT);
VAR
  Ch: CHAR;
  F2, F3: TEXT;
BEGIN{PrintObject}
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      WRITE(F3, Ch)
      PrintTable(F2)
    END
END;{PrintObject}
PROCEDURE PrintTable(VAR F1: TEXT);
VAR
  Ch: CHAR;
  F2, F3: TEXT;
BEGIN{PrintTable}
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      WRITE(F3, Ch)
      PrintObject(F1)
    END
END;{PrintTable}
