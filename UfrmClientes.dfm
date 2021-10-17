inherited frmClientes: TfrmClientes
  KeyPreview = True
  ShowHint = True
  Visible = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    inherited btnExcluir: TSpeedButton
      Top = 4
      ExplicitTop = 4
    end
    inherited btnIncluir: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited btnEditar: TSpeedButton
      Top = 4
      ExplicitTop = 4
    end
  end
  inherited DBGrid: TDBGrid
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo do Cliente'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome do Cliente'
        Width = 691
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Title.Caption = 'Cpf do Cliente'
        Width = 86
        Visible = True
      end>
  end
  inherited dsGrid: TDataSource
    Left = 408
    Top = 200
  end
end
