PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
  EncryptSpace = 'G';
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
BEGIN {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
END;  {Initialize}

PROCEDURE Encode(VAR S: Str; VAR MsgLenght: Lenght);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO MsgLenght
  DO
    IF S[Index] IN ['A' .. 'Z', ' ']
    THEN
      BEGIN
        IF S[Index] = ' '
        THEN
          WRITE(EncryptSpace)
        ELSE
          WRITE(Code[S[Index]])
      END
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

