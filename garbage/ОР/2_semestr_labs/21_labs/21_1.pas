PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
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
  
PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
BEGIN {Initialize}
  Code[' '] := '@';
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
  Code['Z'] := 'A'
END;  {Initialize}

PROCEDURE Encode(VAR S: Str; VAR MsgLenght: Lenght);
{Выводит символы из Code, соответствующие символам из S}
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
  {Инициализировать Code}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {Читать строку в Msg и распечатать ее}
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
      {Распечатать кодированное сообщение}
      Encode(Msg, MsgLenght)
    END
END. {Encryption}   //

