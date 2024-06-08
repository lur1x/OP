UNIT SortedWords;

INTERFACE  {INTERFACE}
  TYPE
    Tree = ^Node;
    Node = RECORD
             Word: STRING;
             LLink, RLink: Tree;
             Counter: INTEGER
           END;
    TreeFile = FILE OF Node; 
  PROCEDURE Insert(VAR Data: STRING); 
  PROCEDURE TransStatistics;
  PROCEDURE PrintStatistics(VAR FOut: TEXT);
  {��������� ����� � ���������� �����, ��� ����� ��������� ���� �����}
{INTERFACE}

IMPLEMENTATION {IMPLEMENTATION}
  VAR
    IsFirstPassege: BOOLEAN;
    TempFile1, TempFile2: TreeFile;
    Root: Tree; 
  PROCEDURE CompareWords(VAR Str1, Str2: STRING; VAR IsBigger: INTEGER);
  {�������� ����� �����������}
  VAR
    I: INTEGER;
    Ch1, Ch2: CHAR;
  BEGIN
    IsBigger := 0;
    I := 1;
    WHILE (IsBigger = 0) AND (I <= Length(Str1)) AND (I <= Length(Str2)) 
    DO
      BEGIN
        Ch1 := Str1[I];
        Ch2 := Str2[I];
        IF (Ch1 <> Ch2)
        THEN
          IF ((Ch1 = '�') AND ('a' <= Ch2) AND (Ch2 <= '�'))
          THEN
            IsBigger := 1
          ELSE 
            IF ((Ch2 = '�') AND ('a' <= Ch1) AND (Ch1 <= '�')) 
            THEN
              IsBigger := 2
            ELSE
              IF Ch1 < Ch2
              THEN
                IsBigger := 2
              ELSE
                IF Ch1 > Ch2
                THEN
                  IsBigger := 1;  
        I := I + 1
      END;
    IF IsBigger = 0
    THEN
      BEGIN
        IF Length(Str1) < Length(Str2)
        THEN
          IsBigger := 2;
        IF Length(Str1) > Length(Str2)
        THEN
          IsBigger := 1  
      END;
  END;    
   
  PROCEDURE Insert(VAR Data: STRING);           
  PROCEDURE Ins(VAR Ptr: Tree; VAR Data: STRING);  
  {��������� ����� � ���������� �����, ��� ����� ��������� ���� �����}
  VAR
    IsBigger: INTEGER;
    Str1, Str2: STRING;
  BEGIN {Ins}
    IF Ptr = NIL
    THEN
      BEGIN
        NEW(Ptr);
        Ptr^.Word := Data;
        Ptr^.Counter := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL
      END
    ELSE
      BEGIN 
        Str1 := Data;
        Str2 := Ptr^.Word;
        CompareWords(Str1, Str2, IsBigger);
        IF IsBigger = 1
        THEN
          Ins(Ptr^.RLink, Data) 
        ELSE
          IF IsBigger = 2
          THEN 
            Ins(Ptr^.LLink, Data)
          ELSE
            Ptr^.Counter := Ptr^.Counter + 1 
      END
  END; {Ins}
  BEGIN {Insert}
    Ins(Root, Data); 
  END; {Insert}
  
  PROCEDURE MergeAndSortStatistics(VAR Ptr: Tree; VAR FileNode: Node; VAR FileNodeReaded: BOOLEAN);
  {����������� ���������� � ����������� ��������� �����}
  VAR
    PtrPositionFound, PtrNodeInserted: BOOLEAN; 
    Str1, Str2: STRING;
    IsBigger: INTEGER;
  BEGIN {MergeAndSortStatistics}
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
            Str1 := FileNode.Word;
            Str2 := Ptr^.Word;
            CompareWords(Str1, Str2, IsBigger); 
            IF IsBigger = 1
            THEN
              BEGIN
                WRITE(TempFile2, FileNode);
                FileNodeReaded := FALSE
              END
            ELSE
              IF IsBigger = 0
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
  END; {MergeAndSortStatistics}

  PROCEDURE MergeStatisticsWithFile(VAR Root: Tree);
  {���������� ����������� ���������� � ������� �����������}
  VAR
    FileNode: Node;
    FileNodeReaded: BOOLEAN;
  BEGIN {MergeStatisticsWithFile}
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
  END; {MergeStatisticsWithFile} 


  PROCEDURE CopyStatisticsToFile(VAR Root: Tree; VAR FOut: TreeFile);
  {��������� ���������� � ��������������� ���� � ����}
  BEGIN {CopyStatisticsToFile}
    IF Root <> NIL
    THEN
      BEGIN
        CopyStatisticsToFile(Root^.LLink, FOut);
        WRITE(FOut, Root^);
        CopyStatisticsToFile(Root^.RLink, FOut)
      END
  END; {CopyStatisticsToFile}

  PROCEDURE ClearMemory(VAR Root: Tree);
  {����������� ������}
  BEGIN {ClearMemory}
    IF Root <> NIL
    THEN
      BEGIN
        ClearMemory(Root^.LLink);
        ClearMemory(Root^.RLink);
        DISPOSE(Root);
        Root := NIL
      END
  END; {ClearMemory}

  PROCEDURE TransStatistics;
  PROCEDURE TransStat(VAR Root: Tree);
  {��������� ���������� �� ��������� ���� � ����������� ������}
  BEGIN {TransStat}
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
  END; {TransStat}
  BEGIN{TransStatistics}
    TransStat(Root)
  END; {TransStatistics}

  PROCEDURE PrintStatistics(VAR FOut: TEXT);
  {������� ��������������� ����� � �� ������������� � ����}
  VAR
    FileNode: Node;
  BEGIN {PrintStatistics}
    RESET(TempFile1);
    WHILE NOT EOF(TempFile1)
     DO
      BEGIN
        READ(TempFile1, FileNode);
        WRITELN(FOut, FileNode.Word, ' ', FileNode.Counter)
      END;
    writeln(FOut, 'complete')
  END; {PrintStatistics}
     
{IMPLEMENTATION}

BEGIN{SortedWords} 
  IsFirstPassege := TRUE
END. {SortedWords}
