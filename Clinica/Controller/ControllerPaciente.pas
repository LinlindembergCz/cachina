unit ControllerPaciente;

interface

uses
   Windows, DB,  Messages, SysUtils, Variants, Classes, ControllerTabelas,
    GenericEntidade;

Type
  TControllerPaciente = class(TControllerTabelas )
  private

  public
    procedure Inserir(Objecto: TGenericEntidade);override;
    procedure Atualizar(Objecto: TGenericEntidade);override;
    procedure Excluir(Objecto: TGenericEntidade); override;
    function GetDataSet(Objecto: TGenericEntidade;Condicao: string; Fields: string= ''):TDataset;
    function GetSelect(Tabela, Condicao:string; Fields: string= ''):TDataset;
    procedure Inicializar(Sender:TStringList);
    function NomeExiste(Nome, Cateira: string): boolean;
  end;

  const
    SQLConsultaPaciente = 'Triagem T1 '+
                          ' left join Especialista esp on esp."Codigo" = T1."CodigoEspecialista" '+
                          ' left join Convenio con on con."Codigo" = T1."CodigoConvenio"' ;

    CamposPaciente = 'T1.*, Esp."Descricao" As "Psicologo", con."Descricao" As "NomeConvenio"';

implementation

{ TControllerAgenda }

uses  GenericDAO, Mapper, EntidadeFactory;

procedure TControllerPaciente.Atualizar(Objecto: TGenericEntidade);
begin
    inherited  ;
end;

procedure TControllerPaciente.Excluir(Objecto: TGenericEntidade);
begin
    inherited  ;
end;

function TControllerPaciente.GetDataSet(Objecto: TGenericEntidade; Condicao,
  Fields: string): TDataset;
begin
   result:= inherited  ;
end;


function TControllerPaciente.GetSelect(Tabela, Condicao,
  Fields: string): TDataset;
begin
    result := inherited  ;
end;

procedure TControllerPaciente.Inicializar(Sender: TStringList);
begin

end;

procedure TControllerPaciente.Inserir(Objecto: TGenericEntidade);
begin
    inherited  ;
end;

function TControllerPaciente.NomeExiste(Nome,Cateira: string): boolean;
begin
  if trim(Cateira) <> '' then
     result:= TGenericDAO.GetValue( TMapper.GetTableNameClasse(
                                     TEntidadeFactory.GetClassInfo(tpTriagem) ),
                                     ' "Nome" = '''+ Nome +
                                     ''' or '+
                                     ' "NumeroCarteira" ='''+ Cateira +'''' ,
                                     'Nome' ) <> ''
  else
     result:= TGenericDAO.GetValue( TMapper.GetTableNameClasse(
                                     TEntidadeFactory.GetClassInfo(tpTriagem) ),
                                     ' "Nome" = '''+ Nome +'''', 'Nome' ) <> '';
end;

end.
