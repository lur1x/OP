PROGRAM RunRecursiveSort(INPUT, OUTPUT);  {����� INPUT, OUTPUT}
VAR
  Ch: CHAR;
  F1, F2: TEXT;
  
PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  WHILE NOT EOLN(InFile)            {����� ������ ������}
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END; {CopyFile}

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  Ch: CHAR;
PROCEDURE Split(VAR F1, F2, F3: TEXT);
{��������� F1 �� F2 � F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {���������� F1 ����������� � F2 � F3}
  Switch := '2';
  WHILE NOT EOLN(F1)            {����� ������ ������}
  DO
    BEGIN
      READ(F1, Ch);
      IF Switch = '2'
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3'
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2'
        END
    END;
  WRITELN(F2);
  WRITELN(F3)
END; {Split}

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
{������� F2 � F3 � F1 � ������������� �������}
VAR 
  Ch2, Ch3: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch2);
  READ(F3, Ch3);
  WHILE NOT EOLN(F2) AND NOT EOLN(F3)    {����� ������ ������}
  DO
    BEGIN 
      IF Ch2 < Ch3     {������������� ��� � ������� ��������}
      THEN 
        BEGIN
          WRITE(F1, Ch2);
          READ(F2, Ch2)
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          READ(F3, Ch3)
        END
    END;
  {���������� ������� F2 � F1}
  WHILE NOT EOLN(F2)     {����� ������ ������}
  DO
    BEGIN
      WRITE(F1, Ch2);
      READ(F2, Ch2)
    END;
  WRITE(F1, Ch2);
  {���������� ������� F3 � F1}
  WHILE NOT EOLN(F3)      {����� ������ ������}
  DO
    BEGIN
      WRITE(F1, Ch3);
      READ(F3, Ch3)
    END;
  WRITE(F1, Ch3)
END; {Merge}

BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT EOLN(F1)   {����� ������ ������}
  THEN
    BEGIN
      READ(F1, Ch);
      IF NOT EOLN(F1) {����� ������ ������}
      THEN {���� ������ ��� ������� 2 �������}
        BEGIN
          Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          Merge(F1, F2, F3)
        END
    END
END; {RecursiveSort}

BEGIN {RunRecursiveSort}
  REWRITE(F1);
  CopyFile(INPUT, F1);
  RESET(F1);
  REWRITE(F2); {����� ����� � �������}
  RecursiveSort(F1);
  RESET(F1);
  CopyFile(F1, OUTPUT)
END. {RunRecursiveSort}


