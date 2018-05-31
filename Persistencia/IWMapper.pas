unit IWMapper;

interface

uses
  TypInfo,  Rtti, Windows, Messages, SysUtils, Variants, Classes,  DB, Grids,
  StdCtrls, Controls, GenericEntidade, CAtribEntity,  dialogs,
  IWGrids, IWCompCalendar, IWCompMemo,  IWCompLabel, IWCompCheckbox, IWCompListbox,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompEdit;

type
   TMapper = class
   private
     FEntidade: TGenericEntidade;
     FFieldMapList: TStringList;
     FDataset: TDataSet;
     procedure SetEntidade(const Value: TGenericEntidade);
     procedure SetFieldMapList(const Value: TStringList);
     procedure SetDataset(const Value: TDataSet);

     function EhCheckBoxValido(Componente: TComponent): boolean;
     function EhCalendarValido(Componente: TComponent): boolean;
     function EhLabelValido(Componente: TComponent): boolean;
     function EhComponenteValido(Componente:TComponent):boolean;
    procedure SetValuePropertyString(Componente: TComponent;
      Prop: TRttiProperty);
    procedure SetValuePropertyInteger(Componente: TComponent;
      Prop: TRttiProperty);
    procedure SetValuePropertyReal(Componente: TComponent; Prop: TRttiProperty);
    function EhMonthCalendarValido(Componente: TComponent): boolean;
    function EhLookUpComboboxValido(Componente: TComponent): boolean;
   protected
     function EhComboboxValido(Componente: TComponent): boolean;
     function EhEditValido(Componente: TComponent): boolean;
     function EhMemoValido(Componente: TComponent): boolean;
     function EhCalendarEditValido(Componente: TComponent): boolean;
   public
     property Entidade:TGenericEntidade read FEntidade write SetEntidade;
     property FieldMapList:TStringList read FFieldMapList write SetFieldMapList;
     property Dataset:TDataSet read FDataset write SetDataset;
     function GetKind(Kind: TTypeKind): char;

     procedure ComponentToEntidade;
     procedure EntidadeToComponent;

     procedure SendValueToFieldEntidade(Field, Value: string);
     function GetValueEntidade(Field: string): string;
     function GetValueDatetimeEntidade(Field: string): TDatetime;

     procedure SendNullToComponent;
     procedure SendValueToFieldDataSet(Field, Value: string);

     procedure SendEntidadeToDataSet;
     procedure SendDataSetToEntidade;

     class function GetTableNameClasse(ClassInfo: Pointer): String;
     procedure Associar(Field: string; Componente: TObject; Value : string ='');


     constructor Create( PEntidade: TGenericEntidade;
                         PDataSet:TDataSet = nil);
     procedure IsRiquired(Fields : array of string );
   end;

implementation

uses
  StrUtils, UtilsString;

constructor TMapper.Create(PEntidade     : TGenericEntidade;
                           PDataSet      : TDataSet = nil);
begin
   FEntidade     := PEntidade;
   FFieldMapList := TStringList.Create;
   FDataset      := PDataSet;
end;

procedure TMapper.SetDataset(const Value: TDataSet);
begin
  FDataset := Value;
end;

procedure TMapper.SetEntidade(const Value: TGenericEntidade);
begin
  FEntidade := Value;
end;

procedure TMapper.SetFieldMapList(const Value: TStringList);
begin
  FFieldMapList := Value;
end;

class function TMapper.GetTableNameClasse(ClassInfo: Pointer): String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Atributo: TCustomAttribute;
  strTable: String;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(ClassInfo);
  for Atributo in TypObj.GetAttributes do
  begin
     if Atributo is TableName then
     begin
        result:= TableName(Atributo).Name;
        exit;
     end;
  end;
end;

procedure TMapper.Associar(Field: string; Componente: TObject; Value : string = '');
begin
  if FFieldMapList.IndexOf(Field) = -1 then
     FFieldMapList.AddObject( Field  , Componente );
  if Value <> '' then
     SendValueToFieldEntidade(Field, Value);
end;

function  TMapper.GetKind( Kind:TTypeKind): char;
begin
   if Kind in [tkWChar, tkLString, tkWString, tkString, tkChar, tkUString] then
      result:= 'S'
   else
   if Kind in [tkFloat] then
      result:= 'R'
   else
   if kind in [tkInteger, tkInt64] then
      result:= 'I';
end;

function  TMapper.EhMemoValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TIWMemo) and (copy(TIWMemo(Componente).Name,1,4) = 'memo');
end;

function  TMapper.EhComboboxValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TIWCombobox) and (copy(TIWCombobox(Componente).Name,1,3) = 'cbo');
end;

