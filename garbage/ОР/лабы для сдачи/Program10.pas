PROGRAM RunSarahRevere(INPUT, OUTPUT);

FUNCTION Initialition(Looking): BOOLEAN;
{Инициализация}
BEGIN {Initialition}
  Looking := NOT EOLN;
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';  
END; {Initialition}
  
PROCEDURE MoveWindow(VAR W1, W2, W3, W4: CHAR; VAR Looking: BOOLEAN; VAR InFile: TEXT);
{Движение окна}   
BEGIN {MoveWindow}
	  W1 := W2;         
	  W2 := W3;
  	  W3 := W4;
	  READ(InFile, W4);
      Looking := NOT EOLN;
END; {MoveWindow}

PROCEDURE CheckWindows(VAR W1, W2, W3, W4: CHAR; VAR Sea, Land: BOOLEAN); 						
{проверка окна на sea}
BEGIN
  {проверка окна на sea}
  Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a');
  {проверка окна на land}
  Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd')
END;
  
PROCEDURE WriteMessage(VAR Land, Sea: BOOLEAN; VAR OutFile: TEXT);
{Создание сообщения Sarah}
BEGIN {WriteMessage}
  IF Land
  THEN 
	WRITELN(OutFile, 'The British are coming by land')
  ELSE 
    IF Sea
	THEN 
	  WRITELN(OutFile, 'The British are coming by sea')
   ELSE 
     WRITELN(OutFile, 'Sarah didn''t say')
END; {WriteMessage}

PROCEDURE SarahRever(VAR InFile, OutFile: TEXT);
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN; 
BEGIN {SarahRever}
  {Инициализация}
  FUNCTION Initialition(W1, W2, W3, W4, Looking);  
  WHILE Looking AND NOT (Land OR Sea)   
  DO
    BEGIN              
      {Движение окна}     
      PROCEDURE MoveWindow(VAR W1, W2, W3, W4: CHAR);
      {Проверка окон}
      PROCEDURE CheckWindows(VAR W1, W2, W3, W4: CHAR);						
    END;
  {Создание сообщения Sarah}
  PROCEDURE WriteMessage(Land, Sea)
END; {SarahRever}

BEGIN  {RunSarahRevere}
  PROCEDURE SarahRevere(INPUT, OUTPUT)
END. {RunSarahRevere}
