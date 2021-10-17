unit UfrmCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastroPadrao = class(TForm)
    Bevel1: TBevel;
    pnlBotoes: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure CancelarAlteracoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.dfm}

procedure TfrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  CancelarAlteracoes;
end;

procedure TfrmCadastroPadrao.CancelarAlteracoes;
begin
  if Application.MessageBox('Deseja cancelar as alterações?', 'Pergunta', MB_YESNO) = ID_NO then
   Exit;

  Self.Close;
end;

end.
