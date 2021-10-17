unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ExtCtrls, Vcl.Menus, UConexaoControle;

type
  TfrmPrincipal = class(TForm)
    mmMenu: TMainMenu;
    miCadastros: TMenuItem;
    TBevel: TBevel;
    miClientes: TMenuItem;
    miPedidosVenda: TMenuItem;
    miLancarPedido: TMenuItem;
    miConsultarPedido: TMenuItem;
    miProdutos: TMenuItem;
    procedure miClientesClick(Sender: TObject);
    procedure miProdutosClick(Sender: TObject);
  private
    procedure AbrirFormGrid(InstanceClass: TComponentClass; var Reference);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses UfrmClientes, UfrmProdutos;

{$R *.dfm}

procedure TfrmPrincipal.AbrirFormGrid(InstanceClass: TComponentClass;
  var Reference);
begin
  if TForm(Reference) = nil then
   begin
    Application.CreateForm(InstanceClass, Reference);

    TForm(Reference).BringToFront;
    TForm(Reference).Show;
   end;
end;

procedure TfrmPrincipal.miClientesClick(Sender: TObject);
begin
  AbrirFormGrid(TfrmClientes, frmClientes);
end;

procedure TfrmPrincipal.miProdutosClick(Sender: TObject);
begin
  AbrirFormGrid(TfrmProdutos, frmProdutos);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
