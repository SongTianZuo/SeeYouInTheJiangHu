unit puts;

interface
    procedure main();

implementation
    {$ifdef win64}
        procedure puts(s:pchar);stdcall;external;
    {$else}
        procedure puts(s:pchar);stdcall;external name '_puts';
    {$endif}
procedure main();
begin
    puts('���������ڽ�����');
end;

begin
end.