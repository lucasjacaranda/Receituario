inherited frmCadastroClientes: TfrmCadastroClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 116
  ClientWidth = 647
  KeyPreview = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 653
  ExplicitHeight = 145
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 647
    Height = 73
    ExplicitTop = 8
    ExplicitWidth = 512
    ExplicitHeight = 266
  end
  inherited pnlBotoes: TPanel
    Top = 73
    Width = 647
    TabOrder = 2
    ExplicitTop = 73
    ExplicitWidth = 647
    inherited btnGravar: TSpeedButton
      Left = 257
      Width = 44
      Anchors = [akLeft, akTop, akBottom]
      OnClick = btnGravarClick
      ExplicitLeft = 257
      ExplicitWidth = 44
    end
    inherited btnCancelar: TSpeedButton
      Left = 311
      Width = 48
      Hint = ''
      Anchors = [akLeft, akTop, akBottom]
      ExplicitLeft = 311
      ExplicitWidth = 48
    end
  end
  object gpbCpfCliente: TGroupBox
    Left = 469
    Top = 8
    Width = 170
    Height = 49
    Caption = ' CPF do Cliente'
    TabOrder = 1
    object mskCpfCliente: TMaskEdit
      Left = 10
      Top = 16
      Width = 150
      Height = 21
      EditMask = '999.999.999-99;1; '
      MaxLength = 14
      TabOrder = 0
      Text = '   .   .   -  '
      OnExit = mskCpfClienteExit
    end
  end
  object gpbNomeCliente: TGroupBox
    Left = 8
    Top = 8
    Width = 450
    Height = 49
    Caption = ' Nome do Cliente'
    TabOrder = 0
    object edtNomeCliente: TEdit
      Left = 10
      Top = 16
      Width = 430
      Height = 21
      MaxLength = 60
      TabOrder = 0
    end
  end
end
