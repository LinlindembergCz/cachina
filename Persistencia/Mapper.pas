unit Mapper;

interface

uses
  TypInfo,  Rtti, Windows, Messages, SysUtils, Variants, Classes,  DB, Vcl.DBCtrls,
  GenericEntidade, CAtribEntity,Vcl.ComCtrls, Vcl.ComStrs, Vcl.Mask, Vcl.Forms,
  Vcl.Grids, Vcl.Samples.Calendar, Vcl.StdCtrls, VCL.Dialogs;

type
   TMapper = class
   private
     FEntidade: TGenericEntidade;
     FFieldMapList: TStringList;
     FDataset: TDataSet;
     FStrings : TStrings;
     class var Contexto : TRttiContext;
     class var TypObj   : TRttiType;

     procedure SetEntidade(const Value: TGenericEntidade);
     procedure SetFieldMapList(const Value: TStringList);
     procedure SetDataset(const Value: TDataSet);
     function EhCheckBoxValido(Componente: TComponent): boolean;
     function EhCalendarValido(Componente: TComponent): boolean;
     function EhLabelValido(Componente: TComponent): boolean;
     function EhComponenteValido(Componente:TComponent):boolean;
     procedure SetValuePropertyString(Componente: TComponent; Prop: TRttiProperty);
     procedure SetValuePropertyInteger(Componente: TComponent; Prop: TRttiProperty);
     procedure SetValuePropertyReal(Componente: TComponent; Prop: TRttiProperty);
     function EhMonthCalendarValido(Componente: TComponent): boolean;
     function EhLookUpComboboxValido(Componente: TComponent): boolean;
     function GetKeyField(Obj: TGenericEntidade): String;
     function GetTableName(Obj: TGenericEntidade): String;
    procedure GetClassesProc(AClass: TPersistentClass);

   protected
     function EhComboboxValido(Componente: TComponent): boolean;
     function EhEditValido(Componente: TComponent): boolean;
     function EhMemoValido(Componente: TComponent): boolean;
     function EhCalendarEditValido(Componente: TComponent): boolean;
   public
     property Entidade:TGenericEntidade read FEntidade write SetEntidade;
     property FieldMapList:TStringList read FFieldMapList write SetFieldMapList;
     property Dataset:TDataSet read FDataset write SetDataset;

     procedure EnumClasses(Strings: TStrings);
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
     procedure Associar(Field: string; Componente: TObject; Value : string ='');
     constructor Create( PEntidade: TGenericEntidade;   PDataSet:TDataSet = nil);
     procedure IsRiquired(Fields : array of string );

     //não está sendo usado
      class function GetTableNameClasse(ClassInfo: Pointer): String;
      procedure Send_ComponentToObject(Form: TForm;Objeto: TGenericEntidade);
      procedure Send_DataSetToComponent(DataSet: TDataSet; Form: TForm);
      procedure Send_DataSetToObject(DataSet: TDataSet;Objeto: TGenericEntidade);
      procedure Send_ObjectToComponent(Objeto: TGenericEntidade; Form: TForm);
      procedure Send_ObjectToDataSet(Objeto: TGenericEntidade;DataSet: TDataSet; State: TDataSetState);
      procedure SetValue(Form: TForm; Objeto: TGenericEntidade; Propriedade, Value: string);
      function Parser_SQLDelete(Objeto: TGenericEntidade): string;
      function Parser_SQLInsert(Objeto: TGenericEntidade): string;
      function Parser_SQLSelect(Entidade: TGenericEntidade; Where: string= ''): string;
      function Parser_SQLSelectId(Entidade: TGenericEntidade; id: string= ''): string;
      function Parser_SQLUpdate(Objeto: TGenericEntidade): string;
      procedure SetValue2(Form: TForm; Objeto: TGenericEntidade; Propriedade, Value: string);

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
  result:= (Componente is TMemo);// and (copy(TMemo(Componente).Name,1,4) = 'memo');
end;

function  TMapper.EhComboboxValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TCombobox);// and (copy(TCombobox(Componente).Name,1,3) = 'cbo');
end;

function  TMapper.EhLookUpComboboxValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TDBLookUpCombobox);// and (copy(TDBLookUpCombobox(Componente).Name,1,3) = 'cbo');
end;

function  TMapper.EhEditValido(Componente: TComponent):boolean;
begin
  result:= ( (Componente is TEdit) );//  and (copy(TEdit(Componente).Name,1,3) = 'edt');
end;

