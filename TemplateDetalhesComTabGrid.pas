unit TemplateDetalhesComTabGrid;

interface

uses
  SysUtils,   Classes, Variants,   Types, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, VCL.StdCtrls, DBClient,
  DB,  Rtti, TemplateDetalhesComTab, VCL.Buttons, VCL.ComCtrls, VCL.ExtCtrls, VCL.Grids, VCL.DBGrids, strutils,
  Vcl.Menus;

type
  TTemplateFormComTabGridDetalhes = class(TTemplateFormComTabDetalhes)
    srcPesquisa: TDataSource;
    grdEntidade: TDBGrid;
    pnlSuperior: TPanel;
    pnlInferior: TPanel;
    grpPesquisa: TGroupBox;
    edtValorPesquisa: TEdit;
    btnPesquisar: TButton;
    lbregistros: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure grdEntidadeDblClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure grdEntidadeTitleClick(Column: TColumn);
  private
    Recno:integer;

    { Private declarations }
  public
    { Public declarations }
    procedure UpdateEntidade(Codigo : string = '');
  public
     CampoPesquisa: string;
     OrderBy: string;
     GroupBy: string;
     procedure RefreshDataSet;virtual;
     procedure PosicionaPageIndex;
  end;

var
  TemplateFormComTabGridDetalhes: TTemplateFormComTabGridDetalhes;

implementation

{$R *.dfm}

procedure TTemplateFormComTabGridDetalhes.RefreshDataSet;
begin
  if Tabela <> '' then
     srcPesquisa.Dataset := Controller.GetSelect(Tabela, Condicao+ ifthen( OrderBy <> '', 'Order by '+OrderBy , '') , Campos)
  else
     srcPesquisa.Dataset := Controller.GetDataset(Entidade, Condicao+ ifthen( OrderBy <> '', 'Order by '+OrderBy , '') , Campos);
end;

procedure TTemplateFormComTabGridDetalhes.UpdateEntidade(Codigo : string = '');
var
  CondicaoEntidade: string;
begin
   if Codigo <> '' then
      CondicaoEntidade := 'T1."'+CampoCodigo+'"'+'='+ Codigo
   else
      CondicaoEntidade := '0=1';

  if Tabela <> '' then
     srcEntidade.Dataset := Controller.GetSelect(Tabela, CondicaoEntidade , Campos)
  else
    srcEntidade.Dataset  := Controller.GetDataset(Entidade, CondicaoEntidade , Campos);

  MapperEntidade.Dataset := srcEntidade.DataSet;
end;

procedure TTemplateFormComTabGridDetalhes.btnAlterarClick(Sender: TObject);
begin
  if not srcPesquisa.Dataset.IsEmpty then
  begin
    UpdateEntidade(srcPesquisa.DataSet.FieldByName('Codigo').AsString);
    inherited;
    PosicionaPageIndex;
  end;
end;

procedure TTemplateFormComTabGridDetalhes.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  //RefreshDataSet;
end;

procedure TTemplateFormComTabGridDetalhes.btnExcluirClick(Sender: TObject);
var
  I:integer;
begin
  if grdEntidade.SelectedRows.Count > 1 then
  begin
      PerguntaConfirmarExclusao:= false;
      for I := 0 to grdEntidade.SelectedRows.Count - 1 do
      begin
          srcPesquisa.DataSet.GotoBookmark( grdEntidade.SelectedRows[i] );
          UpdateEntidade(srcPesquisa.DataSet.FieldByName('Codigo').AsString);
          inherited;
      end;
  end
  else
  begin
    PerguntaConfirmarExclusao:= true;
    UpdateEntidade(srcPesquisa.DataSet.FieldByName('Codigo').AsString);
    inherited;
  end;

  RefreshDataSet;
end;

procedure TTemplateFormComTabGridDetalhes.btnInserirClick(Sender: TObject);
begin
  inherited;
  PosicionaPageIndex;
end;

procedure TTemplateFormComTabGridDetalhes.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  if edtValorPesquisa.Text <> '' then
  begin
     if Tabela <> '' then
        srcPesquisa.Dataset := Controller.GetSelect(Tabela, ifthen(Condicao <> '', Condicao+' and ', '')+
        CampoPesquisa+' COLLATE Latin1_General_CI_AI like '+
        quotedstr('%'+edtValorPesquisa.Text+'%')+ifthen( GroupBy <> '', 'Group by '+GroupBy , '')+
         ifthen( OrderBy <> '', 'Order by '+OrderBy , ''), Campos)
     else
        srcPesquisa.Dataset := Controller.GetDataset(Entidade,ifthen(Condicao <> '', Condicao+' and ', '')+
        CampoPesquisa+' COLLATE Latin1_General_CI_AI like '+
        quotedstr('%'+edtValorPesquisa.Text+'%')+
        ifthen( GroupBy <> '', 'Group by '+GroupBy , '')+
        ifthen( OrderBy <> '', 'Order by '+OrderBy , '')  , Campos)
  end
  else
  begin
     if Tabela <> '' then
       srcPesquisa.Dataset := Controller.GetSelect(Tabela, ifthen(Condicao <> '', Condicao+' and ', '')+'0=0'+
       ifthen( GroupBy <> '', 'Group by '+GroupBy , '')+
       ifthen( OrderBy <> '', 'Order by '+OrderBy , '')  , Campos)
     else
        srcPesquisa.Dataset := Controller.GetDataset(Entidade,ifthen(Condicao <> '', Condicao+' and ', '')+'0=0'+
        ifthen( GroupBy <> '', 'Group by '+GroupBy , '')+
        ifthen( OrderBy <> '', 'Order by '+OrderBy , '')  , Campos);
  end;
  MapperEntidade.Dataset := srcPesquisa.DataSet;
  lbregistros.caption:= inttostr(srcPesquisa.DataSet.recordcount)+' linhas';
end;

procedure TTemplateFormComTabGridDetalhes.grdEntidadeDblClick(Sender: TObject);
begin
  inherited;
  if Operacao <> '' then
     btnCancelar.Click;
  btnAlterar.Click;
end;

procedure TTemplateFormComTabGridDetalhes.grdEntidadeTitleClick(
  Column: TColumn);
begin
  inherited;
  TClientDataSet(srcPesquisa.Dataset).IndexFieldNames:=  Column.fieldname;
end;

procedure TTemplateFormComTabGridDetalhes.FormCreate(Sender: TObject);
begin
  inherited;
  RefreshDataSet;
  if Ordem <> '' then
     TClientDataSet(srcPesquisa.Dataset).IndexFieldNames:=  Ordem;
  CampoPesquisa := 'T1.Descricao';
end;


procedure TTemplateFormComTabGridDetalhes.PosicionaPageIndex;
begin
   tabPrincipal.ActivePageIndex:= 1;
end;

procedure TTemplateFormComTabGridDetalhes.StringGrid1DblClick(Sender: TObject);
begin
  inherited;
  PosicionaPageIndex;
end;

procedure TTemplateFormComTabGridDetalhes.TabSheet1Show(Sender: TObject);
begin
  inherited;
  if Operacao = '' then
     RefreshDataSet;
end;

procedure TTemplateFormComTabGridDetalhes.TabSheet2Show(Sender: TObject);
begin
  inherited;
  if Operacao = '' then
  begin
    UpdateEntidade(srcPesquisa.DataSet.FieldByName('Codigo').AsString);
    MapperEntidade.SendDataSetToEntidade;
    MapperEntidade.EntidadeToComponent;
  end;
end;

end.
