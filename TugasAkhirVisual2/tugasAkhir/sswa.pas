unit sswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, StdCtrls, frxClass, frxDBSet;

type
  TForm3 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    cbb1: TComboBox;
    edt7: TEdit;
    edt8: TEdit;
    edt9: TEdit;
    edt10: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    dbgrd1: TDBGrid;
    zqry2: TZQuery;
    ds1: TDataSource;
    frxdbdtst2: TfrxDBDataset;
    frxrprt2: TfrxReport;
    btn6: TButton;
    procedure bersih;
    procedure kondisiawal;
    procedure editenable;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  id:string;
  nis:string;
  nisn:string;
  nik:string;
implementation

uses
  walikelas;

{$R *.dfm}

procedure TForm3.bersih;
begin
  edt1.Clear;
  edt2.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Text:='0000-00-00';
  cbb1.Text:='==pilih==';
  edt7.Clear;
  edt8.Clear;
  edt9.Clear;
  edt10.Clear;
end;

procedure TForm3.editenable;
begin
  edt1.Enabled:= True;
  edt2.Enabled:= True;
  edt3.Enabled:= True;
  edt4.Enabled:= True;
  edt5.Enabled:= True;
  edt6.Enabled:= True;
  cbb1.Enabled:= True;
  edt7.Enabled:= True;
  edt8.Enabled:= True;
  edt9.Enabled:= True;
  edt10.Enabled:= True;
end;

procedure TForm3.kondisiawal;
begin

  bersih;

  btn1.Enabled:= True;
  btn2.Enabled:= False;
  btn3.Enabled:= False;
  btn4.Enabled:= False;
  btn5.Enabled:= False;

  edt1.Enabled:= False;
  edt2.Enabled:= False;
  edt3.Enabled:= False;
  edt4.Enabled:= False;
  edt5.Enabled:= False;
  edt6.Enabled:= False;
  cbb1.Enabled:= False;
  edt7.Enabled:= False;
  edt8.Enabled:= False;
  edt9.Enabled:= False;
  edt9.Enabled:= False;
end;

procedure TForm3.btn1Click(Sender: TObject);
begin
  bersih;
  btn1.Enabled:= False;
  btn2.Enabled:= True;
  btn3.Enabled:= False;
  btn4.Enabled:= False;
  btn5.Enabled:= True;
  editenable;
end;

procedure TForm3.btn2Click(Sender: TObject);
begin
nis:=  zqry2.Fields[1].AsString;
nisn:= zqry2.Fields[2].AsString;
nik:=  zqry2.Fields[4].AsString;

if edt1.Text= nis then
begin
ShowMessage('NIS SUDAH ADA!');
end else
if edt2.Text= nisn then
begin
ShowMessage('NISN SUDAH ADA!');
end else
if edt4.Text= nik then
begin
ShowMessage('NIK SUDAH ADA!');
end else
if edt1.Text ='' then
begin
ShowMessage('NIS TIDAK BOLEH KOSONG!');
end else
if edt2.Text ='' then
begin
ShowMessage('NISN TIDAK BOLEH KOSONG!');
end else
if edt3.Text ='' then
begin
ShowMessage('NAMA SISWA TIDAK BOLEH KOSONG!');
end else
if edt4.Text ='' then
begin
ShowMessage('NIK TIDAK BOLEH KOSONG!');
end else
if edt5.Text ='' then
begin
ShowMessage('TEMPAT LAHIR TIDAK BOLEH KOSONG!');
end else
if edt6.Text ='' then
begin
ShowMessage('TANGGAL TIDAK BOLEH KOSONG!');
end else
if cbb1.Text ='==pilih==' then
begin
ShowMessage('JENIS KELAMIN TIDAK BOLEH KOSONG!');
end else
if edt7.Text ='' then
begin
ShowMessage('ALAMAT TIDAK BOLEH KOSONG!');
end else
if edt8.Text ='' then
begin
ShowMessage('NO TELPON TIDAK BOLEH KOSONG!');
end else
if edt9.Text ='' then
begin
ShowMessage('NO HP TIDAK BOLEH KOSONG!');
end else      
if edt10.Text ='' then
begin
ShowMessage('STATUS TIDAK BOLEH KOSONG!');
end else
begin
zqry2.SQL.Clear; //simpan
zqry2.SQL.Add('insert into tablesiswa values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+cbb1.Text+'","'+edt7.Text+'","'+edt8.Text+'","'+edt9.Text+'","'+edt10.Text+'")');
zqry2.ExecSQL ;

zqry2.SQL.Clear;
zqry2.SQL.Add('select * from tablesiswa');
zqry2.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
kondisiawal;
end;

end;


procedure TForm3.btn3Click(Sender: TObject);
begin
  if (edt1.Text= '')or (edt2.Text ='')or(edt3.Text= '')or (edt4.Text ='')or (edt5.Text ='')or(cbb1.Text= '')or (edt6.Text= '')or(edt7.Text= '')or(edt8.Text= '')or(edt9.Text= '')or(edt10.Text= '') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
kondisiawal;
end else
begin
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry2.SQL.Clear;
zqry2.SQL.Add('Update tablesiswa set nis="'+edt1.Text+'",nisn="'+edt2.Text+'",nama_siswa="'+edt3.Text+'",nik="'+edt4.Text+'",tempat_lahir="'+edt5.Text+'",tanggal_lahir="'+edt6.Text+'",jk="'+cbb1.Text+'",alamat="'+edt7.Text+'",telp="'+edt8.Text+'",hp="'+edt9.Text+'",status="'+edt10.Text+'" where id="'+id+'"');
zqry2. ExecSQL;

zqry2.SQL.Clear;
zqry2.SQL.Add('select * from tablesiswa');
zqry2.Open;
kondisiawal;
end;

end;

procedure TForm3.FormShow(Sender: TObject);
begin
kondisiawal;
end;

procedure TForm3.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry2.SQL.Clear;
zqry2.SQL.Add(' delete from tablesiswa where id="'+id+'"');
zqry2. ExecSQL;
zqry2.SQL.Clear;
zqry2.SQL.Add('select * from tablesiswa');
zqry2.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
kondisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');
kondisiawal;
end;

end;

procedure TForm3.btn5Click(Sender: TObject);
begin
kondisiawal;
end;

procedure TForm3.dbgrd1CellClick(Column: TColumn);
begin
 id:= zqry2.Fields[0].AsString; // DBGrid
edt1.Text:= zqry2.Fields[1].AsString;
edt2.Text:= zqry2.Fields[2].AsString;
edt3.Text:= zqry2.Fields[3].AsString;
edt4.Text:= zqry2.Fields[4].AsString;
edt5.Text:= zqry2.Fields[5].AsString;
edt6.Text:= zqry2.Fields[6].AsString;
cbb1.Text:= zqry2.Fields[7].AsString;
edt7.Text:= zqry2.Fields[8].AsString;
edt8.Text:= zqry2.Fields[9].AsString;
edt9.Text:= zqry2.Fields[10].AsString;
edt10.Text:= zqry2.Fields[11].AsString;
editenable;

btn1.Enabled:= false;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
end;

procedure TForm3.btn6Click(Sender: TObject);
begin
frxrprt2.ShowReport;
end;

end.
