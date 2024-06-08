UNIT StatisticWords;

INTERFACE {INTERFACE}
  USES
    ReaderWords, SortedWords;
  PROCEDURE GetStatisticWords(VAR InFile, OutFile: TEXT);  
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
  CONST 
    MaxWords = 10;
 
  PROCEDURE GetStatisticWords(VAR InFile, OutFile: TEXT);
  VAR
    Word: STRING;
    CounterWords: INTEGER;
  BEGIN {GetStatisticWords}
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
                Insert(Word);
                CounterWords := CounterWords + 1
              END
          END;
        READLN(InFile)
      END;
    PrintStatistic(OutFile)  
  END; {GetStatisticWords}
{IMPLEMENTATION}

BEGIN {StatisticWords}
END. {StatisticWords}
