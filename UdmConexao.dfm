object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 268
  Width = 350
  object FDReceituario: TFDConnection
    Params.Strings = (
      'Database=D:\Projetos\Receituario\data\SIAGRIDB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=LOCALHOST'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 16
  end
  object FBDReceituario: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    Left = 56
    Top = 72
  end
  object FDWReceituario: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 128
  end
end
