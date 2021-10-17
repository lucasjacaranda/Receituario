unit UClientesControle;

interface

uses
  UControle;

type
  TClientesControle = class(TControle)
  public
    function ChecaCpfExistente(const sCpf: String; const iCodigo: Integer): Boolean;
  end;

var
  ClientesControle: TClientesControle;

implementation

uses
  SysUtils, UConexaoControle, FireDAC.Stan.Param, FireDAC.Comp.Client, FIREDAC.DApt,
  DB;

{ TClientesControle }

function TClientesControle.ChecaCpfExistente(const sCpf: String; const iCodigo: Integer): Boolean;
var
  qry : TFDQuery;
begin
  qry := ConexaoControle.NewQuery;

  try
   qry.SQL.Add(' SELECT CODIGO            ');
   qry.SQL.Add(' FROM TBLCLIENTE          ');
   qry.SQL.Add(' WHERE CPF = :sCpf        ');
   qry.SQL.Add('   AND CODIGO <> :iCodigo ');

   qry.ParamByName('sCpf').AsString     := sCpf;
   qry.ParamByName('iCodigo').AsInteger := iCodigo;
   qry.Open;

   Result := not qry.IsEmpty;
  finally
   FreeAndNil(qry);
  end;
end;

end.
