PROGRAM SortWords;
TYPE
  StringArray = ARRAY[0..100] OF STRING[255];
  Char = '�'..'�','�'..'�','�','�','0'..'9';
VAR
  Strings: StringArray;
  N, I, J, K, L1, L2: INTEGER;
  Temp: STRING[255];
  C1, C2: Char;
BEGIN
  N := 5;
  Strings[0] := '����';
  Strings[1] := '���';
  Strings[2] := '����';
  Strings[3] := '�����';
  Strings[4] := '����';
  FOR I := 0 TO N - 2 DO
    FOR J := 0 TO N - 2 - I DO
      BEGIN
        K := 0;
        L1 := LENGTH(Strings[J]);
        L2 := LENGTH(Strings[J + 1]);
        WHILE (K < L1) AND (K < L2) AND (Strings[J][K + 1] = Strings[J + 1][K + 1]) DO
          K := K + 1;
        IF (K < L1) AND (K < L2) THEN
          BEGIN
            C1 := Strings[J][K + 1];
            C2 := Strings[J + 1][K + 1];
            IF C1 > C2 THEN
              BEGIN
                Temp := Strings[J];
                Strings[J] := Strings[J + 1];
                Strings[J + 1] := Temp;
              END;
          END
        ELSE
          IF L1 > L2 THEN
            BEGIN
              Temp := Strings[J];
              Strings[J] := Strings[J + 1];
              Strings[J + 1] := Temp;
            END;
      END;
  FOR I := 0 TO N - 1 DO
    Writeln(Strings[I]);
END.

