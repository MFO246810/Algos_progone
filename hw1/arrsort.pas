program ArrSort;
uses SysUtils;

const
  SIZE = 100;
var
    Test, tempArray: array of Integer; result: Boolean; i, m: Integer; OutputFile: TextFile;
procedure WriteArrayToFile(var F: TextFile; const arr: array of Integer);
    var
        i: Integer;
    begin
        for i := 0 to High(arr) do
            Write(F, arr[i], ' ');
            m := m + 1;
        Writeln(F);
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
                                    arr[j] := arr[j + 1];
                                    arr[j + 1] := temp;
                                    m := m + 1;
                            end;
                    end;
            end;
    end;

procedure SelectionSort(var arr: array of Integer; n: Integer);
     var
        i: Integer; j: Integer; temp: Integer; min_idx: Integer;
    begin
        for i:= 0 to n - 2 do
            
            begin
                m := m + 1;
                min_idx := i;
                for j := i + 1 to n-1 do
                    
                    begin
                        m := m + 1;
                        if(arr[j] < arr[min_idx]) then
                            
                            begin
                                m := m + 1;
                                min_idx := j;
                            end;
                    end; 
                m := m + 1;
                temp := arr[i];
                arr[i] := arr[min_idx];
                arr[min_idx] := temp;
            end;
    end;

function HPartition(var arr: array of Integer; low, high: Integer): Integer;
    var
        pivot: Integer; i: Integer; j: Integer; temp: Integer;
    begin
        m := m + 1;
        pivot := arr[low];   
        i := low - 1;        
        j := high + 1;

        while true do 
            begin
                repeat
                    m := m + 1;
                    i := i + 1;
                until arr[i] >= pivot;

                repeat
                    m := m + 1;
                    j := j - 1;
                until arr[j] <= pivot;

                if i >= j then 
                begin
                    m := m + 1;
                    HPartition := j; 
                    Exit;
                end; 

                m := m + 1;
                temp := arr[i];
                arr[i] := arr[j];
                arr[j] := temp;
            end;
    end;

function MedianOfThree(var arr: array of Integer; low, high: Integer): Integer;
    var
        mid: Integer; temp: Integer;
    begin
        m := m + 1;
        mid := (low + high) div 2;

        if arr[low] > arr[mid] then
            begin
                m := m + 1;
                temp := arr[low];
                arr[low] := arr[mid];
                arr[mid] := temp;
            end;
        if arr[low] > arr[high] then
            begin
                m := m + 1;
                temp := arr[low];
                arr[low] := arr[high];
                arr[high] := temp;
            end;
        if arr[mid] > arr[high] then
            begin
                m := m + 1;
                temp := arr[mid];
                arr[mid] := arr[high];
                arr[high] := temp;
            end;
        m := m + 1;
        MedianOfThree := arr[mid];
    end;

function MPartition (var arr: array of Integer; low, high, pivot: Integer): Integer;
    var
        i: Integer; j: Integer; temp: Integer;
    begin
        m := m + 1;  
        i := low - 1;        
        j := high + 1;

        while true do 
            begin
                repeat
                    m := m + 1;
                    i := i + 1;
                until arr[i] >= pivot;

                repeat
                    m := m + 1;
                    j := j - 1;
                until arr[j] <= pivot;

                if i >= j then 
                begin
                    m := m + 1;
                    MPartition := j; 
                    Exit;
                end; 

                m := m + 1;
                temp := arr[i];
                arr[i] := arr[j];
                arr[j] := temp;
            end;
    end;

Procedure QuickSortV1(var arr: array of Integer; low: Integer; high: Integer);
    var
        p: Integer;
    begin
        if low < high then
            begin
                m := m + 1;
                p := HPartition(arr, low, high);  
                QuickSortV1(arr, low, p);    
                QuickSortV1(arr, p + 1, high); 
            end;
    end;

procedure QuickSortV2(var arr: array of Integer; low: Integer; high: Integer);
    var
        p, pivot: Integer;
    begin
        if low < high then
            begin
                m := m + 1;
                pivot := MedianOfThree(arr, low, high);
                p := MPartition(arr, low, high, pivot);  
                QuickSortV2(arr, low, p);    
                QuickSortV2(arr, p + 1, high); 
            end;
    end;



procedure Merge(var arr: array of Integer; i, j, m: integer);
    var
        tempArr: array of Integer;
        L, R, k, mid: integer;
    begin
        m := m + 1;
        mid := (i + j) div 2;
        L := i;
        R := mid + 1;
        k := i;

        SetLength(tempArr, j + 1); 
        while (L <= mid) and (R <= j) do
            begin
                if arr[L] <= arr[R] then
                    begin
                        m := m + 1;
                        tempArr[k] := arr[L];
                        L := L + 1;
                    end
                else
                    begin
                        m := m + 1;
                        tempArr[k] := arr[R];
                        R := R + 1;
                    end;
                m := m + 1;
                k := k + 1;
            end;

        while L <= mid do
            begin
                m := m + 1;
                tempArr[k] := arr[L];
                L := L + 1;
                k := k + 1;
            end;

        while R <= j do
            begin
                m := m + 1;
                tempArr[k] := arr[R];
                R := R + 1;
                k := k + 1;
            end;

        for k := i to j do
            begin
                m := m + 1;
                arr[k] := tempArr[k];
            end;
    end;  

