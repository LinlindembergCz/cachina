unit EquipeDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateDetalhesComTabGrid, Data.DB,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient, Vcl.DBCtrls, Mapper, GenericEntidade;

type
  TFormEquipeDetalhes = class(TTemplateFormComTabGridDetalhes)
    edtDescricao: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    cboCodigoFuncionario: TDBLookupComboBox;
    srcItemEquipe: TDataSource;
    DBGrid2: TDBGrid;
    srgCargos: TDataSource;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    chkAtiva: TCheckBox;
    cboResponsavel: TComboBox;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure grdEntidadeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    MapperItemEquipe : TMapper;
    ItemEquipe       : TGenericEntidade;
    procedure SalvarItens(CodigoEquipe: string);
    procedure MapearCamposItem;
    procedure GetItens(Codigo: string = '');
    procedure GetItemEquipe;
    procedure GetCargos(Codigo: string = '');
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEquipeDetalhes: TFormEquipeDetalhes;

implementation

{$R *.dfm}

uses ControllerTabelas, EntidadeFactory, DBUtils, Constantes, Principal,
  StrUtils, FuncionariosDetalhes;

procedure TFormEquipeDetalhes.btnAlterarClick(Sender: TObject);
begin
  inherited;
   GetItens;
end;

procedure TFormEquipeDetalhes.btnConfirmarClick(Sender: TObject);
var
  CodigoEquipe: string;
begin
  if Operacao = opeInsert then
  begin
     CodigoEquipe := trim(TControllerTabelas(Controller).GetMaxEntidade('Equipe'));
   end
  else
  begin
    CodigoEquipe := MapperEntidade.GetValueEntidade('Codigo');
  end;
  MapperEntidade.SendValueToFieldEntidade('Codigo',  CodigoEquipe );
  inherited;
  if srcItemEquipe.dataset.state in [dsinsert, dsedit] then
     srcItemEquipe.dataset.post;
  SalvarItens(CodigoEquipe);
end;

procedure TFormEquipeDetalhes.btnExcluirClick(Sender: TObject);
begin
  inherited;
  GetItens;
end;

procedure TFormEquipeDetalhes.SalvarItens(CodigoEquipe: string);
begin
  if srcItemEquipe.dataSet.recordcount > 0 then
  begin
    TControllerTabelas(Controller).DeleteSQL('ItemEquipe','CodigoEquipe='+CodigoEquipe);

    MapperItemEquipe.dataSet := srcItemEquipe.dataSet;
    srcItemEquipe.dataSet.first;
    while not srcItemEquipe.dataSet.eof do
    begin
      MapperItemEquipe.Entidade := TEntidadeFactory.Criar(tpItemEquipe);

      MapperItemEquipe.SendDataSetToEntidade;

      MapperItemEquipe.SendValueToFieldEntidade( 'CodigoEquipe', CodigoEquipe);
      MapperItemEquipe.SendValueToFieldEntidade( 'ParticipacaoReal',
                                                  MapperItemEquipe.GetValueEntidade('Participacao') );
      Controller.Inserir(MapperItemEquipe.Entidade);

      srcItemEquipe.dataSet.next;
    end;

    GetItens(CodigoEquipe);
  end;
end;

procedure TFormEquipeDetalhes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  FormPrincipal.ShowForm(TFormFuncionariosDetalhes, FormPrincipal.ActFuncionarios, true);
  FillLookUpCombobox(tpFuncionarios,cboCodigoFuncionario,'Codigo','Nome');
end;

procedure TFormEquipeDetalhes.btnInserirClick(Sender: TObject);
begin
  inherited;
  GetItens('0');
  chkAtiva.Checked := true;
  if FormPrincipal.CodigoPessoa <> '' then
     cboResponsavel.ItemIndex:= cboResponsavel.Items.IndexOfObject(
                                TObject(strtoInt(
                                FormPrincipal.CodigoPessoa)) );
end;

procedure TFormEquipeDetalhes.btnPesquisarClick(Sender: TObject);
begin
  Condicao:=  ' Codigo IN (select CodigoEquipe from '+
              ' ItemEquipe inner join Funcionarios func on CodigoFuncionario = func.Codigo '+
              ' where Nome COLLATE Latin1_General_CI_AI Like '+quotedstr( '%'+edtValorPesquisa.text+'%' )+
              ') or '+CampoPesquisa+' COLLATE Latin1_General_CI_AI like '+
              quotedstr('%'+edtValorPesquisa.Text+'%') ;

  srcPesquisa.Dataset := Controller.GetDataset( Entidade,ifthen(Condicao <> '', Condicao, '') , Campos);
  MapperEntidade.Dataset := srcPesquisa.DataSet;
  //inherited;
end;

procedure TFormEquipeDetalhes.Button1Click(Sender: TObject);
var
  count :integer;
  Peso: Double;

