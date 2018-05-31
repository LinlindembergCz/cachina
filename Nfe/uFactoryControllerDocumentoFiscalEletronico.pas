unit uFactoryControllerDocumentoFiscalEletronico;

interface

uses
uControllerDocumentoFiscalEletronico,Venda, PDV, uGlobais, SysUtils, Empresa,
uServicoVenda;

type
   TFactoryControllerDocumentoFiscalEletronico = class
   public
     class function FabricarControllerDocumentoFiscalEletronico(
     proVenda:TVenda; proServicoVenda:TServicoVenda; proEmpresa:TEmpresa ): TControllerDocumentoFiscalEletronico;
   end;

implementation

class function TFactoryControllerDocumentoFiscalEletronico.FabricarControllerDocumentoFiscalEletronico(
proVenda:TVenda; proServicoVenda:TServicoVenda; proEmpresa:TEmpresa ):TControllerDocumentoFiscalEletronico;
var
  loControllerNFC: TControllerDocumentoFiscalEletronico;
begin
  if proVenda <> nil then
     loControllerNFC := TControllerDocumentoFiscalEletronico.Create('',
     proEmpresa.Pessoa.CNPJCPF, proVenda.SequenciaNotaFiscal,
     proVenda.Serie, proVenda.Especie, proVenda.DataVenda, '', True, nil)
  else
    loControllerNFC := TControllerDocumentoFiscalEletronico.Create;

  loControllerNFC.SempreImprimirNFCE := True;

  if proServicoVenda <> nil then
     loControllerNFC.ServicoVenda := proServicoVenda;

  result:= loControllerNFC;
end;

end.
