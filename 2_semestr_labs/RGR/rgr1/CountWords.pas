PROGRAM CountWords;
USES StatisticWords;
CONST 
  InputFile = 'INPUT3.TXT';
  StatisticFile = 'OUTPUT.TXT';
VAR
  InFile, OutFile: TEXT;
BEGIN {CountWords}
  ASSIGN(InFile, InputFile);
  ASSIGN(OutFile, StatisticFile);
  RESET(InFile);
  REWRITE(OutFile);
  GetStatisticWords(InFile, OutFile)
END. {CountWords}  

