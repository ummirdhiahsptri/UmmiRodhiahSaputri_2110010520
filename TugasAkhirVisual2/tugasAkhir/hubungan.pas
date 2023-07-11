unit hubungan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, StdCtrls, frxClass, frxDBSet;

type
  TForm8 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    dbgrd1: TDBGrid;
    ds7: TDataSource;
    zqry7: TZQuery;
    lbl3: TLabel;
    lbl4: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    lbl5: TLabel;
    edt5: TEdit;
    frxrprt7: TfrxReport;
    frxdbdtst7: TfrxDBDataset;
    btn6: TButton;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  siswa:string;
implementation

uses
  walikelas;

{$R *.dfm}

procedure TForm8.bersih;
begin
  edt1.Clear;
  edt2.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
end;

procedure TForm8.editenable;
begin
  edt1.Enabled:= True;
  edt2.Enabled:= True;
  edt3.Enabled:= True;
  edt4.Enabled:= True;
  edt5.Enabled:= True;
end;

procedure TForm8.kondisiawal;
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
end;

procedure TForm8.btn1Click(Sender: TObject);
begin
  bersih;
  btn1.Enabled:= False;
  btn2.Enabled:= True;
  btn3.Enabled:= False;
  btn4.Enabled:= False;
  btn5.Enabled:= True;
  editenable;
end;

procedure TForm8.btn2Click(Sender: TObject);
begin
siswa:= zqry7.Fields[1].AsString;

if edt1.Text = siswa then
begin
ShowMessage('ID SISWA SUDAH ADA!');
end else
if edt1.Text ='' then
begin
ShowMessage('ID SISWA TIDAK BOLEH KOSONG!');
end else
if edt2.Text ='' then
begin
ShowMessage('ID ORTU TIDAK BOLEH KOSONG!');
end else
if edt2.Text ='' then
begin
ShowMessage('STATUS HUB TIDAK BOLEH KOSONG!');
end else
if edt3.Text ='' then
begin
ShowMessage('KETERANGAN TIDAK BOLEH KOSONG!');
end else
if edt4.Text ='' then
begin
ShowMessage('STATUS ORTU TIDAK BOLEH KOSONG!');
end else
begin
zqry7.SQL.Clear; //simpan
zqry7.SQL.Add('insert into tablehubungan values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'")');
zqry7.ExecSQL ;

zqry7.SQL.Clear;
zqry7.SQL.Add('select * from tablehubungan');
zqry7.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
kondisiawal;
end;

end;

procedure TForm8.dbgrd1CellClick(Column: TColumn);
begin
 id:= zqry7.Fields[0].AsString; // DBGrid
edt1.Text:= zqry7.Fields[1].AsString;
edt2.Text:= zqry7.Fields[2].AsString;
edt3.Text:= zqry7.Fields[3].AsString;
edt4.Text:= zqry7.Fields[4].AsString;
edt5.Text:= zqry7.Fields[5].AsString;
editenable;

btn1.Enabled:= false;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
end;

procedure TForm8.btn3Click(Sender: TObject);
begin
  if (edt1.Text= '')or (edt2.Text ='')or (edt3.Text ='')or (edt4.Text ='')or (edt5.Text ='') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
kondisiawal;
end else
begin
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry7.SQL.Clear;
zqry7.SQL.Add('Update tablehubungan set siswa_id="'+edt1.Text+'",ortu_id="'+edt2.Text+'",statushubanak="'+edt3.Text+'",keterangan="'+edt4.Text+'",status_ortu="'+edt5.Text+'" where id="'+id+'"');
zqry7. ExecSQL;

zqry7.SQL.Clear;
zqry7.SQL.Add('select * from tablehubungan');
zqry7.Open;
kondisiawal;
end;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
kondisiawal;
end;

procedure TForm8.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry7.SQL.Clear;
zqry7.SQL.Add(' delete from tablehubungan where id="'+id+'"');
zqry7. ExecSQL;
zqry7.SQL.Clear;
zqry7.SQL.Add('select * from tablehubungan');
zqry7.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
kondisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');
kondisiawal;
end;

end;

procedure TForm8.btn5Click(Sender: TObject);
begin
  kondisiawal;
end;

end.
