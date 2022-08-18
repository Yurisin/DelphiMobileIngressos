unit Ingressos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFormIngresso = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    Image1: TImage;
    LayoutIngresso: TLayout;
    labelNomeEvento: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LayoutRodape: TLayout;
    Image2: TImage;
    LayoutVerIngressos: TLayout;
    RoundRect1: TRoundRect;
    Label6: TLabel;
    procedure Label6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormIngresso: TFormIngresso;

implementation

{$R *.fmx}
uses Comprar;

procedure TFormIngresso.Label6Click(Sender: TObject);
begin
  FormComprar.Show();
end;


end.
