PROGRAM XPrint(INPUT, OUTPUT);

CONST
  Column = 5;
  Line = 5;
  MaxLenght = Line * Column;
  MaxVolume = 10 * MaxLenght;
  FileWithValue = 'ValueForLet.TXT';
TYPE
  Amount = SET OF 1..MaxLenght; 
  Volume = SET OF 1..MaxVolume;
VAR
  ValueForLetter: Amount;
  Letter: CHAR;
  Lenght, Counter: INTEGER;
  VolumeLetters: Volume;
 
PROCEDURE PullOutValue(VAR Letter: CHAR; VAR ValueForLetter: Amount);
VAR
  F1: TEXT;
  Ch: CHAR;
  I: INTEGER;
BEGIN {PullOutLetter}
  ASSIGN(F1, 'ValueForLet.TXT');
  RESET(F1);
  ValueForLetter := [];
  IF Letter <> ' '
  THEN
    BEGIN
      WHILE (NOT EOF(F1)) AND (Ch <> Letter)
      DO
        BEGIN
          WHILE (NOT EOLN(F1)) AND (Ch <> Letter)
          DO 
            READ(F1, Ch);
          IF (Ch <> Letter)
          THEN
            READLN(F1)
        END;
      IF (Ch = Letter)
      THEN
        WHILE NOT EOLN(F1)
        DO
          BEGIN
            READ(F1, I);
            ValueForLetter := ValueForLetter + [I]
          END
      ELSE 
        ValueForLetter := [1..25]
  END
END; {PullOutLetter}

PROCEDURE MoveValueInSet(VAR VolumeLetters: Volume; VAR Counter: INTEGER);
VAR
  I, E: INTEGER;
  IntermediateSet: Volume;
BEGIN {MoveValueInSet}
  IntermediateSet := [];
  FOR I := 1 TO (Lenght * (Counter-1))
  DO
    BEGIN
      IF I IN VolumeLetters
      THEN
        IntermediateSet := IntermediateSet + [I]
    END;
  VolumeLetters := [];
  E := 0;
  FOR I :=1 TO (Lenght * (Counter-1))
  DO
    BEGIN
      IF I IN IntermediateSet
      THEN 
        VolumeLetters := VolumeLetters + [I + (Column * E)];
      IF (I MOD (Column * (Counter-1))) = 0
      THEN
        E := E + 1
    END
END; {MoveValueInSet}  
        
PROCEDURE AddValueInSet(VAR ValueForLetter: Amount; VAR VolumeLetters: Volume; VAR Counter: INTEGER);
VAR
  I, E: INTEGER;
BEGIN {AddValueInSet}
  IF Counter > 1
  THEN
    BEGIN
      MoveValueInSet(VolumeLetters, Counter);
      E := 1;
      FOR I :=1 TO Lenght
      DO
        BEGIN
          IF I IN ValueForLetter
          THEN 
            VolumeLetters := VolumeLetters + [I + (Column * E * (Counter - 1))];
          IF (I MOD Column)  = 0
          THEN
             E := E + 1
        END
    END
  ELSE
    FOR I := 1 TO Lenght
    DO
      BEGIN
        IF I IN ValueForLetter
        THEN
          VolumeLetters := VolumeLetters + [I]
      END
END; {AddValueInSet}
                            
PROCEDURE WriteLetter(VAR Lenght, Counter: INTEGER; VAR VolumeLetters: Volume; VAR OutFile: TEXT);
VAR
  I: INTEGER;
BEGIN {WriteLetter}
  FOR I := 1 TO (Lenght * Counter)
  DO
    BEGIN
      IF I IN VolumeLetters
      THEN
        WRITE(OutFile, '#')
      ELSE
        WRITE(OutFile, ' ');
      IF (I MOD Column) = 0
      THEN
        BEGIN
          WRITE(OutFile, ' ');
          IF (I MOD (Column * Counter)) = 0
          THEN
            WRITELN(OutFile)
        END                         
    END     
END; {WriteLetter}

BEGIN {XPrint}
  Lenght := MaxLenght;
  VolumeLetters := [];
  Counter := 0;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Letter); 
      Counter := Counter + 1;
      PullOutValue(Letter, ValueForLetter);
      AddValueInSet(ValueForLetter, VolumeLetters, Counter)
    END;
  WriteLetter(Lenght, Counter, VolumeLetters, OUTPUT) 
END. {XPrint}




