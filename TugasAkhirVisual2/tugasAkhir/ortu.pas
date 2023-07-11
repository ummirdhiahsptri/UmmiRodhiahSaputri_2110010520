unit ortu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, StdCtrls, frxClass, frxDBSet;

type
  TForm4 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    cbb1: TComboBox;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    dbgrd1: TDBGrid;
    ds3: TDataSource;
    zqry3: TZQuery;
    lbl9: TLabel;
    edt7: TEdit;
    edt8: TEdit;
    frxdbdtst3: TfrxDBDataset;
    frxrprt3: TfrxReport;
    btn6: TButton;
    procedure bersih;
    procedure kondisiawal;
    procedure editenable;
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
  Form4: TForm4;
  id:string;
  nis:string;
implementation

uses
  walikelas;

{$R *.dfm}

procedure TForm4.bersih;
begin
  edt1.Clear;
  edt2.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  cbb1.Text:='==pilih==';
  edt6.Clear;
  edt7.Clear;  
  edt8.Clear;
end;

procedure TForm4.editenable;
begin
  edt1.Enabled:= True;
  edt2.Enabled:= True;
  edt3.Enabled:= True;
  edt4.Enabled:= True;
  edt5.Enabled:= True;
  cbb1.Enabled:= True;
  edt6.Enabled:= True;
  edt7.Enabled:= True;
  edt8.Enabled:= True;
end;

procedure TForm4.kondisiawal;
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
  cbb1.Enabled:= False;
  edt6.Enabled:= False;
  edt7.Enabled:= False;
  edt8.Enabled:= False;
end;

procedure TForm4.btn1Click(Sender: TObject);
begin
  bersih;
  btn1.Enabled:= False;
  btn2.Enabled:= True;
  btn3.Enabled:= False;
  btn4.Enabled:= False;
  btn5.Enabled:= True;
  editenable;
end;

procedure TForm4.btn2Click(Sender: TObject);
begin
nis:=  zqry3.Fields[1].AsString;

if edt1.Text = nis then
begin
ShowMessage('NIS SUDAH ADA!');
end else
if edt1.Text ='' then
begin
ShowMessage('NIS TIDAK BOLEH KOSONG!');
end else
if edt2.Text ='' then
begin
ShowMessage('NAMA TIDAK BOLEH KOSONG!');
end else
if edt3.Text ='' then
begin
ShowMessage('PENDIDIKAN TIDAK BOLEH KOSONG!');
end else
if edt4.Text ='' then
begin
ShowMessage('PEKERJAAN TIDAK BOLEH KOSONG!');
end else
if edt5.Text ='' then
begin
ShowMessage('NO TELPON LAHIR TIDAK BOLEH KOSONG!');
end else
if edt6.Text ='' then
begin
ShowMessage('ALAMAT LAHIR TIDAK BOLEH KOSONG!');
end else
if cbb1.Text ='==pilih==' then
begin
ShowMessage('JENIS KELAMIN TIDAK BOLEH KOSONG!');
end else
if edt7.Text ='' then
begin
ShowMessage('AGAMA TIDAK BOLEH KOSONG!');
end else
if edt8.Text ='' then
begin
ShowMessage('STATUS TIDAK BOLEH KOSONG!');
end else
begin
zqry3.SQL.Clear; //simpan
zqry3.SQL.Add('insert into tableortu values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+cbb1.Text+'","'+edt7.Text+'","'+edt8.Text+'")');
zqry3.ExecSQL ;

zqry3.SQL.Clear;
zqry3.SQL.Add('select * from tableortu');
zqry3.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
kondisiawal;
end;

end;

procedure TForm4.dbgrd1CellClick(Column: TColumn);
begin
 id:= zqry3.Fields[0].AsString; // DBGrid
edt1.Text:= zqry3.Fields[1].AsString;
edt2.Text:= zqry3.Fields[2].AsString;
edt3.Text:= zqry3.Fields[3].AsString;
edt4.Text:= zqry3.Fields[4].AsString;
edt5.Text:= zqry3.Fields[5].AsString;
edt6.Text:= zqry3.Fields[6].AsString;
cbb1.Text:= zqry3.Fields[7].AsString;
edt7.Text:= zqry3.Fields[8].AsString;
edt8.Text:= zqry3.Fields[9].AsString;
editenable;

btn1.Enabled:= false;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
end;

procedure TForm4.btn3Click(Sender: TObject);
begin
  if (edt1.Text= '')or (edt2.Text ='')or(edt3.Text= '')or (edt4.Text ='')or (edt5.Text ='')or (edt6.Text= '')or(cbb1.Text= '')or(edt7.Text= '')or(edt8.Text= '') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
kondisiawal;
end else
begin
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry3.SQL.Clear;
zqry3.SQL.Add('Update tableortu set nis="'+edt1.Text+'",nama_ortu="'+edt2.Text+'",pendidikan="'+edt3.Text+'",pekerjaan="'+edt4.Text+'",telp="'+edt5.Text+'",alamat="'+edt6.Text+'",jk="'+cbb1.Text+'",agama="'+edt7.Text+'",id_active="'+edt8.Text+'" where id="'+id+'"');
zqry3. ExecSQL;

zqry3.SQL.Clear;
zqry3.SQL.Add('select * from tableortu');
zqry3.Open;
kondisiawal;
end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
kondisiawal;
end;

procedure TForm4.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry3.SQL.Clear;
zqry3.SQL.Add(' delete from tableortu where id="'+id+'"');
zqry3. ExecSQL;
zqry3.SQL.Clear;
zqry3.SQL.Add('select * from tableortu');
zqry3.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
kondisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');
kondisiawal;
end;
end;

procedure TForm4.btn5Click(Sender: TObject);
begin
kondisiawal;
end;

procedure TForm4.btn6Click(Sender: TObject);
begin
frxrprt3.ShowReport;
end;

end.
