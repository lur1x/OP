PROGRAM CountSimbols(INPUT, OUTPUT);
VAR
  Thousend, X100, X10, X1: CHAR;
USES Count3;
BEGIN{CountSimbols}
  Thousend := '0';
  Start;
  Value(X100, X10, X1);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(X1);
      Bump(Thousend);
      Value(X100, X10, X1)  
    END;
  IF Thousend = '0'
  THEN
    WRITELN('���������� ��������: ', X100, X10, X1)
  ELSE
    WRITELN('������� ����������')    
END.{CountSimbols}
