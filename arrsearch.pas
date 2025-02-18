program ArrSearch;
uses SysUtils;

const size = 100;
var
   arr, keys :array of Integer; i, first, last, key : Integer; m:LongInt; outputFile: TextFile;

function GenerateRandomValue(): Integer;
    begin
        m := m + 1;
        GenerateRandomValue := Random(1001);
    end;

procedure BubbleSort(var arr: array of Integer; n: Integer);
    var
        i: Integer; j: Integer; temp: Integer;
    begin
        temp := 0;
        m := m + 1; 
        for i:= 0 to n-1 do 
            
            begin
                m := m + 1; 
                for j:= 0 to n - i - 2 do
                    
                    begin
                        m := m + 1;
                        if(arr[j] > arr[j + 1]) then 
                            begin
                                    temp := arr[j];
                                    m := m + 1;
                                    arr[j] := arr[j + 1];
                                    m := m + 1;
                                    arr[j + 1] := temp;
                                     
                            end;
                    end;
            end;
    end;

procedure linearsearch(var arr: array of Integer; key, i, size: Integer; var first, last: Integer);
    begin
        if i>=size then 
            begin
                m := m + 1;
                EXIT;
            end
        else if arr[i] = key then 
            begin
                if first = -1 then first := i;
                last := i;
                m := m + 1;
            end;
        LinearSearch(arr, key, i + 1, size, first, last);
    end;

procedure BinarySearch(var arr: array of Integer; key, low, high: Integer; var first, last: Integer);
    var 
        mid: Integer;
    begin
        m := m + 1;
        mid := low + (high - low) div 2;
        if(low > high) then Exit;

        if (arr[mid] = key) then 
            begin
                if first = -1 then first := mid;
                m := m + 1;
                last := mid;
                BinarySearch(arr, key, low, mid - 1, first, last);
                m := m + 1;
                BinarySearch(arr, key, mid + 1, high, first, last)
            end
        else if arr[mid] > key then
            BinarySearch(arr, key, low, mid - 1, first, last)         
        else
            BinarySearch(arr, key, mid + 1, high, first, last);
            
            


    end;

procedure PrintArray(Var arr: array of Integer; n: integer; var f: TextFile);
    var
        i: integer;
    begin
        m := m + 1;
        m := m + 1;
        writeln();
        for i := 0 to n-1 do
            begin
                write(f, arr[i], ' ');
                m := m + 1;
                writeln();
            end;
    end;


begin 
    Randomize;
    Assign(outputFile, 'arrsearch.txt');  
    Rewrite(outputFile);
    m := 0;
    Randomize;
    m := m + 1;
    SetLength(arr, size);
    SetLength(Keys, 10);
    m := m + 1;
    key := GenerateRandomValue;
    m := m + 1;
    first := -1;
    m := m + 1;
    last := -1;
    m := m + 1;
    
    for i := 0 to size - 1 do
        begin
            m := m + 1;
            arr[i] := GenerateRandomValue;
        end;
    for i := 0 to 9 do
        begin
            m := m + 1;
            Keys[i] := GenerateRandomValue;
        end;
    m := m + 1; 
    BubbleSort(arr, size);
    m := m + 1;
    Write(outputFile, 'Array: ');
    PrintArray(arr, size, outputFile);
    m := m + 1;
     for i := 0 to 9 do
    begin
        writeln(outputFile);
        Write(outputFile, 'Key: ', Keys[i]);
        writeln(outputFile);
        
        // Perform binary search
        BinarySearch(arr, Keys[i], 0, size - 1, first, last);
        
        if first <> -1 then
            writeln(outputFile, 'First occurrence: ', first, ', Last occurrence: ', last)
        else
            writeln(outputFile, 'Element not found.');
    end;

    // Write the number of operations to the output file
    writeln(outputFile, 'Number of operations: ', m);
    Close(outputFile);
end.