object FrmClip: TFrmClip
  Left = 1048
  Height = 318
  Top = 182
  Width = 320
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'FrmClip'
  ClientHeight = 318
  ClientWidth = 320
  OnActivate = FormActivate
  LCLVersion = '1.3'
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
    Width = 106
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
  object opec: TOpenDialog
    FileName = 'H:\OLDGAMES\pc-swos-totalpack\run\p02_swos_97'
    Filter = 'Carrer Save|*.car|All Files|*.*'
    InitialDir = 'H:\OLDGAMES\pc-swos-totalpack\run\'
    left = 258
    top = 58
  end
end
