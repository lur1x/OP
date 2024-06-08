UNIT StatisticWords;
  
INTERFACE {INTERFACE}

USES 
  ReaderWords, SortedWords;
CONST 
  MaxWords = 5;
  
PROCEDURE GetStatisticWords(VAR InFile, OutFile: TEXT);


IMPLEMENTATION 
  
PROCEDURE PrintStatistic(VAR OutFile: TEXT; Root: Tree);
BEGIN {PrintStatistic}
  IF Root <> NIL
  THEN
    BEGIN
      PrintStatistic(OutFile, Root^.LLink);
      WRITELN(OutFile, Root^.Word, ' ', Root^.Counter);
      PrintStatistic(OutFile, Root^.RLink)
    END
END;
  
PROCEDURE GetStatisticWords(VAR InFile, OutFile: TEXT);
VAR
  WordTemp: STRING;
  Root: Tree;
  CounterWords: INTEGER;
BEGIN {GetStatisticWords}
  Root := NIL; 
  CounterWords := 0;
  WHILE NOT EOF(InFile) AND (CounterWords <= MaxWords)
  DO
    BEGIN
      WHILE (NOT EOLN(InFile)) AND (CounterWords <= MaxWords)
      DO 
        BEGIN
          ReadWord(InFile, WordTemp); 
          IF WordTemp <> ''
          THEN
            BEGIN
              Insert(Root, WordTemp);
              CounterWords := CounterWords + 1
            END
        END;
      READLN(InFile)
    END;
  PrintStatistic(OutFile, Root)
END; {GetStatisticWords}

BEGIN {StatisticWords}
END. {StatisticWords}  
