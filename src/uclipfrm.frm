object FrmClip: TFrmClip
  Left = 389
  Height = 308
  Top = 232
  Width = 320
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'FrmClip'
  ClientHeight = 308
  ClientWidth = 320
  OnActivate = FormActivate
  LCLVersion = '7.0'
  object ClbTeam: TListBox
    Left = 8
    Height = 112
    Top = 24
    Width = 192
    ItemHeight = 0
    OnClick = ClbTeamClick
    TabOrder = 0
  end
  object clbPlayer: TListBox
    Left = 8
    Height = 120
    Top = 184
    Width = 192
    ItemHeight = 0
    OnClick = clbPlayerClick
    TabOrder = 1
  end
  object lbClTeam: TLabel
    Left = 8
    Height = 15
    Top = 8
    Width = 105
    Caption = 'Teams in Clipboard:'
    ParentColor = False
  end
  object lbClPlayers: TLabel
    Left = 8
    Height = 15
    Top = 168
    Width = 108
    Caption = 'Players in Clipboard:'
    ParentColor = False
  end
  object btClearT: TButton
    Left = 208
    Height = 17
    Top = 24
    Width = 104
    Caption = 'Clear'
    OnClick = btClearTClick
    TabOrder = 2
  end
  object btClearP: TButton
    Left = 208
    Height = 17
    Top = 184
    Width = 104
    Caption = 'Clear'
    OnClick = btClearPClick
    TabOrder = 3
  end
  object btnAddToCar: TButton
    Left = 8
    Height = 24
    Top = 136
    Width = 192
    Caption = 'Add To Carrer Job Offer'
    OnClick = btnAddToCarClick
    TabOrder = 4
  end
  object btnExp: TButton
    Left = 208
    Height = 17
    Top = 48
    Width = 104
    Caption = 'Export'
    OnClick = btnExpClick
    TabOrder = 5
  end
  object opec: TOpenDialog
    Left = 216
    Top = 96
  end
  object savc: TSaveDialog
    Left = 256
    Top = 96
  end
end
