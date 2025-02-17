program InfiniteInteger;

uses SysUtils;

const 
  MAX_DIGITS = 256;

type
  TBigInt = record
    digits: array of Integer;  {hold digits of big number}
    length: Integer;           
  end;

procedure InitBigInt(var num: TBigInt);
begin
  num.length := 0;  
end;

procedure AppendDigit(var num: TBigInt; d: Integer);
begin
  SetLength(num.digits, num.length + 1);  
  num.digits[num.length] := d;            
  num.length := num.length + 1;          
end;

procedure GenerateBigInt(var num: TBigInt);
var
  i, d: Integer;
begin
  InitBigInt(num);  
  Randomize;

  d := Random(9) + 1;  {making sure first digit doesn't start at 0}
  AppendDigit(num, d);  

  for i := 2 to MAX_DIGITS do
  begin
    d := Random(10); 
    AppendDigit(num, d);
  end;
end;

procedure PrintBigInt(var num: TBigInt; var outputFile: Text);
var
  i: Integer;
begin
  for i := num.length - 1 downto 0 do
    Write(outputFile, num.digits[i]);
end;

function AddBigInts(a, b: TBigInt): TBigInt;
var
  sum: TBigInt;
  carry, digitSum: Integer;
  p1, p2: Integer;
begin
  InitBigInt(sum);  {sum}
  carry := 0;
  p1 := a.length - 1;  
  p2 := b.length - 1;  

  while (p1 >= 0) or (p2 >= 0) or (carry <> 0) do
  begin
    digitSum := carry;

    if p1 >= 0 then
    begin
      digitSum := digitSum + a.digits[p1];
      Dec(p1);
    end;

    if p2 >= 0 then
    begin
      digitSum := digitSum + b.digits[p2];
      Dec(p2);
    end;

    carry := digitSum div 10;
    AppendDigit(sum, digitSum mod 10);
  end;

  Exit(sum); 
end;

function ModuloBigInt(var num: TBigInt; divisor: Integer): Integer;
var
  i, remainder: Integer;
begin
  remainder := 0;
  for i := num.length - 1 downto 0 do
  begin
    remainder := (remainder * 10 + num.digits[i]) mod divisor;
  end;
  Exit(remainder);  
end;

function IsBigIntPrime(var num: TBigInt): Boolean; {Determining if n is prime}
var
  i: Integer;
begin
  if (num.length = 1) and (num.digits[0] = 1) then
  begin
    Exit(False);  
  end;

  for i := 2 to 50 do
  begin
    if ModuloBigInt(num, i) = 0 then
    begin
      Exit(False);  {Return False if divisible by i}
    end;
  end;

  Exit(True);  {Return True if prime}
end;

var
  x, y, sum, n: TBigInt;
  outputFile: Text;
begin
  GenerateBigInt(x);
  GenerateBigInt(y);
  GenerateBigInt(n);
  sum := AddBigInts(x, y);

  Assign(outputFile, 'infinteger.txt');
  Rewrite(outputFile);

  Write(outputFile, 'x = ');
  PrintBigInt(x, outputFile);
  WriteLn(outputFile);

  Write(outputFile, 'y = ');
  PrintBigInt(y, outputFile);
  WriteLn(outputFile);

  Write(outputFile, 'Sum = ');
  PrintBigInt(sum, outputFile);
  WriteLn(outputFile);

  Write(outputFile, 'n = ');
  PrintBigInt(n, outputFile);
  WriteLn(outputFile);

  Write(outputFile, 'n prime: ');
  if IsBigIntPrime(n) then
    WriteLn(outputFile, 'Y')
  else
    WriteLn(outputFile, 'N');

  Close(outputFile);
end.




