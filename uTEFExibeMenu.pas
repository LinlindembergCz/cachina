unit uTEFExibeMenu;

{$IFDEF FPC}
 {$mode objfpc}{$H+}
{$ENDIF}

interface

uses
  Classes, SysUtils,
  Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Buttons;

type

{$IFNDEF FPC}
 {$R *.dfm}
{$ELSE}
 {$R *.lfm}
{$ENDIF}

  { TForm4 }

  TfrmTEFExibeMenu = class(Tform)
     BitBtn1 : TBitBtn;
     BitBtn2 : TBitBtn;
     ListBox1 : TListBox;
     Memo1 : TMemo ;
     Panel1 : TPanel;
     Panel2 : TPanel;
     Splitter1 : TSplitter ;
     procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmTEFExibeMenu : TfrmTEFExibeMenu;

implementation

{ TForm4 }

procedure TfrmTEFExibeMenu.FormShow(Sender: TObject);
begin
   inherited;
   Caption := 'TEF';
   if Memo1.Lines.Count > 0 then
   begin
     Memo1.Width   := Trunc(Width/2)-10;
     Memo1.Visible := True ;
     Splitter1.Visible := True ;
   end ;

   ListBox1.SetFocus;
   if ListBox1.Items.Count > 0 then
      ListBox1.ItemIndex := 0 ;
end;

end.

