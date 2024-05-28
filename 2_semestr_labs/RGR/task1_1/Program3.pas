UNIT WordReader;
INTERFACE {ITERFACE}
PROCEDURE ReadWord(VAR InFile: TEXT; VAR WordTemp: STRING);
{INTERFACE}
IMPLEMENTATION {IMPLEMENTATION}
FUNCTION ChangeOfCase(VAR Ch: CHAR): CHAR;
BEGIN
  CASE Ch OF
    'A' : ChangeOfCase := 'a';
    'B' : ChangeOfCase := 'b';
    'C' : ChangeOfCase := 'c';
    'D' : ChangeOfCase := 'd';
    'E' : ChangeOfCase := 'e';
    'F' : ChangeOfCase := 'f';
    'G' : ChangeOfCase := 'g';
    'H' : ChangeOfCase := 'h';
    'I' : ChangeOfCase := 'i';
    'J' : ChangeOfCase := 'j';
    'K' : ChangeOfCase := 'k';
    'L' : ChangeOfCase := 'l';
    'M' : ChangeOfCase := 'm';
    'N' : ChangeOfCase := 'n';
    'O' : ChangeOfCase := 'o';
    'P' : ChangeOfCase := 'p';
    'Q' : ChangeOfCase := 'q';
    'R' : ChangeOfCase := 'r';
    'S' : ChangeOfCase := 's';
    'T' : ChangeOfCase := 't';
    'U' : ChangeOfCase := 'u';
    'W' : ChangeOfCase := 'w';
    'V' : ChangeOfCase := 'v';
    'X' : ChangeOfCase := 'x';
    'Y' : ChangeOfCase := 'y';
    'Z' : ChangeOfCase := 'z';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�';
    '�' : ChangeOfCase := '�'
  END
END;
PROCEDURE ReadWord(VAR InFile: TEXT; VAR WordTemp: STRING);
VAR
  Ch: CHAR;
BEGIN
  WordTemp := '';
  READ(InFile, Ch);
  WHILE (NOT EOLN(InFile)) AND (Ch IN CorrectChars)
  DO
    BEGIN
      IF Ch IN UpperLetters
      THEN
        Ch := ChangeOfCase(Ch);
      WordTemp := WordTemp + Ch;
      READ(InFile, Ch)
    END
END;
{IMPLEMENTATION}
