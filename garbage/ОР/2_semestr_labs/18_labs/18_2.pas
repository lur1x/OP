PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 3;
  ClassSize = 2;
  MinScore = 0;
  MaxScore = 100;
TYPE
  Score = MinScore .. MaxScore;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  SurnameStudent: TEXT;
PROCEDURE CopySurname(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopySurname}
  IF NOT EOLN(InFile)
  THEN
    READ(InFile, Ch);
  WHILE (Ch <> ' ') AND (NOT EOLN(InFile))
  DO
    BEGIN
      WRITE(OutFile, Ch);
      READ(InFile, Ch)
    END
END; {CopySurname}
BEGIN {AverageScore}
  ClassTotal := 0;
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      WRITELN('Enter surname student''s');
      REWRITE(SurnameStudent);
      CopySurname(INPUT, SurnameStudent);
      WRITELN(SurnameStudent);
      WHILE WhichScore <= NumberOfScores 
      DO
        BEGIN
          IF NOT EOLN 
          THEN
            READ(NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END; 
      READLN;
      RESET(SurnameStudent);
      CopySurname(SurnameStudent, OUTPUT);
      WRITE(': ');
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1
    END;
  WRITELN;
  WRITE('Class average: ');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END. {AverageScore}
