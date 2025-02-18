program IntList;
uses SysUtils;

const
    MAX_DIGITS = 256;

type
    PNode = ^Node;  
    Node = record
        data: Integer;  
        prev: PNode;
        next: PNode;
    end;

var head, curr: PNode; m: LongInt; outputFile: TextFile;

procedure AppendToList(var Head: PNode; val: Integer);  
    var
        curr: PNode; temp: PNode;
    begin
        New(temp);
        m := m + 1;
        temp^.data := val;
        m := m + 1;   
        temp^.next := nil;
        m := m + 1;
        temp^.prev := nil;
        m := m + 1;   

        if Head = Nil then 
            begin
                Head := temp;
                m := m + 1;
            end
            
        else 
            begin
                curr := Head;
                m := m + 1;
                while curr^.next <> Nil do  
                    curr := curr^.next;
                    m := m + 1;
                    curr^.next := temp;
                    m := m + 1;
                    temp^.prev := curr;  
                    m := m + 1;
            end;
    end;

procedure TraverseList(var Head: PNode;  var f: TextFile);
    var 
        curr: PNode;
    begin
        curr := Head;
        m := m + 1;
        if curr <> Nil then
            begin
                write(f, curr^.data, ' ');
                m := m + 1;
                TraverseList(curr^.next, f);
                m := m + 1;
            end
    end;

function sizeOfList(var Head: PNode): Integer;
    var 
        size: Integer; curr: PNode;
    begin
        size := 0;
        m := m + 1;
        if(Head<> Nil) then
            begin
                curr := Head;
                m := m + 1;
                while curr^.next <> Nil do 
                    begin
                        size := size + 1;
                        m := m + 1;
                        curr := curr^.next;
                        m := m + 1;
                    end;

            end
        else
            begin
                writeln('Lil bro the list is empty');
                m := m + 1;
            end;
        m := m + 1;
        sizeOfList := size;
        
    end;

procedure Sort(var Head: PNode); 
    var
        curr: PNode; temp: PNode; inside: PNode; Key: Integer; TempData: Integer;
    begin
        if Head = Nil then 
        begin
            m := m + 1;
            writeln('List is empty, nothing to sort.');
            Exit;
        end;
    
        begin
        
        TempData := 0;
        m := m + 1;
        curr := Head;
        m := m + 1;
        inside := Head;
        m := m + 1;
        while curr <> Nil do 
            begin
                inside := curr^.next;
                m := m + 1;
                Key := curr^.data;
                m := m + 1;
                while inside <> Nil do
                    begin
                        if(inside^.data <= Key) then 
                            begin
                                TempData := Key;
                                m := m + 1;
                                curr^.data := inside^.data;
                                m := m + 1;
                                Key := inside^.data;
                                m := m + 1;
                                inside^.data :=  TempData;
                            end;
                        m := m + 1;
                        inside := inside^.next 
                    end;
                m := m + 1;
                curr := curr^.next;
            end;

        end;
    end;

function Partition(var head, tail: PNode): PNode;
    var
        pivot: Integer;
        i, j: PNode;
        temp: Integer;
    begin
        pivot := tail^.data;
        m := m + 1;
        i := head;
        m := m + 1;
        j := head;

        while (j <> tail) do
        begin
            if (j^.data <= pivot) then
            begin
            m := m + 1;
            temp := i^.data;
            m := m + 1;
            i^.data := j^.data;
            m := m + 1;
            j^.data := temp;
            m := m + 1;
            i := i^.next;
            m := m + 1;
            end;
            j := j^.next;
            m := m + 1;
        end;

        temp := i^.data;
        m := m + 1;
        i^.data := tail^.data;
        m := m + 1;
        tail^.data := temp;
        m := m + 1;

        Partition := i;
        m := m + 1;
    end;

procedure QuickSort(var head, tail: PNode);
    var
        pivot: PNode;
    begin
        if (head <> nil) and (tail <> nil) and (head <> tail) then
        begin
            pivot := Partition(head, tail);
            m := m + 1;

            if (pivot <> head) then
                QuickSort(head, pivot^.prev);
                m := m + 1;

            if (pivot <> tail) then
                QuickSort(pivot^.next, tail);
                m := m + 1;
        end;
    end;

procedure RemoveDuplicates(var head: PNode);
    var
        curr, check, temp: PNode;
    begin
        curr := head;
        m := m + 1;
        while (curr <> nil) and (curr^.next <> nil) do
            begin
                check := curr^.next;
                m := m + 1;

            while (check <> nil) do
                begin
                    if (check^.data = curr^.data) then
                        begin
                            temp := check;
                            m := m + 1;
                            check := check^.next;
                            m := m + 1;

                            if (temp^.prev <> nil) then
                                temp^.prev^.next := temp^.next;
                                m := m + 1;
                
                            if (temp^.next <> nil) then
                                temp^.next^.prev := temp^.prev;
                                m := m + 1;
                
                            Dispose(temp);
                            m := m + 1;
                        end
                    else
                        check := check^.next;
                        m := m + 1;
            end;

            curr := curr^.next;
            m := m + 1;
        end;
    end;

procedure GenerateBigInt(var head: PNode);
    var
        i, numDigits, digit: Integer;
    begin
        numDigits := Random(MAX_DIGITS) + 1;  
        for i := 1 to numDigits do
            begin
                digit := Random(1001); 
                AppendToList(head, digit);
            end;
    end;


begin
    Randomize;
    Assign(outputFile, 'intlist.txt');  
    Rewrite(outputFile);

    m := 0;
    GenerateBigInt(head);

    Writeln(outputFile, 'Original List:');
    RemoveDuplicates(head);
    TraverseList(head, outputFile);

    m := m + 1;
    writeln(sizeOfList(head));  
    
    Sort(Head);

    writeln(outputFile);
    Writeln(outputFile, 'Sorted List:');
    TraverseList(head, outputFile);

    m := m + 1;

    writeln(outputFile);
    writeln(outputFile, 'Operation: ', m);
    m := m + 1;

    Close(outputFile);
end.