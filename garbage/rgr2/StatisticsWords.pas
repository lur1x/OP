UNIT StatisticsWords;

INTERFACE {INTERFACE}
  USES
    ReaderWords, SortedWords;
  PROCEDURE GetStatistics(VAR InputFile, OutputFile: TEXT);
  {���������� �� ����� ����� � ������� ������������� ������� ����� � �����}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
  CONST
    LimitWords = 1000000;

  VAR
    IsFirstPassege: BOOLEAN;                      
    CounterWords: INTEGER;
    TempFile1, TempFile2: TreeFile;
  PROCEDURE MergeAndSortStatistics(VAR Ptr: Tree; VAR FileNode: Node; VAR FileNodeReaded: BOOLEAN);
  {����������� ���������� � ����������� ��������� �����}
  VAR
    PtrPositionFound, PtrNodeInserted: BOOLEAN; 
  BEGIN
    IF Ptr <> NIL
    THEN
      BEGIN
        MergeAndSortStatistics(Ptr^.LLink, FileNode, FileNodeReaded);
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
        MergeAndSortStatistics(Ptr^.RLink, FileNode, FileNodeReaded)
      END
  END;

  PROCEDURE MergeStatisticsWithFile(VAR Root: Tree);
  {���������� ����������� ���������� � ������� �����������}
  VAR
    FileNode: Node;
    FileNodeReaded: BOOLEAN;
  BEGIN
    RESET(TempFile1);
    REWRITE(TempFile2);
    FileNodeReaded := FALSE;
    MergeAndSortStatistics(Root, FileNode, FileNodeReaded);
    {������� ������� �� ������� ����� �� ������}
    IF FileNodeReaded
    THEN
      WRITE(TempFile2, FileNode);
    WHILE NOT EOF(TempFile1)
    DO
      BEGIN
        READ(TempFile1, FileNode);
        WRITE(TempFile2, FileNode)
      END;
    {������� ������ �� ������� ����� � ������}
    RESET(TempFile2);
    REWRITE(TempFile1);
    WHILE NOT EOF(TempFile2)
    DO
      BEGIN
        READ(TempFile2, FileNode);
        WRITE(TempFile1, FileNode)
      END
  END;  


  PROCEDURE CopyStatisticsToFile(VAR Root: Tree; VAR FOut: TreeFile);
  {��������� ���������� � ��������������� ���� � ����}
  BEGIN
    IF Root <> NIL
    THEN
      BEGIN
        CopyStatisticsToFile(Root^.LLink, FOut);
        WRITE(FOut, Root^);
        CopyStatisticsToFile(Root^.RLink, FOut)
      END
  END;

  PROCEDURE ClearMemory(VAR Root: Tree);
  {����������� ������}
  BEGIN
    IF Root <> NIL
    THEN
      BEGIN
        ClearMemory(Root^.LLink);
        ClearMemory(Root^.RLink);
        DISPOSE(Root);
        Root := NIL
      END
  END;


  PROCEDURE TransStatistcs(VAR Root: Tree);
  {��������� ���������� �� ��������� ���� � ����������� ������}
  BEGIN 
    IF IsFirstPassege
    THEN
      BEGIN
        REWRITE(TempFile1);
        CopyStatisticsToFile(Root, TempFile1);
        IsFirstPassege := FALSE
      END
    ELSE
      MergeStatisticsWithFile(Root);
    ClearMemory(Root)
  END;

  PROCEDURE PrintStatistics(VAR FOut: TEXT);
  {������� ��������������� ����� � �� ������������� � ����}
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

  PROCEDURE GetStatistics(VAR InputFile, OutputFile: TEXT);
  {���������� �� ����� ����� � ������� ������������� ������� ����� � �����}
  VAR
    Word: STRING;
  BEGIN
    Word := '';
    WHILE NOT EOF(InputFile)
    DO
      BEGIN
        WHILE NOT EOLN(InputFile)
        DO
          BEGIN
            ReadWord(InputFile, Word);
            IF (Word <> '-') AND (Word <> '')
            THEN
              BEGIN
                Insert(Word);
                CounterWords := CounterWords + 1;
                IF CounterWords = LimitWords
                THEN
                  TransStatistcs(Root);
              END
          END;
        READLN(InputFile)
      END;
    TransStatistcs(Root);
    PrintStatistics(OutputFile)
  END;
{IMPLEMENTATION}

BEGIN {StatisticsWords}
  CounterWords := 0;
    IsFirstPassege := TRUE
END. {StatisticsWords}



