unit poin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, frxClass, frxDBSet;

type
  TForm6 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    dbgrd1: TDBGrid;
    ds5: TDataSource;
    zqry5: TZQuery;
    cbb1: TComboBox;
    cbb2: TComboBox;
    btn6: TButton;
    frxdbdtst5: TfrxDBDataset;
    frxrprt5: TfrxReport;
    procedure bersih;
    procedure editenable;
    procedure kondisiawal;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  nama:string;
implementation

uses
  walikelas;

{$R *.dfm}

procedure TForm6.bersih;
begin
  edt1.Clear;
  edt2.Clear;
  cbb1.Text:='==pilih==';
  cbb2.Text:='==pilih==';
end;

procedure TForm6.editenable;
begin
  edt1.Enabled:= True;
  edt2.Enabled:= True;
  cbb1.Enabled:= True;
  cbb2.Enabled:= True;
end;

procedure TForm6.kondisiawal;
begin

  bersih;

  btn1.Enabled:= True;
  btn2.Enabled:= False;
  btn3.Enabled:= False;
  btn4.Enabled:= False;
  btn5.Enabled:= False;

  edt1.Enabled:= False;
  edt2.Enabled:= False;
  cbb1.Enabled:= False;
  cbb2.Enabled:= False;
end;

procedure TForm6.btn1Click(Sender: TObject);
begin
  bersih;
  btn1.Enabled:= False;
  btn2.Enabled:= True;
  btn3.Enabled:= False;
  btn4.Enabled:= False;
  btn5.Enabled:= True;
  editenable;
end;

procedure TForm6.btn2Click(Sender: TObject);
begin
nama:=  zqry5.Fields[1].AsString;

if edt1.Text = nama then
begin
ShowMessage('NAMA POIN SUDAH ADA!');
end else
if edt1.Text ='' then
begin
ShowMessage('NAMA TIDAK BOLEH KOSONG!');
end else
if edt2.Text ='' then
begin
ShowMessage('BOBOT TIDAK BOLEH KOSONG!');
end else
if cbb1.Text ='==pilih==' then
begin
ShowMessage('JENIS BELUM DIISI DENGAN BENAR!');
end else
if cbb2.Text ='==pilih==' then
begin
ShowMessage('STATUS BELUM DIISI DENGAN BENAR!');
end else
begin
zqry5.SQL.Clear; //simpan
zqry5.SQL.Add('insert into tablepoin values(null,"'+edt1.Text+'","'+edt2.Text+'","'+cbb1.Text+'","'+cbb2.Text+'")');
zqry5.ExecSQL ;

zqry5.SQL.Clear;
zqry5.SQL.Add('select * from tablepoin');
zqry5.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
kondisiawal;
end;
end;

procedure TForm6.dbgrd1CellClick(Column: TColumn);
begin
 id:= zqry5.Fields[0].AsString; // DBGrid
edt1.Text:= zqry5.Fields[1].AsString;
edt2.Text:= zqry5.Fields[2].AsString;
cbb1.Text:= zqry5.Fields[3].AsString;
cbb2.Text:= zqry5.Fields[4].AsString;
editenable;

btn1.Enabled:= false;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
end;

procedure TForm6.btn3Click(Sender: TObject);
begin
  if (edt1.Text= '')or (edt2.Text ='')or(cbb1.Text= '')or (cbb2.Text ='') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
kondisiawal;
end else
begin
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry5.SQL.Clear;
zqry5.SQL.Add('Update tablepoin set nama_poin="'+edt1.Text+'",bobot="'+edt2.Text+'",jenis="'+cbb1.Text+'",status="'+cbb2.Text+'" where id="'+id+'"');
zqry5. ExecSQL;

zqry5.SQL.Clear;
zqry5.SQL.Add('select * from tablepoin');
zqry5.Open;
kondisiawal;
end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
kondisiawal;
end;

procedure TForm6.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry5.SQL.Clear;
zqry5.SQL.Add(' delete from tablepoin where id="'+id+'"');
zqry5. ExecSQL;
zqry5.SQL.Clear;
zqry5.SQL.Add('select * from tablepoin');
zqry5.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
kondisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');
kondisiawal;
end;
end;

procedure TForm6.btn5Click(Sender: TObject);
begin
  kondisiawal;
end;

procedure TForm6.btn6Click(Sender: TObject);
begin
frxrprt5.ShowReport;
end;

end.
