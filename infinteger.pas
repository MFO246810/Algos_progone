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
    x, y, n, total: Big_Int; m: LongInt; outputFile: TextFile;

procedure Initalize(var num: Big_Int; size: Integer);
    begin
        m := m + 1;
        SetLength(num.values, size);  
        m := m + 1;
        num.length := 0; 
        m := m + 1;   
        num.capacity := Max_Digits;      
    end;

function GenerateRandomValue(): Integer;
    begin
        GenerateRandomValue := Random(9);
        m := m + 1;
    end;

procedure AppendToBigInt(var num: Big_Int);
    var 
        val, i: Integer; 
    begin 
        for i := 0 to Max_Digits - 1 do 
            begin
                val := GenerateRandomValue;
                m := m + 1; 
                num.values[num.length] := val;
                m := m + 1; 
                num.length := num.length + 1;
                m := m + 1; 
            end;
    end;

function BigIntToInteger(var num: Big_Int): Integer;
    var
        i, result: Integer;
    begin
        m := m + 1; 
        result := 0;
        for i := 0 to num.length - 1 do
            begin
                m := m + 1; 
                result := result * 10 + num.values[i];  { Assuming least significant digit first }
            end;
        m := m + 1; 
        BigIntToInteger := result;
    end;

procedure AddDigit(var num: Big_Int; val: Integer);
    begin
        m := m + 1; 
        num.values[num.length] := val;
        m := m + 1; 
        num.length := num.length + 1;
    end;

procedure PrintBig_Int(var num: Big_Int; title: string; var f: TextFile);
    var 
        i: Integer;
    begin
        m := m + 1; 
        write(f, title);
        for i := 0 to num.length - 1 do
             
            write(f, num.values[i]);
        m := m + 1; 
        writeln;
    end;

function Add(var x, y: Big_Int): Big_Int;
    var 
        sum: Big_Int;
        carry, digitSum: Integer;
        p1, p2: Integer;
    begin 
       
        Initalize(sum, Max_Digits);
        m := m + 1; 
        carry := 0;
        m := m + 1; 
        p1 := x.length - 1;  
        m := m + 1; 
        p2 := y.length - 1; 
         m := m + 1; 

        while (p1 >= 0) or (p2 >= 0) or (carry <> 0) do
            begin
                m := m + 1; 
                digitSum := carry;

                if p1 >= 0 then
                    begin
                        m := m + 1; 
                        digitSum := digitSum + x.values[p1];
                        m := m + 1; 
                        Dec(p1);
                    end;

                if p2 >= 0 then
                    begin
                        m := m + 1; 
                        digitSum := digitSum + y.values[p2];
                        m := m + 1; 
                        Dec(p2);
                    end;
                m := m + 1; 
                carry := digitSum div 10;
                m := m + 1; 
                AddDigit(sum, digitSum mod 10);
            end;
    m := m + 1; 
    Exit(sum); 
    end;

function ModuloBigInt(var num: Big_Int; divisor: Integer): Integer;
    var
        i, remainder: Integer;
    begin
        m := m + 1; 
        remainder := 0;
        for i := 0 to num.length - 1  do
            begin
            m := m + 1; 
            remainder := (remainder * 10 + num.values[i]) mod divisor;
            end;
        m := m + 1; 
        Exit(remainder);  
    end;

function FastIsPrime(var n: Big_Int): Boolean;
    var
        i, res: Integer;
    begin
        m := m + 1; 
        res := BigIntToInteger(n);
        if res <= 1 then
            Exit(False);  

        for i := 2 to Trunc(Sqrt(res)) do
            begin
                m := m + 1; 
                if ModuloBigInt(n, i) = 0 then
                    begin
                        m := m + 1; 
                        Exit(False);  
                    end;
            end;
            m := m + 1; 
            Exit(True);
    end;

function SlowIsPrime(var n: Big_Int): Boolean;
    var
        i, res: Integer;
    begin
        m := m + 1; 
        res := BigIntToInteger(n);
        if res <= 1 then
            Exit(False);  

        for i := 2 to res-1 do
            begin
                m := m + 1; 
                if ModuloBigInt(n, i) = 0 then
                    begin
                        m := m + 1; 
                        Exit(False);  
                    end;
            end;
            m := m + 1; 
            Exit(True);
    end;

begin
    Assign(outputFile, 'infinteger.txt');  
    Rewrite(outputFile);
    m := 0;
    Randomize;
    m := m + 1; 
    Initalize(n, Max_Digits);
    m := m + 1; 
    Initalize(x, Max_Digits);
    m := m + 1; 
    Initalize(y, Max_Digits);
    m := m + 1; 
    AppendToBigInt(x);
    m := m + 1; 
    AppendToBigInt(y);
    m := m + 1; 
    AppendToBigInt(n);
    m := m + 1; 
    total := Add(x, y);
    m := m + 1; 
    
    PrintBig_Int(x, 'X: ', outputFile);
    m := m + 1; 
    writeln(outputFile);
    PrintBig_Int(y, 'Y: ', outputFile);
    writeln(outputFile);
    m := m + 1; 

    if FastIsPrime(n) then 
    begin
        m := m + 1; 
        writeln(outputFile);
        write(outputFile, 'This number is prime: ');
        m := m + 1; 
        PrintBig_Int(n, 'n: ', outputFile);
    end
    else 
    begin
        m := m + 1; 
        writeln(outputFile);
        write(outputFile, 'This number is not prime: ');
        m := m + 1; 
        PrintBig_Int(n, 'n: ', outputFile);
    end;

     m := m + 1; 
    writeln(outputFile);
    PrintBig_Int(total, 'Total: ', outputFile);
    writeln(outputFile, 'Number of operations: ', m)
    
end.
