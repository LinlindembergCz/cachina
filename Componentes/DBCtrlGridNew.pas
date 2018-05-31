unit DBCtrlGridNew;

interface

uses
WinTypes, WinProcs, Classes, Vcl.DBCGrids;

type
TNoVertScrollDBCtrlGridNew = class(TDBCtrlGrid)
protected
  procedure Paint;
end;

procedure Register;

implementation

procedure TNoVertScrollDBCtrlGridNew.Paint;
begin
  //SetScrollRange(Self.Handle, SB_HORZ, 0, 0, False);
  //inherited Paint;
end;

procedure Register;
begin
  //RegisterComponents('Data Controls', [TNoVertScrollDBCtrlGridNew]);
end;

end.
