program Piscologo;

uses
  VCL.Forms,
  Controller in '..\Controller\Controller.pas',
  CAtribEntity in '..\Persistencia\CAtribEntity.pas',
  Mapper in '..\Persistencia\Mapper.pas',
  GenericDAO in '..\Dao\GenericDAO.pas',
  Constantes in '..\Constantes.pas',
  TemplateDetalhesBase in '..\TemplateDetalhesBase.pas' {TemplateFormBaseDetalhes},
  TemplateDetalhesComTab in '..\TemplateDetalhesComTab.pas' {TemplateFormComTabDetalhes},
  TemplateDetalhesComTabGrid in '..\TemplateDetalhesComTabGrid.pas' {TemplateFormComTabGridDetalhes},
  ControllerTabelas in '..\Controller\ControllerTabelas.pas',
  GenericEntidade in '..\Modelos\GenericEntidade.pas',
  EntidadeFactory in 'Factory\EntidadeFactory.pas',
  Principal in 'Principal.pas' {FormPrincipal},
  TipoAgendamentoDetalhes in 'View\TipoAgendamentoDetalhes.pas' {FormTipoAgendamentoDetalhes},
  ConvenioDetalhes in 'View\ConvenioDetalhes.pas' {FormConvenioDetalhes},
  AgendamentoDetalhes in 'View\AgendamentoDetalhes.pas' {FormAgendamentoDetalhes},
  EspecialistaDetalhes in 'View\EspecialistaDetalhes.pas' {FormEspecialistaDetalhes},
  ControllerAgenda in 'Controller\ControllerAgenda.pas',
  ControllerPaciente in 'Controller\ControllerPaciente.pas',
  srvModBaseDados in 'Conexao\srvModBaseDados.pas' {DSServerModuleBaseDados: TDataModule},
  TriagemDetalhes in 'View\TriagemDetalhes.pas' {FormTriagemDetalhes},
  TemplateListagemBase in '..\TemplateListagemBase.pas' {TemplateFormListagemBase},
  PacienteDetalhes in 'View\PacienteDetalhes.pas' {FormPacienteDetalhes},
  PacienteListagem in 'View\PacienteListagem.pas' {FormPacienteListagem},
  Agendamento in 'Modelos\Agendamento.pas',
  Convenio in 'Modelos\Convenio.pas',
  Especialista in 'Modelos\Especialista.pas',
  Sessoes in 'Modelos\Sessoes.pas',
  TabelaCID in 'Modelos\TabelaCID.pas',
  TipoAgendamento in 'Modelos\TipoAgendamento.pas',
  Triagem in 'Modelos\Triagem.pas',
  DBUtils in '..\DBUtils.pas',
  DialogsUtils in '..\DialogsUtils.pas',
  UtilsNumeros in '..\UtilsNumeros.pas',
  UtilsString in '..\UtilsString.pas',
  RelAgenda in 'Relatorios\RelAgenda.pas' {FormRelAgenda},
  RelFaturmento in 'Relatorios\RelFaturmento.pas' {FormRelFaturamento},
  RelFaturmento2 in 'Relatorios\RelFaturmento2.pas' {FormRelfaturamento2},
  RelFichaPaciente in 'Relatorios\RelFichaPaciente.pas' {FormRelFichaPacinte},
  RelFichaTriagem in 'Relatorios\RelFichaTriagem.pas' {FormRelFichaTriagem},
  RelGuiaConsulta in 'Relatorios\RelGuiaConsulta.pas' {FormRelGuiaConsulta},
  RelGuiaConsulta2 in 'Relatorios\RelGuiaConsulta2.pas' {FormRelGuiaConsulta2},
  RelGuiaFaturamentoAmil in 'Relatorios\RelGuiaFaturamentoAmil.pas' {FormRelGuiaFaturamento},
  RelGuiaFaturamentoAmil1 in 'Relatorios\RelGuiaFaturamentoAmil1.pas' {FormRelGuiaFaturamentoAmil1},
  RelGuiaFaturamentoAmilPreImpressa in 'Relatorios\RelGuiaFaturamentoAmilPreImpressa.pas' {FormRelGuiaFaturamentoAmilPreImpressa},
  RelPesquisaAgenda in 'Relatorios\RelPesquisaAgenda.pas' {FormRelPesquisaAgenda},
  ModuloAgenda in 'Relatorios\ModuloAgenda.pas' {DataModuleConsultaAgenda: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDSServerModuleBaseDados, DSServerModuleBaseDados);
  Application.CreateForm(TDataModuleConsultaAgenda, DataModuleConsultaAgenda);
  Application.Run;

end.
