unit Cadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit, idHashSHA;

type
  TFormCadastro = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    LayoutImagem: TLayout;
    Image1: TImage;
    LayoutUsuario: TLayout;
    Label2: TLabel;
    EditUsuario: TEdit;
    LayoutSenha: TLayout;
    Senha: TLabel;
    EditSenha: TEdit;
    LayoutCadastrar: TLayout;
    RoundRect1: TRoundRect;
    Label3: TLabel;
    LayoutRodape: TLayout;
    Image2: TImage;
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    function SHA1 (Astring:string): string;
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.fmx}

uses Login, UDM;

procedure TFormCadastro.Label3Click(Sender: TObject);
var senha:string;
begin
  FormBD.FDQueryPessoa.Close;
  FormBD.FDQueryPessoa.Open();


  if(EditUsuario.Text = EmptyStr) or (EditSenha.Text = EmptyStr) then
      Abort;
    FormBD.FDQueryPessoa.Append;
    FormBD.FDQueryPessoaUsuario.AsString:=EditUsuario.Text;
    FormBD.FDQueryPessoaSenha.AsString:= SHA1(EditSenha.Text);
    FormBD.FDQueryPessoa.Post;
    FormBD.FDConnection1.CommitRetaining;

    ShowMessage('Cadastrado com Sucesso');

    FormLogin.Hide;

    FormLogin.Showmodal;
    FormCadastro.close;

  FormLogin.Show();
end;


function TFormCadastro.SHA1(Astring: string): string;
var
  senhaSH1: TIDhAsHsha1;
begin
  senhaSH1:=TIDhASHsha1.Create;
  try
    Result:= senhaSH1.hashStringAsHex(Astring);
  finally
    SenhaSH1.Free;
  end;
end;

end.
