unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, IOUtils;

type
  TFormHome = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    LayoutLista: TLayout;
    ScrollBoxLista: TScrollBox;
    LayoutRodape: TLayout;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
     procedure CarregarListaProdutos(id: integer; nome, descricao: string;
      valor: double);
    procedure GetProdutosBase;
    procedure AddFavoritos(Sender: TObject);
    function favorito(id: integer) : boolean;
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.fmx}

uses Login, UDM, Ingressos, Cadastro, EditUsuario, Usuario;

{ TFormHome }

procedure TFormHome.AddFavoritos(Sender: TObject);
var
  AId: string;
begin
  AId:= (TRectangle(Sender).TagString);
  FormBD.FDQueryIngresso.Locate('id', AId, []);
  FormBD.FDQueryIngresso.Edit;
  FormBD.FDQueryIngressofavorito.AsString := 'S';
  FormBD.FDQueryIngresso.Post;
  ShowMessage('Adicionado ao seus favoritos');
end;

procedure TFormHome.CarregarListaProdutos(id: integer; nome, descricao: string;
  valor: double);
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

  //ImgFavoritos
img := TImage.Create(rect);
if not favorito(id) then
begin
  with img do
  begin
{$IFDEF MSWINDOWS}
    Bitmap.LoadFromFile
      (IOUtils.TPath.Combine
      ('D:\Users\ybotelho.UNIVEL\Desktop\EvAk - Mobile\img',
       'heart_nosel.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
      (IOUtils.TPath.Combine(System,IOUtils.TPath.GetDocumentsPath,
      'heart_nosel.png'));
{$ENDIF}
    Height := 30;
    Width := 30;
    Position.x := 210;
    Position.y := 5;
    name := 'imgheartNoSel' + IntToStr(id);
    TagString := IntToStr(id);
    OnClick := AddFavoritos;
    Visible := true;
    rect.AddObject(img);
  end;
end
else
begin
  with img do
  begin
{$IFDEF MSWINDOWS}
    Bitmap.LoadFromFile
      (IOUtils.TPath.Combine
      ('D:\Users\ybotelho.UNIVEL\Desktop\EvAk - Mobile\img',
       'heart_yessel.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
      (IOUtils.TPath.Combine(System,IOUtils.TPath.GetDocumentsPath,
      'heart_yessel.png'));
{$ENDIF}
    Height := 30;
    Width := 30;
    Position.x := 210;
    Position.y := 5;
    name := 'imgheartNoSel' + IntToStr(id);
    TagString := IntToStr(id);
    OnClick := AddFavoritos;
    Visible := true;
    rect.AddObject(img);
  end;
end;
   ScrollBoxLista.AddObject(rect);
end;

function TFormHome.favorito(id: integer): boolean;
begin
  FormBD.FDQueryFavoritos.Close;
  FormBD.FDQueryFavoritos.ParamByName('pIdIngresso').AsInteger := id;
  FormBD.FDQueryFavoritos.Open();

  if not FormBD.FDQueryFavoritos.IsEmpty then
    Result := True
  else
    Result := False;
end;


procedure TFormHome.FormShow(Sender: TObject);
begin
   GetProdutosBase;
end;

procedure TFormHome.GetProdutosBase;
begin
FormBD.FDQueryIngresso.Close;
  FormBD.FDQueryIngresso.Open();
  while not FormBD.FDQueryIngresso.Eof do
  begin
    CarregarListaProdutos(FormBD.FDQueryIngressoid.AsInteger, FormBD.FDQueryIngressonome.AsString,
      FormBD.FDQueryIngressodescricao.AsString, FormBD.FDQueryIngressovalor.AsFloat);
    FormBD.FDQueryIngresso.next;
end;

end;
procedure TFormHome.Image4Click(Sender: TObject);
begin
  FormUsuario.Show;
  FormHome.Hide();
end;


end.
