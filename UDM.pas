unit UDM;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, IOUtils;

type
  TFormBD = class(TForm)
    FDConnection1: TFDConnection;
    FDQueryPessoa: TFDQuery;
    FDQueryIngresso: TFDQuery;
    FDQueryIngressoid: TFDAutoIncField;
    FDQueryIngressonome: TStringField;
    FDQueryIngressovalor: TBCDField;
    FDQueryIngressoimg_ingresso: TBlobField;
    FDQueryIngressoquantidade: TIntegerField;
    FDQueryPessoaid: TFDAutoIncField;
    FDQueryPessoanome: TStringField;
    FDQueryPessoacpf: TStringField;
    FDQueryPessoatelefone: TStringField;
    FDQueryPessoacep: TStringField;
    FDQueryPessoaendereco: TStringField;
    FDQueryPessoacidade: TStringField;
    FDQueryPessoauf: TStringField;
    FDQueryPessoabairro: TStringField;
    FDQueryPessoaemail: TStringField;
    FDQueryPessoausuario: TStringField;
    FDQueryPessoaimg_usuario: TBlobField;
    FDQueryPessoasenha: TStringField;
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBD: TFormBD;

implementation

{$R *.fmx}

procedure TFormBD.FDConnection1AfterConnect(Sender: TObject);
var
  strSQL: string;
begin
 strSQL := 'create table IF NOT EXISTS pessoa(    ' + //
           'id integer not null primary key autoincrement, ' + //
           'nome varchar(40),                              ' + //
           'cpf varchar(11),                               ' + //
           'telefone varchar(13),                           ' + //
           'cep varchar(10),                               ' + //
           'endereco varchar(60),                          ' + //
           'cidade varchar(60),                            ' + //
           'uf char(2),                                    ' + //
           'bairro varchar(60),                            ' + //
           'usuario varchar(60),                             ' + //
           'email varchar(60),                             ' + //
           'senha varchar(40),                            ' + //
           'img_usuario blob)';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := ' create table IF NOT EXISTS ingresso( ' + //
            ' id integer not null primary key autoincrement, ' + //
            ' dataevento datetime,                           ' + //
            ' nome varchar(40),                              ' + //
            ' valor numeric(14,2),                            ' + //
            ' quantidade integer,                            ' + //
            ' img_ingresso blob) ';
  FDConnection1.ExecSQL(strSQL);

  FDQueryPessoa.Active := true;
  FDQueryIngresso.Active := true;
end;

procedure TFormBD.FDConnection1BeforeConnect(Sender: TObject);
var
  strPath: string;
begin
{$IF DEFINED (iOS) or DEFINED(ANDROID)}
  strPath := System.IOUtils.TPath.Combine
  (System.IOutils.TPath.GetDocumentPath,
    'Banco.db');
{$ENDIF}
{$IFDEF MSWINDOWS}
  strPath := System.IOUtils.TPath.Combine('D:\Users\ybotelho.UNIVEL\Desktop\EvAk - Mobile\BD','Banco.db');
{$ENDIF}
  FDConnection1.Params.Values['UseUnicode'] := 'False';
  FDConnection1.Params.Values['DATABASE'] := strPath;
end;



end.
