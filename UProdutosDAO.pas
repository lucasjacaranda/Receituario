unit UProdutosDAO;

interface

uses
  UProdutos;

type
  TProdutosDAO = class
  public
    procedure Carregar(Produto : TProdutos; iCodigoProduto : Integer);
  end;

var
  ProdutosDAO : TProdutosDAO;

implementation

uses
  SysUtils, FireDAC.Comp.Client, FIREDAC.DApt, FireDAC.Stan.Param, UConexaoControle;

{ TProdutosDAO }

procedure TProdutosDAO.Carregar(Produto: TProdutos; iCodigoProduto: Integer);
var
  qry: TFDQuery;
begin
  qry := ConexaoControle.NewQuery;

  try
   qry.SQL.Add(' SELECT * FROM TBLPRODUTOS     ');
   qry.SQL.Add(' WHERE CODIGO = :iCodioProduto ');

   qry.ParamByName('iCodioProduto').AsInteger := iCodigoProduto;
   qry.Open;

   Produto.Codigo   := qry.FieldByName('CODIGO').AsInteger;
   Produto.Nome     := qry.FieldByName('NOME').AsString;
   Produto.Valor    := qry.FieldByName('VALOR').AsFloat;
   Produto.Controle := qry.FieldByName('CONTROLE').AsString;
  finally
   FreeAndNil(qry);
  end;
end;

end.
