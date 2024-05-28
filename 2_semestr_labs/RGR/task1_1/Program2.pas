PROGRAM CountWords;
CONST
  In
TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;
           Counter: INTEGER;
           LLink, RLink: Tree
         END;
VAR
  WordTemp: STRING;
  InFile, OutFile: TEXT;
  Root: Tree;
 
BEGIN {CountWords}
  ASSIGN(InFile, 'INPUT1.TXT');
  ASSIGN(OutFile, 'OUTPUT.TXT');
  RESET(InFile);
  REWRITE(OutFile);
  GetStattics(InFile)
  PrintTree(OutFile, Root)
END. {CountWords}  
