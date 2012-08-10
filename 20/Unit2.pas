unit Unit2;

interface

uses  Grids,SysUtils;

Type  TInf=record
        aj:extended;
        j:word;
      end;
      TSel=^Sel;
      Sel=record
        inf:TInf;
        A:TSel;
      end;

      TLists=class(TObject)
        sp1,sp:TSel;
        procedure Adds(inf:TInf);
        procedure Addsj(inf:TInf);
        function Readsj(j:word):extended;
        procedure Dels;
      end;

      TMsLists=array [1..1] of TLists;

      TMas=array [1..1] of extended;
      PMas=^TMas;

      TListMs=class(TLists)
        ms:^TMsLists;
        m,n:word;
        constructor Create(m0,n0:word);
        destructor Free;
        procedure Add(i,j:word; a:extended);
        procedure Addj(i,j:word; a:extended);
        function Read(i,j:word):extended;
        procedure Print(StG:TStringGrid);
      end;

      Tbx=array [1..1] of extended;
      Tbxp=^Tbx;
      TSlau=class(TListMs)
        b,x:Tbxp;
        constructor Create(n0:word);
        procedure Addb(i:word; bi:extended);
        procedure SlauT;
        procedure Max(SG:TStringGrid);
        procedure Print(SG1,SG2,SG3:TStringGrid);
        destructor Free;
      end;

implementation

function TLists.Readsj;
begin
	sp:=sp1;
  while (sp<>Nil) and (sp^.inf.j<>j) do
    sp:=sp.A;
	if sp=Nil then
    Result:=0
  else
    Result:=sp^.Inf.aj;
end;

procedure TLists.Adds;
begin
  New(sp);
  sp^.Inf:=Inf;
  sp^.A:=sp1;
  sp1:=sp;
end;

procedure TLists.Addsj;
var spt:TSel;
begin
  New(sp);
  sp^.inf:=inf;
  if sp1=Nil then
    begin
      sp1:=sp;
      sp1^.A:=Nil;
    end
  else
    if sp1^.inf.j>=inf.j then
      begin
        sp^.A:=sp1;
        sp1:=sp;
      end
    else
      begin
        spt:=sp1;
        while (spt^.A<>Nil) and (spt^.A^.inf.j<inf.j) do
          spt:=spt^.A;
          sp^.A:=spt^.A;
          spt^.A:=sp;
        end;
end;

procedure TLists.Dels;
begin
  sp:=sp1;
  sp1:=sp1^.A;
  Dispose(sp);
end;

constructor TListMs.Create;
var i:word;
begin
  m:=m0;
  n:=n0;
  Inherited Create;
  GetMem(ms,4*m);
  for i:=1 to m do
    begin
      ms[i]:=TLists.Create;
      ms[i].sp1:=Nil
    end;
end;

destructor TListMs.Free;
var i:word;
begin
  for i:=1 to m do
  while ms[i].sp1<>Nil do
    ms[i].Dels;
  FreeMem(ms,4*m);
end;

procedure TListMs.Print;
var i,j:word;
begin
  for i:=1 to m do
    for j:=1 to n do
      StG.Cells[j-1,i-1]:=FloatToStr(ms[i].Readsj(j))
end;

procedure TListMs.Add;
var inf:TInf;
begin
  inf.aj:=a;
  inf.j:=j;
  ms[i].Adds(inf);
end;

procedure TListMs.Addj;
var inf:Tinf;
begin
    inf.aj:=a;
    inf.j:=j;
    ms[i].Addsj(inf);
end;

function TListMs.Read;
begin
  Result:=ms[i].readsj(j);
end;


constructor TSlau.Create;
begin
  Inherited Create(n0,n0);
  GetMem(b,sizeof(extended)*n0);
  GetMem(x,sizeof(extended)*n0);
end;


destructor TSlau.Free;
begin
  FreeMem(x,sizeof(extended)*n);
  FreeMem(b,sizeof(extended)*n);
  Inherited Free;
end;

procedure TSlau.Addb;
begin
  b[i]:=bi;
end;

procedure TSlau.Print;
var i:word;
begin
  Inherited Print(SG1);
  for i:=1 to m do
    begin
      SG2.Cells[0,i-1]:=FloatToStr(b[i]);
      SG3.Cells[0,i-1]:=FloatToStr(x[i]);
    end;
end;

procedure TSlau.SlauT;
var a1,s:extended;
    pt,sp:TSel;
    i,j:word;
begin
  pt:=ms[n].sp1;
  if pt<>Nil then
    a1:=pt^.inf.aj
  else
    a1:=0;
  x[n]:=b[n]/a1;
  for i:=n-1 downto 1 do
    begin
      sp:=ms[i].sp1;
      a1:=sp^.inf.aj;
      s:=0;
      sp:=sp^.A;
      while sp<>Nil do
        begin
          j:=sp^.inf.j;
          s:=s+sp^.inf.aj*x[j];
          sp:=sp^.A;
        end;
      x[i]:=(b[i]-s)/a1;
    end;
end;

procedure TSlau.Max;
  function Mx(x,y:extended):extended;
  begin
    if x>y then
      Mx:=x
    else
      Mx:=y;
  end;
var i,j:integer;
    Maxi:PMas;
    sp:TSel;
begin
  GetMem(Maxi,n*sizeof(extended));
  i:=1;
  while i<n+1 do
    begin
      sp:=ms[i].sp1;
      Maxi[i]:=sp.inf.aj;
      while sp^.A<>Nil do
        begin
          Maxi[i]:=Mx(Maxi[i],sp^.A.inf.aj);
          sp:=sp^.A;
        end;
      Inc(i);
    end;
  for i:=0 to n-1 do
    SG.Cells[0,i]:=FloatToStr(Maxi[i+1]);
  FreeMem(Maxi,n*sizeof(extended));
end;

procedure TSlau.Change(a, b: byte; Grid: TStringGrid);
var
 temp: TSel;
begin
 if a <> b then
 begin
  temp := ms[a].sp1;
  ms[a].sp1 := ms[b].sp1;
  ms[b].sp1 := temp;
 end;
 Inherited Print(Grid);
end;

end.
