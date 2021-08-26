object SettingForm: TSettingForm
  Left = 399
  Height = 354
  Top = 221
  Width = 511
  Caption = 'Settings'
  ClientHeight = 354
  ClientWidth = 511
  OnActivate = FormActivate
  LCLVersion = '7.0'
  object PageControl1: TPageControl
    Left = 0
    Height = 312
    Top = 0
    Width = 511
    ActivePage = tbEditor
    Align = alTop
    TabIndex = 1
    TabOrder = 0
    object tbPath: TTabSheet
      Caption = 'Directories'
      ClientHeight = 284
      ClientWidth = 503
      object grMAnual: TGroupBox
        Left = 4
        Height = 152
        Top = 128
        Width = 497
        Caption = 'or Manual'
        ClientHeight = 132
        ClientWidth = 493
        TabOrder = 0
        object ESWSExe: TEdit
          Left = 14
          Height = 23
          Top = 80
          Width = 440
          TabOrder = 0
          Text = 'ESWSExe'
        end
        object lbSWSVer: TLabel
          Left = 14
          Height = 15
          Top = 104
          Width = 49
          Caption = 'lbSWSVer'
          ParentColor = False
        end
        object btBrowExe: TButton
          Left = 454
          Height = 25
          Top = 78
          Width = 32
          Caption = '...'
          OnClick = btBrowExeClick
          TabOrder = 1
        end
        object lbSWSExe: TLabel
          Left = 14
          Height = 15
          Top = 64
          Width = 115
          Caption = 'SWOS Executable File:'
          ParentColor = False
        end
        object btBrowseData: TButton
          Left = 454
          Height = 25
          Top = 22
          Width = 32
          Caption = '...'
          OnClick = btBrowseDataClick
          TabOrder = 2
        end
        object ESWSdata: TEdit
          Left = 14
          Height = 23
          Top = 24
          Width = 440
          TabOrder = 3
          Text = 'ESWSdata'
        end
        object lbSWSdata: TLabel
          Left = 14
          Height = 15
          Top = 8
          Width = 113
          Caption = 'SWOS Data Directory:'
          ParentColor = False
        end
      end
      object GroupBox1: TGroupBox
        Left = 4
        Height = 113
        Top = 8
        Width = 497
        Caption = 'Total Pack Options'
        ClientHeight = 93
        ClientWidth = 493
        TabOrder = 1
        object EtotalPack: TEdit
          Left = 14
          Height = 23
          Top = 64
          Width = 440
          TabOrder = 0
          Text = 'EtotalPack'
        end
        object Button3: TButton
          Left = 454
          Height = 25
          Top = 62
          Width = 32
          Caption = '...'
          OnClick = Button3Click
          TabOrder = 1
        end
        object Label5: TLabel
          Left = 14
          Height = 15
          Top = 48
          Width = 105
          Caption = 'Total Pack Directory'
          ParentColor = False
        end
        object chbUseTP: TCheckBox
          Left = 14
          Height = 19
          Top = 16
          Width = 447
          Caption = 'Use New Total Pack (team verification is optional, executable corrects diffrences).'
          OnChange = chbUseTPChange
          TabOrder = 2
        end
        object btRefrManual: TButton
          Left = 366
          Height = 17
          Top = 40
          Width = 120
          Caption = 'Refresh Manual'
          OnClick = btRefrManualClick
          TabOrder = 3
        end
      end
    end
    object tbEditor: TTabSheet
      Caption = 'Editor'
      ClientHeight = 284
      ClientWidth = 503
      object chSelAuto: TCheckBox
        Left = 12
        Height = 19
        Top = 24
        Width = 180
        Caption = 'Automatic Select Cell on Enter'
        TabOrder = 0
      end
      object CBShowHint: TCheckBox
        Left = 12
        Height = 19
        Top = 48
        Width = 169
        Caption = 'Show Information and Hints'
        TabOrder = 1
      end
      object chAutoCopyexe: TCheckBox
        Left = 12
        Height = 19
        Top = 72
        Width = 279
        Caption = 'Auto Write LS To Exe and Exe++ if load TotalPack'
        TabOrder = 2
      end
      object cbAutoUpd: TCheckBox
        Left = 12
        Height = 19
        Top = 256
        Width = 176
        Caption = 'Automatic Check for Updates'
        TabOrder = 3
      end
      object chSafeMode: TCheckBox
        Left = 12
        Height = 19
        Top = 96
        Width = 216
        Caption = 'Safe Mode (Verification Assistant On)'
        TabOrder = 4
      end
      object chUseCol: TCheckBox
        Left = 12
        Height = 19
        Top = 120
        Width = 295
        Caption = 'Highlights teams by division and players by position'
        TabOrder = 5
      end
      object cbCSVString: TCheckBox
        Left = 12
        Height = 19
        Top = 144
        Width = 321
        Caption = 'Export data (positions, tactic, nationality) in CSV as String'
        TabOrder = 6
      end
    end
    object tbLinks: TTabSheet
      Caption = 'Links'
      ClientHeight = 284
      ClientWidth = 503
      object grLink1: TGroupBox
        Left = 4
        Height = 97
        Top = 8
        Width = 480
        Caption = 'Link 1'
        ClientHeight = 77
        ClientWidth = 476
        TabOrder = 0
        object Label1: TLabel
          Left = 6
          Height = 15
          Top = 14
          Width = 63
          Caption = 'Description:'
          ParentColor = False
        end
        object EL1Desc: TEdit
          Left = 110
          Height = 23
          Top = 6
          Width = 352
          OnExit = EL1DescExit
          TabOrder = 0
        end
        object Label2: TLabel
          Left = 6
          Height = 15
          Top = 48
          Width = 41
          Caption = 'Format:'
          ParentColor = False
        end
        object EL1Frm: TEdit
          Left = 110
          Height = 23
          Top = 40
          Width = 352
          OnExit = EL1FrmExit
          TabOrder = 1
        end
      end
      object grLink2: TGroupBox
        Left = 3
        Height = 96
        Top = 112
        Width = 481
        Caption = 'Link 2'
        ClientHeight = 76
        ClientWidth = 477
        TabOrder = 1
        object Label3: TLabel
          Left = 7
          Height = 15
          Top = 16
          Width = 63
          Caption = 'Description:'
          ParentColor = False
        end
        object EL2Desc: TEdit
          Left = 111
          Height = 23
          Top = 8
          Width = 352
          OnExit = EL2DescExit
          TabOrder = 0
        end
        object Label4: TLabel
          Left = 7
          Height = 15
          Top = 48
          Width = 41
          Caption = 'Format:'
          ParentColor = False
        end
        object EL2Frm: TEdit
          Left = 111
          Height = 23
          Top = 40
          Width = 352
          OnExit = EL2FrmExit
          TabOrder = 1
        end
      end
    end
    object tbLang: TTabSheet
      Caption = 'Language'
      ClientHeight = 284
      ClientWidth = 503
      object Label6: TLabel
        Left = 12
        Height = 15
        Top = 16
        Width = 132
        Caption = 'Select a Editor Language:'
        ParentColor = False
      end
      object LBLang: TListBox
        Left = 12
        Height = 208
        Top = 40
        Width = 268
        ItemHeight = 0
        TabOrder = 0
      end
      object btChaLang: TButton
        Left = 12
        Height = 25
        Top = 247
        Width = 268
        Caption = 'Change Language'
        OnClick = btChaLangClick
        TabOrder = 1
      end
    end
  end
  object Button1: TButton
    Left = 368
    Height = 25
    Top = 320
    Width = 131
    Caption = 'Save and Exit'
    OnClick = Button1Click
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Height = 25
    Top = 320
    Width = 144
    Caption = 'Cancel'
    OnClick = Button2Click
    TabOrder = 2
  end
  object opee: TOpenDialog
    Left = 432
    Top = 8
  end
  object seld: TSelectDirectoryDialog
    Left = 400
    Top = 8
  end
end
