program InfiniteInteger;
uses sysutils;

const 
    Max_Digits = 256;

type Big_Int = record
    values:array of Integer;
    capacity: Integer;
    length: Integer;
end;

var 
    x, y, total : Big_Int; 

procedure Initalize(var num: Big_Int; size: Integer);
    begin
        SetLength(num.values, size);  
        num.length := 0;    
        num.capacity := Max_Digits;       
    end;
function GenerateRandomValue(): Integer;
    begin
        GenerateRandomValue := Random(9);
    end;
procedure AppendToBigInt(var num: Big_Int);
    var 
        val, i :Integer; 
    begin 
        for i:= 0 to Max_Digits - 1 do 
            Begin
                val := GenerateRandomValue;
                num.values[num.length] := val;
                num.length := num.length + 1;
            end;
    end;
procedure AddDigit (var num: Big_Int; val : Integer);
    begin 
        num.values[num.length] := val;
        num.length := num.length + 1;
    end;

procedure PrintBig_Int(var num: Big_Int; title: string);
    var 
        i : Integer;
    begin
        write(title);
        for i:=0 to Max_Digits - 1 do
            write(num.values[i])
    end;

function Add(var x, y: Big_Int): Big_Int;
    var 
        sum: Big_Int;
        carry, digitsum: Integer;
        p1, p2: Integer;
    begin 
        Initalize(sum, Max_Digits);
        carry := 0;
        p1 := x.length - 1;  
        p2 := y.length - 1; 

        while (p1 >= 0) or (p2 >= 0) or (carry <> 0) do
            begin
                digitSum := carry;

                if p1 >= 0 then
                    begin
                        digitSum := digitSum + x.values[p1];
                        Dec(p1);
                    end;

                if p2 >= 0 then
                    begin
                        digitSum := digitSum + y.values[p2];
                        Dec(p2);
                    end;

                carry := digitSum div 10;
                AddDigit(sum, digitSum mod 10);
            end;
        Exit(sum); 
    end;

function ModuloBigInt(var num: TBigInt; divisor: Integer): Integer;
var
  i, remainder: Integer;
begin
  remainder := 0;
  for i := 0 to num.length - 1  do
  begin
    remainder := (remainder * 10 + num.digits[i]) mod divisor;
  end;
  Exit(remainder);  
end;

function IsPrime(var n: Big_Int): Boolean;
    var

    begin

    end;

begin
    Randomize;

    Initalize(x, Max_Digits);
    Initalize(y, Max_Digits);
    AppendToBigInt(x);
    AppendToBigInt(y);
    total := Add(x, y);
    PrintBig_Int(x, 'X: ');
    writeln();
    PrintBig_Int(y, 'Y: ');
    writeln();
    PrintBig_Int(total, 'Total: ');
end.