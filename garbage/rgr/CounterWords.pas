PROGRAM CounterWords(INPUT, OUTPUT);
{��������� ������������ ������������ ���-�� ����, ����������� � �������� ����� �� ���� InputFileName}
{� ������� ���������� � ���� �� ���� OutputFileName.}
{����������� ����������� ��������� - 250 ����(~1s); (500 - ~1.15s; 1000 - ~2s)}
USES
  WordsManager;
CONST
  InputFileName = 'input.txt';
  OutputFileName = 'output.txt';
VAR
  IFile, OFile: TEXT;
BEGIN {ReadingWords}                                                    
  ASSIGN(IFile, InputFileName);
  ASSIGN(OFile, OutputFileName);
  RESET(IFile);
  REWRITE(OFile);
  StartCounting(IFile, OFile);
  WRITELN('complete')
END. {ReadWord}
