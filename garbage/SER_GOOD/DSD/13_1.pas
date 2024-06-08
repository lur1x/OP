PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
  EncryptSpace = '@';
TYPE 
  Letter = 'A'..'Z';
  Str = ARRAY [1 .. Len] OF Letter;
  Chiper = ARRAY [Letter] OF CHAR;
  Lenght = 1..Len;
VAR
  Msg: Str;
  Code: Chiper;
  MsgLenght: Lenght;

PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
VAR
  F: TEXT;
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
END;

PROCEDURE Encode(VAR S: Str; VAR MsgLenght: Lenght);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO MsgLenght
  DO
    IF S[Index] IN ['A' .. 'Z', ' ']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END; {Encode}

BEGIN {Encryption}
  {Инициализировать Code}
  Initialize(Code);
  {читать строку в Msg и распечатать ее}
  MsgLenght := 1;
  WHILE NOT EOLN AND (MsgLenght <= Len)
  DO
    BEGIN
      READ(Msg[MsgLenght]);
      WRITE(Msg[MsgLenght]);
      MsgLenght := MsgLenght + 1
    END;
  READLN;
  WRITELN;
  {распечатать кодированное сообщение}
  Encode(Msg, MsgLenght)
END. {Encryption}

