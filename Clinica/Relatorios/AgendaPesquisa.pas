unit AgendaPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, Provider, DBClient, DBCtrls, Grids, DBGrids,
  StdCtrls,StrUtils, ComCtrls, Menus;

type
  TFormAgendamentoPesquisa = class(TForm)
    grdEntidade: TDBGrid;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource2: TDataSource;
    Especialista: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SQLDataSet2: TSQLDataSet;
    EspecialistaCodigo: TIntegerField;
    EspecialistaDescricao: TStringField;
    DataSource3: TDataSource;
    btnPesquisar: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    CheckBox2: TCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider2: TDataSetProvider;
    Convenio: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    DataSource4: TDataSource;
    PopupMenu1: TPopupMenu;
    GuiaAmil1: TMenuItem;
    Fichadopaciente1: TMenuItem;
    Relao1: TMenuItem;
    edtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    GuiadeConsulta1: TMenuItem;
    Agenda1: TMenuItem;
    dataInicio: TDateTimePicker;
    dataFim: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    cboSituacao: TComboBox;
    Label8: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Pesquisa1: TMenuItem;
    GuiaAmilPrImpressa1: TMenuItem;
    RelatorioFaturamento1: TMenuItem;
    GuiaAmilAnterior1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    RegitrarFatura1: TMenuItem;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GuiaAmil1Click(Sender: TObject);
    procedure Fichadopaciente1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Relao1Click(Sender: TObject);
    procedure DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GuiadeConsulta1Click(Sender: TObject);
    procedure grdEntidadeTitleClick(Column: TColumn);
    procedure Agenda1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBox2CloseUp(Sender: TObject);
    procedure Pesquisa1Click(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure GuiaAmilPrImpressa1Click(Sender: TObject);
    procedure RelatorioFaturamento1Click(Sender: TObject);
    procedure GuiaAmilAnterior1Click(Sender: TObject);
    procedure grdEntidadeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RegitrarFatura1Click(Sender: TObject);
  private

    procedure FiltrarSelecionados;
    procedure RegistrarFatura;
    { Private declarations }
  public
    { Public declarations }
    CodigoEspecialista: string;
    Paciente: string;
    Mes: string;
  end;

var
  FormAgendamentoPesquisa: TFormAgendamentoPesquisa;

implementation

uses
ModuloAgenda, RelFichaTriagem, RelFaturmento, RelGuiaConsulta,
RelAgenda, RelGuiaFaturamentoAmil , srvModBaseDados, TabelaCID, DBUtils,
  EntidadeFactory, RelPesquisaAgenda, RelGuiaFaturamentoAmilPreImpressa,
  RelFaturmento2, RelGuiaFaturamentoAmil1;

{$R *.dfm}

procedure TFormAgendamentoPesquisa.btnPesquisarClick(Sender: TObject);
var
  where, CodigoTipoAgendamento : string;
begin
    DataModuleConsultaAgenda.ClientDataSet1.Close;
    DataModuleConsultaAgenda.ClientDataSet2.Close;

    where:= ' 0=0 ';

    if DBLookupComboBox1.text <> '' then
       where := where + ifthen(DBLookupComboBox1.text <> '',
          ' and ( Agendamento."CodigoEspecialista"=' + string(DBLookupComboBox1.KeyValue)+')','');

    if DBLookupComboBox3.text <> '' then
       where := where +      ifthen(DBLookupComboBox3.text <> '',
          ' and ( Agendamento."CodigoEncaminhado"=' + string(DBLookupComboBox3.KeyValue)+')','');

    if DBLookupComboBox2.text <> '' then
       where := where +      ifthen( DBLookupComboBox2.text <> '',
          ' and Agendamento."CodigoConvenio"='  + string(DBLookupComboBox2.KeyValue),'');

    if cboSituacao.text <> '' then
       where := where +   ifthen( cboSituacao.text <> '',
                   ' and Agendamento."Situacao"=' + quotedstr(cboSituacao.text) ,'');

    if edtNome.text <> '' then
       where := where +   ifThen( edtNome.Text <> '' , ' and Triagem."Nome" like '+ quotedstr('%'+edtNome.Text+'%'),'');

    where := where + ' and ( ( Agendamento."Data" >='+ quotedstr(FormatDateTime('YYYY/MM/DD', dataInicio.datetime))+
          ' and     Agendamento."Data" <='+ quotedstr(FormatDateTime('YYYY/MM/DD', dataFim.datetime))+') OR '+
          ' Agendamento."Codigo" IN ( Select "CodigoAgendamento" From Sessoes where '+
          ' ( "Data" >= cast( '+ quotedstr( FormatDatetime( 'YYYY/MM/DD', dataInicio.datetime ))+' as Date)' +
          '  and '+
          '  "Data" <= cast( '+ quotedstr( FormatDatetime( 'YYYY/MM/DD', dataFim.datetime ))+' as Date ) ) ) ) ';

    DataModuleConsultaAgenda.ClientDataSet1.DataRequest(Where);
    DataModuleConsultaAgenda.ClientDataSet1.Open;

    DataModuleConsultaAgenda.ClientDataSet2.DataRequest(Where);
    DataModuleConsultaAgenda.ClientDataSet2.Open;

    Label1.caption := inttostr(DataModuleConsultaAgenda.ClientDataSet1.RecordCount) + ' Registros';

end;

procedure TFormAgendamentoPesquisa.Button2Click(Sender: TObject);
var
  pt: TPoint;
begin
  GetCursorPos( pt );
  PopupMenu1.popup( pt.x , pt.y );
end;

procedure TFormAgendamentoPesquisa.grdEntidadeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if ( DataSource1.dataset.FieldByName('Situacao').asstring = 'Faturado') then
  begin
     grdEntidade.Canvas.brush.Color := clGreen;
     grdEntidade.Canvas.font.Color := clwhite;
  end;

  grdEntidade.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormAgendamentoPesquisa.grdEntidadeTitleClick(Column: TColumn);
begin
  DataModuleConsultaAgenda.ClientDataSet1.IndexFieldNames:=  Column.FieldName;
end;

procedure TFormAgendamentoPesquisa.DBLookupComboBox2CloseUp(Sender: TObject);
var
  CodigoConvenio: Integer;
begin
  inherited;
 {cboCodigoTipoAgendamento.Clear;
  if DBLookupComboBox2.Text <> '' then
  begin
     CodigoConvenio := Integer(DBLookupComboBox2.keyValue);
     FillCombobox(tpTipoAgendamento, cboCodigoTipoAgendamento, '"CodigoConvenio"=' + inttostr(CodigoConvenio));
  end}

end;

procedure TFormAgendamentoPesquisa.DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key =VK_DELETE then
     TDBLookupComboBox(Sender).KeyValue := null
  else
  if key  = vk_return then
     btnPesquisar.Click;
end;

procedure TFormAgendamentoPesquisa.edtNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  key:= UpCase(key);
end;

procedure TFormAgendamentoPesquisa.FiltrarSelecionados;
var
  Selecionados: TBookmarkList;
  i:integer;
  Codigos: string;
begin

  Selecionados:= grdEntidade.SelectedRows;
  if Selecionados.Count > 0 then
  begin
    Codigos := '-1';
    DataModuleConsultaAgenda.ClientDataSet1.Filtered:= false;
      if CheckBox1.checked then
      begin
          for I := 0 to Selecionados.Count - 1 do
          begin
            DataSource1.DataSet.GotoBookmark( Selecionados[i] );
            Codigos := Codigos +' , '+ DataSource1.DataSet.FieldByName('CodigoAgendamento').AsString;
          end;
          DataModuleConsultaAgenda.ClientDataSet1.Filter := 'CodigoAgendamento IN ('+ Codigos +')';
          DataModuleConsultaAgenda.ClientDataSet1.Filtered:= true;
      end;
  end;

end;

procedure TFormAgendamentoPesquisa.RegistrarFatura;

  procedure AlterarSituacao;
  begin
     with DataModuleConsultaAgenda.ClientDataSet1 do
     begin
       edit;
       Fieldbyname('Situacao').asstring := 'Faturado';
       post;
       next;
     end;
  end;

begin
  if Application.messagebox('Deseja marcar como Faturada ',
   'Confirmada', mb_iconquestion + mb_yesno) = id_yes then
  begin
    if CheckBox1.checked then
    begin
      with DataModuleConsultaAgenda.ClientDataSet1 do
      begin
        first;
        while not eof do
        begin
          AlterarSituacao;
        end;
      end;
    end
    else
    begin
       AlterarSituacao;
    end;
  end;
end;

procedure TFormAgendamentoPesquisa.RegitrarFatura1Click(Sender: TObject);
begin
   FiltrarSelecionados;
   RegistrarFatura;
   DataModuleConsultaAgenda.ClientDataSet1.Filtered := false;
end;

procedure TFormAgendamentoPesquisa.FormActivate(Sender: TObject);
begin
  Especialista.Open;
  Convenio.open;
  if CodigoEspecialista <> '' then
  begin
     DBLookupComboBox1.KeyValue:= CodigoEspecialista;
     btnPesquisar.Click;
     //edtNome.Text:= Paciente;
     DataModuleConsultaAgenda.ClientDataSet1.Locate('PACIENTE',Paciente,[]);
  end;
  DataModuleConsultaAgenda.TabelaCID.Close;
  DataModuleConsultaAgenda.TabelaCID.Open;

  DataModuleConsultaAgenda.ClientDataSet2.Close;
  DataModuleConsultaAgenda.ClientDataSet2.open;
end;

procedure TFormAgendamentoPesquisa.FormCreate(Sender: TObject);
var
  TabelaCID:TTabelaCID;
begin
  dataInicio.Date := date;
  datafim.date   := date;
end;

procedure TFormAgendamentoPesquisa.Fichadopaciente1Click(Sender: TObject);
begin
  FiltrarSelecionados;
    application.CreateForm(TFormRelFichaTriagem,FormRelFichaTriagem);
  FormRelFichaTriagem.QuickRep1.Previewmodal;
  DataModuleConsultaAgenda.ClientDataSet1.Filtered := false;
end;

procedure TFormAgendamentoPesquisa.GuiaAmil1Click(Sender: TObject);
begin
  FiltrarSelecionados;

  application.CreateForm(TFormRelGuiaFaturamento,FormRelGuiaFaturamento);
  FormRelGuiaFaturamento.QuickRep1.PreviewModal;
  RegistrarFatura;

  DataModuleConsultaAgenda.ClientDataSet1.Filtered := false;
  FormRelGuiaFaturamento.Free;
end;

procedure TFormAgendamentoPesquisa.GuiaAmilAnterior1Click(Sender: TObject);
begin
  FiltrarSelecionados;
  application.CreateForm(TFormRelGuiaFaturamentoAmil1,FormRelGuiaFaturamentoAmil1);
  FormRelGuiaFaturamentoAmil1.QuickRep1.PreviewModal;
  RegistrarFatura;
  DataModuleConsultaAgenda.ClientDataSet1.Filtered := false;
  FormRelGuiaFaturamentoAmil1.Free;
end;

procedure TFormAgendamentoPesquisa.GuiaAmilPrImpressa1Click(Sender: TObject);
begin
  FiltrarSelecionados;
  application.CreateForm(TFormRelGuiaFaturamentoAmilPreImpressa,FormRelGuiaFaturamentoAmilPreImpressa);
  FormRelGuiaFaturamentoAmilPreImpressa.QuickRep1.PreviewModal;
  DataModuleConsultaAgenda.ClientDataSet1.Filtered := false;
//FormRelGuiaFaturamentoAmilPreImpressa.RegistroANS := inputbox('Informe o Nº Registo ANS da guia','Nº Registo ANS','');
  FormRelGuiaFaturamentoAmilPreImpressa.Free;
end;

procedure TFormAgendamentoPesquisa.GuiadeConsulta1Click(Sender: TObject);
begin
  FiltrarSelecionados;
   application.CreateForm(TFormRelGuiaConsulta,FormRelGuiaConsulta);
  FormRelGuiaConsulta.QuickRep1.PreviewModal;
  DataModuleConsultaAgenda.ClientDataSet1.Filtered := false;
end;

procedure TFormAgendamentoPesquisa.Pesquisa1Click(Sender: TObject);
begin
  FiltrarSelecionados;
  application.CreateForm(TFormRelPesquisaAgenda,FormRelPesquisaAgenda);
  FormRelPesquisaAgenda.QuickRep1.PreviewModal;
  DataModuleConsultaAgenda.ClientDataSet1.Filtered := false;
end;

procedure TFormAgendamentoPesquisa.Relao1Click(Sender: TObject);
begin
  FiltrarSelecionados;
   application.CreateForm(TFormRelFaturamento,FormRelFaturamento);
  FormRelFaturamento.QuickRep1.PreviewModal;
  DataModuleConsultaAgenda.ClientDataSet1.Filtered := false;
end;

procedure TFormAgendamentoPesquisa.RelatorioFaturamento1Click(Sender: TObject);
begin
  FiltrarSelecionados;
   application.CreateForm(TFormRelFaturamento2,FormRelFaturamento2);
  FormRelFaturamento2.QuickRep1.PreviewModal;
  DataModuleConsultaAgenda.ClientDataSet1.Filtered := false;
end;

procedure TFormAgendamentoPesquisa.Agenda1Click(Sender: TObject);
begin
  FiltrarSelecionados;
   application.CreateForm(TFormRelAgenda,FormRelAgenda);
  FormRelAgenda.QuickRep1.PreviewModal;
  DataModuleConsultaAgenda.ClientDataSet1.Filtered := false;
end;

end.
