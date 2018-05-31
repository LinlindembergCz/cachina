unit Diretorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.FileCtrl;

type
  TFormDiretorios = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    FDiretorio: string;
    procedure SetDiretorio(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property Diretorio: string read FDiretorio write SetDiretorio;
  end;

var
  FormDiretorios: TFormDiretorios;

implementation

{$R *.dfm}

procedure TFormDiretorios.BitBtn1Click(Sender: TObject);
begin
   Diretorio := DirectoryListBox1.Directory;
end;

procedure TFormDiretorios.SetDiretorio(const Value: string);
begin
  FDiretorio := Value;
end;

end.
