inherited frmCadastroProdutos: TfrmCadastroProdutos
  Caption = 'Cadastro de Produtos'
  ClientHeight = 170
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitHeight = 199
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Height = 127
    ExplicitHeight = 188
  end
  inherited pnlBotoes: TPanel
    Top = 127
    TabOrder = 3
    ExplicitTop = 127
    inherited btnGravar: TSpeedButton
      OnClick = btnGravarClick
    end
    inherited btnCancelar: TSpeedButton
      Hint = ''
    end
  end
  object gpbNomeProduto: TGroupBox
    Left = 10
    Top = 8
    Width = 494
    Height = 49
    Caption = ' Nome do Produto'
    TabOrder = 0
    object edtNomeProduto: TEdit
      Left = 10
      Top = 18
      Width = 474
      Height = 21
      MaxLength = 60
      TabOrder = 0
    end
  end
  object gpbValorProduto: TGroupBox
    Left = 10
    Top = 63
    Width = 240
    Height = 49
    Caption = 'Valor do Produto'
    TabOrder = 1
    object edtValorProduto: TEdit
      Left = 10
      Top = 18
      Width = 220
      Height = 21
      MaxLength = 60
      NumbersOnly = True
      TabOrder = 0
      OnExit = edtValorProdutoExit
    end
  end
  object rdgControleEspecial: TRadioGroup
    Left = 264
    Top = 63
    Width = 240
    Height = 49
    Caption = ' Exige Controle Especial'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 2
  end
end
