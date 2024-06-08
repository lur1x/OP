UNIT StatisticWords;

INTERFACE {INTERFACE}
  USES
    ReaderWords, SortedWords;
  PROCEDURE GetStatisticWords(VAR InFile, OutFile: TEXT);  
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
  CONST 
    MaxWords = 10;
  PROCEDURE PrintStatistic(VAR OutFile: TEXT; Root: Tree);
  BEGIN {PrintStatistic}
    IF Root <> NIL
    THEN
      BEGIN
        PrintStatistic(OutFile, Root^.LLink);
        WRITELN(OutFile, Root^.Words, ' ', Root^.Counter);
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
    WHILE (NOT EOF(InFile)) AND (CounterWords < MaxWords)
    DO
      BEGIN
        WHILE (NOT EOLN(InFile)) AND (CounterWords < MaxWords)
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
    PrintStatistic(OutFile, Root)  
  END; {GetStatisticWords}
{IMPLEMENTATION}

BEGIN {StatisticWords}
END. {StatisticWords}
