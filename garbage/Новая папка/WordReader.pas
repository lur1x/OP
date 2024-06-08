UNIT WordReader;
INTERFACE

PROCEDURE WordCreater(VAR TextFile: TEXT; VAR WordAp: STRING);

IMPLEMENTATION
FUNCTION GetLoverCase(Ch: CHAR): CHAR;
BEGIN
  CASE Ch OF
    {eng}
    'A': GetLoverCase := 'a';
    'B': GetLoverCase := 'b';
    'C': GetLoverCase := 'c';
    'D': GetLoverCase := 'd';
    'E': GetLoverCase := 'e';
    'F': GetLoverCase := 'f';
    'G': GetLoverCase := 'g';
    'H': GetLoverCase := 'h';
    'I': GetLoverCase := 'i';
    'J': GetLoverCase := 'j';
    'K': GetLoverCase := 'k';
    'L': GetLoverCase := 'l';
    'M': GetLoverCase := 'm';
    'N': GetLoverCase := 'n';
    'O': GetLoverCase := 'o';
    'P': GetLoverCase := 'p';
    'Q': GetLoverCase := 'q'; 
    'R': GetLoverCase := 'r';
    'S': GetLoverCase := 's';
    'T': GetLoverCase := 't';
    'U': GetLoverCase := 'u';
    'V': GetLoverCase := 'v';
    'W': GetLoverCase := 'w';
    'X': GetLoverCase := 'x';
    'Y': GetLoverCase := 'y';
    'Z': GetLoverCase := 'z';
    {rus}
    'À': GetLoverCase := 'à';
    'Á': GetLoverCase := 'á';
    'Â': GetLoverCase := 'â';
    'Ã': GetLoverCase := 'ã';
    'Ä': GetLoverCase := 'ä';
    'Å': GetLoverCase := 'å';
    '¨': GetLoverCase := '¸';
    'Æ': GetLoverCase := 'æ';
    'Ç': GetLoverCase := 'ç';
    'È': GetLoverCase := 'è';
    'É': GetLoverCase := 'é';
    'Ê': GetLoverCase := 'ê';
    'Ë': GetLoverCase := 'ë';
    'Ì': GetLoverCase := 'ì';
    'Í': GetLoverCase := 'í';
    'Î': GetLoverCase := 'î';
    'Ï': GetLoverCase := 'ï';
    'Ð': GetLoverCase := 'ð'; 
    'Ñ': GetLoverCase := 'ñ';
    'Ò': GetLoverCase := 'ò';
    'Ó': GetLoverCase := 'ó';
    'Ô': GetLoverCase := 'ô';             
    'Õ': GetLoverCase := 'õ';
    'Ö': GetLoverCase := 'ö';
    '×': GetLoverCase := '÷';
    'Ø': GetLoverCase := 'ø';
    'Ù': GetLoverCase := 'ù';
    'Ú': GetLoverCase := 'ú';
    'Û': GetLoverCase := 'û';
    'Ü': GetLoverCase := 'ü';
    'Ý': GetLoverCase := 'ý';
    'Þ': GetLoverCase := 'þ';
    'ß': GetLoverCase := 'ÿ'
  END
END;

FUNCTION CheckChar(Ch: CHAR): BOOLEAN;
BEGIN
  IF ((Ch >= 'A') AND (Ch <= 'Z')) OR ((Ch >= 'a') AND (Ch <= 'z'))
  OR ((Ch >= 'À') AND (Ch <= 'ß')) OR ((Ch >= 'à') AND (Ch <= 'ÿ'))
  OR (Ch = '¸') OR (Ch = '¨')
  THEN
    CheckChar := TRUE
  ELSE
    CheckChar := FALSE
END;

FUNCTION CheckPuncMark(Ch: CHAR): BOOLEAN;
BEGIN
  IF (Ch = '''') OR (Ch = '-')
  THEN
    CheckPuncMark := TRUE
  ELSE
    CheckPuncMark := FALSE
END;

PROCEDURE AddMark(VAR TextFile: TEXT; VAR WordAp: STRING; VAR Ch: CHAR);
VAR
  PucnMark: CHAR;
BEGIN
  IF CheckPuncMark(Ch) AND (LENGTH(WordAp) > 0)
  THEN
    BEGIN
      PucnMark := Ch;
      IF NOT EOLN(TextFile)
      THEN
        BEGIN
          READ(TextFile, Ch);
          IF CheckChar(Ch)
          THEN
            WordAp := WordAp + PucnMark
        END
    END
END; 

PROCEDURE WordCreater(VAR TextFile: TEXT; VAR WordAp: STRING);
VAR
  Ch, PucnMark: CHAR;
BEGIN
  WordAp := '';
  READ(TextFile, Ch);
  Ch := GetLoverCase(Ch);
  IF EOLN(TextFile) AND CheckChar(Ch)
  THEN
    WordAp := Ch;
  WHILE NOT EOLN(TextFile) AND CheckChar(Ch)
  DO
    BEGIN
      WordAp := WordAp + Ch;
      READ(TextFile, Ch);
      Ch := GetLoverCase(Ch);
      IF EOLN(TextFile) AND CheckChar(Ch) 
      THEN
        WordAp := WordAp + Ch;
      AddMark(TextFile, WordAp, Ch);
    END  
END;
BEGIN
END.