function  TMapper.EhLookUpComboboxValido(Componente: TComponent):boolean;
begin
  //result:= (Componente is TIWDBLookUpCombobox) and (copy(TIWDBLookUpCombobox(Componente).Name,1,3) = 'cbo');
end;

function  TMapper.EhEditValido(Componente: TComponent):boolean;
begin
  result:= ( (Componente is TIWEdit) )  and (copy(TIWEdit(Componente).Name,1,3) = 'edt');
end;

function  TMapper.EhCalendarEditValido(Componente: TComponent):boolean;
begin
  //result:= (Componente is TIWDateTimePicker ) and (copy(TIWDateTimePicker(Componente).Name,1,4) = 'date');
end;

function  TMapper.EhMonthCalendarValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TIWCalendar ) and (copy(TIWCalendar(Componente).Name,1,4) = 'date');
end;

function  TMapper.EhCalendarValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TIWCalendar ) and (copy(TIWCalendar(Componente).Name,1,4) = 'date');
end;

function  TMapper.EhCheckBoxValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TIWCheckBox ) and (copy(TIWCheckBox(Componente).Name,1,3) = 'chk');
end;

function  TMapper.EhLabelValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TIWLabel ) and (copy(TIWLabel(Componente).Name,1,2) = 'lb');
end;

function  TMapper.EhComponenteValido(Componente:TComponent):boolean;
begin
   result:= (Componente is TIWEdit)      or
            (Componente is TIWMemo)      or
            (Componente is TIWCombobox)  or
            //(Componente is TIWDBLookUpCombobox)  or
            (Componente is TIWLabel) or
            //(Componente is TIWDateTimePicker) or
            (Componente is TIWCalendar) or
            (Componente is TIWCheckBox) or
            (Componente is TIWCalendar);
end;

procedure  TMapper.SetValuePropertyString( Componente: TComponent; Prop: TRttiProperty );
begin
    if EhMemoValido(Componente) then
       Prop.SetValue(TObject(FEntidade), (TIWMemo(Componente)).Text)
    else
    if EhComboboxValido(Componente) then
    begin
      if TCombobox(Componente).ItemIndex > -1 then
         Prop.SetValue(TObject(FEntidade),
           TIWCombobox(Componente).Items.Strings[TIWCombobox(Componente)
           .ItemIndex])
    end
    else
    if EhEditValido(Componente) then
       Prop.SetValue(TObject(FEntidade), (TIWEdit(Componente)).Text)
    else
    if EhLabelValido(Componente) then
       Prop.SetValue(TObject(FEntidade), (TIWLabel(Componente)).caption);
end;

procedure  TMapper.SetValuePropertyInteger( Componente: TComponent; Prop: TRttiProperty );
begin
   if EhEditValido(Componente) then
      Prop.SetValue(TObject(FEntidade),
        strtointdef((TIWEdit(Componente)).Text, 0))
   else
   if EhLabelValido(Componente) then
      Prop.SetValue(TObject(FEntidade),
        strtointdef((TIWLabel(Componente)).caption, 0))
   else if EhComboboxValido(Componente) then
   begin
     if TIWCombobox(Componente).ItemIndex > -1 then
        Prop.SetValue(TObject(FEntidade),
          Integer(TIWCombobox(Componente).Items.Objects
          [TCombobox(Componente).ItemIndex]));
   end;
   {else
   if EhLookUpComboboxValido(Componente) then
   begin
     if TIWDBlookUpCombobox(Componente).text <> '' then
        Prop.SetValue(TObject(FEntidade),
          Integer(TIWDBlookUpCombobox(Componente).KeyValue) );
   end
   else }
end;

procedure  TMapper.SetValuePropertyReal( Componente: TComponent; Prop: TRttiProperty );
begin
  if EhEditValido(Componente) then
     Prop.SetValue(TObject(FEntidade),
       strtofloatdef(TEdit(Componente).Text, 0))
  else if EhLabelValido(Componente) then
     Prop.SetValue(TObject(FEntidade),
       strtofloatdef((TLabel(Componente)).caption, 0));
end;

