UNIT WordsManager;
{������, ����������� ������� ��������� ����}


INTERFACE


USES
  ContainerManagment;
PROCEDURE StartCounting(VAR IFile: TEXT; VAR OFile: TEXT);


IMPLEMENTATION


USES
  WordCustoms;

PROCEDURE WordControl(VAR Str: STRING);
{������������ ��������� �����, ����������� ��� � ��������� �� ������ ContainerManagment}
VAR
  TFlag: BOOLEAN; 
BEGIN {WordControl}
  TFlag := FALSE;
  IF (Str <> '') AND ((Str <> '-') OR (Str <> '- ')) {��������� ������� �������� � ����� "����"}
  THEN
    BEGIN
      AddAndFindItem(Str, TFlag);
      //FindWord(Root, Str, TFlag);     {���������� �� findword, ����������� ������� ����� � additem}
      //IF NOT(TFlag)
      //THEN
        //AddItem(Root, Str, Limit)
    END;
  Str := ''
END; {WordControl}

PROCEDURE StartCounting(VAR IFile: TEXT; VAR OFile: TEXT);
{��������� ������� ��������� ���� � ��������� ���}
VAR
  Flag: BOOLEAN;
  Ch: CHAR;
  Str: STRING;
BEGIN {StartCounting}
  Flag := FALSE;
  Str := '';
  WHILE NOT EOF(IFile)
  DO
    BEGIN
      WHILE NOT EOLN(IFile)
      DO
        BEGIN
          READ(IFile, Ch);
          IsLetter(Ch, Flag);
          IF Flag
          THEN
            Str := Str + Ch {���������� ������, ��� ������������ ��������� ��� ������������������ �������� - �������� �����}
          ELSE
            WordControl(Str)
        END;
      WordControl(Str); {������������ ������ ����� ������: �����, ���������� � ����� ������ - ����� �����}
      READLN(IFile)
    END;
  PrintContainer(OFile)
END; {StartCounting}

BEGIN {WordsManager}
END. {WordsManager}
