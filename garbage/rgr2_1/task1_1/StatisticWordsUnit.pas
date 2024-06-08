UNIT StatisticWordsUnit;
USES ConstsUnit, WordReaderUnit, EntityUnit;

INTERFACE {INTERFACE}
  PROCEDURE StatisticWords(VAR InFile, OutFile: TEXT);
  {������ ����-�� ����� � ����� � ������� �� ����������}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTETION}
  PROCEDURE StatisticWords(VAR InFile, OutFile: TEXT);
  {������ ����-�� ����� � ����� � ������� �� ����������}  
  BEGIN {StatisticWords}
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
  END; {StatisticWords}  
{IMPLEMENTATION}

BEGIN {StatisticWordsUnit}
END. {StatisticWordsUnit}
