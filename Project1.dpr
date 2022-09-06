program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Cadastro in 'Cadastro.pas' {FormCadastro},
  Login in 'Login.pas' {FormLogin},
  Ingressos in 'Ingressos.pas' {FormIngresso},
  Comprar in 'Comprar.pas' {FormComprar},
  UDM in 'UDM.pas' {FormBD},
  Principal in 'Principal.pas' {FormHome},
  Usuario in 'Usuario.pas' {FormUsuario},
  EditUsuario in 'EditUsuario.pas' {FormEditUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormIngresso, FormIngresso);
  Application.CreateForm(TFormComprar, FormComprar);
  Application.CreateForm(TFormBD, FormBD);
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TFormUsuario, FormUsuario);
  Application.CreateForm(TFormEditUsuario, FormEditUsuario);
  Application.Run;
end.
