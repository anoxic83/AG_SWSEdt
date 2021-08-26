object ECCFrm: TECCFrm
  Left = 334
  Height = 601
  Top = 156
  Width = 710
  BorderStyle = bsDialog
  Caption = 'European Club Competitions'
  ClientHeight = 601
  ClientWidth = 710
  OnActivate = FormActivate
  LCLVersion = '5.7'
  object grCL: TGroupBox
    Left = 8
    Height = 352
    Top = 8
    Width = 220
    Caption = 'Champions League'
    ClientHeight = 332
    ClientWidth = 216
    TabOrder = 0
    object lbCL: TListBox
      Left = 6
      Height = 256
      Top = 8
      Width = 203
      ItemHeight = 0
      OnClick = lbCLClick
      PopupMenu = PoMenuECC
      TabOrder = 0
    end
    object btGenTMDCL: TButton
      Left = 6
      Height = 25
      Top = 304
      Width = 203
      Caption = 'Generate TMD File'
      OnClick = btGenTMDCLClick
      TabOrder = 1
    end
    object btnGenClip: TButton
      Left = 6
      Height = 25
      Top = 272
      Width = 203
      Caption = 'Update List From Clipboard'
      OnClick = btnGenClipClick
      TabOrder = 2
    end
  end
  object grCWC: TGroupBox
    Left = 232
    Height = 592
    Top = 8
    Width = 220
    Caption = 'Euro Cup Winners Cup'
    ClientHeight = 572
    ClientWidth = 216
    TabOrder = 1
    object lbCWC: TListBox
      Left = 6
      Height = 500
      Top = 8
      Width = 200
      ItemHeight = 0
      OnClick = lbCWCClick
      PopupMenu = PoMenuECC
      TabOrder = 0
    end
    object btnGenClip1: TButton
      Left = 6
      Height = 25
      Top = 512
      Width = 203
      Caption = 'Update List From Clipboard'
      OnClick = btnGenClip1Click
      TabOrder = 1
    end
    object btGenTMDCL1: TButton
      Left = 6
      Height = 25
      Top = 544
      Width = 203
      Caption = 'Generate TMD File'
      OnClick = btGenTMDCL1Click
      TabOrder = 2
    end
  end
  object grUEFA: TGroupBox
    Left = 464
    Height = 592
    Top = 8
    Width = 220
    Caption = 'UEFA Cup'
    ClientHeight = 572
    ClientWidth = 216
    TabOrder = 2
    object lbUEFA: TListBox
      Left = 6
      Height = 500
      Top = 8
      Width = 200
      ItemHeight = 0
      OnClick = lbUEFAClick
      PopupMenu = PoMenuECC
      TabOrder = 0
    end
    object btnGenClip2: TButton
      Left = 14
      Height = 25
      Top = 512
      Width = 203
      Caption = 'Update List From Clipboard'
      OnClick = btnGenClip2Click
      TabOrder = 1
    end
    object btGenTMDCL2: TButton
      Left = 14
      Height = 25
      Top = 544
      Width = 203
      Caption = 'Generate TMD File'
      OnClick = btGenTMDCL2Click
      TabOrder = 2
    end
  end
  object Button1: TButton
    Left = 8
    Height = 25
    Top = 536
    Width = 220
    Caption = 'Save All List To Exe'
    OnClick = Button1Click
    TabOrder = 3
  end
  object Button2: TButton
    Left = 8
    Height = 25
    Top = 568
    Width = 220
    Caption = 'Exit'
    OnClick = Button2Click
    TabOrder = 4
  end
  object grInfo: TGroupBox
    Left = 8
    Height = 81
    Top = 368
    Width = 217
    Caption = 'Information'
    ClientHeight = 61
    ClientWidth = 213
    TabOrder = 5
    object Label1: TLabel
      Left = 6
      Height = 48
      Top = 8
      Width = 192
      AutoSize = False
      Caption = 'Groups in the Champions League and a pair in the other Cups in the order of the list.'
      ParentColor = False
      WordWrap = True
    end
  end
  object PoMenuECC: TPopupMenu
    left = 152
    top = 464
    object MPEReplace: TMenuItem
      Caption = 'Replace with Clipboard'
      OnClick = MPEReplaceClick
    end
  end
end
