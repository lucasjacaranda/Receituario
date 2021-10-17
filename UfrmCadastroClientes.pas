unit UfrmCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmCadastroPadrao, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmCadastroClientes = class(TfrmCadastroPadrao)
    gpbCpfCliente: TGroupBox;
    gpbNomeCliente: TGroupBox;
    edtNomeCliente: TEdit;
    mskCpfCliente: TMaskEdit;
    procedure mskCpfClienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure VerificarCpf;
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
  frmCadastroClientes: TfrmCadastroClientes;

implementation

uses
  UClientesControle, UClientesDAO, UClientes, UfrmClientes,
  FireDAC.Comp.Client, UConexaoControle, FireDAC.Stan.Param;

var
  Cliente : TClientes;

{$R *.dfm}

procedure TfrmCadastroClientes.AbrirCadastro;
begin
  if Assigned(Cliente) then
   begin
    if frmClientes.dsGrid.DataSet.Tag = 5 then
     LoadObject
   end
  else
   Cliente := TClientes.Create;

  if frmClientes.dsGrid.DataSet.Tag = 5 then
   LoadObject;
end;

procedure TfrmCadastroClientes.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Destruir;
end;

procedure TfrmCadastroClientes.btnGravarClick(Sender: TObject);
begin
  inherited;
  SalvarCadastro;
end;

procedure TfrmCadastroClientes.Destruir;
begin
  FreeAndNil(Cliente);
  frmCadastroClientes := nil;
end;

procedure TfrmCadastroClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  RecarregarGrid;
end;

procedure TfrmCadastroClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  Destruir;
end;

procedure TfrmCadastroClientes.FormShow(Sender: TObject);
begin
  inherited;
  AbrirCadastro;
end;

procedure TfrmCadastroClientes.LoadObject;
begin
  ClientesDAO.Carregar(Cliente, frmClientes.dsGrid.DataSet.FieldByName('CODIGO').AsInteger);

  mskCpfCliente.Text    := Cliente.Cpf;
  edtNomeCliente.Text   := Cliente.Nome;
end;

procedure TfrmCadastroClientes.mskCpfClienteExit(Sender: TObject);
begin
  inherited;
  VerificarCpf;
end;

procedure TfrmCadastroClientes.RecarregarGrid;
begin
  frmClientes.dsGrid.DataSet.DisableControls;
  frmClientes.dsGrid.DataSet := ClientesControle.CarregarGrid('TBLCLIENTE', '', '');
  frmClientes.dsGrid.DataSet.EnableControls;
end;

procedure TfrmCadastroClientes.SalvarCadastro;
begin
  if Assigned(Cliente) then
   begin
    if frmClientes.dsGrid.DataSet.Tag = 2 then
     Cliente.Codigo := ClientesControle.BuscaSequenciaGenerator('GNR_CLIENTE');

    Cliente.Cpf  := mskCpfCliente.Text;
    Cliente.Nome := edtNomeCliente.Text;

    SaveObject;
   end;

  Self.Close;
end;

procedure TfrmCadastroClientes.SaveObject;
var
  qry : TFDQuery;
begin
  qry := ConexaoControle.NewQuery;

  try
   if frmClientes.dsGrid.DataSet.Tag = 5 then
    begin
     qry.SQL.Add(' UPDATE TBLCLIENTE       ');
     qry.SQL.Add(' SET NOME = :sNome,      ');
     qry.SQL.Add('     CPF  = :sCpf        ');
     qry.SQL.Add(' WHERE CODIGO = :iCodigo ');

     qry.ParamByName('sNome').AsString    := Cliente.Nome;
     qry.ParamByName('sCpf').AsString     := Cliente.Cpf;
     qry.ParamByName('iCodigo').AsInteger := Cliente.Codigo;
    end
   else
    begin
     qry.SQL.Add(' INSERT INTO TBLCLIENTE (CODIGO, NOME, CPF)       ');
     qry.SQL.Add('                 VALUES (:iCodigo, :sNome, :sCpf) ');

     qry.ParamByName('iCodigo').AsInteger := Cliente.Codigo;
     qry.ParamByName('sNome').AsString    := Cliente.Nome;
     qry.ParamByName('sCpf').AsString     := Cliente.Cpf;
    end;

    qry.ExecSQL;
  finally
   FreeAndNil(qry);
  end;
end;

procedure TfrmCadastroClientes.VerificarCpf;
begin
  if not (Trim(mskCpfCliente.Text) = '') then
   begin
    if ClientesControle.ChecaCpfExistente(mskCpfCliente.Text, Cliente.Codigo) then
     begin
      Application.MessageBox('O número do CPF informado já está vinculado a outro Cliente.', 'Aviso', MB_ICONEXCLAMATION + MB_OK);
      mskCpfCliente.Clear;
      mskCpfCliente.SetFocus;
     end;
   end;
end;

end.
