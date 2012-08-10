begin 
 k := power(2, n) - 1;
 if odd(n) then begin 
  RodO[0] := 'A';
  RodO[1] := 'B';
  RodO[2] := 'C';
  
  RodE[0] := 'A';
  RodE[1] := 'C';
  RodE[2] := 'B';  
 end
 else begin
  RodO[0] := 'A';
  RodO[1] := 'C';
  RodO[2] := 'B';
  
  RodE[0] := 'A';
  RodE[1] := 'B';
  RodE[2] := 'C';  
 end;
 while k <> 0 do
 begin
  u := 2;
  p := 1;
  while k mod u = 0 do
  begin
   p := p + 1;
   u := 2 * u;
  end;
  
  u := u / 2;
  r := ((k mod 2) - 1) mod u;
  
  if odd(p) then
  begin
   Rod1 := RodO[r mod 3];
   Rod2 := RodO[(r + 1) mod 3];
  end
  else
  begin
   Rod1 := RodE[r mod 3];
   Rod2 := RodE[(r + 1) mod 3];   
  end;
  s := s + 'перенести с' + Rod1 'на' + Rod2 + #13;
  k := k - 1;
 end;
 end;