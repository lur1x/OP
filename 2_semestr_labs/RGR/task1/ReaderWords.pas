UNIT ReaderWords;

INTERFACE {INTERFACE}
  CONST 
    UpperLetters: SET OF CHAR = ['A' .. 'Z', '�' .. '�', '�'];
    LowerLetters: SET OF CHAR = ['a' .. 'z', '�' .. '�', '�'];
    ConnectingSigns: SET OF CHAR = ['''', '-'];
    CorrectChars: SET OF CHAR =  UpperLetters + LowerLetters + ConnectingSigns; 
  PROCEDURE ReadWord(VAR InFile: TEXT; VAR WordTemp: STRING);
  {������ ������ � ���������� � ������}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
{IMPLEMENTATION}
  FUNCTION ChangeOfCase(VAR Ch: CHAR): CHAR;
  {������ ������� ������� � ������� �� ������}
  BEGIN {ChangeOfCase}
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
  END; {ChangeOfCase}
  
  PROCEDURE ReadWord(VAR InFile: TEXT; VAR WordTemp: STRING);
  {������ ������ � ���������� � ������}
  VAR
    Ch: CHAR;
  BEGIN {ReadWord}
    WordTemp := '';
    READ(InFile, Ch);
    IF EOLN(InFile) AND (Ch IN CorrectChars)
    THEN
      BEGIN
        IF Ch IN UpperLetters
        THEN
          Ch := ChangeOfCase(Ch);
        IF Ch = '-'
        THEN
          BEGIN
            READLN(InFile);
            READ(InFile, Ch);
            IF Ch IN UpperLetters
            THEN
              Ch := ChangeOfCase(Ch);
            WordTemp := WordTemp + Ch;
            Read(InFile, Ch)
          END
        ELSE
          WordTemp := WordTemp + Ch
      END;
    WHILE (Ch IN CorrectChars) AND (NOT EOLN(InFile))
    DO
      BEGIN
        IF Ch IN UpperLetters
        THEN
          Ch := ChangeOfCase(Ch);
        WordTemp := WordTemp + Ch;
        READ(InFile, Ch);
        IF EOLN(InFile) AND (Ch IN CorrectChars)
        THEN
          BEGIN
            IF Ch IN UpperLetters
            THEN
              Ch := ChangeOfCase(Ch);
            IF Ch = '-'
            THEN
              BEGIN
                READLN(InFile);
                READ(InFile, Ch);
                IF Ch IN UpperLetters
                THEN
                  Ch := ChangeOfCase(Ch);
                WordTemp := WordTemp + Ch;
                Read(InFile, Ch)
              END
            ELSE
              WordTemp := WordTemp + Ch
          END
      END
  END; {ReadWord}
{IMPLEMENTATION}

BEGIN {ReaderWords}
END. {ReaderWords}
