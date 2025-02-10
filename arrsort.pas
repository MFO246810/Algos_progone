program ArrSort;

var
    Test: array [0..5] of Integer; result: Boolean;

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

procedure SelectionSort(var arr: array of Integer; n: Integer);
     var
        i: Integer; j: Integer; temp: Integer; min_idx: Integer;
    begin
        for i:= 0 to n - 2 do
            begin
                min_idx := i;
                for j := i + 1 to n-1 do
                    begin
                        if(arr[j] < arr[min_idx]) then
                            begin
                                min_idx := j;
                            end;
                    end; 

                temp := arr[i];
                arr[i] := arr[min_idx];
                arr[min_idx] := temp;
            end;
    end;

function HPartition(var arr: array of Integer; low, high: Integer): Integer;
    var
        pivot: Integer; i: Integer; j: Integer; temp: Integer;
    begin
        pivot := arr[low];   
        i := low - 1;        
        j := high + 1;

        while true do 
            begin
                repeat
                    i := i + 1;
                until arr[i] >= pivot;

                repeat
                    j := j - 1;
                until arr[j] <= pivot;

                if i >= j then 
                begin
                    HPartition := j; 
                    Exit;
                end; 

                temp := arr[i];
                arr[i] := arr[j];
                arr[j] := temp;
            end;
    end;

function MedianOfThree(var arr: array of Integer; low, high: Integer): Integer;
    var
        mid: Integer; temp: Integer;
    begin
        mid := (low + high) div 2;

        if arr[low] > arr[mid] then
            begin
                temp := arr[low];
                arr[low] := arr[mid];
                arr[mid] := temp;
            end;
        if arr[low] > arr[high] then
            begin
                temp := arr[low];
                arr[low] := arr[high];
                arr[high] := temp;
            end;
        if arr[mid] > arr[high] then
            begin
                temp := arr[mid];
                arr[mid] := arr[high];
                arr[high] := temp;
            end;
        MedianOfThree := arr[mid];
    end;

function MPartition (var arr: array of Integer; low, high, pivot: Integer): Integer;
    var
        i: Integer; j: Integer; temp: Integer;
    begin  
        i := low - 1;        
        j := high + 1;

        while true do 
            begin
                repeat
                    i := i + 1;
                until arr[i] >= pivot;

                repeat
                    j := j - 1;
                until arr[j] <= pivot;

                if i >= j then 
                begin
                    MPartition := j; 
                    Exit;
                end; 

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
                pivot := MedianOfThree(arr, low, high);
                p := MPartition(arr, low, high, pivot);  
                QuickSortV2(arr, low, p-1);    
                QuickSortV2(arr, p + 1, high); 
            end;
    end;



procedure Merge(var arr: array of Integer; i, j, m: integer);
    var
        tempArr: array of Integer;
        L, R, k, mid: integer;
    begin
        mid := (i + j) div 2;
        L := i;
        R := mid + 1;
        k := i;

        SetLength(tempArr, j + 1); 
        while (L <= mid) and (R <= j) do
            begin
                if arr[L] <= arr[R] then
                    begin
                        tempArr[k] := arr[L];
                        L := L + 1;
                    end
                else
                    begin
                        tempArr[k] := arr[R];
                        R := R + 1;
                    end;
                k := k + 1;
            end;

        while L <= mid do
            begin
                tempArr[k] := arr[L];
                L := L + 1;
                k := k + 1;
            end;

        while R <= j do
            begin
                tempArr[k] := arr[R];
                R := R + 1;
                k := k + 1;
            end;

        for k := i to j do
            begin
                arr[k] := tempArr[k];
            end;
    end;  

procedure MergeSort(var arr: array of Integer; i, j: Integer);
    var
        m: integer;
    begin
        if i < j then
            begin
                m := (i + j) div 2;  
                MergeSort(arr, i, m);  
                MergeSort(arr, m + 1, j);  
                Merge(arr, i, j, m);  
            end;
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



function IsSorted(var arr: array of Integer; i, n: Integer): Boolean;
    begin
        if i >= n - 1 then
            begin
                IsSorted := True;  
                Exit;
            end;

        if arr[i] > arr[i + 1] then
            begin
                IsSorted := False;  
                Exit;
            end;

        IsSorted := IsSorted(arr, i + 1, n);
    end; 


begin
    Test[0] := 10;
    Test[1] := 20;
    Test[2] := 3;
    Test[3] := 40;
    Test[4] := 1000;
    Test[5] := 50;
    result := IsSorted(Test, 0, 6);
    if result then
        writeln('sorted')
    else
        begin
            writeln('unsorted');
        end;
    MergeSort(Test,0,5);
    result := IsSorted(Test, 0, 6);
    if result then
        writeln('sorted')
    else
        begin
            writeln('unsorted');
        end;
    PrintArray(Test, 6);
end.