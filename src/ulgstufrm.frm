object LgeStrForm: TLgeStrForm
  Left = 584
  Height = 438
  Top = 189
  Width = 469
  BorderStyle = bsDialog
  Caption = 'League Structure'
  ClientHeight = 438
  ClientWidth = 469
  OnActivate = FormActivate
  OnClose = FormClose
  LCLVersion = '1.3'
  object gbcomp: TGroupBox
    Left = 8
    Height = 192
    Top = 8
    Width = 440
    Caption = 'Competition'
    ClientHeight = 174
    ClientWidth = 436
    TabOrder = 0
    object lbCompNr: TLabel
      Left = 6
      Height = 15
      Top = 16
      Width = 117
      Caption = 'Competition Number:'
      ParentColor = False
    end
    object EcmpNr: TEdit
      Left = 310
      Height = 23
      Top = 8
      Width = 100
      ReadOnly = True
      TabOrder = 0
      Text = 'EcmpNr'
    end
    object lbStMon: TLabel
      Left = 6
      Height = 15
      Top = 46
      Width = 61
      Caption = 'Start Sezon:'
      ParentColor = False
    end
    object cbStMon: TComboBox
      Left = 102
      Height = 23
      Top = 38
      Width = 100
      ItemHeight = 15
      OnChange = cbStMonChange
      TabOrder = 1
      Text = 'cbStMon'
    end
    object lbEnMon: TLabel
      Left = 214
      Height = 15
      Top = 46
      Width = 57
      Caption = 'End Sezon:'
      ParentColor = False
    end
    object cbEnMon: TComboBox
      Left = 310
      Height = 23
      Top = 38
      Width = 100
      ItemHeight = 15
      OnChange = cbEnMonChange
      TabOrder = 2
      Text = 'cbEnMon'
    end
    object lbMeT: TLabel
      Left = 6
      Height = 15
      Top = 80
      Width = 95
      Caption = 'Match Each Time:'
      ParentColor = False
    end
    object EmeT: TEdit
      Left = 310
      Height = 23
      Top = 72
      Width = 100
      OnExit = EmeTExit
      TabOrder = 3
      Text = 'EmeT'
    end
    object lbPosSub: TLabel
      Left = 6
      Height = 15
      Top = 144
      Width = 74
      Caption = 'Possible Subs:'
      ParentColor = False
    end
    object cbpossub: TComboBox
      Left = 102
      Height = 23
      Top = 136
      Width = 100
      ItemHeight = 15
      OnChange = cbpossubChange
      TabOrder = 4
      Text = 'cbpossub'
    end
    object lbFromSub: TLabel
      Left = 214
      Height = 15
      Top = 144
      Width = 48
      Caption = 'Reserves:'
      ParentColor = False
    end
    object cbFromSub: TComboBox
      Left = 310
      Height = 23
      Top = 136
      Width = 100
      ItemHeight = 15
      OnChange = cbFromSubChange
      TabOrder = 5
      Text = 'cbFromSub'
    end
    object lbPts: TLabel
      Left = 6
      Height = 15
      Top = 111
      Width = 78
      Caption = 'Points for Win:'
      ParentColor = False
    end
    object epts: TEdit
      Left = 310
      Height = 23
      Top = 103
      Width = 100
      OnExit = eptsExit
      TabOrder = 6
      Text = 'epts'
    end
  end
  object grDivs: TGroupBox
    Left = 8
    Height = 184
    Top = 208
    Width = 440
    Caption = 'Divisions'
    ClientHeight = 166
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
      Width = 38
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
    Top = 400
    Width = 139
    Caption = 'Save and Exit'
    OnClick = btCmSavClick
    TabOrder = 2
  end
  object btExtoutSav: TButton
    Left = 16
    Height = 25
    Top = 400
    Width = 144
    Caption = 'Exit without Saving'
    OnClick = btExtoutSavClick
    TabOrder = 3
  end
end
