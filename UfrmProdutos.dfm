inherited frmProdutos: TfrmProdutos
  Caption = 'Cadastro de Produtos'
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
        Title.Caption = 'C'#243'digo do Produto'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome do Produto'
        Width = 552
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor do Produto'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTROLE'
        Title.Caption = 'Controle Especial'
        Width = 98
        Visible = True
      end>
  end
end
