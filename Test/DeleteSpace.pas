PROGRAM DeleteSpace(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      IF (Ch <> ' ')
      THEN
        WRITE(Ch)
      ELSE
        BEGIN
          WHILE (Ch = ' ') AND (NOT EOLN)
          DO
            READ(Ch);
          IF NOT EOLN
          THEN
            WRITE(' ', Ch)
        END
    END;
  WRITELN
END.
