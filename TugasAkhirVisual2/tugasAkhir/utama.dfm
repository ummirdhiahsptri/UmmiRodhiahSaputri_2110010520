object Form1: TForm1
  Left = 438
  Top = 226
  Width = 413
  Height = 313
  Caption = 'Utama'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 168
    Top = 64
    Width = 54
    Height = 13
    Caption = 'USERNAME'
  end
  object lbl2: TLabel
    Left = 168
    Top = 136
    Width = 57
    Height = 13
    Caption = 'PASSWORD'
  end
  object lbl3: TLabel
    Left = 152
    Top = 8
    Width = 129
    Height = 41
    Caption = 'LOGIN'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -29
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object edt1: TEdit
    Left = 120
    Top = 160
    Width = 161
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 120
    Top = 88
    Width = 161
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btn1: TButton
    Left = 160
    Top = 224
    Width = 75
    Height = 25
    Caption = 'LOGIN'
    TabOrder = 2
    OnClick = btn1Click
  end
  object zqry: TZQuery
    Connection = con
    Active = True
    SQL.Strings = (
      'select * from tableuser')
    Params = <>
    Left = 40
    Top = 32
  end
  object ds: TDataSource
    DataSet = zqry
    Left = 40
    Top = 104
  end
  object con: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'dbsekolah'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Program Files (x86)\Borland\Delphi7\Projects\tugasAkhir\libmy' +
      'sql.dll'
    Left = 40
    Top = 176
  end
end
