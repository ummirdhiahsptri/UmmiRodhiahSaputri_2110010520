unit admin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TForm10 = class(TForm)
    mm1: TMainMenu;
    mniWALIKELAS1: TMenuItem;
    mniWALIKELAS2: TMenuItem;
    mniSISWA1: TMenuItem;
    mniKELAS1: TMenuItem;
    mniORANGTUA1: TMenuItem;
    mniHUBUNGAN1: TMenuItem;
    mniSEMESTER1: TMenuItem;
    mniPOIN1: TMenuItem;
    mniUSER1: TMenuItem;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    mniN1: TMenuItem;
    mniLOGOUT1: TMenuItem;
    procedure mniWALIKELAS2Click(Sender: TObject);
    procedure mniSISWA1Click(Sender: TObject);
    procedure mniKELAS1Click(Sender: TObject);
    procedure mniORANGTUA1Click(Sender: TObject);
    procedure mniHUBUNGAN1Click(Sender: TObject);
    procedure mniSEMESTER1Click(Sender: TObject);
    procedure mniPOIN1Click(Sender: TObject);
    procedure mniUSER1Click(Sender: TObject);
    procedure mniLOGOUT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses walikelas, sswa, kelas, ortu, hubungan, semester, poin, user;

{$R *.dfm}

procedure TForm10.mniWALIKELAS2Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm10.mniSISWA1Click(Sender: TObject);
begin
Form3.Show;
end;

procedure TForm10.mniKELAS1Click(Sender: TObject);
begin
Form7.Show;
end;

procedure TForm10.mniORANGTUA1Click(Sender: TObject);
begin
Form4.Show;
end;

procedure TForm10.mniHUBUNGAN1Click(Sender: TObject);
begin
Form8.Show;
end;

procedure TForm10.mniSEMESTER1Click(Sender: TObject);
begin
    Form9.Show;
end;

procedure TForm10.mniPOIN1Click(Sender: TObject);
begin
Form6.Show;
end;

procedure TForm10.mniUSER1Click(Sender: TObject);
begin
Form5.Show;
end;

procedure TForm10.mniLOGOUT1Click(Sender: TObject);
begin
if application.MessageBox('Yakin ingin logout?','Konfirmasi Ulang',MB_YesNo)=ID_Yes then
begin
form10.Close;
end;
end;

end.
