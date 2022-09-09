unit Usuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormUsuario = class(TForm)
    LayoutTop: TLayout;
    Image1: TImage;
    labelNome: TLabel;
    Layout1: TLayout;
    RoundRectEditPerfil: TRoundRect;
    LabelEditPerfil: TLabel;
    LayoutRodape: TLayout;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    procedure LabelEditPerfilClick(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuario: TFormUsuario;

implementation

{$R *.fmx}

uses Login, UDM, Ingressos, Principal, Cadastro, EditUsuario, Favoritos;

procedure TFormUsuario.Image4Click(Sender: TObject);
begin
  FormFavoritos.Show;
  FormUsuario.Hide();

end;

procedure TFormUsuario.Image6Click(Sender: TObject);
begin
  FormHome.Show;
  FormUsuario.Hide();
end;

procedure TFormUsuario.LabelEditPerfilClick(Sender: TObject);
begin
  FormEditUsuario.Show;
  FormUsuario.Hide();
end;

end.
