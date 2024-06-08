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
    'À' : ChangeOfCase := 'à';
    'Á' : ChangeOfCase := 'á';
    'Â' : ChangeOfCase := 'â';
    'Ã' : ChangeOfCase := 'ã';
    'Ä' : ChangeOfCase := 'ä';
    'Å' : ChangeOfCase := 'å';
    '¨' : ChangeOfCase := '¸';
    'Æ' : ChangeOfCase := 'æ';
    'Ç' : ChangeOfCase := 'ç';
    'È' : ChangeOfCase := 'è';
    'É' : ChangeOfCase := 'é';
    'Ê' : ChangeOfCase := 'ê';
    'Ë' : ChangeOfCase := 'ë';
    'Ì' : ChangeOfCase := 'ì';
    'Í' : ChangeOfCase := 'í';
    'Î' : ChangeOfCase := 'î';
    'Ï' : ChangeOfCase := 'ï';
    'Ð' : ChangeOfCase := 'ð';
    'Ñ' : ChangeOfCase := 'ñ';
    'Ò' : ChangeOfCase := 'ò';
    'Ó' : ChangeOfCase := 'ó';
    'Ô' : ChangeOfCase := 'ô';
    'Õ' : ChangeOfCase := 'õ';
    'Ö' : ChangeOfCase := 'ö';
    '×' : ChangeOfCase := '÷';
    'Ø' : ChangeOfCase := 'ø';
    'Ù' : ChangeOfCase := 'ù';
    'Ü' : ChangeOfCase := 'ü';
    'Û' : ChangeOfCase := 'û';
    'Ú' : ChangeOfCase := 'ú';
    'Ý' : ChangeOfCase := 'ý';
    'Þ' : ChangeOfCase := 'þ';
    'ß' : ChangeOfCase := 'ÿ'
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