function  TMapper.EhCalendarEditValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TDateTimePicker );// and (copy(TDateTimePicker(Componente).Name,1,4) = 'date');
end;

function  TMapper.EhMonthCalendarValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TMonthCalendar );// and (copy(TMonthCalendar(Componente).Name,1,4) = 'date');
end;

function  TMapper.EhCalendarValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TCalendar );// and (copy(TCalendar(Componente).Name,1,4) = 'date');
end;

function  TMapper.EhCheckBoxValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TCheckBox );// and (copy(TCheckBox(Componente).Name,1,3) = 'chk');
end;

function  TMapper.EhLabelValido(Componente: TComponent):boolean;
begin
  result:= (Componente is TLabel );// and (copy(TLabel(Componente).Name,1,2) = 'lb');
end;

function  TMapper.EhComponenteValido(Componente:TComponent):boolean;
begin
   result:= (Componente is TEdit)      or
            (Componente is TMemo)      or
            (Componente is TCombobox)  or
            (Componente is TDBLookUpCombobox)  or
            (Componente is TLabel) or
            (Componente is TDateTimePicker) or
            (Componente is TCalendar) or
            (Componente is TCheckBox) or
            (Componente is TMonthCalendar);
end;

procedure  TMapper.SetValuePropertyString( Componente: TComponent; Prop: TRttiProperty );
begin
    if EhMemoValido(Componente) then
       Prop.SetValue(TObject(FEntidade), (TMemo(Componente)).Text)
    else
    if EhComboboxValido(Componente) then
    begin
      if TCombobox(Componente).ItemIndex > -1 then
         Prop.SetValue(TObject(FEntidade),
           TCombobox(Componente).Items.Strings[TCombobox(Componente)
           .ItemIndex])
    end
    else
    if EhEditValido(Componente) then
       Prop.SetValue(TObject(FEntidade), (TEdit(Componente)).Text)
    else
    if EhLabelValido(Componente) then
       Prop.SetValue(TObject(FEntidade), (TLabel(Componente)).caption);
end;

procedure  TMapper.SetValuePropertyInteger( Componente: TComponent; Prop: TRttiProperty );
begin
   if EhEditValido(Componente) then
      Prop.SetValue(TObject(FEntidade),
        strtointdef((TEdit(Componente)).Text, 0))
   else
   if EhLabelValido(Componente) then
      Prop.SetValue(TObject(FEntidade),
        strtointdef((TLabel(Componente)).caption, 0))
   else if EhComboboxValido(Componente) then
   begin
     if TCombobox(Componente).ItemIndex > -1 then
        Prop.SetValue(TObject(FEntidade),
          Integer(TCombobox(Componente).Items.Objects
          [TCombobox(Componente).ItemIndex]));
   end
   else
   if EhLookUpComboboxValido(Componente) then
   begin
     if TDBlookUpCombobox(Componente).text <> '' then
        Prop.SetValue(TObject(FEntidade),
          Integer(TDBlookUpCombobox(Componente).KeyValue) );
   end
   else
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
          if EhCalendarEditValido(Componente) then
            Prop.SetValue(TObject(FEntidade), TDateTimePicker(Componente).Date)
          else if EhMonthCalendarValido(Componente) then
            Prop.SetValue(TObject(FEntidade), TMonthCalendar(Componente).Date)
          else if EhCalendarValido(Componente) then
            Prop.SetValue(TObject(FEntidade), TCalendar(Componente).CalendarDate)
          else if EhCheckBoxValido(Componente) then
            Prop.SetValue(TObject(FEntidade),
               ifThen((Componente as TCheckBox).Checked, 'S', 'N'))
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
              TLabel(Componente).caption := FormatFloat('0.00;',Field.AsFloat)
           else
              TLabel(Componente).caption := Field.AsString;
        end
        else
        if EhEditValido(Componente) then
        begin
          if Field.DataType = ftFloat then
             TEdit(Componente).Text := FormatFloat('0.00;',Field.AsFloat)
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
              TCombobox(Componente).ItemIndex:= TCombobox(Componente).Items.IndexOfObject(
                                                TObject(Field.AsInteger) )
           else
              TCombobox(Componente).ItemIndex:= TCombobox(Componente).Items.IndexOf(Field.AsString);
        end
        else
        if EhLookUpComboboxValido(Componente) then
            TDBLookUpCombobox(Componente).KeyValue := Field.Value
        else
        if EhCalendarEditValido(Componente) then
           TDateTimePicker(Componente).Date := Field.AsDateTime
        else
        if EhMonthCalendarValido(Componente) then
           TMonthCalendar(Componente).Date := Field.AsDateTime
        else
        if EhCalendarValido(Componente) then
           TCalendar(Componente).CalendarDate := Field.AsDateTime
        else
        if EhCheckBoxValido(Componente)  then
           TCheckBox(Componente).Checked:=  (Field.AsString <> '') and (Field.AsString[1] = 'S');
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
       FDataset.FieldByName(Campo).ReadOnly:= false;
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
       if Componente is TEdit         then (Componente as TEdit).Text := ''
       else
       if Componente is TLabel        then (Componente as TLabel).caption := ''
       else
       if Componente is TCombobox     then (Componente as TCombobox).ItemIndex := -1
       else
       if Componente is TCheckBox     then (Componente as TCheckBox).Checked:= false
       else
       if Componente is TDateTimePicker then (Componente as TDateTimePicker).Date:= 0
       else
       if Componente is TDBLookUpCombobox then (Componente as TDBLookUpCombobox).Keyvalue:= null;
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
           Prop.SetValue(TObject(FEntidade), strtodatetime(Value));
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
   FDataSet.FieldByName(Field).ReadOnly:= false;
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
          begin
             application.messagebox( Pchar('Campo '+ Prop.Name +' é requerido!'),Pchar('Campo obrigatorio'),MB_ICONWARNING + mb_ok );
             abort;
          end;
        end;
     end;
   end;
