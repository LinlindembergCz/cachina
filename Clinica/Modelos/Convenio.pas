unit Convenio;

interface

uses
 CAtribEntity,  GenericEntidade;

type
  [TableName('Convenio')]
  TConvenio = class(TGenericEntidade)
  private
    FDescricao: string;
    FCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
  public
    [KeyField('Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
  end;

implementation

{ TConvenio }

procedure TConvenio.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TConvenio.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

End.


