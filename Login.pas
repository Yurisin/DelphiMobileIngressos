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
    EditUsuario: TEdit;
    LayoutSenha: TLayout;
    Senha: TLabel;
    EditSenha: TEdit;
    LayoutLogin: TLayout;
    RoundRect1: TRoundRect;
    Label3: TLabel;
    LayoutRodape: TLayout;
    Image2: TImage;
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
sql:String;
begin
    sql := 'select count(1) from pessoa ' +
    ' where usuario = ' + (EditUsuario.Text) +
    ' and senha = ' + SHA1(EditSenha.Text)   ;
begin
    FormBD.FDQueryPessoa.Close;
    FormBD.FDQueryPessoa.Open();

    if FormBD.FDQueryPessoa.Locate('usuario', EditUsuario.Text) and
    FormBD.FDQueryPessoa.Locate('senha', SHA1(EditUsuario.Text)) then
begin
    Showmessage('Login Efetuado com Sucesso!');
    FormLogin := TFormLogin.Create(Application) ;
    FormIngresso.Show;
    FormLogin.Hide;
    abort;
end
else
abort;
    Showmessage('nome ou senha incorretos');
    editSenha.Text:='';
    editUsuario.Text:='';
    editUsuario.SetFocus;
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