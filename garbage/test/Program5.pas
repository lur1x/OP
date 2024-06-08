PROGRAM RecordWords(INPUT, OUTPUT);
CONST
  Len = 2000; 
  UpperCase: SET OF CHAR = ['A' .. 'Z', '�' .. '�', '?'];
  LowerCase: SET OF CHAR = ['a' .. 'z', '�' .. '�', '-'];
  CorrectChars: SET OF CHAR =  UpperCase + LowerCase; 
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Lenght = 0 .. Len;
VAR
  Word: Str;
  WordLenght: Lenght;
  Ch: CHAR;
PROCEDURE WriteWord(VAR S: Str; VAR MsgLenght: Lenght);
{�������� �����}
VAR
  Index: 0 .. MsgLenght;
BEGIN
  FOR Index := 0 TO (MsgLenght - 1)
  DO
    BEGIN
      WRITE(S[Index])
    END
END;  
BEGIN
  WHILE NOT EOF
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          {������ ������ � Msg � ����������� ��}
          WordLenght := 0;
          READ(Ch);
          WHILE (Ch IN CorrectChars) AND (WordLenght <= Len)
          DO
            BEGIN 
              Word[WordLenght] := Ch;
              WordLenght := WordLenght + 1;
              READ(Ch)
            END;
          {����������� ������}
          WriteWord(Word, WordLenght);
          WRITE(' ')
        END;
      READLN;
      WRITELN;
    END
END.
