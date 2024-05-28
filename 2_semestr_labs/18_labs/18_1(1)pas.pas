PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
  MinScore = 0;
  MaxScore = 100;
TYPE
  Score = MinScore .. MaxScore;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  OverFlow : BOOLEAN;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages: ');
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      WHILE WhichScore <= NumberOfScores
      DO
        BEGIN
          IF NOT EOLN
          THEN
             BEGIN
               READ(NextScore);
               IF (NextScore <= MaxScore) AND (NextScore >= MinScore)
               THEN
                 BEGIN
                   TotalScore := TotalScore + NextScore;
                   WhichScore := WhichScore + 1
                 END
               ELSE
                 BEGIN
                 WRITELN('OVERFLOW')
                 OverFlow := TRUE
             END
        END; 
      READLN;
      IF NOT OverFlow
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          IF Ave MOD 10 >= 5
          THEN
            WRITELN(Ave DIV 10 + 1)
          ELSE
            WRITELN(Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore;
        END
      Student := Student + 1
    END;
  WRITELN;
  WRITELN('Class average: ');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END. {AverageScore}
