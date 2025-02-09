program ArrSort;

var
    Test: array [0..4] of Integer;

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
{
Procedure QuickSortV1(var arr: array of Integer);
    begin

    end;

procedure QuickSortV2(var arr: array of Integer);
    begin

    end;

procedure MergeSort(var arr: array of Integer);
    begin

    end;  

procedure IsSorted(var arr: array of Integer; n: Integer);
    begin

    end; }

begin
    Test[0] := 10;
    Test[1] := 20;
    Test[2] := 3;
    Test[3] := 40;
    Test[4] := 1000;
    SelectionSort(Test, 5);
    writeln('Array values: ', Test[0], ', ', Test[1], ', ', Test[2], ', ', Test[3], ', ', Test[4]);
end.