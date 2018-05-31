unit TemplateComboEditDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  Graphics, Controls, Forms, Dialogs, StdCtrls,
 EntidadeFactory;

type
  TTemplateFormComboboEditDialog = class(TForm)
    Button1: TButton;
    Button2: TButton;
    lbEntidade: TLabel;
    ComboEdit1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     Codigo: string;
     TipoEntidade: TTipoEntidade;
  end;

var
  TemplateFormComboboEditDialog: TTemplateFormComboboEditDialog;

implementation

{$R *.dfm}

uses DBUtils;

procedure TTemplateFormComboboEditDialog.Button1Click(Sender: TObject);
begin
  if ComboEdit1.ItemIndex > -1 then
  begin
    Codigo:= inttostr( Integer( ComboEdit1.Items.Objects[ComboEdit1.ItemIndex] ) );
    close;
  end;
end;

procedure TTemplateFormComboboEditDialog.Button2Click(Sender: TObject);
begin
  Codigo :='';
  close;
end;

procedure TTemplateFormComboboEditDialog.FormActivate(Sender: TObject);
begin
  //FillCombobox( TipoEntidade , ComboEdit1);
end;

end.

