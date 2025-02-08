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

procedure Sort(Head);
    var
        curr: PNode; temp: PNode; inside: PNode; Key: Integer; TempData: Integer;
    begin
        curr := Head;
        inside := Head;
        while curr^.next <> Nil do 
            begin
                inside := curr^.next;
                Key := curr^.data;
                while inside^.next <> Nil do
                    begin
                        if(key <= inside^.data) then 
                            begin
                                key := inside ^.data;

                            end;
                        inside = inside^.next 
                    end;
                TempData = curr-> data
                
                curr := curr^.next;
            end;

    end;

begin
    New(Head);
    AppendToList(Head, 5);
    AppendToList(Head, 20);
    AppendToList(Head, 10);
    AppendToList(Head, 15);
    AppendToList(Head, 8);
    AppendToList(Head, 95);
    writeln(sizeOfList(Head));
    TraverseList(Head);
    
end.