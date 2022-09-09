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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuario: TFormUsuario;

implementation

{$R *.fmx}

uses Login, UDM, Ingressos, Principal, Cadastro, EditUsuario;

procedure TFormUsuario.LabelEditPerfilClick(Sender: TObject);
begin
  FormEditUsuario.Show;
  FormUsuario.Hide();
end;

end.
