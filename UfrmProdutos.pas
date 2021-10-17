unit UfrmProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmGridPadrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmProdutos = class(TfrmGridPadrao)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
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
  frmProdutos: TfrmProdutos;

implementation

uses
  UProdutosControle, UfrmCadastroProdutos;

{$R *.dfm}

procedure TfrmProdutos.AbrirCadastro;
begin
  if TForm(frmCadastroProdutos) = nil then
   begin
    Application.CreateForm(TfrmCadastroProdutos, frmCadastroProdutos);
   end;

  frmCadastroProdutos.BringToFront;
  frmCadastroProdutos.Show;
end;

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro;
end;

procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluirRegistro;
end;

procedure TfrmProdutos.btnIncluirClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro;
end;

procedure TfrmProdutos.Button1Click(Sender: TObject);
begin
  inherited;
  AbrirCadastro;
end;

procedure TfrmProdutos.CarregarGrid;
begin
  dsGrid.DataSet := ProdutosControle.CarregarGrid('TBLPRODUTOS', '', '');
end;

procedure TfrmProdutos.Destruir;
begin
  FreeAndNil(dsGrid.DataSet);
  FreeAndNil(frmProdutos);
end;

procedure TfrmProdutos.ExcluirRegistro;
begin
 dsGrid.DataSet.Delete;
end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Destruir;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarGrid;
end;

end.
