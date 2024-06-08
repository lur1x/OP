PROGRAM PsevdoGraphic(INPUT, OUTPUT);

CONST
  Column = 5;
  Line = 5;
  MaxLenght = Line * Column;
  MaxVolume = 10 * MaxLenght;
TYPE
  Amount = SET OF 1..MaxLenght; 
  Volume = SET OF 1..MaxVolume;
  Let = (NoLetter, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, W, V, X, Y, Z);
VAR
  ValueForLetter: Amount;
  Letter: Let;
  Lenght, Counter: INTEGER;
  VolumeLetters: Volume;
  
PROCEDURE ReadLetter(VAR InFile: TEXT; VAR Letter: Let);
VAR
  Ch: CHAR;
BEGIN {ReadLetter}
  READ(InFile, Ch);
  CASE Ch OF
    'A': Letter := A; 
    'B': Letter := B;
    'C': Letter := C;
    'D': Letter := D;
    'E': Letter := E;
    'F': Letter := F;
    'G': Letter := G;
    'H': Letter := H;
    'I': Letter := I;
    'J': Letter := J;
    'K': Letter := K;
    'L': Letter := L;
    'M': Letter := M;
    'N': Letter := N;
    'O': Letter := O;
    'P': Letter := P;
    'Q': Letter := Q;
    'R': Letter := R;
    'S': Letter := S;
    'T': Letter := T;
    'U': Letter := U;
    'W': Letter := W;
    'V': Letter := V;
    'X': Letter := X;
    'Y': Letter := Y;
    'Z': Letter := Z
  ELSE
    Letter := NoLetter
  END
END; {ReadLetter}
 
PROCEDURE PullOutValue(VAR Letter: Let; VAR ValueForLetter: Amount);
BEGIN {PullOutLetter}
  CASE Letter OF
    A: ValueForLetter := [5, 9, 10, 13, 15, 18, 19, 20, 22, 25];
    B: ValueForLetter := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
    C: ValueForLetter := [2, 3, 4, 6, 10, 11, 16, 20, 22, 23, 24];
    D: ValueForLetter := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    E: ValueForLetter := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
    F: ValueForLetter := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21];
    G: ValueForLetter := [1, 2, 3, 4, 5, 6, 11, 14, 15, 16, 20, 21, 22, 23, 24, 25];
    H: ValueForLetter := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    I: ValueForLetter := [1, 2, 3, 4, 5, 8, 13, 18, 21, 22, 23, 24, 25];
    J: ValueForLetter := [1, 2, 3, 4, 5, 8, 13, 16, 18, 22, 23];
    K: ValueForLetter := [1, 4, 5, 6, 8, 11, 12, 16, 18, 21, 24, 25];
    L: ValueForLetter := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    M: ValueForLetter := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    N: ValueForLetter := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    O: ValueForLetter := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    P: ValueForLetter := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 21];
    Q: ValueForLetter := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24, 25];
    R: ValueForLetter := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 18, 19,  21, 24, 25];
    S: ValueForLetter := [2, 3, 4, 5, 6, 12, 13,14, 20, 21, 22, 23, 24];
    T: ValueForLetter := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    U: ValueForLetter := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    W: ValueForLetter := [1, 5, 6, 10, 11, 13, 15, 16, 17, 18, 19, 20, 21, 23, 25];
    V: ValueForLetter := [1, 5, 6, 10, 11, 15, 17, 19, 23];
    X: ValueForLetter := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    Y: ValueForLetter := [1, 5, 7, 9, 13, 18, 23];
    Z: ValueForLetter := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25]
  ELSE
    ValueForLetter := []
  END
END; {PullOutLetter}

PROCEDURE MoveValueInSet(VAR VolumeLetters: Volume; VAR Counter: INTEGER);
VAR
  I, E: INTEGER;
  IntermediateSet: Volume;
BEGIN 
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
END;   
        
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
                            
PROCEDURE WriteLetter(VAR Lenght, Counter: INTEGER; VAR VolumeLetters: Volume);
VAR
  I: INTEGER;
BEGIN {WriteLetter}
  FOR I := 1 TO (Lenght * Counter)
  DO
    BEGIN
      IF I IN VolumeLetters
      THEN
        WRITE('#')
      ELSE
        WRITE(' ');
      IF (I MOD Column) = 0
      THEN
        BEGIN
          WRITE(' ');
          IF (I MOD (Column * Counter)) = 0
          THEN
            WRITELN
        END                         
    END     
END; {WriteLetter}

BEGIN {PsevdoGraphic}
  Lenght := MaxLenght;
  VolumeLetters := [];
  Counter := 0;
  WHILE NOT EOLN
  DO
    BEGIN
      ReadLetter(INPUT, Letter);
      Counter := Counter + 1;
      PullOutValue(Letter, ValueForLetter);
      AddValueInSet(ValueForLetter, VolumeLetters, Counter)
    END;
  WriteLetter(Lenght, Counter, VolumeLetters) 
END. {PsevdoGraphic}




