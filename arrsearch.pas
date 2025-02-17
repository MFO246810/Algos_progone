program ArrSearch;
uses SysUtils;

const size = 10;
var
   arr :array of Integer; i, first, last, key: Integer;

function GenerateRandomValue(): Integer;
    begin
        GenerateRandomValue := Random(1001);
    end;

procedure BubbleSort(var arr: array of Integer; n: Integer);
    var
        i: Integer; j: Integer; temp: Integer;
    begin
        temp := 0;
         
        for i:= 0 to n-1 do 
            
            begin
                 
                for j:= 0 to n - i - 2 do
                    
                    begin
                         
                        if(arr[j] > arr[j + 1]) then 
                            begin
                                    temp := arr[j];
                                    arr[j] := arr[j + 1];
                                    arr[j + 1] := temp;
                                     
                            end;
                    end;
            end;
    end;

procedure linearsearch(var arr: array of Integer; key, i, size: Integer; var first, last: Integer);
    begin
        if i>=size then 
            EXIT
        else if arr[i] = key then 
            begin
                if first = -1 then first := i;
                last := i;
            end;
        LinearSearch(arr, key, i + 1, size, first, last);
    end;

procedure BinarySearch(var arr: array of Integer; key, low, high: Integer; var first, last: Integer);
    var 
        mid: Integer;
    begin
        mid := low + (high - low) div 2;
        if(low > high) then Exit;

        if (arr[mid] = key) then 
            begin
                if first = -1 then first := mid;
                last := mid;
                BinarySearch(arr, key, low, mid - 1, first, last);
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
        write('Current Array: ');
        writeln();
        for i := 0 to n-1 do
            begin
                write(arr[i], ' ');
                writeln();
            end;
    end;


begin 
    Randomize;
    SetLength(arr, size);
    key := GenerateRandomValue;
    first := -1;
    last := -1;
    for i := 0 to size - 1 do
        begin
            arr[i] := GenerateRandomValue;
        end;
    BubbleSort(arr, size);
    PrintArray(arr, size);
    Writeln('Key: ', key);
    BinarySearch(arr, key, 0, size-1, first, last);
    if first <> -1 then
        writeln('First occurrence: ', first, ', Last occurrence: ', last)
    else
        writeln('Element not found.');
end.