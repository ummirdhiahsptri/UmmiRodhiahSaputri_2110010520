unit wakel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TForm11 = class(TForm)
    mm1: TMainMenu;
    mniMENU1: TMenuItem;
    mniSISWA1: TMenuItem;
    mniSEMESTER1: TMenuItem;
    mniORANGTUA1: TMenuItem;
    mniSEMESTER2: TMenuItem;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    mniN1: TMenuItem;
    mniLOGOUT1: TMenuItem;
    procedure mniSEMESTER1Click(Sender: TObject);
    procedure mniORANGTUA1Click(Sender: TObject);
    procedure mniSEMESTER2Click(Sender: TObject);
    procedure mniSISWA1Click(Sender: TObject);
    procedure mniLOGOUT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses ortu, hubungan, semester, sswa, admin;

{$R *.dfm}

procedure TForm11.mniSEMESTER1Click(Sender: TObject);
begin
Form4.Show;
end;

procedure TForm11.mniORANGTUA1Click(Sender: TObject);
begin
Form8.Show;
end;

procedure TForm11.mniSEMESTER2Click(Sender: TObject);
begin
Form9.Show;
end;

procedure TForm11.mniSISWA1Click(Sender: TObject);
begin
Form3.Show;
end;

procedure TForm11.mniLOGOUT1Click(Sender: TObject);
begin
if application.MessageBox('Yakin ingin logout?','Konfirmasi Ulang',MB_YesNo)=ID_Yes then
begin
form11.Close;
end;
end;

end.