procedure  TMapper.ComponentToEntidade;
var
  i, pos   : Integer;
  Contexto : TRttiContext;
  TypObj   : TRttiType;
  Prop     : TRttiProperty;
  PropInfo : PPropInfo;
  Componente : TComponent;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(FEntidade).ClassInfo);

  for Prop in TypObj.GetProperties do
  begin
    i := FFieldMapList.IndexOf(Prop.Name);
    if i > -1 then
    begin
      Componente := TComponent(FFieldMapList.Objects[i]);
      if Componente <> nil then
      begin
        if EhComponenteValido(Componente) then
        begin
         // if EhCalendarEditValido(Componente) then
          //  Prop.SetValue(TObject(FEntidade), TIWDateTimePicker(Componente).Date)
          //else
          {if EhMonthCalendarValido(Componente) then
            Prop.SetValue(TObject(FEntidade), TIWCalendar(Componente).)
          else if EhCalendarValido(Componente) then
            Prop.SetValue(TObject(FEntidade), TIWCalendar(Componente).Date)
          else} if EhCheckBoxValido(Componente) then
            Prop.SetValue(TObject(FEntidade),
               ifThen((Componente as TIWCheckBox).Checked, 'S', 'N'))
          else
          case GetKind(Prop.GetValue(TObject(FEntidade)).Kind) of
            'S':begin
                   SetValuePropertyString( Componente ,Prop );
                end;
            'I':begin
                   SetValuePropertyInteger( Componente ,Prop );
                end;
            'R':begin
                   SetValuePropertyReal( Componente ,Prop );
                end
         end;
        end;
      end
     else//casos especiais
     if Componente <> nil then
        showmessage('Componente ' + Componente.ClassName + ' não implementado!');
    end;
  end;
end;

procedure TMapper.EntidadeToComponent;
var
  i ,  pos : Integer;
  campo: string;
  Componente:TComponent;
  Field: TField;
begin
  for I := 0 to FFieldMapList.Count - 1 do
  begin
    pos := FDataset.FieldDefs.Find(FFieldMapList.Strings[i]).index;
    if pos > -1  then
    begin
      Campo      := FDataset.FieldDefs[pos].Name;
      Componente := TComponent(FFieldMapList.Objects[ i ]);
      Field      := FDataset.FieldByName(Campo);
      if Componente <> nil then
      begin
        if  EhLabelValido(Componente) then
        begin
           if Field.DataType = ftFloat then
              TLabel(Componente).caption := FormatFloat(',0.00;',Field.AsFloat)
           else
              TLabel(Componente).caption := Field.AsString;
        end
        else
        if EhEditValido(Componente) then
        begin
          if Field.DataType = ftFloat then
             TEdit(Componente).Text := FormatFloat(',0.00;',Field.AsFloat)
          else
             TEdit(Componente).Text := Field.AsString;
        end
        else
        if EhMemoValido(Componente)   then
           TMemo(Componente).Text := Field.AsString
        else
        if EhComboboxValido(Componente)  then
        begin
           if Field.DataType = ftInteger   then
              TIWCombobox(Componente).ItemIndex:= TIWCombobox(Componente).Items.IndexOfObject(
                                                TObject(Field.AsInteger) )
           else
              TIWCombobox(Componente).ItemIndex:= TIWCombobox(Componente).Items.IndexOf(Field.AsString);
        end
        else
        {if EhLookUpComboboxValido(Componente) then
            TIWDBLookUpCombobox(Componente).KeyValue := Field.Value
        else
        if EhCalendarEditValido(Componente) then
           TIWDateTimePicker(Componente).Date := Field.AsDateTime
        else  }
        {
        if EhMonthCalendarValido(Componente) then
           TIWCalendar(Componente).Date := Field.AsDateTime
        else
        if EhCalendarValido(Componente) then
           TIWCalendar(Componente).Date := Field.AsDateTime
        else}
        if EhCheckBoxValido(Componente)  then
           TIWCheckBox(Componente).Checked:=  (Field.AsString <> '') and (Field.AsString[1] = 'S');
      end;
    end;
  end;
end;

procedure TMapper.SendEntidadeToDataSet;
var
  i, pos   : Integer;
  Value    : Variant;
  Campo    : string;
begin
  for I := 0 to FFieldMapList.Count - 1 do
  begin
    Campo := FFieldMapList.Strings[i];
    pos   := FDataset.FieldDefs.Find(Campo).index;
    if pos > -1  then
    begin
       //Value := GetPropValue(FEntidade, Campo );
       Value := GetValueEntidade( Campo );
       FDataset.FieldByName(Campo).AsString:= Value;
    end;
  end;
end;

procedure TMapper.SendDataSetToEntidade;
var
  i, pos   : Integer;
  Contexto : TRttiContext;
  TypObj   : TRttiType;
  Prop     : TRttiProperty;
  PropInfo : PPropInfo;
  Componente : TComponent;
