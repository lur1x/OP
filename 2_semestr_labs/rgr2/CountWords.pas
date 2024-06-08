PROGRAM CountWordsV2;
USES 
  StatisticsWords;
CONST
  FileNameInput = 'INPUT.TXT';
  FileNameOutput = 'OUTPUT.TXT';
VAR
  InFile, OutFile: TEXT;
BEGIN
  ASSIGN(InFile, FileNameInput);
  ASSIGN(OutFile, FileNameOutput);
  RESET(InFile);
  REWRITE(OutFile);
  GetStatistics(InFile, OutFile)
END.
