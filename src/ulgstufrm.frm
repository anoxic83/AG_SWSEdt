object LgeStrForm: TLgeStrForm
  Left = 389
  Height = 490
  Top = 232
  Width = 469
  BorderStyle = bsDialog
  Caption = 'League Structure'
  ClientHeight = 490
  ClientWidth = 469
  OnActivate = FormActivate
  OnClose = FormClose
  LCLVersion = '6.9'
  object gbcomp: TGroupBox
    Left = 8
    Height = 240
    Top = 8
    Width = 440
    Caption = 'Competition'
    ClientHeight = 220
    ClientWidth = 436
    TabOrder = 0
    object lbCompNr: TLabel
      Left = 6
      Height = 15
      Top = 40
      Width = 95
      Caption = 'National Number:'
      ParentColor = False
    end
    object EcmpNr: TEdit
      Left = 310
      Height = 23
      Top = 32
      Width = 100
      ReadOnly = True
      TabOrder = 0
      Text = 'EcmpNr'
    end
    object lbStMon: TLabel
      Left = 6
      Height = 15
      Top = 70
      Width = 61
      Caption = 'Start Sezon:'
      ParentColor = False
    end
    object cbStMon: TComboBox
      Left = 102
      Height = 23
      Top = 62
      Width = 100
      ItemHeight = 15
      OnChange = cbStMonChange
      TabOrder = 1
      Text = 'cbStMon'
    end
    object lbEnMon: TLabel
      Left = 214
      Height = 15
      Top = 70
      Width = 57
      Caption = 'End Sezon:'
      ParentColor = False
    end
    object cbEnMon: TComboBox
      Left = 310
      Height = 23
      Top = 62
      Width = 100
      ItemHeight = 15
      OnChange = cbEnMonChange
      TabOrder = 2
      Text = 'cbEnMon'
    end
    object lbMeT: TLabel
      Left = 6
      Height = 15
      Top = 104
      Width = 95
      Caption = 'Match Each Time:'
      ParentColor = False
    end
    object EmeT: TEdit
      Left = 310
      Height = 23
      Top = 96
      Width = 100
      OnExit = EmeTExit
      TabOrder = 3
      Text = 'EmeT'
    end
    object lbPosSub: TLabel
      Left = 6
      Height = 15
      Top = 168
      Width = 74
      Caption = 'Possible Subs:'
      ParentColor = False
    end
    object cbpossub: TComboBox
      Left = 102
      Height = 23
      Top = 160
      Width = 100
      ItemHeight = 15
      OnChange = cbpossubChange
      TabOrder = 4
      Text = 'cbpossub'
    end
    object lbFromSub: TLabel
      Left = 214
      Height = 15
      Top = 168
      Width = 48
      Caption = 'Reserves:'
      ParentColor = False
    end
    object cbFromSub: TComboBox
      Left = 310
      Height = 23
      Top = 160
      Width = 100
      ItemHeight = 15
      OnChange = cbFromSubChange
      TabOrder = 5
      Text = 'cbFromSub'
    end
    object lbPts: TLabel
      Left = 6
      Height = 15
      Top = 135
      Width = 78
      Caption = 'Points for Win:'
      ParentColor = False
    end
    object epts: TEdit
      Left = 310
      Height = 23
      Top = 127
      Width = 100
      OnExit = eptsExit
      TabOrder = 6
      Text = 'epts'
    end
    object Label1: TLabel
      Left = 6
      Height = 15
      Top = 12
      Width = 84
      Caption = 'Competition ID:'
      ParentColor = False
    end
    object ECmpID: TEdit
      Left = 310
      Height = 23
      Top = 4
      Width = 100
      TabOrder = 7
      Text = 'ECmpID'
    end
    object Label2: TLabel
      Left = 9
      Height = 15
      Top = 200
      Width = 50
      Caption = 'Divisions:'
      ParentColor = False
    end
    object Ediv: TEdit
      Left = 312
      Height = 23
      Top = 192
      Width = 72
      ReadOnly = True
      TabOrder = 8
      Text = 'Ediv'
    end
    object UpDown1: TUpDown
      Left = 382
      Height = 23
      Top = 192
      Width = 30
      Min = 0
      OnClick = UpDown1Click
      Position = 0
      TabOrder = 9
    end
  end
  object grDivs: TGroupBox
    Left = 8
    Height = 184
    Top = 264
    Width = 440
    Caption = 'Divisions'
    ClientHeight = 164
    ClientWidth = 436
    TabOrder = 1
    object cbDiv: TComboBox
      Left = 7
      Height = 23
      Top = 8
      Width = 207
      ItemHeight = 15
      OnChange = cbDivChange
      TabOrder = 0
      Text = 'cbDiv'
    end
    object lbTeams: TLabel
      Left = 6
      Height = 15
      Top = 48
      Width = 37
      Caption = 'Teams:'
      ParentColor = False
    end
    object eteams: TEdit
      Left = 310
      Height = 23
      Top = 40
      Width = 100
      OnExit = eteamsExit
      TabOrder = 1
      Text = 'eteams'
    end
    object lbProm: TLabel
      Left = 6
      Height = 15
      Top = 72
      Width = 56
      Caption = 'Promoted:'
      ParentColor = False
    end
    object eprom: TEdit
      Left = 310
      Height = 23
      Top = 64
      Width = 100
      OnExit = epromExit
      TabOrder = 2
      Text = 'eprom'
    end
    object Eprompo: TEdit
      Left = 310
      Height = 23
      Top = 88
      Width = 100
      OnExit = EprompoExit
      TabOrder = 3
      Text = 'Eprompo'
    end
    object Erel: TEdit
      Left = 310
      Height = 23
      Top = 112
      Width = 100
      OnExit = ErelExit
      TabOrder = 4
      Text = 'Erel'
    end
    object Erelpo: TEdit
      Left = 310
      Height = 23
      Top = 136
      Width = 100
      OnExit = ErelpoExit
      TabOrder = 5
      Text = 'Erelpo'
    end
    object lbprompo: TLabel
      Left = 6
      Height = 15
      Top = 96
      Width = 117
      Caption = 'Promoted by Play-off:'
      ParentColor = False
    end
    object lbRel: TLabel
      Left = 6
      Height = 15
      Top = 120
      Width = 55
      Caption = 'Relegated:'
      ParentColor = False
    end
    object lbrelpo: TLabel
      Left = 6
      Height = 15
      Top = 144
      Width = 116
      Caption = 'Relegated by Play-off:'
      ParentColor = False
    end
  end
  object btCmSav: TButton
    Left = 309
    Height = 25
    Top = 456
    Width = 139
    Caption = 'Save To SWOS and Exit'
    OnClick = btCmSavClick
    TabOrder = 2
  end
  object btExtoutSav: TButton
    Left = 16
    Height = 25
    Top = 456
    Width = 120
    Caption = 'Exit without Saving'
    OnClick = btExtoutSavClick
    TabOrder = 3
  end
  object Button1: TButton
    Left = 168
    Height = 25
    Hint = 'SWOS 2020 Win32 Port Competition Changer v0.1.1b.'#13#10'Can be download at: '#13#10'https://www.sensiblesoccer.de/forum/swos-2020/27081-swos-2020-win32-port-competition-changer'
    Top = 456
    Width = 139
    Caption = 'Create Patch for SWSCC'
    OnClick = Button1Click
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
end
