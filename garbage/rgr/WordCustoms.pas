UNIT WordCustoms;     {WordsProcessor}
{Модуль, предназначенный для совершения манипуляций со словами: сравнение, приведение к нижнему регистру}


INTERFACE


PROCEDURE IsLetter(VAR Symb: CHAR; VAR F: BOOLEAN);
PROCEDURE CompareWords(VAR Ans: BOOLEAN; W1, W2: STRING);


IMPLEMENTATION


CONST
  LetterRange = 32; {в ascii разница м/у одинаковыми буквами разного регистра = 32(за искл. ё/Ё)}

PROCEDURE CompareWords(VAR Ans: BOOLEAN; W1, W2: STRING);
{Сравнивает две строки, с учётом особенности буквы "ё" в ascii}
VAR
  I: INTEGER;
BEGIN {CompareWords}
  FOR I := 1 TO LENGTH(W1)
  DO
    IF W1[I] = 'ё'
    THEN
      W1[I] := 'е';
  FOR I := 1 TO LENGTH(W2)
  DO
    IF W2[I] = 'ё'
    THEN
      W2[I] := 'е';
  IF W1 >= W2
  THEN
    Ans := TRUE
END; {CompareWords}

PROCEDURE IsLetter(VAR Symb: CHAR; VAR F: BOOLEAN);
{Проверяет, является ли переданный символ - буквой(дефисом), приводит её в нижний регистр}
BEGIN {IsLetter}
  F := FALSE;
  IF Symb IN ['A' .. 'Z', 'А' .. 'Я', 'Ё']
  THEN
    BEGIN
      IF Symb in ['Ё']  {ascii 'Ё' = 240; ascii 'ё' = 241}
      THEN
        BEGIN
          Symb := 'ё'; 
          F := TRUE
        END
      ELSE
        BEGIN
          Symb := CHR(ORD(Symb) + LetterRange); {дистанция м/у одинаковыми буквами в ascii = LetterRange = 32} 
          F := TRUE
        END
    END
  ELSE
    IF Symb IN ['-', 'a' .. 'z', 'а' .. 'я', 'ё']
    THEN
      F := TRUE  
END; {IsLetter}

BEGIN {WordCustoms}
END. {WordCustoms}