end;

procedure TMapper.Send_ComponentToObject(Form:TForm;
                                               Objeto: TGenericEntidade);
var
   j  : Integer;
   Prop     : TRttiProperty;
   Atributo : TCustomAttribute;
   Componente:TComponent;
begin
   try
      FEntidade := Objeto;
      Contexto := TRttiContext.Create;
      for j := 0 to Form.componentcount -1 do
      begin
         TypObj := Contexto.GetType(Objeto.ClassInfo);
         for Prop in TypObj.GetProperties do
         begin
            Componente := Form.components[j];
            if Prop.Name = Componente.Name  then
            begin
               if EhComponenteValido(Componente) then
               begin
                  if EhCalendarEditValido(Componente) then
                    Prop.SetValue(TObject(FEntidade), TDateTimePicker(Componente).Date)
                  else if EhMonthCalendarValido(Componente) then
                    Prop.SetValue(TObject(FEntidade), TMonthCalendar(Componente).Date)
                  else if EhCalendarValido(Componente) then
                    Prop.SetValue(TObject(FEntidade), TCalendar(Componente).CalendarDate)
                  else if EhCheckBoxValido(Componente) then
                    Prop.SetValue(TObject(FEntidade),
                       ifThen((Componente as TCheckBox).Checked, 'S', 'N'))
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
               TEdit(Form.components[j]).Text:= '';
            end;
         end;
      end;
   finally
      Contexto.Free;
   end;
end;

procedure TMapper.Send_ObjectToComponent( Objeto: TGenericEntidade;
                                                Form:TForm);
var
   j  : Integer;
   Prop     : TRttiProperty;
begin
   try
      Contexto := TRttiContext.Create;
      for j := 0 to Form.componentcount -1 do
      begin
         TypObj := Contexto.GetType(Objeto.ClassInfo);
         for Prop in TypObj.GetProperties do
         begin
            if Prop.Name = Form.components[j].Name then
            begin
               TEdit(Form.components[j]).text := Prop.GetValue(Objeto).AsString;
            end;
         end;
      end;
   finally
     Contexto.Free;
   end;
end;

procedure TMapper.Send_ObjectToDataSet( Objeto: TGenericEntidade;
                                              DataSet: TDataSet;
                                              State:TDataSetState );
var
   j  : Integer;
   Prop     : TRttiProperty;
begin
   try
      if State = dsInsert then
         DataSet.append
      else
         DataSet.edit;

      Contexto := TRttiContext.Create;
      for j := 0 to DataSet.Fieldcount -1 do
      begin
         TypObj := Contexto.GetType(Objeto.ClassInfo);
         for Prop in TypObj.GetProperties do
         begin
            if Prop.Name = DataSet.Fields[j].fieldname then
            begin
               DataSet.FieldByName(Prop.Name).AsString  := Prop.GetValue(Objeto).AsString;
            end;
         end;
      end;

      DataSet.post;
   finally
     Contexto.Free;
   end;
end;

procedure TMapper.Send_DataSetToComponent( DataSet: TDataSet;
                                                 Form: TForm);
var
   j  : Integer;
   Prop     : TRttiProperty;
