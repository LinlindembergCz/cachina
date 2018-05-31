unit DialogsUtils;

interface

uses
  VCL.Dialogs;

Type
  TDialogs = class
  private

  public
    class function ConfirmarMensagem(Mensagem: string):boolean;
    class function ConfirmarExclusao:boolean;
    class procedure MensagemAtencao(Mensagem: string); static;
    class procedure MensagemInfo(Mensagem: string); static;
  end;

implementation

uses
  Types;

{ TDialogs }

class function TDialogs.ConfirmarExclusao: boolean;
var
  opYes: integer;
begin
  opYes := MessageDlg('Deseja EXCLUIR este registro ',
  TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbyes, TMsgDlgBtn.mbNo],0);

  result  := opYes = 6;
end;

class procedure TDialogs.MensagemAtencao(Mensagem: string);
var
  opYes: integer;
begin
  opYes := MessageDlg(Mensagem,
  TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
end;

class procedure TDialogs.MensagemInfo(Mensagem: string);
var
  opYes: integer;
begin
  opYes := MessageDlg(Mensagem,
  TMsgDlgType.mtInformation,[TMsgDlgBtn.mbOK],0);
end;


class function TDialogs.ConfirmarMensagem(Mensagem: string): boolean;
var
  opYes: integer;
begin
  opYes := MessageDlg(Mensagem,
  TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbyes, TMsgDlgBtn.mbNo],0);

  result  := opYes = 6;
end;

end.
