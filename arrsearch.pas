program ArrSearch;
uses SysUtils;

const size = 8000;
var
   arr :array of Integer; i, first, last, key : Integer; m:LongInt;

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
                    m := m + 1;
                    begin
                         
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

procedure PrintArray(Var arr: array of Integer; n: integer);
    var
        i: integer;
    begin
        m := m + 1;
        write('Current Array: ');
        m := m + 1;
        writeln();
        for i := 0 to n-1 do
            begin
                write(arr[i], ' ');
                m := m + 1;
                writeln();
            end;
    end;


begin 
    m := 0;
    Randomize;
    m := m + 1;
    SetLength(arr, size);
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
    m := m + 1; 
    BubbleSort(arr, size);
    m := m + 1;
    PrintArray(arr, size);
    m := m + 1;
    Writeln('Key: ', key);
    m := m + 1;
    BinarySearch(arr, key, 0, size-1, first, last);
    if first <> -1 then
        begin
            m := m + 1;
            writeln('First occurrence: ', first, ', Last occurrence: ', last)
        end
    else
        m := m + 1;
        writeln('Element not found.');
    m := m + 1;
    writeln('Number of operations: ', m)
end.