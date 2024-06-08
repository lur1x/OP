PROGRAM CounterWords(INPUT, OUTPUT);
{Программа подсчитывает ОГРАНИЧЕННОЕ кол-во слов, встречаемых в исходном файле по пути InputFileName}
{и выводит статистику в файл по пути OutputFileName.}
{Стандартное ограничение обработки - 250 слов(~1s); (500 - ~1.15s; 1000 - ~2s)}
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
