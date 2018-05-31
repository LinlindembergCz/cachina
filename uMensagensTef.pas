unit uMensagensTef;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmMensagensTef = class(TForm)
    pMensagem: TPanel;
    pMensagemOperador: TPanel;
    lMensagemOperador: TLabel;
    Label10: TLabel;
    pMensagemCliente: TPanel;
    Label8: TLabel;
    lMensagemCliente: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagensTef: TfrmMensagensTef;

implementation

{$R *.dfm}

end.
