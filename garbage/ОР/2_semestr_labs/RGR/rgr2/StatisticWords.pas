UNIT StatisticWords;

INTERFACE {INTERFACE}
  USES
    ReaderWords, SortedWords; 
  PROCEDURE GetStatisticWords(VAR InFile, OutFile: TEXT);  
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
  CONST 
    MaxWords = 5;
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
 
  PROCEDURE GetStatisticWords(VAR InFile, OutFile: TEXT);
  VAR
    Word: STRING;
    Root: Tree;
    CounterWords: INTEGER;
  BEGIN {GetStatisticWords}
    Root := NIL; 
    CounterWords := 0;
    WHILE (CounterWords < 5) AND (NOT EOF(InFile))
    DO
      BEGIN
        WHILE (CounterWords < 5) AND (NOT EOLN(InFile))
        DO 
          BEGIN
            ReadWord(InFile, Word); 
            IF (Word <> '') AND (Word <> '-') 
            THEN
              BEGIN
                Insert(Root, Word);
                CounterWords := CounterWords + 1
              END
          END;
        READLN(InFile)
      END;
    PrintStatistic(OutFile, Root);  
  END; {GetStatisticWords}
{IMPLEMENTATION}

BEGIN {StatisticWords}
END. {StatisticWords}
