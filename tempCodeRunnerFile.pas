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
            Write(outputFile, 'Keys: ',Keys[i]);
            writeln(outputFile);
            BinarySearch(arr, keys[i], 0, size-1, first, last);
            if first <> -1 then
                begin
                    m := m + 1;
                    writeln(outputFile, 'First occurrence: ', first, ', Last occurrence: ', last)
                end
            else
                m := m + 1;
                writeln(outputFile, 'Element not found.');
            m := m + 1;
        end;
        m := m + 1;
    
    
    writeln(outputFile, 'Number of operations: ', m)
end.