unit UClientesDAO;

interface

uses
  UClientes, UConexaoControle;

type
  TClientesDAO = class
  public
    procedure Carregar(Cliente : TClientes; iCodigoCliente : Integer);
  end;

var
  ClientesDAO : TClientesDAO;

implementation

uses
  SysUtils, FireDAC.Comp.Client, FIREDAC.DApt, FireDAC.Stan.Param;

{ TCClientesDAO }

procedure TClientesDAO.Carregar(Cliente: TClientes; iCodigoCliente : Integer);
var
  qry: TFDQuery;
begin
  qry := ConexaoControle.NewQuery;

  try
   qry.SQL.Add(' SELECT * FROM TBLCLIENTE      ');
   qry.SQL.Add(' WHERE CODIGO = :iCodioCliente ');

   qry.ParamByName('iCodioCliente').AsInteger := iCodigoCliente;
   qry.Open;

   Cliente.Codigo := qry.FieldByName('CODIGO').AsInteger;
   Cliente.Nome   := qry.FieldByName('NOME').AsString;
   Cliente.Cpf    := qry.FieldByName('CPF').AsString;
  finally
   FreeAndNil(qry);
  end;
end;

end.
