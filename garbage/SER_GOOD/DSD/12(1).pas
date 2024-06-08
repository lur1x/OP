PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Letter = 'A'..'Z'; 
  Str = ARRAY [1 .. Len] OF Letter;
  Chiper = ARRAY [Letter] OF CHAR;
  Lenght = 1..Len;
VAR
  Msg: Str;
  Code: Chiper;
  MsgLenght: Lenght;
  F1, F2: TEXT;

PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  WHILE NOT EOF(InFile)
  DO
    BEGIN 
      IF NOT EOLN(InFile)
      THEN
        BEGIN
          READ(InFile, Ch);
          WRITE(OutFile, Ch)
        END
      ELSE
        BEGIN
          WRITELN(OutFile);
          READLN(InFile)
        END
    END
END; {CopyFile}

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

PROCEDURE Encode(VAR S: Str; VAR MsgLenght: Lenght; VAR OutFile: TEXT);
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
          WRITE(OutFile, 'G')
        ELSE
          WRITE(OutFile, Code[S[Index]])
      END
    ELSE
      WRITE(OutFile, S[Index]);
  WRITELN(OutFile)
END; {Encode}

PROCEDURE Encrypty(VAR InFile, OutFile: TEXT);
BEGIN {Encrypty}
  {Инициализировать Code}
  Initialize(Code);
  WHILE NOT EOF(InFile)
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      MsgLenght := 1;
      WHILE (NOT EOLN(InFile)) AND (MsgLenght <= Len)
      DO
        BEGIN
          READ(InFile, Msg[MsgLenght]);
          WRITE(OutFile, Msg[MsgLenght]);
          MsgLenght := MsgLenght + 1
        END;
      READLN(InFile);
      WRITELN(OutFile);
      {распечатать кодированное сообщение}
      Encode(Msg, MsgLenght, OutFile)
    END
END; {Encrypty}

BEGIN {Encryption}
  CopyFile(INPUT, F1);
  Encrypty(F1, OUTPUT)
END. {Encryption}


