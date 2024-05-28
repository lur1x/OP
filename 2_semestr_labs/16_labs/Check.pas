PROGRAM CheckDateIO(INPUT, OUTPUT);
USES DateIO;
VAR
  M1, M2: Month;
BEGIN
  ReadMonth(INPUT, M1);
  ReadMonth(INPUT, M2);
  WriteMonth(OUTPUT, M1);
  WRITELN(OUTPUT);
  WriteMonth(OUTPUT, M2);
  WRITELN(OUTPUT)
END.


