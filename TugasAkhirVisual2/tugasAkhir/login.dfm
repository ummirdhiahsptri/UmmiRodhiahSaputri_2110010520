object Form10: TForm10
  Left = 187
  Top = 242
  Width = 928
  Height = 460
  Caption = 'login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 88
    Top = 88
    Width = 47
    Height = 13
    Caption = 'username'
  end
  object lbl2: TLabel
    Left = 88
    Top = 128
    Width = 46
    Height = 13
    Caption = 'password'
  end
  object edt1: TEdit
    Left = 160
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 160
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 168
    Top = 176
    Width = 75
    Height = 25
    Caption = 'login'
    TabOrder = 2
    OnClick = btn1Click
  end
  object ds10: TDataSource
    DataSet = zqry10
    Left = 16
    Top = 112
  end
  object zqry10: TZQuery
    Connection = Form2.con1
    SQL.Strings = (
      'select * from tableuser')
    Params = <>
    Left = 16
    Top = 168
  end
end
