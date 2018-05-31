unit TemplateDetalhesComTab;

interface

uses
  SysUtils, Types, Classes, Variants,  VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, VCL.StdCtrls,
  TemplateDetalhesBase, DB, VCL.ComCtrls, VCL.ExtCtrls, Vcl.Buttons, Vcl.Menus;

type
  TTemplateFormComTabDetalhes = class(TTemplateFormBaseDetalhes)
    tabPrincipal: TPageControl;
    TabSheet1: TTabSheet;
    btnRelatorio: TSpeedButton;
    PopupRelatorio: TPopupMenu;
    procedure btnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private

  protected
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemplateFormComTabDetalhes: TTemplateFormComTabDetalhes;

implementation

{$R *.dfm}

uses Mapper;

procedure TTemplateFormComTabDetalhes.btnInserirClick(Sender: TObject);
begin
  inherited;
  //AjustaComponentes;
end;

procedure TTemplateFormComTabDetalhes.btnRelatorioClick(Sender: TObject);
begin
  inherited;
  PopupRelatorio.Popup(screen.DesktopLeft,screen.DesktopTop);
end;

procedure TTemplateFormComTabDetalhes.FormCreate(Sender: TObject);
begin
  inherited;
  tabPrincipal.ActivePageIndex := 0;
end;

end.
