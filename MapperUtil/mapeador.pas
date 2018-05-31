unit mapeador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ValEdit, Vcl.StdCtrls, Strutils,
  Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    ValueListEditor1: TValueListEditor;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtSize: TEdit;
    cboComponent: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    edtItens: TEdit;
    chkChave: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    radFMX: TRadioButton;
    radVCL: TRadioButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cboComponentChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  i:integer;
  field: string;
  fieldtype: string;
  PosicaoY:integer;
  Chave    :boolean;
  CampoChave: string;
  ClassName: string;
  Itens: string;


  function WhriteTEdit(Campo: string; Posicao, Ordem:integer): string;
  begin
     result:= ' object lb'+ Campo +':  TLabel'+
              '   Height = 17'+
              ifthen(radFMX.Checked,' Position.X = 8','left=8')+
              ifthen(radFMX.Checked,' Position.Y = '+ inttostr(Posicao),'top='+inttostr(Posicao))+
              ifthen(radFMX.Checked,' Text = '''+Campo+'''','   caption = '''+Campo+'''')+
              '   Width = 120' +
              ' end'+
              ' object edt'+Campo+': TEdit' +
              '   TabOrder = '+ inttostr(Ordem)+
              ifthen(radFMX.Checked,' Position.X = 88',' left=88')+
              ifthen(radFMX.Checked,' Position.Y = '+ inttostr(Posicao),' top = '+ inttostr(Posicao))+
              '   Width = 100'+
              '   Height = 22'+
              '   KillFocusByReturn = False'+
              ' end'+#13;
     PosicaoY := PosicaoY + 32;
  end;

  function WhriteTCalendarEdit(Campo: string; Posicao, Ordem:integer): string;
  begin
     result:= ' object lb'+ Campo +':  TLabel'+
              '   Height = 17'+
              ifthen(radFMX.Checked,'   Position.X = 8', 'left=8')+
              ifthen(radFMX.Checked,'   Position.Y = '+ inttostr(Posicao),'top='+inttostr(Posicao) )+
              ifthen(radFMX.Checked,'   Text = '+quotedstr(Campo),' caption='+quotedstr(Campo) )+
              '   Width = 120' +
              ' end'+
              ' object edt'+Campo+ifthen(radFMX.Checked,': TCalendarEdit', ' : TDatatimePicker') +
              '   TabOrder = '+ inttostr(Ordem)+
              '   Cursor = crIBeam '+
              ifthen(radFMX.Checked,'   Position.X = 88', 'left=88' )+
              ifthen(radFMX.Checked,'   Position.Y = '+ inttostr(Posicao),'top='+inttostr(Posicao) )+
              '   Width = 100'+
              '   Height = 22'+
              '   KillFocusByReturn = False'+
              ' end'+#13;
     PosicaoY := PosicaoY + 32;
  end;



  function WhriteTCombobox(Campo: string;
                           Posicao, Ordem:integer;
                           Itens : string = ''): string;
  var
    itensList: TStringList;
    I        : integer;
    texto    : string;
    ListBoxItem: string;
    Aux:integer;
  begin
    itensList:= TStringList.Create;
    if Itens <> '' then
     begin
       texto:= EmptyStr;
       Aux:= 1;
       if radFMX.Checked then
       begin
           for I := 1 to length( Itens ) - 1  do
           begin
              texto:= texto + Itens[i];
              if Itens[i+1] = ',' then
              begin
                   texto:= '  object TListBoxItem'+
                           '     Height = 19'+
                           '     Text = '+ quotedstr( trim(Copy( texto , 1, length(texto) - 1 )))+
                           '     Width = 19'+
                           '  end';
                           itensList.Add(texto);

                   texto:= EmptyStr;
              end;
           end;
       end
       else
       begin
         ListBoxItem:= StringReplace( Itens, ',', #13, [rfReplaceAll]);
       end;


       if ( radFMX.Checked ) and ( texto <> '' ) then
          itensList.Add('  object TListBoxItem'+
                     '     Height = 19'+
                     ifthen(radFMX.Checked,'     Text = '+ quotedstr(texto),
                     '     caption = '+ quotedstr(texto) )+
                     '     Width = 19'+
                     '  end')
       else
       begin
         itensList.Add(' Items.Strings = ( '+ ListBoxItem +')');
       end;

     end;
     result:= ' object lb'+ Campo +':  TLabel'+
              '   Height = 17 '+
              ifthen(radFMX.Checked,'   Position.X = 8 ',' left=8' )+
              ifthen(radFMX.Checked,'   Position.Y = '+ inttostr(Posicao),' top='+ inttostr(Posicao))+
              ifthen(radFMX.Checked,'   Text = '+quotedstr(Campo),'   caption = '+quotedstr(Campo))+
              '   Width = 120' +
              ' end '+
              ' object cbo'+Campo+': TComboBox '+
              '   Height = 22'+
              ifthen(radFMX.Checked,'   Position.X = 88', ' left=88' )+
              ifthen(radFMX.Checked,'   Position.Y = '+ inttostr(Posicao),' top='+ inttostr(Posicao) ) +
              '   TabOrder = '+ inttostr(Ordem)+
              '   Width = 100 '+ itensList.Text +
              ' end';
     PosicaoY := PosicaoY + 32;
  end;


begin
  ClassName:= Edit2.Text;

  Memo1.Clear;
  Memo2.Clear;
  Memo3.Clear;
  Memo4.Clear;


  Memo1.Lines.Add('unit '+ Edit2.Text);
  Memo1.Lines.Add('');
  Memo1.Lines.Add('interface');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('uses');
  Memo1.Lines.Add(' CAtribEntity,  GenericEntidade;');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('type');
  Memo1.Lines.Add('  [TableName('+quotedstr(ClassName)+')]');
  Memo1.Lines.Add('  T'+ClassName+' = class(TGenericEntidade)');
  Memo1.Lines.Add('public');



  memo2.Lines.Add( 'CREATE TABLE '+ClassName+'(' );
  for I := 1 to ValueListEditor1.RowCount-1 do
  begin
    if Pos(';', ValueListEditor1.Cells[0,i]) = 0 then
       field     := ValueListEditor1.Cells[0,i]
    else
    begin
       field     := Copy(ValueListEditor1.Cells[0,i],1, Pos(';', ValueListEditor1.Cells[0,i]) -1);
       Chave     := true;
      {if CampoChave <> '' then
          CampoChave:= CampoChave +', '+ field+' ASC'
       else}
       CampoChave:= field+' ASC';
    end;

    fieldtype := ValueListEditor1.Cells[1,i];

    if lowercase(ValueListEditor1.Cells[0,i]) = 'codigo' then
      Memo1.Lines.Add( '  [KeyField('+quotedstr(field)+')]')
    else
      Memo1.Lines.Add( '  [FieldName('+quotedstr(field)+')]');

    if Pos('string',lowercase(fieldtype)) > 0 then
       Memo1.Lines.Add( '  property '+ field+': string;' )
    else
       Memo1.Lines.Add( '  property '+ field+': '+
                                       copy(fieldtype,1,pos(';',fieldtype)-1)+';' );
    ////////////////////
    if Pos('string',lowercase(fieldtype)) > 0 then
    begin
       memo2.Lines.Add('  '+field+' '+
       StringReplace(copy(fieldtype,1,pos(';',fieldtype)-1),'string','varchar',[]) +',');

       if (Pos('tcombobox',lowercase(fieldtype)) > 0) then
       begin
          Itens:= Copy(ValueListEditor1.Cells[1,i],
               Pos('=',ValueListEditor1.Cells[1,i])+1,
                length(ValueListEditor1.Cells[1,i]) );

          Memo3.Lines.Add('associar('+quotedstr(field)+','+ ifthen( cboComponent.Text <> '',' cbo'+field ,' nil') +');');
          Memo4.Lines.Add(WhriteTCombobox(field, PosicaoY, i-1, Itens ));
       end
       else
       begin
          Memo3.Lines.Add('associar('+quotedstr(field)+','+  ifthen( cboComponent.Text <> '',' edt'+field,'nil')  +');');
          Memo4.Lines.Add(WhriteTEdit(field, PosicaoY, i-1));
       end;
    end
    else
    if Pos('boolean', lowercase(fieldtype) ) > 0 then
    begin
       memo2.Lines.Add('  '+field+' varchar(1) ,');
       Memo3.Lines.Add('associar('+quotedstr(field)+', '+ ifthen( cboComponent.Text <> '',' chk'+field,'nil') +');');
    end
    else
    if pos('integer',lowercase(fieldtype)) > 0 then
    begin
       memo2.Lines.Add('  '+field+' int '+  ifthen(Chave, 'IDENTITY(1,1) NOT NULL, ','') );

       if pos('tcombobox',lowercase(fieldtype)) > 0 then
       begin
          Memo3.Lines.Add('associar('+quotedstr(field)+', '+ ifthen( cboComponent.Text <> '',' cbo'+field,'nil')  +');');
          Memo4.Lines.Add(WhriteTCombobox(field, PosicaoY, i-1));
       end
       else
       begin
          Memo3.Lines.Add('associar('+quotedstr(field)+','+  ifthen( cboComponent.Text <> '',' edt'+field,'nil') +');');
          Memo4.Lines.Add(WhriteTEdit(field, PosicaoY, i-1));
       end;

    end
    else
    if  pos('double',lowercase(fieldtype)) > 0 then
    begin
       memo2.Lines.Add('  '+field+' Float ,');
       Memo3.Lines.Add('associar('+quotedstr(field)+','+  ifthen( cboComponent.Text <> '',' edt'+field,'nil') +');');
       Memo4.Lines.Add(WhriteTEdit(field, PosicaoY, i-1));
    end
    else
    if Pos('tdatetime',lowercase(fieldtype)) > 0 then
    begin
       memo2.Lines.Add('  '+field+' Datetime ,');
       Memo3.Lines.Add('associar('+quotedstr(field)+','+  ifthen( cboComponent.Text <> '',' date'+field,'nil') +');');
       Memo4.Lines.Add(WhriteTCalendarEdit(field, PosicaoY, i-1));
    end;

  end;
  Memo1.Lines.Add( 'end;');

  if CampoChave <> '' then
  begin
    Memo2.Lines.Add( ' CONSTRAINT [PK_'+ ClassName +'] PRIMARY KEY CLUSTERED '+
                   ' ( '+ CampoChave +' )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF,'+
                   ' IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON,'+
                   ' ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'+
                   ' ) ON [PRIMARY]');
  end
  else
    Memo2.Lines.Add( ')' );

  Memo2.Lines.Add( 'GO');

  Memo1.Lines.Add('');
  Memo1.Lines.Add('implementation');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('End.');
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if combobox1.Text = 'string' then
     ValueListEditor1.InsertRow( edit1.Text + ifthen(chkChave.Checked,';Keyfield','') ,
                                 combobox1.Text+'('+
                                 edtSize.Text+')'+';'+
                                 cboComponent.Text +
                                 ifthen(edtItens.Text <> '' ,'='+edtItens.Text , '' ) , true)
  else
     ValueListEditor1.InsertRow( edit1.Text+ ifthen(chkChave.Checked,';Keyfield', '' ) ,
                                 combobox1.Text+';'+
                                 cboComponent.Text +
                                 ifthen( edtItens.Text <> '' , '='+edtItens.Text , '' ) , true);
  chkChave.Checked := false;
  edtItens.Text    := '';
end;

procedure TForm2.cboComponentChange(Sender: TObject);
begin
   if cboComponent.text = 'TCombobox' then
   begin
      edtItens.Visible := true;
   end;
   edtItens.Text    := '';
end;

end.
