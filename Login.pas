unit Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, idHashSHA;

type
  TFormLogin = class(TForm)
    LayoutImagem: TLayout;
    Image1: TImage;
    LayoutUsuario: TLayout;
    Label2: TLabel;
    EditEmail: TEdit;
    LayoutSenha: TLayout;
    Senha: TLabel;
    EditSenha: TEdit;
    LayoutLogin: TLayout;
    RoundRect1: TRoundRect;
    Label3: TLabel;
    LayoutRodape: TLayout;
    Image2: TImage;
    Image3: TImage;
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
  function SHA1 (AsString:string):string;
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.fmx}
uses Ingressos, UDM;


procedure TFormLogin.Label3Click(Sender: TObject);
var
  senha : string;
begin
    senha := SHA1(EditSenha.Text);
    if (EditEmail.Text = FormBD.FDQueryPessoaemail.AsString) and
      (senha = FormBD.FDQueryPessoasenha.AsString) then
    begin
      if not Assigned(FormIngresso) then
      Application.CreateForm(TFormIngresso, FormIngresso);
      FormIngresso.Show;
    end
    else
    begin
      ShowMessage('Login ou Senha Incorreto');
    end;


 end;



function TFormLogin.SHA1(AsString: string) : string;
var
senhaSHA1:TIDhAsHsha1;
begin
  senhaSHA1:=TIDhASHsha1.Create;
  try
    Result:= senhaSHA1.hashStringAsHex(AsString);
  finally
    SenhaSHA1.Free;
  end;
end;
end.