begin
  inherited;
  if cboCodigoFuncionario.text <> '' then
  begin
    //if not  srcItemEquipe.dataset.locate('CodigoFuncionario',cboCodigoFuncionario.keyvalue,[] ) then
    begin
      srcItemEquipe.dataset.append;
      srcItemEquipe.dataset.fieldbyname('Codigo').value               := srcItemEquipe.dataset.recordcount + 1;
      srcItemEquipe.dataset.fieldbyname('CodigoFilial').value         := 1;
      srcItemEquipe.dataset.fieldbyname('CodigoEquipe').asstring      := '0';
      srcItemEquipe.dataset.fieldbyname('CodigoFuncionario').asstring := cboCodigoFuncionario.keyvalue;
      srcItemEquipe.dataset.fieldbyname('Nome').asstring              := cboCodigoFuncionario.text;
      srcItemEquipe.dataset.fieldbyname('DescricaoCargo').asstring    := TControllerTabelas(Controller).GetValue(
                                                                         'Cargos inner join Funcionario on CodigoCargo = Cargos.Codigo',
                                                                         'Funcionario.Codigo='+ srcItemEquipe.dataset.fieldbyname('CodigoFuncionario').asstring,
                                                                         'Cargos.Descricao');
      srcItemEquipe.dataset.post;
    end;
    {
    count := 0;
    srcItemEquipe.dataset.first;
    while not srcItemEquipe.dataset.eof  do
    begin
       srcItemEquipe.dataset.edit;
       if TControllerTabelas(Controller).GetValue('Cargos',
          'Descricao='+ quotedstr(srcItemEquipe.dataset.fieldbyname('DescricaoCargo').asstring),
          'TemProducao') = 'S' then
       begin
          count := count + 1;
          srcItemEquipe.dataset.fieldbyname('Participacao').value := 100;
       end
       else
          srcItemEquipe.dataset.fieldbyname('Participacao').value := 0;
       srcItemEquipe.dataset.post;
       srcItemEquipe.dataset.next;
    end;

    srcItemEquipe.dataset.first;
    while not srcItemEquipe.dataset.eof  do
    begin
       Peso = strtofloatDef(TControllerTabelas(Controller).GetValue(
               'Funcionarios',
               'Codigo='+ srcItemEquipe.dataset.fieldbyname('CodigoFuncionario').asstring,
               'Comissao') , 0 );
       srcItemEquipe.dataset.edit;
       srcItemEquipe.dataset.fieldbyname('Participacao').value := (srcItemEquipe.dataset.fieldbyname('Participacao').asfloat / count) ;
       srcItemEquipe.dataset.post;

       srcItemEquipe.dataset.next;
    end;
    }
  end;

end;

procedure TFormEquipeDetalhes.Button2Click(Sender: TObject);
begin
  inherited;
  {
  try
    if ItemEquipe <> nil then
       FreeandNil(ItemEquipe);
    ItemEquipe := TEntidadeFactory.Criar(tpItemEquipe);

    MapperItemEquipe.Entidade := ItemEquipe;
    MapperItemEquipe.Dataset := srcItemEquipe.DataSet;

    MapperItemEquipe.SendDataSetToEntidade;

    Controller.Excluir( MapperItemEquipe.Entidade );
  finally
    ItemEquipe.free;
  end;
  }
  if not srcItemEquipe.Dataset.isEmpty then
  begin
     if srcItemEquipe.dataset.fieldbyname('CodigoEquipe').asstring <> '0' then
     begin
       TControllertabelas(Controller).Excluir( MapperItemEquipe.Entidade );
       srcItemEquipe.Dataset.delete;
     end
     else
       srcItemEquipe.Dataset.delete;
  end;
end;

procedure TFormEquipeDetalhes.Button3Click(Sender: TObject);
var
  FuncionariosList: TstringList;
  DataSetFuncionarios: TClientDataset;
begin
  inherited;
  DataSetFuncionarios:= TClientDataset.create(nil);
  DataSetFuncionarios.CloneCursor( TClientDataset(srcItemEquipe.dataset) , true);
  btnInserir.click;
  GetItens('0');

  DataSetFuncionarios.first;
  while not DataSetFuncionarios.eof  do
  begin
    srcItemEquipe.dataset.append;
    srcItemEquipe.dataset.fieldbyname('Codigo').value               := srcItemEquipe.dataset.recordcount + 1;
    srcItemEquipe.dataset.fieldbyname('CodigoFilial').value         := 1;
    srcItemEquipe.dataset.fieldbyname('CodigoEquipe').asstring      := '0';
    srcItemEquipe.dataset.fieldbyname('Nome').asstring              := DataSetFuncionarios.fieldbyname('Nome').asstring;
    srcItemEquipe.dataset.fieldbyname('CodigoFuncionario').asstring := DataSetFuncionarios.fieldbyname('CodigoFuncionario').asstring;
    srcItemEquipe.dataset.fieldbyname('Participacao').asstring      := DataSetFuncionarios.fieldbyname('Participacao').asstring;
    srcItemEquipe.dataset.fieldbyname('Gratificacao').asstring      := DataSetFuncionarios.fieldbyname('Gratificacao').asstring;
    srcItemEquipe.dataset.fieldbyname('TipoGratificacao').asstring  := DataSetFuncionarios.fieldbyname('TipoGratificacao').asstring;

    srcItemEquipe.dataset.post;

    DataSetFuncionarios.next;
  end;

