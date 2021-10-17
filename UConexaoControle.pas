unit UConexaoControle;

interface

uses UClientes, Classes, FireDAC.Comp.Client, UdmConexao;

type
  TConexaoControle = class
  private

  public
    function NewQuery : TFDQuery; overload;
  end;

var
  ConexaoControle: TConexaoControle;

implementation

uses
  SysUtils;

{ TConexaoControle }

function TConexaoControle.NewQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := dmConexao.FDReceituario;
end;

end.
