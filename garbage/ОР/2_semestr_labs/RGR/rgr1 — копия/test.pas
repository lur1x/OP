program ReadWords(input, output);

var
  Input: string;
  Word: string;
  i, j: integer;

begin
  writeln('Enter a string:');
  readln(Input);

  writeln('Enter the number of words to read:');
  readln(i);
  reset(input);
  for j := 1 to i do
  begin
    read(Input, Word); { ?????? ???? ????? ?? ?????? }
    writeln('Word ', j, ': ', Word);
  end;
end.

