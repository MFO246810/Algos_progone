program intlist;

type
    PNode = ^TNode;
    TNode = record
        data: integer;
        next, prev: PNode;
    end;

var
    head: PNode;
    f: text;

function CreateNode(value: integer): PNode;
var
    node: PNode;
begin
    new(node);
    node^.data := value;
    node^.next := nil;
    node^.prev := nil;
    CreateNode := node;
end;

procedure Append(var head: PNode; value: integer);
var
    temp, newNode: PNode;
begin
    newNode := CreateNode(value);  
    if head = nil then
    begin
        head := newNode;
        exit;
    end;
    temp := head;
    while temp^.next <> nil do
        temp := temp^.next;
    temp^.next := newNode;
    newNode^.prev := temp;
end;

procedure PrintList(node: PNode);
begin
    if node = nil then
    begin
        writeln;
        writeln(f);
        exit;
    end;
    write(node^.data, ' ');
    write(f, node^.data, ' ');
    PrintList(node^.next);
end;

procedure Sort(var head: PNode);
var
    i, j: PNode;
    temp: integer;
begin
    i := head;
    while i <> nil do
    begin
        j := i^.next;
        while j <> nil do
        begin
            if i^.data > j^.data then
            begin
                temp := i^.data;
                i^.data := j^.data;
                j^.data := temp;
            end;
            j := j^.next;
        end;
        i := i^.next;
    end;
end;

procedure RemoveDuplicates(var head: PNode);
var
    current, temp: PNode;
begin
    if (head = nil) or (head^.next = nil) then exit;
    current := head;
    while current^.next <> nil do
    begin
        if current^.data = current^.next^.data then
        begin
            temp := current^.next;
            current^.next := temp^.next;
            if temp^.next <> nil then
                temp^.next^.prev := current;
            dispose(temp); 
        end
        else
            current := current^.next;
    end;
end;

procedure GenerateList(var head: PNode; n: integer);
var
    i: integer;
begin
    randomize;
    for i := 1 to n do
        Append(head, random(100));
end;

begin
    assign(f, 'intlist.txt');
    rewrite(f);

    head := nil;
    GenerateList(head, 10);

    writeln('Unsorted List:');
    writeln(f, 'Unsorted List:');
    PrintList(head);

    Sort(head);
    writeln('Sorted List:');
    writeln(f, 'Sorted List:');
    PrintList(head);

    RemoveDuplicates(head);
    writeln('After Removing Duplicates:');
    writeln(f, 'After Removing Duplicates:');
    PrintList(head);

    close(f);
end.
