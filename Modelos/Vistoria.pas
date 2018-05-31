unit Vistoria;

interface

uses
  Orcamento;

  type
  TVistoria = class helper for TOrcamento
  private
    FopcaofarolMilha: string;
    FopcaoChaveRoda: string;
    FopcaoMacaco: string;
    FTextRodas: string;
    FTextFarolMilha: string;
    FopcaoAutoFalantes: string;
    FTextChaveRoda: string;
    FTextMacaco: string;
    FopcaoCdPlayer: string;
    FopcaoTriangulo: string;
    FTextObjetos: string;
    FopcaoEstepe: string;
    FTextAutoFalantes: string;
    FopcaoPneusTraseiros: string;
    FopcaoTapete: string;
    FopcaoExtintor: string;
    FTextCDPlayer: string;
    FopcaoCalotas: string;
    FTextTriangulo: string;
    FopcaoChave: string;
    FTextEstepe: string;
    FTextPneusTraseiros: string;
    FTextTapete: string;
    FTextExtintor: string;
    FopcaoBateria: string;
    FTextCalotas: string;
    FopcaoManual: string;
    FTextChave: string;
    FopcaoPneusDianteiro: string;
    FTextBateria: string;
    FTextManual: string;
    FopcaoAcendendor: string;
    FTextPneusDianteiro: string;
    FopcaoRodas: string;
    FTextAcendedor: string;
    procedure SetopcaoAcendendor(const Value: string);
    procedure SetopcaoAutoFalantes(const Value: string);
    procedure SetopcaoBateria(const Value: string);
    procedure SetopcaoCalotas(const Value: string);
    procedure SetopcaoCdPlayer(const Value: string);
    procedure SetopcaoChave(const Value: string);
    procedure SetopcaoChaveRoda(const Value: string);
    procedure SetopcaoEstepe(const Value: string);
    procedure SetopcaoExtintor(const Value: string);
    procedure SetopcaofarolMilha(const Value: string);
    procedure SetopcaoMacaco(const Value: string);
    procedure SetopcaoManual(const Value: string);
    procedure SetopcaoPneusDianteiro(const Value: string);
    procedure SetopcaoPneusTraseiros(const Value: string);
    procedure SetopcaoRodas(const Value: string);
    procedure SetopcaoTapete(const Value: string);
    procedure SetopcaoTriangulo(const Value: string);
    procedure SetTextAcendedor(const Value: string);
    procedure SetTextAutoFalantes(const Value: string);
    procedure SetTextBateria(const Value: string);
    procedure SetTextCalotas(const Value: string);
    procedure SetTextCDPlayer(const Value: string);
    procedure SetTextChave(const Value: string);
    procedure SetTextChaveRoda(const Value: string);
    procedure SetTextEstepe(const Value: string);
    procedure SetTextExtintor(const Value: string);
    procedure SetTextFarolMilha(const Value: string);
    procedure SetTextMacaco(const Value: string);
    procedure SetTextManual(const Value: string);
    procedure SetTextObjetos(const Value: string);
    procedure SetTextPneusDianteiro(const Value: string);
    procedure SetTextPneusTraseiros(const Value: string);
    procedure SetTextRodas(const Value: string);
    procedure SetTextTapete(const Value: string);
    procedure SetTextTriangulo(const Value: string);
  public
    [FieldName('opcaoExtintor')]property opcaoExtintor   : string read FopcaoExtintor write SetopcaoExtintor;
    [FieldName('opcaoMacaco')]property opcaoMacaco     : string read FopcaoMacaco write SetopcaoMacaco;
    [FieldName('opcaoChaveRoda')] property opcaoChaveRoda  : string read FopcaoChaveRoda write SetopcaoChaveRoda;
    [FieldName('opcaoBateria')] property opcaoBateria: string read FopcaoBateria write SetopcaoBateria;
    [FieldName('opcaoTriangulo')] property opcaoTriangulo: string read FopcaoTriangulo write SetopcaoTriangulo;
    [FieldName('opcaoCalotas')] property opcaoCalotas: string read FopcaoCalotas write SetopcaoCalotas;
    [FieldName('opcaoAcendendor')] property opcaoAcendendor: string read FopcaoAcendendor write SetopcaoAcendendor;
    [FieldName('opcaofarolMilha')] property opcaofarolMilha: string read FopcaofarolMilha write SetopcaofarolMilha;
    [FieldName('opcaoTapete')] property opcaoTapete: string read FopcaoTapete write SetopcaoTapete;
    [FieldName('opcaoRodas')] property opcaoRodas: string read FopcaoRodas write SetopcaoRodas;
    [FieldName('opcaoCdPlayer')] property opcaoCdPlayer: string read FopcaoCdPlayer write SetopcaoCdPlayer;
    [FieldName('opcaoEstepe')] property opcaoEstepe: string read FopcaoEstepe write SetopcaoEstepe;
    [FieldName('opcaoPneusTraseiros')] property opcaoPneusTraseiros: string read FopcaoPneusTraseiros write SetopcaoPneusTraseiros;
    [FieldName('opcaoPneusDianteiro')] property opcaoPneusDianteiro: string read FopcaoPneusDianteiro write SetopcaoPneusDianteiro;
    [FieldName('opcaoChave')] property opcaoChave: string read FopcaoChave write SetopcaoChave;
    [FieldName('opcaoManual')] property opcaoManual: string read FopcaoManual write SetopcaoManual;
    [FieldName('opcaoAutoFalantes')] property opcaoAutoFalantes: string read FopcaoAutoFalantes write SetopcaoAutoFalantes;
    [FieldName('TextExtintor')] property TextExtintor: string read FTextExtintor write SetTextExtintor;
    [FieldName('TextMacaco')] property TextMacaco: string read FTextMacaco write SetTextMacaco;
    [FieldName('TextChaveRoda')] property TextChaveRoda: string read FTextChaveRoda write SetTextChaveRoda;
    [FieldName('TextTriangulo')] property TextTriangulo: string read FTextTriangulo write SetTextTriangulo;
    [FieldName('TextCalotas')] property TextCalotas: string read FTextCalotas write SetTextCalotas;
    [FieldName('TextBateria')] property TextBateria: string read FTextBateria write SetTextBateria;
    [FieldName('TextAutoFalantes')] property TextAutoFalantes: string read FTextAutoFalantes write SetTextAutoFalantes;
    [FieldName('TextCDPlayer')] property TextCDPlayer: string read FTextCDPlayer write SetTextCDPlayer;
    [FieldName('TextRodas')] property TextRodas: string read FTextRodas write SetTextRodas;
    [FieldName('TextTapete')] property TextTapete: string read FTextTapete write SetTextTapete;
    [FieldName('TextFarolMilha')] property TextFarolMilha: string read FTextFarolMilha write SetTextFarolMilha;
    [FieldName('TextAcendedor')] property TextAcendedor: string read FTextAcendedor write SetTextAcendedor;
    [FieldName('TextEstepe')] property TextEstepe: string read FTextEstepe write SetTextEstepe;
    [FieldName('TextPneusTraseiros')] property TextPneusTraseiros: string read FTextPneusTraseiros write SetTextPneusTraseiros;
    [FieldName('TextPneusDianteiro')] property TextPneusDianteiro: string read FTextPneusDianteiro write SetTextPneusDianteiro;
    [FieldName('TextChave')] property TextChave: string read FTextChave write SetTextChave;
    [FieldName('TextManual')] property TextManual: string read FTextManual write SetTextManual;
    [FieldName('TextObjetos')] property TextObjetos: string read FTextObjetos write SetTextObjetos;
  end;

