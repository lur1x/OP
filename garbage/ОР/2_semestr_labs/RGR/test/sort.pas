program SortStrings;

type
  StringArray = array of string;

var
  Strings: StringArray;
  I, J, N: Integer;
  Temp: string;

function CompareStrings(S1, S2: string): Integer;
var
  I: Integer;
begin
  I := 1;
  while (I <= Length(S1)) and (I <= Length(S2)) do
  begin
    if S1[I] <> S2[I] then
      Exit(Ord(S1[I]) - Ord(S2[I]));
    Inc(I);
  end;
  if Length(S1) <> Length(S2) then
    Exit(Length(S1) - Length(S2));
  Exit(0);
end;

procedure BubbleSort(var A: StringArray);
var
  I, J: Integer;
  Temp: string;
begin
  for I := 0 to Length(A) - 2 do
    for J := 0 to Length(A) - I - 2 do
      if CompareStrings(A[J], A[J + 1]) > 0 then
      begin
        Temp := A[J];
        A[J] := A[J + 1];
        A[J + 1] := Temp;
      end;
end;

begin
  SetLength(Strings, 5);
  Strings[0] := '???????';
  Strings[1] := '??';
  Strings[2] := '???????';
  Strings[3] := '???';
  Strings[4] := '??????';
  BubbleSort(Strings);
  for I := 0 to Length(Strings) - 1 do
    Writeln(Strings[I]);
  Readln;
end.

