UNIT StatisticsWords;

INTERFACE {INTERFACE}
  USES
    ReaderWords, SortedWords;
  PROCEDURE GetStatistics(VAR InputFile, OutputFile: TEXT);
  {Проходимся по всему файлу и считаем встречаемость каждого слова в файле}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}     
  CONST
    LimitWords = 2;

  VAR                      
    CounterWords: INTEGER;
    
  PROCEDURE GetStatistics(VAR InputFile, OutputFile: TEXT);
  {Проходимся по всему файлу и считаем встречаемость каждого слова в файле}
  VAR
    Word: STRING;
  BEGIN {GetStatistics}
    CounterWords := 0;
    WHILE NOT EOF(InputFile)
    DO
      BEGIN
        WHILE NOT EOLN(InputFile)
        DO
          BEGIN
            ReadWord(InputFile, Word);
            IF (Word <> '-') AND (Word <> '')
            THEN
              BEGIN
                Insert(Word);
                CounterWords := CounterWords + 1;
                IF CounterWords = LimitWords
                THEN
                  TransStatistics;
              END
          END;
        READLN(InputFile)
      END;
    TransStatistics;
    PrintStatistics(OutputFile)
  END; {GetStatistics}
{IMPLEMENTATION}

BEGIN {StatisticsWords}
END. {StatisticsWords}