implementation

{ TVistoria }

procedure TVistoria.SetopcaoAcendendor(const Value: string);
begin
  FopcaoAcendendor := Value;
end;

procedure TVistoria.SetopcaoAutoFalantes(const Value: string);
begin
  FopcaoAutoFalantes := Value;
end;

procedure TVistoria.SetopcaoBateria(const Value: string);
begin
  FopcaoBateria := Value;
end;

procedure TVistoria.SetopcaoCalotas(const Value: string);
begin
  FopcaoCalotas := Value;
end;

procedure TVistoria.SetopcaoCdPlayer(const Value: string);
begin
  FopcaoCdPlayer := Value;
end;

procedure TVistoria.SetopcaoChave(const Value: string);
begin
  FopcaoChave := Value;
end;

procedure TVistoria.SetopcaoChaveRoda(const Value: string);
begin
  FopcaoChaveRoda := Value;
end;

procedure TVistoria.SetopcaoEstepe(const Value: string);
begin
  FopcaoEstepe := Value;
end;

procedure TVistoria.SetopcaoExtintor(const Value: string);
begin
  FopcaoExtintor := Value;
end;

procedure TVistoria.SetopcaofarolMilha(const Value: string);
begin
  FopcaofarolMilha := Value;
end;

procedure TVistoria.SetopcaoMacaco(const Value: string);
begin
  FopcaoMacaco := Value;
