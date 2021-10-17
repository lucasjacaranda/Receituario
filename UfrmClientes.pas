unit UfrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmGridPadrao, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmClientes = class(TfrmGridPadrao)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    procedure CarregarGrid;
    procedure Destruir;
    procedure ExcluirRegistro;
    procedure AbrirCadastro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses
  UClientesControle, UfrmCadastroClientes;

{$R *.dfm}

procedure TfrmClientes.AbrirCadastro;
begin
  if TForm(frmCadastroClientes) = nil then
   begin
    Application.CreateForm(TfrmCadastroClientes, frmCadastroClientes);
   end;

  frmCadastroClientes.BringToFront;
  frmCadastroClientes.Show;
end;

procedure TfrmClientes.btnEditarClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro;
end;

procedure TfrmClientes.btnExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluirRegistro;
end;

procedure TfrmClientes.btnIncluirClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro;
end;

procedure TfrmClientes.CarregarGrid;
begin
  dsGrid.DataSet := ClientesControle.CarregarGrid('TBLCLIENTE', '', '');
end;

procedure TfrmClientes.Destruir;
begin
  FreeAndNil(dsGrid.DataSet);
  FreeAndNil(frmClientes);
end;

procedure TfrmClientes.ExcluirRegistro;
begin
 dsGrid.DataSet.Delete;
end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Destruir;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarGrid;
end;

end.
