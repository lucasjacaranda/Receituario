object frmPrincipal: TfrmPrincipal
  AlignWithMargins = True
  Left = 0
  Top = 0
  Align = alCustom
  Anchors = []
  AutoSize = True
  BorderStyle = bsSingle
  Caption = 'Receitu'#225'rio'
  ClientHeight = 600
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object TBevel: TBevel
    Left = 0
    Top = 0
    Width = 1000
    Height = 600
    Align = alClient
    ExplicitWidth = 1118
    ExplicitHeight = 225
  end
  object mmMenu: TMainMenu
    Left = 40
    Top = 80
    object miCadastros: TMenuItem
      Caption = 'Cadastros'
      object miClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = miClientesClick
      end
      object miProdutos: TMenuItem
        Caption = 'Produtos'
        OnClick = miProdutosClick
      end
    end
    object miPedidosVenda: TMenuItem
      Caption = 'Pedidos de venda'
      object miLancarPedido: TMenuItem
        Caption = 'Lan'#231'ar pedido'
      end
      object miConsultarPedido: TMenuItem
        Caption = 'Consultar pedidos'
      end
    end
  end
end
