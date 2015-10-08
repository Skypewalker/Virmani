object frmDijalog: TfrmDijalog
  Left = 269
  Top = 170
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'frmDijalog'
  ClientHeight = 120
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnDa: TButton
    Left = 8
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Da'
    ModalResult = 6
    TabOrder = 0
  end
  object btnNe: TButton
    Left = 104
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Ne'
    ModalResult = 7
    TabOrder = 1
  end
  object btnOdustani: TButton
    Left = 200
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Odustani'
    ModalResult = 2
    TabOrder = 2
  end
  object memPoruka: TMemo
    Left = 8
    Top = 8
    Width = 265
    Height = 73
    BorderStyle = bsNone
    Ctl3D = False
    Lines.Strings = (
      'memPoruka')
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 3
  end
end
