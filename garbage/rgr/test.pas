PROGRAM CountWords;
CONST 
  UpperLetters: SET OF CHAR = ['A' .. 'Z', '�' .. '�', '�'];
  LowerLetters: SET OF CHAR = ['a' .. 'z', '�' .. '�', '�'];
  ConnectingSigns: SET OF CHAR = ['''', '-'];
  CorrectChars: SET OF CHAR =  UpperLetters + LowerLetters + ConnectingSigns; 
  InputFile = 'input.txt';
  StatisticFile = 'output.txt';
  MaxWords = 1000;
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
END; 

PROCEDURE CompareWords(VAR Ptr: Tree; VAR Data: STRING; VAR IsBigger: INTEGER);
VAR
  I: INTEGER;
  Ch1, Ch2: CHAR;
BEGIN {CompareWords}
  IsBigger := 0;
  I := 0;
  WHILE (IsBigger = 0) AND (I < Length(Data)) AND (I < Length(Ptr^.Word)) 
  DO
    BEGIN
      Ch1 := Data[I];
      Ch2 := Ptr^.Word[I];
      IF NOT ((Ch1 = '�') AND (Ch2 = '�'))
      THEN
        BEGIN
          IF ((Ch1 = '�') AND ('�' <= Ch2) AND (Ch2 <= '�'))
          THEN
            IsBigger := 1
          ELSE
            IF ((Ch2 = '�') AND ('�' <= Ch1) AND (Ch1 <= '�')) 
            THEN
              IsBigger := 2
            ELSE
              IF Ch1 < Ch2
              THEN
                IsBigger := 2
              ELSE
                IF Ch1 > Ch2
                THEN
                  IsBigger := 1;
          I := I + 1;
        END
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
END; {CompareWords}

PROCEDURE Insert(VAR Data: STRING);         
PROCEDURE Ins(VAR Ptr: Tree; VAR Data: STRING);
VAR
  IsBigger: INTEGER;
BEGIN {Ins}
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
      IsBigger := 0;
      CompareWords(Ptr, Data, IsBigger);
      IF IsBigger = 1
      THEN
        Ins(Ptr^.RLink, Data) 
      ELSE
        IF IsBigger = 2
        THEN 
          Ins(Ptr^.LLink, Data)
        ELSE
          Ptr^.Counter := Ptr^.Counter + 1 
    END
END; {Ins}
BEGIN {Insert}
  Ins(Root, Data)
END; {Insert}

PROCEDURE PrintStatistic(VAR OutFile: TEXT);

PROCEDURE PrintStat(VAR OutFile: TEXT; Ptr: Tree);
BEGIN {PrintStat}
  IF Ptr <> NIL
  THEN
    BEGIN
      PrintStat(OutFile, Ptr^.LLink);
      WRITELN(OutFile, Ptr^.Word, ' ', Ptr^.Counter);
      PrintStat(OutFile, Ptr^.RLink)
    END
END; {PrintStat}
BEGIN {PrintStatistic}
  PrintStat(OutFile, Root)
END; {PrintStatistic}
 
BEGIN {WordsStatistics}
  ASSIGN(InFile, InputFile);
  ASSIGN(OutFile, StatisticFile);
  RESET(InFile);
  REWRITE(OutFile); 
  CounterWords := 0;
  WHILE NOT EOF(InFile) AND (CounterWords < MaxWords)
  DO
    BEGIN
      WHILE NOT EOLN(InFile) AND (CounterWords < MaxWords)
      DO 
        BEGIN
          ReadWord(InFile, WordTemp); 
          IF WordTemp <> ''
          THEN
            BEGIN
              Insert(WordTemp);
              CounterWords := CounterWords + 1
            END
        END;
      READLN(InFile)
    END;
  PrintStatistic(OutFile)
END. {WordsStatistics}        
