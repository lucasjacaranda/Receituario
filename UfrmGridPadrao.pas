unit UfrmGridPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmGridPadrao = class(TForm)
    pnlBotoes: TPanel;
    btnExcluir: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnFechar: TSpeedButton;
    TBevel: TBevel;
    dsGrid: TDataSource;
    DBGrid: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    procedure ExcluirRegistro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridPadrao: TfrmGridPadrao;

implementation

{$R *.dfm}

procedure TfrmGridPadrao.btnEditarClick(Sender: TObject);
begin
  dsGrid.DataSet.Tag := 5;
end;

procedure TfrmGridPadrao.btnExcluirClick(Sender: TObject);
begin
  ExcluirRegistro;
end;

procedure TfrmGridPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGridPadrao.btnIncluirClick(Sender: TObject);
begin
  dsGrid.DataSet.Tag := 2;
end;

procedure TfrmGridPadrao.ExcluirRegistro;
begin
 if dsGrid.DataSet.RecordCount = 0 then
  begin
   Application.MessageBox('Não há registros para serem excluídos!', 'Erro', MB_ICONERROR + MB_OK);
   Abort;
  end;

 if not Application.MessageBox('Deseja realmente excluir o registro selecionado?', 'Pergunta', MB_YESNO) = ID_YES then
  Abort;
end;

end.
