program intlist;

type
    PNode = ^Node;  
    Node = record
        data: Integer;  
        prev: PNode;
        next: PNode;
    end;

var head, curr: PNode; 

procedure AppendToList(var Head: PNode; val: Integer);  
    var
        curr: PNode; temp: PNode;
    begin
        New(temp);
        temp^.data := val;   
        temp^.next := nil;
        temp^.prev := nil;   

        if Head = Nil then 
            Head := temp
        else 
            begin
                curr := Head;
                while curr^.next <> Nil do  
                    curr := curr^.next;
        
                    curr^.next := temp;
                    temp^.prev := curr;  
            end;
    end;

procedure TraverseList(var Head: PNode);
    var 
        curr: PNode;
    begin
        curr := Head;
        if curr <> Nil then
            begin
                writeln(curr^.data);
                TraverseList(curr^.next);
            end
    end;

function sizeOfList(var Head: PNode): Integer;
    var 
        size: Integer; curr: PNode;
    begin
        size := 0;
        if(Head<> Nil) then
            begin
                curr := Head;
                while curr^.next <> Nil do 
                    begin
                        size := size + 1;
                        curr := curr^.next;
                    end;

            end
        else
            begin
                writeln('Lil bro the list is empty')
            end;

        sizeOfList := size;
    end;

procedure Sort(var Head: PNode); 
    var
        curr: PNode; temp: PNode; inside: PNode; Key: Integer; TempData: Integer;
    begin
        if Head = Nil then 
        begin
            writeln('List is empty, nothing to sort.');
            Exit;
        end;
    
        begin
        TempData := 0;
        curr := Head;
        inside := Head;
        while curr <> Nil do 
            begin
                inside := curr^.next;
                Key := curr^.data;
                while inside <> Nil do
                    begin
                        if(inside^.data <= Key) then 
                            begin
                                TempData := Key;
                                curr^.data := inside^.data;
                                Key := inside^.data;
                                inside^.data :=  TempData;
                            end;
                        inside := inside^.next 
                    end;
                
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
        i := head;
        j := head;

        while (j <> tail) do
        begin
            if (j^.data <= pivot) then
            begin
            temp := i^.data;
            i^.data := j^.data;
            j^.data := temp;
            i := i^.next;
            end;
            j := j^.next;
        end;

        temp := i^.data;
        i^.data := tail^.data;
        tail^.data := temp;

        Partition := i;
    end;

procedure QuickSort(var head, tail: PNode);
    var
        pivot: PNode;
    begin
        if (head <> nil) and (tail <> nil) and (head <> tail) then
        begin
            pivot := Partition(head, tail);

            if (pivot <> head) then
                QuickSort(head, pivot^.prev);

            if (pivot <> tail) then
                QuickSort(pivot^.next, tail);
        end;
    end;

procedure RemoveDuplicates(var head: PNode);
    var
        curr, check, temp: PNode;
    begin
        curr := head;

        while (curr <> nil) and (curr^.next <> nil) do
            begin
                check := curr^.next;

            while (check <> nil) do
                begin
                    if (check^.data = curr^.data) then
                        begin
                            temp := check;
                            check := check^.next;

                            if (temp^.prev <> nil) then
                                temp^.prev^.next := temp^.next;
                
                            if (temp^.next <> nil) then
                                temp^.next^.prev := temp^.prev;
                
                            Dispose(temp);
                        end
                    else
                        check := check^.next;
            end;

            curr := curr^.next;
        end;
    end;

begin
    New(Head);
    Head := Nil;
    AppendToList(Head, 5);
    AppendToList(Head, 95);
    AppendToList(Head, 20);
    AppendToList(Head, 10);
    AppendToList(Head, 15);
    AppendToList(Head, 8);
    curr := Head;
    write('Size of List is: ');
    write(sizeOfList(Head));
    writeln();
    while(curr^.next <> Nil) do
        begin
            curr := curr^.next;
        end;
    
    QuickSort(Head, curr);
    TraverseList(Head);
    
end.