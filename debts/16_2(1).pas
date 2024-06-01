PROGRAM RunSarahRever(INPUT, OUTPUT);

PROCEDURE Initilize(VAR W1, W2, W3, W4: CHAR);
{Инициализация}
BEGIN {Initilize}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' '  
END; {Initilize}

PROCEDURE MoveWindows(VAR W1, W2, W3, W4: CHAR; VAR InFile: TEXT);
{Двигать окна}
BEGIN {MoveWindows}
  W1 := W2;         
  W2 := W3;
  W3 := W4;
  READ(InFile, W4)
END; {MoveWindows}

PROCEDURE CheckEoln(VAR Looking: BOOLEAN; VAR InFile: TEXT);
{Проверка на конец строки}
BEGIN {CheckEoln}
  Looking := NOT EOLN(InFile)
END; {CheckEoln}

PROCEDURE CheckWindows(VAR Land, Sea: BOOLEAN; VAR W1, W2, W3, W4: CHAR);
{Проверка окна}
BEGIN {CheckWindows}
  {проверка на sea}
  Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a');
  {проверка на land}
  Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd')
END; {CheckWindows}

PROCEDURE WriteMessage(VAR Land, Sea: BOOLEAN; VAR OutFile: TEXT);
{Напечатать сообщение}
BEGIN {WriteMessage}
  IF Land
  THEN 
	WRITELN(OutFile, 'The British are coming by land.')
  ELSE 
    IF Sea
	THEN 
	  WRITELN(OutFile, 'The British are coming by sea.')
    ELSE 
      WRITELN(OutFile, 'Sarah didn''t say.')
END;{WriteMessage}

PROCEDURE SarahRever(VAR InFile, OutFile: TEXT);
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN; 
BEGIN {SarahRever}
  CheckEoln(Looking, InFile);
  Initilize(W1, W2, W3, W4);    
  WHILE Looking AND (NOT (Land OR Sea))   
  DO
    BEGIN                  
      MoveWindows(W1, W2, W3, W4, InFile);
      CheckEoln(Looking, InFile);					
      CheckWindows(Land, Sea, W1, W2, W3, W4)
    END;
  WriteMessage(Land, Sea, OutFile)
END; {SarahRever}

BEGIN {RunSarahRever}
  SarahRever(INPUT, OUTPUT)
END. {RunSarahRever}
