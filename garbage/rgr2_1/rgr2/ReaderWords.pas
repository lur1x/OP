UNIT ReaderWords;

INTERFACE {INTERFACE}
  PROCEDURE ReadWord(VAR InFile: TEXT; VAR Word: STRING);
  {��������� �� ���������� �����, ����� ������� � ������}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
  CONST 
    UpperLetters: SET OF CHAR = ['A' .. 'Z', '�' .. '�', '�'];
    LowerLetters: SET OF CHAR = ['a' .. 'z', '�' .. '�', '�'];
    ConnectingSigns: SET OF CHAR = ['''', '-'];
    CorrectChars: SET OF CHAR =  UpperLetters + LowerLetters + ConnectingSigns; 
    
  FUNCTION ChangeOfCase(VAR Ch: CHAR): CHAR;
  {������ ������� ����� � ������� �� ������}
  BEGIN
    CASE Ch OF
      'A': ChangeOfCase := 'a';
      'B': ChangeOfCase := 'b';
      'C': ChangeOfCase := 'c';
      'D': ChangeOfCase := 'd';
      'E': ChangeOfCase := 'e';
      'F': ChangeOfCase := 'f';
      'G': ChangeOfCase := 'g';
      'H': ChangeOfCase := 'h';
      'I': ChangeOfCase := 'i';
      'J': ChangeOfCase := 'j';
      'K': ChangeOfCase := 'k';
      'L': ChangeOfCase := 'l';
      'M': ChangeOfCase := 'm';
      'N': ChangeOfCase := 'n';
      'O': ChangeOfCase := 'o';
      'P': ChangeOfCase := 'p';
      'Q': ChangeOfCase := 'q';
      'R': ChangeOfCase := 'r';
      'S': ChangeOfCase := 's';
      'T': ChangeOfCase := 't';
      'U': ChangeOfCase := 'u';
      'W': ChangeOfCase := 'w';
      'V': ChangeOfCase := 'v';
      'X': ChangeOfCase := 'x';
      'Y': ChangeOfCase := 'y';
      'Z': ChangeOfCase := 'z';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�';
      '�': ChangeOfCase := '�'
    END
  END;

  PROCEDURE CheckForUpLet(VAR Ch: CHAR);
  {���������, ����� � ������ ��������.
  ���� ��, ������ �� ������ �������}
  BEGIN
    IF Ch IN UpperLetters
    THEN
      Ch := ChangeOfCase(Ch)
  END;

  PROCEDURE CheckForHyphen(VAR Ch: CHAR; VAR InFile: TEXT;  VAR Word: STRING);
  {�������� ������� �� '-' � ''''}
  BEGIN
    IF (Ch IN CorrectChars) AND (LENGTH(Word) > 0)
    THEN                       
      BEGIN
        READLN(InFile);
        READ(InFile, Ch);
        CheckForUpLet(Ch);
        Word := Word + Ch;
        Read(InFile, Ch)
      END
    ELSE
      Word := Word + Ch
  END;

  PROCEDURE ReadWord(VAR InFile: TEXT; VAR Word: STRING);
  {��������� �� ���������� �����, ����� ������� � ������}
  VAR
    Ch: CHAR;
  BEGIN
    Word := '';
    READ(InFile, Ch);
    IF (Ch <> '-')
    THEN
      IF EOLN(InFile) AND (Ch IN CorrectChars)
      THEN
        BEGIN
          CheckForUpLet(Ch);
          READLN(InFile)
        END
      ELSE
        WHILE (Ch IN CorrectChars) AND (NOT EOLN(InFile))
        DO
          BEGIN
            CheckForUpLet(Ch);
            Word := Word + Ch;
            READ(InFile, Ch);
            IF EOLN(InFile) AND (Ch IN CorrectChars)
            THEN
              BEGIN
                CheckForUpLet(Ch);
                CheckForHyphen(Ch, InFile, Word)
              END
          END
  END;
{IMPLEMENTATION} 

BEGIN {ReaderWords}
END. {ReaderWords}

