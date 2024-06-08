PROGRAM WhatMore(INPUT, OUTPUT);
VAR
  Result: CHAR;
  F1, F2: TEXT;
  
PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR 
  Ch: CHAR;
BEGIN {CopyFile}
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END; {CopyFile}

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1)) AND (NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF Ch1 < Ch2
      THEN
        Result := '1'
      ELSE
        IF Ch1 > Ch2
        THEN
          Result := '2'
    END       
END; {Lexico}

BEGIN {WhatMore}
  REWRITE(F1);
  REWRITE(F2);
  CopyFile(INPUT, F1);
  READLN(INPUT);
  CopyFile(INPUT, F2);
  Lexico(F1, F2, Result);
  WRITE(Result)
END. {WhatMore}

