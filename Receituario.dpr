program Receituario;

{$R *.res}

uses
  System.SysUtils,
  Vcl.Forms,
  Vcl.Dialogs,
  MidasLib,
  UfrmPrincipal in '..\src\Forms\UfrmPrincipal.pas' {frmPrincipal},
  UdmConexao in '..\src\DataModules\UdmConexao.pas' {dmConexao: TDataModule},
  UfrmGridPadrao in '..\src\Forms\UfrmGridPadrao.pas' {frmGridPadrao},
  UfrmClientes in '..\src\Forms\UfrmClientes.pas' {frmClientes},
  UClientes in '..\src\Modelos\UClientes.pas',
  UConexaoControle in '..\src\Controladores\UConexaoControle.pas',
  UClientesControle in '..\src\Controladores\UClientesControle.pas',
  UClientesDAO in '..\src\DAO\UClientesDAO.pas',
  UControle in '..\src\Controladores\UControle.pas',
  UfrmCadastroPadrao in '..\src\Forms\UfrmCadastroPadrao.pas' {frmCadastroPadrao},
  UfrmCadastroClientes in '..\src\Forms\UfrmCadastroClientes.pas' {frmCadastroClientes},
  UfrmProdutos in '..\src\Forms\UfrmProdutos.pas' {frmProdutos},
  UfrmCadastroProdutos in '..\src\Forms\UfrmCadastroProdutos.pas' {frmCadastroProdutos},
  UProdutos in '..\src\Modelos\UProdutos.pas',
  UProdutosDAO in '..\src\DAO\UProdutosDAO.pas',
  UProdutosControle in '..\src\Controladores\UProdutosControle.pas';

begin
  Application.Title := 'Receituário';
  Application.Initialize;

  FormatSettings.ShortDateFormat   :=  'dd/mm/yyyy';

  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.


