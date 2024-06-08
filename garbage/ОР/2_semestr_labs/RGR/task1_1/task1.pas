PROGRAM CountWords;
USES ConstsUnit, StatisticWordsUnit; 
BEGIN {CountWords}
  ASSIGN(InFile, InputFile);
  ASSIGN(OutFile, StatisticFile);
  RESET(InFile);
  REWRITE(OutFile);
  StatisticWords(InFile, OutFile)
END. {CountWords}  
