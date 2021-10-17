unit UClientes;

interface

type TClientes = class
  private
    FCodigo: Integer;
    FCpf: String;
    FNome: String;
  public
    procedure Find(const iCodigoCliente : Integer);

    property Codigo: Integer read FCodigo write FCodigo;
    property Nome:   String  read FNome   write FNome;
    property Cpf:    String  read FCpf    write FCpf;
end;

implementation

{ TClientes }

uses
  UClientesDAO, SysUtils;

procedure TClientes.Find(const iCodigoCliente: Integer);
var
  ClienteDAO: TClientesDAO;
begin
  ClienteDAO := TClientesDAO.Create;

  try
   ClienteDAO.Carregar(Self, iCodigoCliente);
  finally
   FreeAndNil(ClienteDAO);
  end;
end;

end.