end;

procedure TVistoria.SetopcaoManual(const Value: string);
begin
  FopcaoManual := Value;
end;

procedure TVistoria.SetopcaoPneusDianteiro(const Value: string);
begin
  FopcaoPneusDianteiro := Value;
end;

procedure TVistoria.SetopcaoPneusTraseiros(const Value: string);
begin
  FopcaoPneusTraseiros := Value;
end;

procedure TVistoria.SetopcaoRodas(const Value: string);
begin
  FopcaoRodas := Value;
end;

procedure TVistoria.SetopcaoTapete(const Value: string);
begin
  FopcaoTapete := Value;
end;

procedure TVistoria.SetopcaoTriangulo(const Value: string);
begin
  FopcaoTriangulo := Value;
end;

procedure TVistoria.SetTextAcendedor(const Value: string);
begin
  FTextAcendedor := Value;
end;

procedure TVistoria.SetTextAutoFalantes(const Value: string);
begin
  FTextAutoFalantes := Value;
end;

procedure TVistoria.SetTextBateria(const Value: string);
begin
  FTextBateria := Value;
end;

procedure TVistoria.SetTextCalotas(const Value: string);
begin
  FTextCalotas := Value;
end;

procedure TVistoria.SetTextCDPlayer(const Value: string);
begin
  FTextCDPlayer := Value;
end;

procedure TVistoria.SetTextChave(const Value: string);
begin
  FTextChave := Value;
end;

procedure TVistoria.SetTextChaveRoda(const Value: string);
begin
  FTextChaveRoda := Value;
end;

procedure TVistoria.SetTextEstepe(const Value: string);
begin
  FTextEstepe := Value;
end;

procedure TVistoria.SetTextExtintor(const Value: string);
begin
  FTextExtintor := Value;
end;

procedure TVistoria.SetTextFarolMilha(const Value: string);
begin
  FTextFarolMilha := Value;
end;

procedure TVistoria.SetTextMacaco(const Value: string);
begin
  FTextMacaco := Value;
end;

procedure TVistoria.SetTextManual(const Value: string);
begin
  FTextManual := Value;
end;

procedure TVistoria.SetTextObjetos(const Value: string);
begin
  FTextObjetos := Value;
end;

procedure TVistoria.SetTextPneusDianteiro(const Value: string);
begin
  FTextPneusDianteiro := Value;
end;

procedure TVistoria.SetTextPneusTraseiros(const Value: string);
begin
  FTextPneusTraseiros := Value;
end;

procedure TVistoria.SetTextRodas(const Value: string);
begin
  FTextRodas := Value;
end;

procedure TVistoria.SetTextTapete(const Value: string);
begin
  FTextTapete := Value;
end;

procedure TVistoria.SetTextTriangulo(const Value: string);
begin
  FTextTriangulo := Value;
end;

end.
