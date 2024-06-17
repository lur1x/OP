PROGRAM Reverse(INPUT, OUTPUT);
{Выводит первые Depth символов в INPUT в обратном порядке}
CONST
  Depth = 20;
TYPE
  EltType = CHAR;
  Stack = RECORD
            Val: ARRAY [1..Depth] OF EltType;
            StackTop: 0..Depth
          END;
VAR
  S: Stack;
  Elt: EltType;

PROCEDURE NewStack(VAR S: Stack);
{S := <>}
BEGIN {NewStack}
  S.StackTop := 0;
END;  {NewStack}

PROCEDURE Push(VAR S: Stack, E: EltType);
{S := S & <E>}
BEGIN {Push}
  IF S.StackTop >= Depth
  THEN
    WRITELN('** OVERFLOW **')
  ELSE
    BEGIN
      S.StackTop := S.StackTop + 1;
      S.Val[S.StackTop] := E
    END
END;  {Push}

PROCEDURE Pop(VAR S:Stack);
{Существуют Stack X, EltType E, такие что
 S = X & <E> --> S := X}
BEGIN {Pop}
  IF S.StackTop <= 0 
  THEN
    WRITELN('** UNDERFLOW **')
  ELSE
    S.StackTop := S.StackTop - 1
END;  {Pop}

Function Top(VAR S: Stack);
{Существуют Stack X, EltType E, такие что
 S = X & <E> --> Top := E}
BEGIN {Top}
  IF S.StackTop <= 0
  THEN
    BEGIN
      WRITELN('** READING EMPTY STACK **');
      Top := 0;
    END
  ELSE
    Top := S.Val[S.StackTop]
END;  {Top}

FUNCTION Empty(VAR S: Stack): BOOLEAN;
{Empty := (S = <>)}
BEGIN {Empty}
  Empty := S.StackTop <= 0
END;  {Empty}

FUNCTION Full(VAR S: Stack): BOOLEAN;
{Full := (Length(S) = Depth)}
BEGIN {Full}
  Full := S.StackTop >= Depth
END;  {Full}

BEGIN {Reverse}
  NewStack(S);
  WHILE NOT EOF AND NOT Full(S)
  DO
    BEGIN
      Read(Elt);
      Push(S, Elt);
    END;
  WHILE NOT Empty(S)
  DO
    BEGIN
      WRITE(Top(S));
      Pop(S)
    END;
  WRITELN
END.  {Reverse}

