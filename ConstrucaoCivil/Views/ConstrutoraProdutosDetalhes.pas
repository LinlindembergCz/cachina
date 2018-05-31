unit ConstrutoraProdutosDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ProdutosDetalhes, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFormConstrutoraProdutosDetalhes = class(TFormProdutosDetalhes)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConstrutoraProdutosDetalhes: TFormConstrutoraProdutosDetalhes;

implementation

{$R *.dfm}

end.
