PROGRAM CountWords;
CONST 
  UpperLetters: SET OF CHAR = ['A' .. 'Z', 'À' .. 'ß', '¨'];
  LowerLetters: SET OF CHAR = ['a' .. 'z', 'à' .. 'ÿ', '¸'];
  ConnectingSigns: SET OF CHAR = ['''', '-'];
  CorrectChars: SET OF CHAR =  UpperLetters + LowerLetters + ConnectingSigns; 
  InputFile = 'INPUT1.TXT';
  StatisticFile = 'OUTPUT.TXT';
  MaxWords = 10000;
TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;
           Counter: INTEGER;
           LLink, RLink: Tree
         END;

VAR
  WordTemp: STRING;
  InFile, OutFile: TEXT;
  Root: Tree;
  CounterWords: INTEGER;
  
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

PROCEDURE CheckForUpLet(VAR Ch: CHAR);
BEGIN
  IF Ch IN UpperLetters
  THEN
    Ch := ChangeOfCase(Ch);
END;

PROCEDURE CheckForHyphen(VAR Ch: CHAR; VAR InFile: TEXT;  VAR WordTemp: STRING);
BEGIN
  IF Ch = '-'
  THEN
    BEGIN
      READLN(InFile);
      READ(InFile, Ch);
      CheckForUpLet(Ch);
      WordTemp := WordTemp + Ch;
      Read(InFile, Ch)
    END
  ELSE
    WordTemp := WordTemp + Ch
END;

PROCEDURE ReadWord(VAR InFile: TEXT; VAR WordTemp: STRING);
VAR
  Ch: CHAR;
BEGIN
  WordTemp := '';
  READ(InFile, Ch);
  IF EOLN(InFile) AND (Ch IN CorrectChars)
  THEN
    BEGIN
      CheckForUpLet(Ch);
      CheckForHyphen(Ch, InFile, WordTemp)
    END;
  WHILE (Ch IN CorrectChars) AND (NOT EOLN(InFile))
  DO
    BEGIN
      CheckForUpLet(Ch);
      WordTemp := WordTemp + Ch;
      READ(InFile, Ch);
      IF EOLN(InFile) AND (Ch IN CorrectChars)
      THEN
        BEGIN
          CheckForUpLet(Ch);
          CheckForHyphen(Ch, InFile, WordTemp)
        END
    END
END; 

PROCEDURE CompareWords(VAR Ptr: Tree; VAR Data: STRING; VAR IsBigger: INTEGER);
VAR
  I: INTEGER;
  Ch1, Ch2: CHAR;
BEGIN
  IsBigger := 0;
  I := 1;
  WHILE (IsBigger = 0) AND (I <= Length(Data)) AND (I <= Length(Ptr^.Word)) 
  DO
    BEGIN
      Ch1 := Data[I];
      Ch2 := Ptr^.Word[I];
      IF NOT ((Ch1 = '¸') AND (Ch2 = '¸'))
      THEN
        BEGIN
          IF ((Ch1 = '¸') AND ('a' <= Ch2) AND (Ch2 <= 'å'))
          THEN
            Ch1 := 'æ';
          IF ((Ch2 = '¸') AND ('a' <= Ch1) AND (Ch1 <= 'å')) 
          THEN
            Ch2 := 'æ';
          IF Ch1 < Ch2
          THEN
            IsBigger := 2
          ELSE
            IF Ch1 > Ch2
            THEN
              IsBigger := 1
        END;
      I := I + 1;
    END;
  IF IsBigger = 0
  THEN
    BEGIN
      IF Length(Data) < Length(Ptr^.Word)
      THEN
        IsBigger := 2;
      IF Length(Data) > Length(Ptr^.Word)
      THEN
        IsBigger := 1  
    END;
END;
            
PROCEDURE Insert(VAR Ptr: Tree; VAR Data: STRING);
VAR
  IsBigger: INTEGER;
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN
      NEW(Ptr);
      Ptr^.Word := Data;
      Ptr^.Counter := 1;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL
    END
  ELSE
    BEGIN 
      CompareWords(Ptr, Data, IsBigger);
      IF IsBigger = 1
      THEN
        Insert(Ptr^.RLink, Data) 
      ELSE
        IF IsBigger = 2
        THEN 
          Insert(Ptr^.LLink, Data)
        ELSE
          Ptr^.Counter := Ptr^.Counter + 1 
    END
END; {Insert}

PROCEDURE PrintStatistic(VAR OutFile: TEXT; Root: Tree);
BEGIN {PrintStatistic}
  IF Root <> NIL
  THEN
    BEGIN
      PrintStatistic(OutFile, Root^.LLink);
      WRITELN(OutFile, Root^.Word, ' ', Root^.Counter);
      PrintStatistic(OutFile, Root^.RLink)
    END
END; {PrintStatistic}
 
BEGIN {WordsStatistics}
  ASSIGN(InFile, InputFile);
  ASSIGN(OutFile, StatisticFile);
  RESET(InFile);
  REWRITE(OutFile);
  Root := NIL; 
  CounterWords := 0;
  WHILE NOT EOF(InFile) AND (CounterWords <= MaxWords)
  DO
    BEGIN
      WHILE (NOT EOLN(InFile)) AND (CounterWords <= MaxWords)
      DO 
        BEGIN
          ReadWord(InFile, WordTemp); 
          IF (WordTemp <> '') AND (WordTemp <> '-') 
          THEN
            BEGIN
              Insert(Root, WordTemp);
              CounterWords := CounterWords + 1
            END
        END;
      READLN(InFile)
    END;
  PrintStatistic(OutFile, Root)
END. {WordsStatistics}  
