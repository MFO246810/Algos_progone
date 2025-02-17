program arrsearch;
uses crt;

const
  SIZE = 1000; { Adjust n to test large inputs }
  NUM_KEYS = 10; { Number of test keys }

type
  IntArray = array[1..SIZE] of Integer;

var
  arr, sortedArr: IntArray;
  keys: array[1..NUM_KEYS] of Integer;
  i, first, last: Integer;
  f: Text;
  m: Integer; { Operation counter for time complexity analysis }

{ Generate random array }
procedure GenerateArray(var A: IntArray);
var i: Integer;
begin
  Randomize;
  for i := 1 to SIZE do
    A[i] := Random(1000); { Values between 0-999 }
end;

{ Recursive Linear Search for first and last occurrence, with time complexity tracking }
procedure RecursiveLinearSearch(A: IntArray; key, index: Integer; var first, last: Integer);
begin
  if index > SIZE then Exit;
  Inc(m); { Count operations }
  if A[index] = key then
  begin
    if first = -1 then first := index;
    last := index;
  end;
  RecursiveLinearSearch(A, key, index + 1, first, last);
end;

{ Recursive Binary Search for first and last occurrence, with time complexity tracking }
procedure RecursiveBinarySearch(A: IntArray; key, low, high: Integer; var first, last: Integer);
var mid: Integer;
begin
  if low > high then Exit;
  Inc(m); { Count operations }
  mid := (low + high) div 2;
  if A[mid] = key then
  begin
    if first = -1 then first := mid;
    last := mid;
    RecursiveBinarySearch(A, key, low, mid - 1, first, last); { Check left }
    RecursiveBinarySearch(A, key, mid + 1, high, first, last); { Check right }
  end
  else if A[mid] < key then
    RecursiveBinarySearch(A, key, mid + 1, high, first, last)
  else
    RecursiveBinarySearch(A, key, low, mid - 1, first, last);
end;

{ Simple Selection Sort for sorting the array, as per problem requirement }
procedure SelectionSort(var A: IntArray);
var i, j, minIdx, temp: Integer;
begin
  for i := 1 to SIZE - 1 do
  begin
    minIdx := i;
    for j := i + 1 to SIZE do
    begin
      Inc(m); { Count operations }
      if A[j] < A[minIdx] then
        minIdx := j;
    end;
    temp := A[i];
    A[i] := A[minIdx];
    A[minIdx] := temp;
  end;
end;

{ Main program }
begin
  clrscr;
  Assign(f, 'arrsearch.txt');
  Rewrite(f);
  m := 0; { Reset operation counter }

  { Generate and display array }
  GenerateArray(arr);
  sortedArr := arr;
  SelectionSort(sortedArr);
  
  Randomize;
  for i := 1 to NUM_KEYS do
    keys[i] := Random(1100); { Some numbers may be outside the range }
  
  WriteLn(f, 'Unsorted Array: ');
  for i := 1 to SIZE do Write(f, arr[i], ' ');
  WriteLn(f, #10'Sorted Array: ');
  for i := 1 to SIZE do Write(f, sortedArr[i], ' ');
  WriteLn(f, #10);

  { Search for each key and count operations }
  for i := 1 to NUM_KEYS do
  begin
    first := -1; last := -1;
    m := 0; { Reset counter }
    RecursiveLinearSearch(arr, keys[i], 1, first, last);
    if first <> -1 then
      WriteLn(f, 'Linear Search: Key ', keys[i], ' found at indices [', first, ', ', last, '], Operations: ', m)
    else
      WriteLn(f, 'Linear Search: Key ', keys[i], ' not found, Operations: ', m);

    first := -1; last := -1;
    m := 0; { Reset counter }
    RecursiveBinarySearch(sortedArr, keys[i], 1, SIZE, first, last);
    if first <> -1 then
      WriteLn(f, 'Binary Search: Key ', keys[i], ' found at indices [', first, ', ', last, '], Operations: ', m)
    else
      WriteLn(f, 'Binary Search: Key ', keys[i], ' not found, Operations: ', m);
  end;

  Close(f);
  WriteLn('Results written to arrsearch.txt');
  ReadLn;
end.
