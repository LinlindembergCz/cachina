inherited FormConstrutoraProdutosDetalhes: TFormConstrutoraProdutosDetalhes
  ClientWidth = 661
  ExplicitTop = -19
  ExplicitWidth = 677
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 661
    ExplicitWidth = 661
    inherited tabPrincipal: TPageControl
      Width = 659
      ExplicitWidth = 659
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 651
        inherited grdEntidade: TDBGrid
          Width = 651
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Width = 540
              Visible = True
            end>
        end
        inherited pnlSuperior: TPanel
          Width = 651
          ExplicitWidth = 651
        end
        inherited pnlInferior: TPanel
          Width = 651
          ExplicitWidth = 651
        end
      end
      inherited TabSheet2: TTabSheet
        ExplicitWidth = 651
        inherited TabControl1: TPageControl
          Width = 640
          ExplicitWidth = 640
          inherited TabSheet4: TTabSheet
            ExplicitWidth = 632
            inherited Label4: TLabel
              Top = 220
              ExplicitTop = 220
            end
            inherited SpeedButton4: TSpeedButton
              Top = 214
              ExplicitTop = 214
            end
            inherited SpeedButton3: TSpeedButton
              Top = 171
              ExplicitTop = 171
            end
            inherited SpeedButton2: TSpeedButton
              Top = 134
              ExplicitTop = 134
            end
            inherited Label2: TLabel
              Top = 138
              ExplicitTop = 138
            end
            inherited Label3: TLabel
              Top = 179
              ExplicitTop = 179
            end
            inherited Label1: TLabel
              Top = 53
              ExplicitTop = 53
            end
            inherited Label34: TLabel
              Top = 97
              ExplicitTop = 97
            end
            inherited cboSubGrupo: TComboBox
              Top = 213
              DropDownCount = 20
              ExplicitTop = 213
            end
            inherited cboGrupo: TComboBox
              Top = 172
              DropDownCount = 20
              ExplicitTop = 172
            end
            inherited cboFamilia: TComboBox
              Top = 134
              DropDownCount = 20
              ExplicitTop = 134
            end
            inherited edtDescricao: TEdit
              Top = 49
              ExplicitTop = 49
            end
            inherited cboCodigoSubFase: TComboBox
              Top = 92
              DropDownCount = 20
              ExplicitTop = 92
            end
          end
          inherited TabSheet5: TTabSheet
            ExplicitWidth = 632
            inherited Label7: TLabel
              Width = 38
              Caption = 'Custo :'
              ExplicitWidth = 38
            end
          end
          inherited TabSheet3: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 632
            ExplicitHeight = 448
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 661
    ExplicitWidth = 661
  end
end
