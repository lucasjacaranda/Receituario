unit UfrmCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmCadastroPadrao, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.StdCtrls;

type
  TfrmCadastroProdutos = class(TfrmCadastroPadrao)
    gpbNomeProduto: TGroupBox;
    edtNomeProduto: TEdit;
    gpbValorProduto: TGroupBox;
    rdgControleEspecial: TRadioGroup;
    edtValorProduto: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtValorProdutoExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure LoadObject;
    procedure SaveObject;
    procedure Destruir;
    procedure AbrirCadastro;
    procedure SalvarCadastro;
    procedure RecarregarGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

uses
  UProdutosControle, UProdutosDAO, UProdutos, UfrmProdutos,
  FireDAC.Comp.Client, UConexaoControle, FireDAC.Stan.Param;

var
  Produto : TProdutos;

{$R *.dfm}

{ TfrmCadastroProdutos }

procedure TfrmCadastroProdutos.AbrirCadastro;
begin
  if Assigned(Produto) then
   begin
    if frmProdutos.dsGrid.DataSet.Tag = 5 then
     LoadObject
   end
  else
   Produto := TProdutos.Create;

  if frmProdutos.dsGrid.DataSet.Tag = 5 then
   LoadObject;
end;

procedure TfrmCadastroProdutos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Destruir;
end;

procedure TfrmCadastroProdutos.btnGravarClick(Sender: TObject);
begin
  inherited;
  SalvarCadastro;
end;

procedure TfrmCadastroProdutos.Destruir;
begin
  FreeAndNil(Produto);
  frmCadastroProdutos := nil;
end;

procedure TfrmCadastroProdutos.edtValorProdutoExit(Sender: TObject);
begin
  inherited;
  if Pos(',', edtValorProduto.Text) > 0 then
   edtValorProduto.Text := Formatfloat(',0.00', StrToFloat(edtValorProduto.Text))
  else
   edtValorProduto.Text := Formatfloat(',0.00', StrToFloat(edtValorProduto.Text) * 0.01);
end;

procedure TfrmCadastroProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  RecarregarGrid;
end;

procedure TfrmCadastroProdutos.FormDestroy(Sender: TObject);
begin
  inherited;
  Destruir;
end;

procedure TfrmCadastroProdutos.FormShow(Sender: TObject);
begin
  inherited;
  AbrirCadastro;
end;

procedure TfrmCadastroProdutos.LoadObject;
begin
  ProdutosDAO.Carregar(Produto, frmProdutos.dsGrid.DataSet.FieldByName('CODIGO').AsInteger);

  edtValorProduto.Text  := FloatToStr(Produto.Valor);
  edtNomeProduto.Text   := Produto.Nome;

  if Produto.Controle = 'S' then
   rdgControleEspecial.ItemIndex := 0
  else
   rdgControleEspecial.ItemIndex := 1;
end;

procedure TfrmCadastroProdutos.RecarregarGrid;
begin
  frmProdutos.dsGrid.DataSet.DisableControls;
  frmProdutos.dsGrid.DataSet := ProdutosControle.CarregarGrid('TBLPRODUTOS', '', '');
  frmProdutos.dsGrid.DataSet.EnableControls;
end;

procedure TfrmCadastroProdutos.SalvarCadastro;
begin
  if Assigned(Produto) then
   begin
    if frmProdutos.dsGrid.DataSet.Tag = 2 then
     Produto.Codigo := ProdutosControle.BuscaSequenciaGenerator('GNR_PRODUTOS');

    Produto.Valor  := StrToFloat(edtValorProduto.Text);
    Produto.Nome   := edtNomeProduto.Text;

    if rdgControleEspecial.ItemIndex = 0 then
     Produto.Controle := 'S'
    else
     Produto.Controle := 'N';

    SaveObject;
   end;

  Self.Close;
end;

procedure TfrmCadastroProdutos.SaveObject;
var
  qry : TFDQuery;
begin
  qry := ConexaoControle.NewQuery;

  try
   if frmProdutos.dsGrid.DataSet.Tag = 5 then
    begin
     qry.SQL.Add(' UPDATE TBLPRODUTOS         ');
     qry.SQL.Add(' SET NOME     = :sNome,     ');
     qry.SQL.Add('     VALOR    = :fValor,    ');
     qry.SQL.Add('     CONTROLE = :cControle, ');
     qry.SQL.Add(' WHERE CODIGO = :iCodigo    ');

     qry.ParamByName('sNome').AsString     := Produto.Nome;
     qry.ParamByName('fValor').AsFloat     := Produto.Valor;
     qry.ParamByName('cControle').AsString := Produto.Controle;
     qry.ParamByName('iCodigo').AsInteger  := Produto.Codigo;
    end
   else
    begin
     qry.SQL.Add(' INSERT INTO TBLPRODUTOS (CODIGO, NOME, VALOR, CONTROLE)         ');
     qry.SQL.Add('                  VALUES (:iCodigo, :sNome, :fValor, :cControle) ');

     qry.ParamByName('iCodigo').AsInteger  := Produto.Codigo;
     qry.ParamByName('sNome').AsString     := Produto.Nome;
     qry.ParamByName('fValor').AsFloat     := Produto.Valor;
     qry.ParamByName('cControle').AsString := Produto.Controle;
    end;

    qry.ExecSQL;
  finally
   FreeAndNil(qry);
  end;
end;

end.
