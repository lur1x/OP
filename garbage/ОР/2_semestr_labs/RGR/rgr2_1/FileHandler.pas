UNIT FileHandler;
{Модуль для работы с файлами}
INTERFACE
USES
  WordReader, TreeProcessing;

PROCEDURE PrintTreeFile(VAR FOut: TEXT);
PROCEDURE ClearTree(VAR Root: Tree);
PROCEDURE ProcessText(VAR Root: Tree);
PROCEDURE WriteStatistics;

IMPLEMENTATION
CONST
  MaxCounter = 1000000;
  FileNameInput = 'InpFile.txt';
  FileNameOutput = 'OutFile.txt';

TYPE
  TreeFile = FILE OF Node;

VAR
  WordsCounter: LONGINT;
  LimiterCounter: INTEGER;
  IsFirstTree: BOOLEAN;
  TempFile1, TempFile2: TreeFile;
  OutputFile, InputFile: TEXT;

PROCEDURE MergeRoutine(VAR Ptr: Tree; VAR FileNode: Node; VAR FileNodeReaded: BOOLEAN);
{Процесс объединения дерева с данными из файла в отсортированном виде}
VAR
  PtrPositionFound, PtrNodeInserted: BOOLEAN;
BEGIN
  IF Ptr <> NIL
  THEN
    BEGIN
      MergeRoutine(Ptr^.LLink, FileNode, FileNodeReaded);
      PtrPositionFound := FALSE;
      PtrNodeInserted := FALSE;
      WHILE (NOT PtrPositionFound) AND (NOT PtrNodeInserted) AND (NOT EOF(TempFile1))
      DO
        BEGIN
          IF NOT FileNodeReaded
          THEN
            READ(TempFile1, FileNode);   

          IF FileNode.Word < Ptr^.Word
          THEN
            BEGIN
              WRITE(TempFile2, FileNode);
              FileNodeReaded := FALSE
            END
          ELSE
            IF FileNode.Word = Ptr^.Word
            THEN
              BEGIN
                FileNode.Counter := FileNode.Counter + Ptr^.Counter;
                WRITE(TempFile2, FileNode);
                PtrNodeInserted := TRUE;
                FileNodeReaded := FALSE
              END
            ELSE
              BEGIN
                PtrPositionFound := TRUE;
                FileNodeReaded := TRUE
              END
        END;
      IF NOT PtrNodeInserted
      THEN
        WRITE(TempFile2, Ptr^);
      MergeRoutine(Ptr^.RLink, FileNode, FileNodeReaded)
    END
END;

PROCEDURE MergeTreeWithFile(VAR Root: Tree);
{Объединение дерева с файлом}
VAR
  FileNode: Node;
  FileNodeReaded: BOOLEAN;
BEGIN
  RESET(TempFile1);
  REWRITE(TempFile2);
  FileNodeReaded := FALSE;
  MergeRoutine(Root, FileNode, FileNodeReaded);
  // Перенос остатка из первого файла во второй
  IF FileNodeReaded
  THEN
    WRITE(TempFile2, FileNode);
  WHILE NOT EOF(TempFile1)
  DO
    BEGIN
      READ(TempFile1, FileNode);
      WRITE(TempFile2, FileNode)
    END;
  // Перенос данных из второго файла в первый
  RESET(TempFile2);
  REWRITE(TempFile1);
  WHILE NOT EOF(TempFile2)
  DO
    BEGIN
      READ(TempFile2, FileNode);
      WRITE(TempFile1, FileNode)
    END
END;  


PROCEDURE ProcessText(VAR Root: Tree);
{Обработка входного текста}
VAR
  NewWord: STRING;
BEGIN
  NewWord := '';
  Root := NIL;
  ASSIGN(InputFile, FileNameInput);
  RESET(InputFile);
  WHILE NOT EOF(InputFile)
  DO
    BEGIN
      WHILE NOT EOLN(InputFile)
      DO
        BEGIN
          WordCreater(InputFile, NewWord);
          IF (NewWord <> '-') AND (NewWord <> '')
          THEN
            BEGIN
              Insert(Root, NewWord);
              LimiterCounter := LimiterCounter + 1;
              WordsCounter := WordsCounter + 1;
              IF LimiterCounter = MaxCounter
              THEN
                BEGIN
                  ClearTree(Root);
                  LimiterCounter := 0
                END
            END
        END;
      READLN(InputFile)
    END;
  ClearTree(Root)
END;

PROCEDURE CopyTreeToFile(VAR Root: Tree; VAR FOut: TreeFile);
{Переносит дерево во временный файл в отсортированном виде}
BEGIN
  IF Root <> NIL
  THEN
    BEGIN
      CopyTreeToFile(Root^.LLink, FOut);
      WRITE(FOut, Root^);
      CopyTreeToFile(Root^.RLink, FOut)
    END
END;

PROCEDURE ClearTree(VAR Root: Tree);
{Очистка дерева с переносом данных во временный файл}
BEGIN
    IF IsFirstTree
    THEN
      BEGIN
        REWRITE(TempFile1);
        CopyTreeToFile(Root, TempFile1);
        IsFirstTree := FALSE
      END
    ELSE
      MergeTreeWithFile(Root);
  DestroyTree(Root)
END;

PROCEDURE PrintTreeFile(VAR FOut: TEXT);
{Вывод отсортированных данных в файл}
VAR
  FileNode: Node;
BEGIN
  RESET(TempFile1);
  WHILE NOT EOF(TempFile1)
  DO
    BEGIN
      READ(TempFile1, FileNode);
      WRITELN(FOut, FileNode.Word, ' ', FileNode.Counter)
    END
END;

PROCEDURE WriteStatistics;
{Вывод обработанной статистики}
BEGIN
  ASSIGN(OutputFile, FileNameOutput);
  REWRITE(OutputFile);
  WRITELN(OutputFile, 'Count words are: ', WordsCounter);
  PrintTreeFile(OutputFile)
END;

BEGIN
  IsFirstTree := TRUE;
  WordsCounter := 0;
  LimiterCounter := 0
END.



