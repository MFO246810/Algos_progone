program InfiniteInteger;
uses sysutils;

const 
    Max_Digits = 256;

type 
    Big_Int = record
        values: array of Integer;
        capacity: Integer;
        length: Integer;
    end;

var 
    x, y, n, total: Big_Int; 

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
        val, i: Integer; 
    begin 
        for i := 0 to Max_Digits - 1 do 
            begin
                val := GenerateRandomValue;
                num.values[num.length] := val;
                num.length := num.length + 1;
            end;
    end;

function BigIntToInteger(var num: Big_Int): Integer;
    var
        i, result: Integer;
    begin
        result := 0;
        for i := 0 to num.length - 1 do
            begin
                result := result * 10 + num.values[i];  { Assuming least significant digit first }
            end;
        BigIntToInteger := result;
    end;

procedure AddDigit(var num: Big_Int; val: Integer);
    begin 
        num.values[num.length] := val;
        num.length := num.length + 1;
    end;

procedure PrintBig_Int(var num: Big_Int; title: string);
    var 
        i: Integer;
    begin
        write(title);
        for i := 0 to num.length - 1 do
            write(num.values[i]);
        writeln;
    end;

function Add(var x, y: Big_Int): Big_Int;
    var 
        sum: Big_Int;
        carry, digitSum: Integer;
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

function ModuloBigInt(var num: Big_Int; divisor: Integer): Integer;
    var
        i, remainder: Integer;
    begin
        remainder := 0;
        for i := 0 to num.length - 1  do
            begin
            remainder := (remainder * 10 + num.values[i]) mod divisor;
            end;
        Exit(remainder);  
    end;

function FastIsPrime(var n: Big_Int): Boolean;
    var
        i, res: Integer;
    begin
        res := BigIntToInteger(n);
        if res <= 1 then
            Exit(False);  

        for i := 2 to Trunc(Sqrt(res)) do
            begin
                if ModuloBigInt(n, i) = 0 then
                    begin
                        Exit(False);  
                    end;
            end;
            Exit(True);
    end;

function SlowIsPrime(var n: Big_Int): Boolean;
    var
        i, res: Integer;
    begin
        res := BigIntToInteger(n);
        if res <= 1 then
            Exit(False);  

        for i := 2 to res-1 do
            begin
                if ModuloBigInt(n, i) = 0 then
                    begin
                        Exit(False);  
                    end;
            end;
            Exit(True);
    end;

begin
    Randomize;
    Initalize(n, Max_Digits);
    Initalize(x, Max_Digits);
    Initalize(y, Max_Digits);
    AppendToBigInt(x);
    AppendToBigInt(y);
    AppendToBigInt(n);
    total := Add(x, y);
    
    PrintBig_Int(x, 'X: ');
    PrintBig_Int(y, 'Y: ');
    PrintBig_Int(n, 'n: ');

    if FastIsPrime(n) then 
    begin
        write('This number is prime: ');
        PrintBig_Int(n, 'n: ');
    end
    else 
    begin
        write('This number is not prime: ');
        PrintBig_Int(n, 'n: ');
    end;

    PrintBig_Int(total, 'Total: ');
end.
