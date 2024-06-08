UNIT ReaderWords;

INTERFACE {INTERFACE}
  PROCEDURE ReadWord(VAR InFile: TEXT; VAR Word: STRING);
  {Читает символ и записывает в строку}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
  CONST 
    UpperLetters: SET OF CHAR = ['A' .. 'Z', 'А' .. 'Я', 'Ё'];
    LowerLetters: SET OF CHAR = ['a' .. 'z', 'а' .. 'я', 'ё'];
    ConnectingSigns: SET OF CHAR = ['''', '-'];
    CorrectChars: SET OF CHAR =  UpperLetters + LowerLetters + ConnectingSigns; 
  FUNCTION ChangeOfCase(VAR Ch: CHAR): CHAR;
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
      'А': ChangeOfCase := 'а';
      'Б': ChangeOfCase := 'б';
      'В': ChangeOfCase := 'в';
      'Г': ChangeOfCase := 'г';
      'Д': ChangeOfCase := 'д';
      'Е': ChangeOfCase := 'е';
      'Ё': ChangeOfCase := 'ё';
      'Ж': ChangeOfCase := 'ж';
      'З': ChangeOfCase := 'з';
      'И': ChangeOfCase := 'и';
      'Й': ChangeOfCase := 'й';
      'К': ChangeOfCase := 'к';
      'Л': ChangeOfCase := 'л';
      'М': ChangeOfCase := 'м';
      'Н': ChangeOfCase := 'н';
      'О': ChangeOfCase := 'о';
      'П': ChangeOfCase := 'п';
      'Р': ChangeOfCase := 'р';
      'С': ChangeOfCase := 'с';
      'Т': ChangeOfCase := 'т';
      'У': ChangeOfCase := 'у';
      'Ф': ChangeOfCase := 'ф';
      'Х': ChangeOfCase := 'х';
      'Ц': ChangeOfCase := 'ц';
      'Ч': ChangeOfCase := 'ч';
      'Ш': ChangeOfCase := 'ш';
      'Щ': ChangeOfCase := 'щ';
      'Ь': ChangeOfCase := 'ь';
      'Ы': ChangeOfCase := 'ы';
      'Ъ': ChangeOfCase := 'ъ';
      'Э': ChangeOfCase := 'э';
      'Ю': ChangeOfCase := 'ю';
      'Я': ChangeOfCase := 'я'
    END
  END;

  PROCEDURE CheckForUpLet(VAR Ch: CHAR);
  BEGIN
    IF Ch IN UpperLetters
    THEN
      Ch := ChangeOfCase(Ch);
  END;

  PROCEDURE CheckForHyphen(VAR Ch: CHAR; VAR InFile: TEXT;  VAR Word: STRING);
  BEGIN
    IF Ch = '-'
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
  VAR
    Ch: CHAR;
  BEGIN
    Word := '';
    READ(InFile, Ch);
    IF EOLN(InFile) AND (Ch IN CorrectChars)
    THEN
      BEGIN
        CheckForUpLet(Ch);
        CheckForHyphen(Ch, InFile, Word)
      END;
    WHILE (Ch IN CorrectChars)
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

BEGIN {ReadWord}
END. {ReadWord}
