unit kelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, StdCtrls, frxClass, frxDBSet;

type
  TForm7 = class(TForm)
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
    ds6: TDataSource;
    zqry6: TZQuery;
    btn6: TButton;
    frxdbdtst6: TfrxDBDataset;
    frxrprt6: TfrxReport;
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
  Form7: TForm7;
   nama:string;
implementation

uses
  walikelas;

{$R *.dfm}

{ TForm7 }

procedure TForm7.bersih;
begin
  edt1.Clear;
  edt2.Clear;
end;

procedure TForm7.editenable;
begin
  edt1.Enabled:= True;
  edt2.Enabled:= True;
end;

procedure TForm7.kondisiawal;
begin
  bersih;

  btn1.Enabled:= True;
  btn2.Enabled:= False;
  btn3.Enabled:= False;
  btn4.Enabled:= False;
  btn5.Enabled:= False;

  edt1.Enabled:= False;
  edt2.Enabled:= False;

end;

procedure TForm7.btn1Click(Sender: TObject);
begin
  bersih;
  btn1.Enabled:= False;
  btn2.Enabled:= True;
  btn3.Enabled:= False;
  btn4.Enabled:= False;
  btn5.Enabled:= True;
  editenable;
end;

procedure TForm7.btn2Click(Sender: TObject);
begin
if edt1.Text ='' then
begin
ShowMessage('NAMA KELAS TIDAK BOLEH KOSONG!');
end else
if edt2.Text ='' then
begin
ShowMessage('JURUSAN TIDAK BOLEH KOSONG!');
end else
begin
zqry6.SQL.Clear; //simpan
zqry6.SQL.Add('insert into tablekelas values(null,"'+edt1.Text+'","'+edt2.Text+'")');
zqry6.ExecSQL ;

zqry6.SQL.Clear;
zqry6.SQL.Add('select * from tablekelas');
zqry6.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
kondisiawal;
end;
end;

procedure TForm7.dbgrd1CellClick(Column: TColumn);
begin
 id:= zqry6.Fields[0].AsString; // DBGrid
edt1.Text:= zqry6.Fields[1].AsString;
edt2.Text:= zqry6.Fields[2].AsString;
editenable;

btn1.Enabled:= false;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
end;

procedure TForm7.btn3Click(Sender: TObject);
begin
  if (edt1.Text= '')or (edt2.Text ='')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
kondisiawal;
end else
begin
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry6.SQL.Clear;
zqry6.SQL.Add('Update tablekelas set nama="'+edt1.Text+'",jurusan="'+edt2.Text+'" where id="'+id+'"');
zqry6. ExecSQL;

zqry6.SQL.Clear;
zqry6.SQL.Add('select * from tablekelas');
zqry6.Open;
kondisiawal;
end;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
kondisiawal;
end;

procedure TForm7.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry6.SQL.Clear;
zqry6.SQL.Add(' delete from tablekelas where id="'+id+'"');
zqry6. ExecSQL;
zqry6.SQL.Clear;
zqry6.SQL.Add('select * from tablekelas');
zqry6.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
kondisiawal;
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');
kondisiawal;
end;
end;

procedure TForm7.btn5Click(Sender: TObject);
begin
  kondisiawal;
end;


procedure TForm7.btn6Click(Sender: TObject);
begin
frxrprt6.ShowReport;
end;

end.