begin
  Contexto := TRttiContext.Create;
  TypObj   := Contexto.GetType(TObject(FEntidade).ClassInfo);
  for Prop in TypObj.GetProperties do
  begin
    i:= FFieldMapList.IndexOf(prop.Name);
    if i > -1 then
    begin
       case GetKind( Prop.GetValue(FEntidade).Kind ) of
          'S': Prop.SetValue(TObject(FEntidade), FDataset.FieldByName(prop.Name).AsString);
          'I': Prop.SetValue(TObject(FEntidade), FDataset.FieldByName(prop.Name).AsInteger);
          'R': Prop.SetValue(TObject(FEntidade), FDataset.FieldByName(prop.Name).AsFloat);
       end;
    end;
  end;
end;

procedure TMapper.SendNullToComponent;
var
  i ,  pos : Integer;
  campo: string;
  Componente:TObject;
  Focused: boolean;
begin
  for I := 0 to FFieldMapList.Count - 1 do
  begin
    pos := FDataset.FieldDefs.Find(FFieldMapList.Strings[i]).index;
    Componente := FFieldMapList.Objects[ i ];
    if (pos > -1)  and ( Componente <> nil ) then
    begin
       campo:= FDataset.FieldDefs[pos].Name;
       if Componente is TIWEdit         then (Componente as TIWEdit).Text := ''
       else
       if Componente is TIWLabel        then (Componente as TIWLabel).caption := ''
       else
       if Componente is TIWCombobox     then (Componente as TIWCombobox).ItemIndex := -1
       else
       if Componente is TIWCheckBox     then (Componente as TIWCheckBox).Checked:= false;
       //else
       //if Componente is TIWDateTimePicker then (Componente as TIWDateTimePicker).Date:= 0
       //else
       //if Componente is TIWDBLookUpCombobox then (Componente as TIWDBLookUpCombobox).Keyvalue:= null;
    end;
  end;
end;

procedure  TMapper.SendValueToFieldEntidade(Field, Value: string);
var
  i   : Integer;
  Contexto : TRttiContext;
  TypObj   : TRttiType;
  Prop     : TRttiProperty;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(FEntidade).ClassInfo);
  for Prop in TypObj.GetProperties do
  begin
    if Prop.Name = Field then
    begin
        if Pos('string', lowerCase(Prop.toString)) > 0 then
           Prop.SetValue(TObject(FEntidade), Value)
        else
        if Pos('integer', lowerCase(Prop.toString)) > 0 then
           Prop.SetValue(TObject(FEntidade), strtointdef(Value,0))
        else
        if Pos('double', lowerCase(Prop.toString)) > 0 then
           Prop.SetValue(TObject(FEntidade), strtofloat(Value))
        else
        if Pos('tdatetime', lowerCase(Prop.toString)) > 0 then
           Prop.SetValue(TObject(FEntidade), strtodate(Value));
    end;
  end;
end;

function  TMapper.GetValueEntidade(Field: string): string;
var
  i    : Integer;
  Contexto : TRttiContext;
  TypObj   : TRttiType;
  Prop     : TRttiProperty;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(FEntidade).ClassInfo);
  for Prop in TypObj.GetProperties do
  begin
    if Prop.Name = Field then
    begin
      result:= Prop.GetValue(FEntidade).ToString;

      exit;
    end;
  end;
end;

function  TMapper.GetValueDatetimeEntidade(Field: string): TDatetime;
var
  i    : Integer;
  Contexto : TRttiContext;
  TypObj   : TRttiType;
  Prop     : TRttiProperty;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(FEntidade).ClassInfo);
  for Prop in TypObj.GetProperties do
  begin
    if Prop.Name = Field then
    begin
      result:= TDateTime(Prop.GetValue(TObject(FEntidade)).AsVariant);
      exit;
    end;
  end;
end;

procedure  TMapper.SendValueToFieldDataSet(Field, Value: string);
begin
  FDataSet.FieldByName(Field).AsString  := Value;
end;

procedure TMapper.IsRiquired(Fields : array of string );
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strUpdate, strValues, strWhere: String;
  Atributo: TCustomAttribute;
  Mapper: TMapper;
begin
   Contexto  := TRttiContext.Create;
   TypObj := Contexto.GetType(TObject(FEntidade).ClassInfo);
   for Prop in TypObj.GetProperties do
   begin
     for Atributo in Prop.GetAttributes do
     begin
        if (Atributo is Required) and ( (Length(Fields) = 0) or (IndexOfArray(Prop.Name, Fields) > -1 ) ) then
        begin
          if Prop.GetValue(TObject(FEntidade)).AsString = '' then
             raise Exception.Create('Campo '+ Prop.Name +' é requerido!');
        end;
     end;
   end;
end;

end.
