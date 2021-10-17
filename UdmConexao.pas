unit UdmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXInterBase, Data.DB, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Comp.Client;

type
  TdmConexao = class(TDataModule)
    FDReceituario: TFDConnection;
    FBDReceituario: TFDPhysFBDriverLink;
    FDWReceituario: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