begin
   try
      Contexto := TRttiContext.Create;
      for j := 0 to Form.componentcount -1 do
      begin
         TypObj := Contexto.GetType(DataSet.ClassInfo);
         if DataSet.FindField(Form.components[j].Name) <> nil then
         begin
            TEdit(Form.components[j]).text := DataSet.FieldByName(Form.components[j].Name).AsString;
         end;
      end;
   finally
     Contexto.Free;
   end;
end;

procedure TMapper.Send_DataSetToObject( DataSet:TDataSet;
                                              Objeto: TGenericEntidade);
var
   j  : Integer;
   Prop     : TRttiProperty;
   Atributo : TCustomAttribute;
begin
   try
      Contexto := TRttiContext.Create;
      for j := 0 to DataSet.fieldcount -1 do
      begin
         TypObj := Contexto.GetType(Objeto.ClassInfo);
         for Prop in TypObj.GetProperties do
         begin
            if Prop.Name = DataSet.fields[j].FieldName  then
            begin
               Prop.SetValue( Objeto , DataSet.FieldByName(Prop.Name ).AsString );

            end;
         end;
      end;
   finally
     Contexto.Free;
   end;
end;

procedure TMapper.SetValue(Form:TForm;
                           Objeto: TGenericEntidade;
                           Propriedade,
                           Value: string);
var
   j  : Integer;
   Prop     : TRttiProperty;
   Atributo : TCustomAttribute;
begin
   try
      Contexto := TRttiContext.Create;
      for j := 0 to Form.componentcount -1 do
      begin
         TypObj := Contexto.GetType(Objeto.ClassInfo);
         for Prop in TypObj.GetProperties do
         begin
            if (Prop.Name = Form.components[j].Name) and (Propriedade = Prop.Name)  then
            begin
               if value <> '' then
                  Prop.SetValue( Objeto , Value )
               else
                  Prop.SetValue( Objeto , TEdit(Form.components[j]).Text );
            end;
         end;
      end;
   finally
      Contexto.Free;
   end;
end;

function TMapper.GetKeyField(Obj: TGenericEntidade): String;
var
   Contexto: TRttiContext;
   TypObj: TRttiType;
   Atributo: TCustomAttribute;
   strTable: String;
begin
   try
      Contexto := TRttiContext.Create;
      TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
      for Atributo in TypObj.GetAttributes do
      begin
         if Atributo is KeyField then
         begin
            result:= TableName(Atributo).Name;
         end;
      end;
   finally
     Contexto.Free;
   end;
end;

function TMapper.GetTableName(Obj: TGenericEntidade): String;
var
   Contexto: TRttiContext;
   TypObj: TRttiType;
   Atributo: TCustomAttribute;
   strTables: String;
begin
   try
      Contexto := TRttiContext.Create;
      TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
      for Atributo in TypObj.GetAttributes do
      begin
         if (Atributo is TableName) //or ( Atributo is JOIN)
         then
         begin
            strTables := strTables +' '+TableName(Atributo).Name;
         end;
      end;
      result:= strTables
   finally
     Contexto.Free;
   end;
end;

function TMapper.Parser_SQLInsert(Objeto: TGenericEntidade): string;
var
   Prop   : TRttiProperty;
   Values : string;
   Fields : string;
begin
   try
      Contexto := TRttiContext.Create;
      TypObj := Contexto.GetType(Objeto.ClassInfo);
      for Prop in TypObj.GetProperties do
      begin
         if Fields = '' then
         begin
            Fields := Prop.Name;
            Values := quotedstr(Prop.GetValue(Objeto).AsString);
         end
         else
         begin
            Fields := Fields +' , '+ Prop.Name;
            Values := Values +' , '+ quotedstr(Prop.GetValue(Objeto).AsString);
         end;
      end;
      result := ' INSERT INTO '+ GetTableName( Objeto ) +' ('+Fields +') VALUES ('+Values+')';
   finally
      Contexto.Free;
   end;
end;

function TMapper.Parser_SQLSelect(Entidade: TGenericEntidade;Where : string  = ''): string;
var
   Prop   : TRttiProperty;
   Values : string;
   Fields : string;
   Atributo: TCustomAttribute;
begin
   try
      Contexto := TRttiContext.Create;
      TypObj := Contexto.GetType(Entidade.ClassInfo);
      for Prop in TypObj.GetProperties do
      begin
          if Fields = '' then
           Fields := Fields + Prop.Name
        else
           Fields := Fields +' , '+ Prop.Name;
      end;
      result := 'Select  '+ Fields +' From '+ GetTableName( Entidade )+ifthen( Where <> '', ' where '+ Where, '');
   finally
      Contexto.Free;
   end;