end;

procedure TFormEquipeDetalhes.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
    if (Operacao = opeUpdate) or (Operacao = opeInsert) then
  begin
    GetItemEquipe;
  end;
end;

procedure TFormEquipeDetalhes.GetItemEquipe;
begin
  if ItemEquipe <> nil then
    FreeandNil(ItemEquipe);
  ItemEquipe := TEntidadeFactory.Criar(tpItemEquipe);
  MapperItemEquipe.Entidade := ItemEquipe;
  MapperItemEquipe.Dataset := srcItemEquipe.DataSet;
  MapperItemEquipe.SendDataSetToEntidade;
  MapperItemEquipe.EntidadeToComponent;
end;

procedure TFormEquipeDetalhes.FormCreate(Sender: TObject);
begin
  Controller := TControllerTabelas.Create;
  Entidade   := TEntidadeFactory.Criar(tpEquipe);
//Condicao   := 'CodigoFuncionario= '+ FormPrincipal.CodigoPessoa;
  campos:= 'T1.*, (Select Nome From Funcionarios where Codigo = T1.CodigoFuncionario) as Responsavel';
  inherited;
  with MapperEntidade do
  begin
    Associar('Codigo',nil);
    Associar('Descricao', edtDescricao);
    Associar('CodigoFuncionario', cboResponsavel);
    Associar('Status', chkAtiva);
  end;
  FillLookUpCombobox(tpFuncionarios,cboCodigoFuncionario,'Codigo','Nome');
  FillCombobox(tpFuncionarios,cboResponsavel,
  'Codigo not in ( select CodigoFuncionario from ItemEquipe)',
  'Codigo',
  'Nome' ,'Nome');

  MapearCamposItem;
end;

procedure TFormEquipeDetalhes.MapearCamposItem;
begin
  MapperItemEquipe   := TMapper.create(nil, srcItemEquipe.DataSet );
  with MapperItemEquipe do
  begin
    Associar('CodigoEquipe', nil);
    Associar('CodigoFuncionario', cboCodigoFuncionario);
    Associar('CodigoFilial', nil);
    Associar('Participacao', nil);
    Associar('ParticipacaoReal', nil);
    Associar('Gratificacao', nil);
    Associar('TipoGratificacao', nil);
  end;
end;

procedure TFormEquipeDetalhes.GetItens(Codigo: string = '');
var
  Condicao: string;
  CodigoEquipe: string;
begin
  if Codigo <> '' then
     CodigoEquipe := Codigo
  else
     CodigoEquipe := srcEntidade.dataset.fieldByName('Codigo').asstring;

  Condicao:= ' CodigoEquipe=' + ifthen(CodigoEquipe <> '',CodigoEquipe,'0') ;

  srcItemEquipe.Dataset := Controller.GetSelect('ItemEquipe T1 inner join Funcionarios func on ' +
                                                ' func.Codigo = T1.CodigoFuncionario '+
                                                ' left join Cargos on func.CodigoCargo = Cargos.Codigo'
                                                , Condicao , 'T1.*, func.Nome, Cargos.Descricao as DescricaoCargo');

  GetCargos(CodigoEquipe);
end;

procedure TFormEquipeDetalhes.grdEntidadeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( srcPesquisa.dataset.FieldByName('Status').asstring <> 'S' )  then
     grdEntidade.Canvas.Font.Color := clSilver;
  grdEntidade.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormEquipeDetalhes.GetCargos(Codigo: string = '');
var
  Condicao: string;
begin
  if Codigo <> '' then
     Condicao:= ' T1.Codigo IN (Select CodigoFuncionario From ItemEquipe where CodigoEquipe=' + Codigo +')'
  else
     Condicao:= ' T1.Codigo IN (Select CodigoFuncionario From ItemEquipe where CodigoEquipe=' + quotedstr(srcEntidade.dataset.fieldByName('Codigo').asstring)+')';

  srgCargos.Dataset := Controller.GetSelect('Funcionarios T1 inner join Cargos carg on  ' +
                                            ' carg.Codigo = T1.CodigoCargo ', Condicao +' GROUP BY carg.Descricao' ,
                                            ' carg.Descricao, count(*) as Quantidade');
end;



procedure TFormEquipeDetalhes.TabSheet2Show(Sender: TObject);
begin
  inherited;
  GetItens;
end;

end.
