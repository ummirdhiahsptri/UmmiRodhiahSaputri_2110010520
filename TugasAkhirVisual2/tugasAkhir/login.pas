unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm10 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    ds10: TDataSource;
    zqry10: TZQuery;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  username:string;
  password:string;
  level:string;
implementation

uses
  walikelas, utama;

{$R *.dfm}

procedure TForm10.btn1Click(Sender: TObject);
begin
 username := edt1.Text;
  password := edt2.Text;

  zqry10 := TZQuery.Create(nil);
  try
    zqry10.Connection := Form2.con1;
    zqry10.SQL.Text := 'SELECT level FROM tableuser WHERE username = :username AND password = :password';
    zqry10.ParamByName('username').AsString := username;
    zqry10.ParamByName('password').AsString := password;
    zqry10.Open;

    if not zqry10.IsEmpty then
    begin
      level := zqry10.FieldByName('level').AsString;
      if level = 'admin' then      
      begin
        // Pengguna berhasil login sebagai admin
        ShowMessage('Admin login successful');
        Form1.Show;
      end
      else if level = 'wali kelas' then
      begin
        // Pengguna berhasil login sebagai pengguna
        ShowMessage('Wali kelas login successful');
        Form2.Show;
      end;
    end
    else
    begin
      // Informasi login tidak valid
      ShowMessage('Invalid username or password');
    end;
  finally
    zqry10.Free;
  end;
end;

end.
