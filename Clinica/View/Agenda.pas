unit Agenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTab, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Buttons, Vcl.ExtCtrls;

type
  TTemplateFormComTabDetalhes1 = class(TTemplateFormComTabDetalhes)
    lbPsicologo: TLabel;
    cboEspecialista: TComboBox;
    lbNomePaciente: TLabel;
    cboPaciente: TComboBox;
    SpeedButton1: TSpeedButton;
    lbCodigoConvenio: TLabel;
    cboCodigoConvenio: TComboBox;
    SpeedButton2: TSpeedButton;
    lbCodigoTipoAgendamento: TLabel;
    cboCodigoTipoAgendamento: TComboBox;
    SpeedButton3: TSpeedButton;
    dateData: TMonthCalendar;
    Edit1: TEdit;
    Label1: TLabel;
    StringGrid1: TDBGrid;
    lbData: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemplateFormComTabDetalhes1: TTemplateFormComTabDetalhes1;

implementation

{$R *.dfm}

end.
