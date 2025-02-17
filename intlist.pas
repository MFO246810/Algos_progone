program Dll;

type
    PNode = ^Node;  
    Node = record
        data: Integer;  
        prev: PNode;
        next: PNode;
    end;

var head: PNode;

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

function SPartition(var Head: PNode; low, high: Integer): Integer;



procedure RecSort(var Head, Beg, end: PNode);
    var
        pivot: Integer; i: Integer; j: Integer; temp: Integer;
    begin
        if Head = Nil or Head^.next = Nil then
            EXIT;
        pivot := Head^.data;   
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

begin
    New(Head);
    Head := Nil;
    AppendToList(Head, 5);
    AppendToList(Head, 95);
    AppendToList(Head, 20);
    AppendToList(Head, 10);
    AppendToList(Head, 15);
    AppendToList(Head, 8);
    TraverseList(Head);
    write('Size of List is: ');
    write(sizeOfList(Head));
    writeln();
    Sort(Head);
    TraverseList(Head);
    
end.