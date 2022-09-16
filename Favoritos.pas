unit Favoritos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFormFavoritos = class(TForm)
    LayoutLista: TLayout;
    ScrollBoxLista: TScrollBox;
    LayoutRodape: TLayout;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    ToolBar1: TToolBar;
    Label1: TLabel;
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarListaFavoritos(id: integer; nome, descricao: string;
      valor: double);
    procedure GetListaFavoritos;

  public
    { Public declarations }
  end;

var
  FormFavoritos: TFormFavoritos;

implementation

{$R *.fmx}

uses Login, UDM, Ingressos, Cadastro, EditUsuario, Usuario, Principal;

procedure TFormFavoritos.Image4Click(Sender: TObject);
begin
  FormUsuario.Show;
  FormFavoritos.Hide();
end;

procedure TFormFavoritos.Image5Click(Sender: TObject);
begin
  FormHome.Show;
  FormFavoritos.Hide();
end;

procedure TFormFavoritos.CarregarListaFavoritos(id: integer;
  nome, descricao: string; valor: double);
var
  rect, rect_barra: TRectangle;
  rect_icone: TCircle;
  lbl: TLabel;
  img: TImage;
  i, valorEstrela: integer;
begin

  // fundo
  rect := TRectangle.Create(ScrollBoxLista);
  with rect do
  begin
    Align := TAlignLayout.Top;
    Height := 110;
    Fill.Color := $FFFFFFFF;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Margins.Top := 10;
    Margins.Left := 10;
    Margins.Right := 10;
    XRadius := 8;
    YRadius := 8;
  end;
  // Barra inferior...
  rect_barra := TRectangle.Create(rect);
  with rect_barra do
  begin
    Align := TAlignLayout.Bottom;
    Height := 45;
    Fill.Color := $FFF4F4F4;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Sides := [TSide.Left, TSide.Bottom, TSide.Right];
    XRadius := 8;
    YRadius := 8;
    Corners := [TCorner.BottomLeft, TCorner.BottomRight];
    HitTest := False;
    rect.AddObject(rect_barra);
  end;

  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF333333;
    Text := nome;
    font.Size := 16;
    font.Style := [TFontStyle.fsBold];
    Position.x := 50;
    Position.Y := 10;
    Width := 200;
    rect.AddObject(lbl);
  end;

  lbl := TLabel.Create(rect_barra);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FFDF0B0B;
    Text := descricao;
    font.Size := 11;
    font.Style := [TFontStyle.fsBold];
    Position.x := 5;
    Position.Y := 70;
    Width := 500;
    rect.AddObject(lbl);
  end;

  lbl := TLabel.Create(rect_barra);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FFDF0B0B;
    Text := FloatToStr(valor);
    font.Size := 11;
    font.Style := [TFontStyle.fsBold];
    Position.x := 5;
    Position.Y := 85;
    Width := 500;
    rect.AddObject(lbl);
  end;
  ScrollBoxLista.AddObject(rect);
end;

procedure TFormFavoritos.FormShow(Sender: TObject);
begin
  ScrollBoxLista.Content.DeleteChildren;
  GetListaFavoritos();
end;

procedure TFormFavoritos.GetListaFavoritos;
begin
  FormBD.FDQueryListaFavoritos.Close;
  FormBD.FDQueryListaFavoritos.Open();
  while not FormBD.FDQueryListaFavoritos.Eof do
  begin
    CarregarListaFavoritos(FormBD.FDQueryListaFavoritosid.AsInteger,
      FormBD.FDQueryListaFavoritosnome.AsString,
      FormBD.FDQueryListaFavoritosdescricao.AsString,
      FormBD.FDQueryListaFavoritosvalor.AsFloat);
    FormBD.FDQueryListaFavoritos.next;
  end;
end;

end.
