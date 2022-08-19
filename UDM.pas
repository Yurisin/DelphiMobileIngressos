unit UDM;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TFormBD = class(TForm)
    FDQueryPessoa: TFDQuery;
    FDConnection1: TFDConnection;
    FDQueryPessoaid: TFDAutoIncField;
    FDQueryPessoanome: TStringField;
    FDQueryPessoausuario: TStringField;
    FDQueryPessoasenha: TStringField;
    FDQueryPessoaendereco: TStringField;
    FDQueryPessoatelefone: TStringField;
    FDQueryIngresso: TFDQuery;
    FDQueryPessoacpf: TStringField;
    FDQueryPessoacelular: TStringField;
    FDQueryPessoacep: TStringField;
    FDQueryPessoacidade: TStringField;
    FDQueryPessoauf: TStringField;
    FDQueryPessoabairro: TStringField;
    FDQueryPessoaemail: TStringField;
    FDQueryIngressoid: TFDAutoIncField;
    FDQueryIngressodataevento: TDateTimeField;
    FDQueryIngressonome: TStringField;
    FDQueryIngressovalor: TBCDField;
    FDQueryIngressoquantidade: TIntegerField;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
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
           'celular varchar(13),                           ' + //
           'cep varchar(10),                               ' + //
           'endereco varchar(60),                          ' + //
           'cidade varchar(60),                            ' + //
           'uf char(2),                                    ' + //
           'bairro varchar(60),                            ' + //
           'email varchar(60),                             ' + //
           'senha varchar(40),                            ' + //
           'img_usuario blob ';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := ' create table IF NOT EXISTS produto( ' + //
            ' id integer not null primary key autoincrement, ' + //
            ' dataevento datetime,                           ' + //
            ' nome varchar(40),                              ' + //
            ' valor numeric(14,2)                            ' + //
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
  FDConnection1.Params.Values['UseUnicode'] := 'False';
  FDConnection1.Params.Values['DATABASE'] := strPath;
end;

end.
