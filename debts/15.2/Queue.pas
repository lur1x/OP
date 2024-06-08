UNIT Queue;

INTERFACE

PROCEDURE EmptyQ; {Инициализация}
PROCEDURE AddQ(VAR Elt: CHAR); {Добавить элемент в конец строки}   {лишний пробел перед :}
PROCEDURE DelQ; {Удалить элемент из строки}
PROCEDURE HeadQ(VAR Elt: CHAR); {Получить первый символ из строки}
PROCEDURE WriteQ; {Вывод строки}

IMPLEMENTATION

VAR
  Q, TEMP: TEXT;
PROCEDURE CopyOpen(VAR F1, F2: TEXT);
{Копирует строку из F1 в F2 без RESET или REWRITE;
таким образом F1 должен быть готов для чтения,а F2 для записи,
но прошлые строки у этих файлов могут быть не пусты }
VAR
  Ch: CHAR;
BEGIN {CopyOpen}
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END
END; {CopyOpen}
PROCEDURE EmptyQ; {Q := <, /, R>}
BEGIN {EmptyQ}
  REWRITE(Q);
  WRITELN(Q);
  RESET(Q)
END; {EmptyQ}
PROCEDURE AddQ(VAR Elt: CHAR); {Q = <, x/, R>, где x строка И Elt = a --> Q = <, xa/, R> }
VAR
  Temp: TEXT;
BEGIN {AddQ}
  REWRITE(Temp);
  CopyOpen(Q, Temp);
  WRITELN(Temp, Elt);
  RESET(Temp);
  REWRITE(Q);
  CopyOpen(Temp, Q);
  WRITELN(Q);
  RESET(Q)
END; {AddQ}
PROCEDURE DelQ; {(Q = <, /, R> -->)|(Q = <, ax/, R>, где a символ и x строка  --> Q := <, x/, R> }
VAR
  Ch: CHAR;
BEGIN {DelQ}
  {Удаляем первый элемент из Q};   {добавил пробелы перед комментарием}
  READ(Q, Ch);
  IF NOT EOF(Q)
  THEN {Не пустой}
    BEGIN
      REWRITE(Temp);
      CopyOpen(Q, Temp);
      WRITELN(Temp);
      {Копируем Temp в Q}
      RESET(Temp);
      REWRITE(Q);
      CopyOpen(Temp, Q);
      WRITELN(Q)
    END;
  RESET(Q)
END; {DelQ}
PROCEDURE HeadQ(VAR Elt: CHAR); {(Q = <, /, R> --> Elt := '#')| (Q = <, ax/, R>, где a символ и x строка  --> Elt := 'a' }
BEGIN {HeadQ}    {Лишний пробел перед комментарием}
  IF NOT EOLN(Q) 
  THEN
    READ(Q, Elt)
  ELSE
    Elt := '#';
  RESET(Q)
END; {HeadQ}
PROCEDURE WriteQ; { (Q = <, x/, R> и OUTPUT = <y, W>, где y и x строка  --> OUTPUT := <y&x/, W> }
BEGIN {WriteQ}
  CopyOpen(Q, OUTPUT);
  WRITELN(OUTPUT);
  RESET(Q)
END; {WriteQ}
BEGIN {Queue}
END. {Queue}