procedure MergeSort(var arr: array of Integer; i, j: Integer);
    var
        mid: integer;
    begin
        if i < j then
            begin
                m := m + 1;
                mid := (i + j) div 2;  
                MergeSort(arr, i, mid);  
                MergeSort(arr, mid + 1, j);  
                Merge(arr, i, j, mid);  
            end;
    end;

procedure PrintArray(Var arr: array of Integer; n: integer);
    var
        i: integer;
    begin
        write('Current Array: ');
        writeln();
        m := m + 1;
        for i := 0 to n-1 do
            begin
                m := m + 1;
                write(arr[i], ' ');
                writeln();
            end;
    end;



function IsSorted(var arr: array of Integer; i, n: Integer): Boolean;
    begin
        if i >= n - 1 then
            begin
                m := m + 1;
                IsSorted := True;  
                Exit;
            end;

        if arr[i] > arr[i + 1] then
            begin
                m := m + 1;
                IsSorted := False;  
                Exit;
            end;
        m := m + 1;
        IsSorted := IsSorted(arr, i + 1, n);
    end; 

function GenerateRandomValue(): Integer;
    begin
        m := m + 1;
        GenerateRandomValue := Random(1001);
    end;

begin
    Randomize;
    m := 0;
    SetLength(Test, SIZE);

    for i := 0 to SIZE - 1 do
        begin
            Test[i] := GenerateRandomValue;
            m := m + 1;
        end;
        
    m := m + 1;
    Assign(OutputFile, 'arrsort.txt');
    Rewrite(OutputFile);
    Writeln(OutputFile, 'Unsorted');
    WriteArrayToFile(OutputFile, Test);

    (* Perform sorting and write results *)
    m := m + 1;
    tempArray := Copy(Test, 0, SIZE);
    m := m + 1;
    SelectionSort(tempArray, SIZE);
    m := m + 1;
    writeln(OutputFile);
    m := m + 1;
    if IsSorted(tempArray, 0, SIZE) then
        begin
            m := m + 1;
            Writeln(OutputFile, '[Sorted]');
        end;
    m := m + 1;
    Writeln(OutputFile, 'Selection Sort:');
    m := m + 1;
    WriteArrayToFile(OutputFile, tempArray);
    m := m + 1;
    tempArray := Copy(Test, 0, SIZE);
    m := m + 1;
    BubbleSort(tempArray, SIZE);
    m := m + 1;
    writeln(OutputFile);
    if IsSorted(tempArray, 0, SIZE) then
        begin
            m := m + 1;
            Writeln(OutputFile, '[Sorted]');
        end;
    m := m + 1;
    Writeln(OutputFile, 'Bubble Sort:');
    m := m + 1;
    WriteArrayToFile(OutputFile, tempArray);
    m := m + 1;
    tempArray := Copy(Test, 0, SIZE);
    m := m + 1;
    MergeSort(tempArray, 0, High(tempArray));
    m := m + 1;
    writeln(OutputFile);
    if IsSorted(tempArray, 0, SIZE) then
        begin
            m := m + 1;
            Writeln(OutputFile, '[Sorted]');
        end;
    m := m + 1;
    Writeln(OutputFile, 'Merge Sort:');
    m := m + 1;
    WriteArrayToFile(OutputFile, tempArray);
    m := m + 1;
    tempArray := Copy(Test, 0, SIZE);
    m := m + 1;
    QuickSortV1(tempArray, 0, High(tempArray));
    m := m + 1;
    writeln(OutputFile);
    if IsSorted(tempArray, 0, SIZE) then
        begin
            m := m + 1;
            Writeln(OutputFile, '[Sorted]');
        end;
    m := m + 1;
    Writeln(OutputFile, 'QuickSort (Hoare Partition):');
    m := m + 1;
    WriteArrayToFile(OutputFile, tempArray);

    m := m + 1;
    tempArray := Copy(Test, 0, SIZE);
    m := m + 1;
    QuickSortV2(tempArray, 0, High(tempArray));
    m := m + 1;
    writeln(OutputFile);
    m := m + 1;
    if IsSorted(tempArray, 0, SIZE) then
        begin
            m := m + 1;
            Writeln(OutputFile, '[Sorted]');
        end;
    Writeln(OutputFile, 'QuickSort (Median Partition):');
    m := m + 1;
    WriteArrayToFile(OutputFile, tempArray);
    m := m + 1;
    writeln(OutputFile);
    m := m + 1;
    writeln(OutputFile, 'Operations: ');
    m := m + 1;
    write(OutputFile, m);
    (* Close file *)
    Close(OutputFile);

    Writeln('Sorting report saved to arrsort.txt');
end.