end;

function TMapper.Parser_SQLSelectId(Entidade: TGenericEntidade; id : string = ''): string;
var
   Prop   : TRttiProperty;
   Values : string;
   Fields : string;
   Atributo: TCustomAttribute;
   Where: string;
begin
   try
      Contexto := TRttiContext.Create;
      TypObj := Contexto.GetType(Entidade.ClassInfo);
      for Prop in TypObj.GetProperties do
      begin
       for Atributo in Prop.GetAttributes do
        begin
           if Atributo is KeyField then
           begin
              Where := KeyField(Atributo).Name + ' = '+ ifthen( id <> '', id, Prop.GetValue(Entidade).AsString );
           end;
        end;
        if Fields = '' then
           Fields := Fields + Prop.Name
        else
           Fields := Fields +' , '+ Prop.Name;
      end;
      result := 'Select  '+ Fields +' From '+ GetTableName( Entidade )+' where '+ Where ;
   finally
      Contexto.Free;
   end;
end;

function TMapper.Parser_SQLUpdate(Objeto: TGenericEntidade): string;
var
   Prop   : TRttiProperty;
   Values : string;
   Fields : string;
   Atributo: TCustomAttribute;
   Where: string;
begin
  try
     Contexto := TRttiContext.Create;
     TypObj := Contexto.GetType(Objeto.ClassInfo);
     for Prop in TypObj.GetProperties do
     begin
       for Atributo in Prop.GetAttributes do
       begin
          if Atributo is KeyField then
          begin
             Where := KeyField(Atributo).Name + ' = '+Prop.GetValue(Objeto).AsString
          end;
       end;

       if Fields = '' then
          Fields := Fields + Prop.Name +' = '+quotedstr(Prop.GetValue(Objeto).AsString)
       else
          Fields := Fields +' , '+ Prop.Name +' = '+quotedstr(Prop.GetValue(Objeto).AsString);
     end;
     result := 'Update '+ GetTableName( Objeto ) +' Set '+ Fields +
               ' where '+ Where ;
  finally
     Contexto.Free;
  end;
end;


function TMapper.Parser_SQLDelete(Objeto: TGenericEntidade): string;
var
   Prop   : TRttiProperty;
   Values : string;
   Atributo: TCustomAttribute;
   Where: string;
begin
   try
      Contexto := TRttiContext.Create;
      TypObj := Contexto.GetType(Objeto.ClassInfo);
      for Prop in TypObj.GetProperties do
      begin
         for Atributo in Prop.GetAttributes do
         begin
            if Atributo is KeyField then
            begin
               Where := KeyField(Atributo).Name + ' = '+ Prop.GetValue(Objeto).AsString
            end;
         end;
      end;
      result := 'Delete From '+ GetTableName( Objeto ) +' where '+Where;
   finally
      Contexto.Free;
   end;
end;

procedure TMapper.SetValue2(Form:TForm;
                                 Objeto: TGenericEntidade;
                                 Propriedade,
                                 Value: string);
var
   j  : Integer;
   Prop     : TRttiProperty;
   Atributo : TCustomAttribute;
begin
   try
      Contexto := TRttiContext.Create;
      for j := 0 to Form.componentcount -1 do
      begin
         TypObj := Contexto.GetType(Objeto.ClassInfo);
         for Prop in TypObj.GetProperties do
         begin
            if (Prop.Name = Form.components[j].Name) and (Propriedade = Prop.Name)  then
            begin
               if value <> '' then
                  Prop.SetValue( Objeto , Value )
               else
                  Prop.SetValue( Objeto , TEdit(Form.components[j]).Text );
            end;
         end;
      end;
   finally
      Contexto.Free;
   end;
end;

procedure TMapper.EnumClasses(Strings: TStrings);
begin
  if not Assigned(Strings) then
     Exit;
     FStrings := Strings;
  with TClassFinder.Create(nil, True) do
  begin
    try
       GetClasses(GetClassesProc);
    finally
       Free;
     end;
  end;
end;

procedure TMapper.GetClassesProc(AClass: TPersistentClass);
begin
   if ( AClass.InheritsFrom(TGenericEntidade) ) and
      ( AClass.ClassName<> 'TGenericEntidade')  then
     if FStrings.IndexOf(AClass.ClassName) = -1 then
        FStrings.AddObject(AClass.ClassName, AClass.Create );
end;

end.
