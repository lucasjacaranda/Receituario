unit UControle;

interface

uses
  FireDAC.Comp.Client, FIREDAC.DApt;

  type
    TControle = class
    public
      function CarregarGrid(const NomeTabela, Filter: String; Sort: String = ''): TFDquery;
      function BuscaSequenciaGenerator(const Generator: String): Integer;
    end;

implementation

uses
  UConexaoControle, SysUtils;

{ TControle }

function TControle.BuscaSequenciaGenerator(const Generator: String): Integer;
var
  qry: TFDQuery;
begin
  qry := ConexaoControle.NewQuery;

  try
   qry.SQL.Add(Format('SELECT gen_id(%s, 1) as VALOR from RDB$DATABASE', [Generator]));

   qry.Open;

   Result := qry.FieldByName('VALOR').AsInteger;
  finally
   qry.Free;
  end;
end;

function TControle.CarregarGrid(const NomeTabela, Filter: String;
  Sort: String): TFDquery;
var
  qry: TFDQuery;
begin
  qry := ConexaoControle.NewQuery;

  try
   qry.SQL.Add(Format(' SELECT * FROM %s ', [NomeTabela]));

   if not (Trim(Filter) = '') then
     qry.SQL.Add(Format(' WHERE %s ', [Filter]));

   if not (Trim(Sort) = '') then
    qry.SQL.Add(Format(' ORDER BY %s ', [Sort]));

   qry.Open;

   Result := qry;
  finally
  end;
end;

end.
