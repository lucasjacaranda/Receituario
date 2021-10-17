unit UProdutos;

interface

type TProdutos = class
  private
    FCodigo: Integer;
    FNome: String;
    FValor: Double;
    FControle: String;
  public
    procedure Find(const iCodigoProduto : Integer);

    property Codigo:   Integer read FCodigo   write FCodigo;
    property Nome:     String  read FNome     write FNome;
    property Valor:    Double  read FValor    write FValor;
    property Controle: String  read FControle write FControle;
end;

implementation

{ TProdutos }

uses
  UProdutosDAO, SysUtils;

procedure TProdutos.Find(const iCodigoProduto: Integer);
var
  ProdutoDAO: TProdutosDAO;
begin
  ProdutoDAO := TProdutosDAO.Create;

  try
   ProdutoDAO.Carregar(Self, iCodigoProduto);
  finally
   FreeAndNil(ProdutoDAO);
  end;
end;

end.
