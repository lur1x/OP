PROGRAM Encryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
CONST
  Len = 20;
  Let = [' ', 'A' .. 'Z'];   //
TYPE
  Letter = ' ' .. 'Z';              // 
  Str = ARRAY [1 .. Len] OF Letter;
  Chiper = ARRAY [Letter] OF CHAR;
  Lenght = 0 .. Len;               //
VAR
  Msg: Str;
  Code: Chiper;
  MsgLenght: Lenght;
  F: TEXT;
  
PROCEDURE Initialize(VAR Code: Chiper);
{��������� Code ���� ������}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Initialize}
  ASSIGN(F, 'ENCRYPTION.TXT');
  RESET(F);
  WHILE NOT EOF(F)
  DO
    BEGIN
      READ(F, Ch1);
      READ(F, Ch2);
      Code[Ch1] := Ch2;
      READLN(F)
    END
END;  {Initialize}

PROCEDURE Encode(VAR S: Str; VAR MsgLenght: Lenght);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. MsgLenght;
BEGIN {Encode}
  FOR Index := 1 TO MsgLenght
  DO
    BEGIN
      IF S[Index] IN Let
      THEN
        WRITE(Code[S[Index]])
      ELSE
        WRITE(S[Index])
    END; //
  WRITELN
END; {Encode}   //

BEGIN {Encryption}
  {���������������� Code}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
      MsgLenght := 0;
      WHILE NOT EOLN AND (MsgLenght <= Len)
      DO
        BEGIN
          MsgLenght := MsgLenght + 1;
          READ(Msg[MsgLenght]);
          WRITE(Msg[MsgLenght]) //
        END;
      READLN;
      WRITELN;
      {����������� ������������ ���������}
      Encode(Msg, MsgLenght)
    END
END. {Encryption}   //

