object MainForm: TMainForm
  Left = 389
  Height = 733
  Top = 232
  Width = 597
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MainForm'
  ClientHeight = 713
  ClientWidth = 597
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Quality = fqCleartype
  Menu = Menus
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDropFiles = FormDropFiles
  OnPaint = FormPaint
  LCLVersion = '6.9'
  object PCtrl: TPageControl
    Left = 0
    Height = 713
    Top = 0
    Width = 597
    ActivePage = tbSquad
    Align = alClient
    TabIndex = 3
    TabOrder = 0
    OnChange = PCtrlChange
    OnChanging = PCtrlChanging
    object tbOver: TTabSheet
      Caption = 'Overview'
      ClientHeight = 686
      ClientWidth = 589
      object LBOver: TTreeView
        Left = 12
        Height = 592
        Top = 40
        Width = 336
        ExpandSignSize = 16
        Font.CharSet = EASTEUROPE_CHARSET
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Quality = fqDraft
        Images = FilFlags
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnDblClick = LBOverDblClick
        Options = [tvoAutoItemHeight, tvoHideSelection, tvoKeepCollapsedNodes, tvoReadOnly, tvoShowButtons, tvoShowLines, tvoShowRoot, tvoToolTips, tvoThemedDraw]
      end
      object lbSelTeam: TLabel
        Left = 13
        Height = 14
        Top = 22
        Width = 100
        Caption = 'Select Team to Load:'
        ParentColor = False
      end
      object ESWSdir: TEdit
        Left = 12
        Height = 22
        Top = 656
        Width = 448
        TabOrder = 1
      end
      object lbOvrActSWSDir: TLabel
        Left = 12
        Height = 14
        Top = 640
        Width = 110
        Caption = 'Actual SWOS Data Dir:'
        ParentColor = False
      end
      object btOvrSwsChange: TButton
        Left = 460
        Height = 25
        Top = 656
        Width = 123
        Caption = 'Change'
        OnClick = MSettingsClick
        TabOrder = 2
      end
      object CBTPVer: TComboBox
        Left = 356
        Height = 23
        Top = 56
        Width = 216
        ItemHeight = 15
        OnChange = CBTPVerChange
        ParentFont = False
        TabOrder = 3
        Text = 'CBTPVer'
      end
      object Label1: TLabel
        Left = 356
        Height = 14
        Top = 43
        Width = 116
        Caption = 'Total Pack Data Version:'
        ParentColor = False
      end
      object grOverStats: TGroupBox
        Left = 355
        Height = 96
        Top = 536
        Width = 217
        Caption = 'Information'
        ClientHeight = 77
        ClientWidth = 213
        TabOrder = 4
        object lbFilesOverCtp: TLabel
          Left = 7
          Height = 15
          Top = 8
          Width = 201
          Alignment = taCenter
          AutoSize = False
          Caption = 'Files Loaded/Files in Data Folder'
          ParentColor = False
        end
        object lbFLFiDF: TLabel
          Left = 7
          Height = 15
          Top = 32
          Width = 201
          Alignment = taCenter
          AutoSize = False
          Caption = 'lbFLFiDF'
          ParentColor = False
        end
        object lbTeamEdited: TLabel
          Left = 7
          Height = 15
          Top = 56
          Width = 201
          Alignment = taCenter
          AutoSize = False
          ParentColor = False
        end
      end
    end
    object tbGeneral: TTabSheet
      Caption = 'General'
      ClientHeight = 686
      ClientWidth = 589
      Enabled = False
      object LBTeams: TListView
        Left = 12
        Height = 488
        Top = 184
        Width = 576
        Columns = <>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
        OnClick = LBTeamsClick
        OnColumnClick = LBTeamsColumnClick
        OnCompare = LBTeamsCompare
        OnDblClick = LBTeamsDblClick
        OnMouseDown = LBTeamsMouseDown
      end
      object lbTeamlist: TLabel
        Left = 4
        Height = 14
        Top = 168
        Width = 48
        Caption = 'Team List:'
        ParentColor = False
      end
      object GTeamInfo: TGroupBox
        Left = 4
        Height = 128
        Top = 10
        Width = 272
        Caption = 'Team File Info'
        ClientHeight = 109
        ClientWidth = 268
        TabOrder = 1
        object LbGeTinF: TLabel
          Left = 6
          Height = 14
          Top = 1
          Width = 111
          Caption = 'Number of Team in File:'
          ParentColor = False
        end
        object LTC: TLabel
          Left = 230
          Height = 13
          Top = 1
          Width = 18
          Caption = 'LTC'
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LbGeTinPD: TLabel
          Left = 6
          Height = 14
          Top = 22
          Width = 124
          Caption = 'Teams in Premier Division:'
          ParentColor = False
        end
        object lbGeTinD2: TLabel
          Left = 6
          Height = 14
          Top = 56
          Width = 109
          Caption = 'Teams in Division Two:'
          ParentColor = False
        end
        object lbGeTinD3: TLabel
          Left = 6
          Height = 14
          Top = 72
          Width = 116
          Caption = 'Teams in Division Three:'
          ParentColor = False
        end
        object lbGeTinD1: TLabel
          Left = 6
          Height = 14
          Top = 40
          Width = 108
          Caption = 'Teams in Division One:'
          ParentColor = False
        end
        object DPT: TLabel
          Left = 230
          Height = 13
          Top = 22
          Width = 21
          Caption = 'DPT'
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object D1T: TLabel
          Left = 230
          Height = 13
          Top = 40
          Width = 20
          Caption = 'D1T'
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object D2T: TLabel
          Left = 230
          Height = 13
          Top = 56
          Width = 20
          Caption = 'D2T'
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object D3T: TLabel
          Left = 230
          Height = 13
          Top = 72
          Width = 20
          Caption = 'D3T'
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbGeTinNL: TLabel
          Left = 6
          Height = 14
          Top = 88
          Width = 105
          Caption = 'Teams non in League:'
          ParentColor = False
        end
        object DNT: TLabel
          Left = 230
          Height = 13
          Top = 88
          Width = 23
          Caption = 'DNT'
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object SWSVer: TGroupBox
        Left = 316
        Height = 128
        Top = 10
        Width = 264
        Caption = 'SWS Exe Verification'
        ClientHeight = 109
        ClientWidth = 260
        TabOrder = 2
        OnMouseEnter = SWSVerMouseEnter
        OnMouseLeave = SWSVerMouseLeave
        object Label38: TLabel
          Left = 14
          Height = 14
          Top = 1
          Width = 31
          Caption = 'Teams'
          ParentColor = False
        end
        object Label39: TLabel
          Left = 62
          Height = 14
          Top = 1
          Width = 58
          Caption = 'Prom - P-off'
          ParentColor = False
        end
        object Label40: TLabel
          Left = 142
          Height = 14
          Top = 1
          Width = 65
          Caption = 'Rele  -   R-off'
          ParentColor = False
        end
        object LD1: TLabel
          Left = 22
          Height = 1
          Top = 22
          Width = 1
          ParentColor = False
        end
        object LD2: TLabel
          Left = 22
          Height = 1
          Top = 40
          Width = 1
          ParentColor = False
        end
        object LD3: TLabel
          Left = 22
          Height = 1
          Top = 56
          Width = 1
          ParentColor = False
        end
        object LD4: TLabel
          Left = 22
          Height = 1
          Top = 72
          Width = 1
          ParentColor = False
        end
        object LP1: TLabel
          Left = 62
          Height = 1
          Top = 22
          Width = 1
          ParentColor = False
        end
        object LP2: TLabel
          Left = 62
          Height = 1
          Top = 40
          Width = 1
          ParentColor = False
        end
        object LP3: TLabel
          Left = 62
          Height = 1
          Top = 56
          Width = 1
          ParentColor = False
        end
        object LP4: TLabel
          Left = 62
          Height = 1
          Top = 72
          Width = 1
          ParentColor = False
        end
        object LX1: TLabel
          Left = 102
          Height = 1
          Top = 22
          Width = 1
          ParentColor = False
        end
        object LX2: TLabel
          Left = 102
          Height = 1
          Top = 40
          Width = 1
          ParentColor = False
        end
        object LX3: TLabel
          Left = 102
          Height = 1
          Top = 56
          Width = 1
          ParentColor = False
        end
        object LX4: TLabel
          Left = 102
          Height = 1
          Top = 72
          Width = 1
          ParentColor = False
        end
        object LR1: TLabel
          Left = 142
          Height = 1
          Top = 22
          Width = 1
          ParentColor = False
        end
        object LR2: TLabel
          Left = 142
          Height = 1
          Top = 40
          Width = 1
          ParentColor = False
        end
        object LR3: TLabel
          Left = 142
          Height = 1
          Top = 56
          Width = 1
          ParentColor = False
        end
        object LR4: TLabel
          Left = 142
          Height = 1
          Top = 72
          Width = 1
          ParentColor = False
        end
        object LV1: TLabel
          Left = 182
          Height = 1
          Top = 22
          Width = 1
          ParentColor = False
        end
        object LV2: TLabel
          Left = 182
          Height = 1
          Top = 40
          Width = 1
          ParentColor = False
        end
        object LV3: TLabel
          Left = 182
          Height = 1
          Top = 56
          Width = 1
          ParentColor = False
        end
        object LV4: TLabel
          Left = 182
          Height = 1
          Top = 72
          Width = 1
          ParentColor = False
        end
      end
      object AdvLed1: TAdvLed
        Left = 252
        Height = 24
        Top = 138
        Width = 24
        Kind = lkGreenLight
        State = lsDisabled
        Blink = False
        AutoSize = False
      end
      object lbVerSWS: TLabel
        Left = 4
        Height = 14
        Top = 144
        Width = 195
        Caption = 'Verification Teams in File and SWOS exe'
        ParentColor = False
      end
      object btEdtLeagStruc: TButton
        Left = 316
        Height = 25
        Top = 137
        Width = 264
        Caption = 'Edit League Structure'
        OnClick = btEdtLeagStrucClick
        TabOrder = 3
      end
    end
    object tbTeam: TTabSheet
      Caption = 'Team'
      ClientHeight = 686
      ClientWidth = 589
      Enabled = False
      object grTmNavi: TGroupBox
        Left = 3
        Height = 72
        Top = 8
        Width = 577
        Caption = 'Navigation Box'
        ClientHeight = 53
        ClientWidth = 573
        Font.Height = -11
        Font.Name = 'Arial'
        ParentFont = False
        TabOrder = 0
        OnMouseDown = grTeamGenMouseDown
        object lbTmTeamEd: TLabel
          Left = 14
          Height = 15
          Top = 8
          Width = 71
          Caption = 'Team To Edit:'
          ParentColor = False
          ParentFont = False
        end
        object CBTeams: TComboBox
          Left = 14
          Height = 22
          Top = 24
          Width = 240
          ItemHeight = 14
          OnChange = CBTeamsChange
          TabOrder = 0
        end
        object UpDown: TUpDown
          Left = 382
          Height = 20
          Top = 23
          Width = 80
          Min = 0
          OnClick = UpDownClick
          Orientation = udHorizontal
          Position = 0
          TabOrder = 1
        end
        object ImTFlag: TImage
          Left = 260
          Height = 24
          Top = 23
          Width = 24
        end
        object lbtmCnt: TLabel
          Left = 382
          Height = 15
          Top = 8
          Width = 80
          Alignment = taCenter
          AutoSize = False
          Caption = 'lbtmCnt'
          ParentColor = False
        end
      end
      object grTeamGen: TGroupBox
        Left = 4
        Height = 224
        Top = 88
        Width = 577
        Caption = 'General Information'
        ClientHeight = 205
        ClientWidth = 573
        TabOrder = 1
        OnMouseDown = grTeamGenMouseDown
        object lbTeamName: TLabel
          Left = 14
          Height = 14
          Top = 16
          Width = 58
          Caption = 'Team Name:'
          ParentColor = False
        end
        object ETeamname: TEdit
          Left = 302
          Height = 22
          Top = 8
          Width = 248
          CharCase = ecUppercase
          MaxLength = 16
          OnExit = ETeamnameExit
          OnMouseDown = EatFMouseDown
          TabOrder = 0
        end
        object ENationNum: TEdit
          Left = 302
          Height = 22
          Top = 40
          Width = 248
          OnExit = ENationNumExit
          OnMouseDown = EatFMouseDown
          TabOrder = 1
        end
        object lbNationNum: TLabel
          Left = 14
          Height = 14
          Top = 48
          Width = 109
          Caption = 'Team National Number:'
          ParentColor = False
        end
        object ETeamNum: TEdit
          Left = 302
          Height = 22
          Top = 72
          Width = 248
          OnExit = ETeamNumExit
          OnMouseDown = EatFMouseDown
          TabOrder = 2
        end
        object lbTeamNum: TLabel
          Left = 14
          Height = 14
          Top = 80
          Width = 98
          Caption = 'Team Number in File:'
          ParentColor = False
        end
        object ESWSgennum: TEdit
          Left = 302
          Height = 22
          Top = 104
          Width = 248
          OnExit = ESWSgennumExit
          OnMouseDown = EatFMouseDown
          TabOrder = 3
        end
        object lbSWSgennum: TLabel
          Left = 14
          Height = 14
          Top = 112
          Width = 144
          Caption = 'SWOS General Team Number:'
          ParentColor = False
        end
        object CBDivision: TComboBox
          Left = 302
          Height = 22
          Top = 136
          Width = 248
          ItemHeight = 14
          OnChange = CBDivisionChange
          TabOrder = 4
        end
        object lbDivision: TLabel
          Left = 14
          Height = 14
          Top = 144
          Width = 68
          Caption = 'Team Division:'
          ParentColor = False
        end
        object lbCoach: TLabel
          Left = 14
          Height = 14
          Top = 176
          Width = 62
          Caption = 'Team Coach:'
          ParentColor = False
        end
        object ECoach: TEdit
          Left = 302
          Height = 22
          Top = 168
          Width = 248
          CharCase = ecUppercase
          MaxLength = 22
          OnExit = ECoachExit
          OnMouseDown = EatFMouseDown
          TabOrder = 5
        end
      end
      object grHomeKit: TGroupBox
        Left = 4
        Height = 272
        Top = 320
        Width = 280
        Caption = 'Home Kit'
        ClientHeight = 253
        ClientWidth = 276
        TabOrder = 2
        OnMouseDown = grHomeKitMouseDown
        object lbHKittyp: TLabel
          Left = 14
          Height = 14
          Top = 16
          Width = 35
          Caption = 'Kit Typ:'
          ParentColor = False
        end
        object CBHKitTyp: TComboBox
          Left = 94
          Height = 22
          Top = 8
          Width = 173
          ItemHeight = 14
          OnExit = CBHKitTypChange
          TabOrder = 0
        end
        object grHKitGfx: TGroupBox
          Left = 147
          Height = 200
          Top = 40
          Width = 120
          Caption = 'Image'
          ClientHeight = 181
          ClientWidth = 116
          TabOrder = 1
          object ImHShirt: TImage
            Left = 9
            Height = 75
            Top = 8
            Width = 100
          end
          object imHShort: TImage
            Left = 9
            Height = 45
            Top = 83
            Width = 100
          end
          object imHSock: TImage
            Left = 9
            Height = 45
            Top = 128
            Width = 100
          end
        end
        object lbHShCol: TLabel
          Left = 14
          Height = 14
          Top = 56
          Width = 59
          Caption = 'Shirt Colors:'
          ParentColor = False
        end
        object cbHShirtCol1: TColorBox
          Left = 14
          Height = 22
          Top = 72
          Width = 114
          Style = [cbCustomColor]
          ItemHeight = 16
          OnExit = CBHKitTypChange
          TabOrder = 2
        end
        object cbHShirtcol2: TColorBox
          Left = 14
          Height = 22
          Top = 104
          Width = 114
          Style = [cbCustomColor]
          ItemHeight = 16
          OnExit = CBHKitTypChange
          TabOrder = 3
        end
        object cbHShortCol: TColorBox
          Left = 14
          Height = 22
          Top = 152
          Width = 116
          Style = [cbCustomColor]
          ItemHeight = 16
          OnExit = CBHKitTypChange
          TabOrder = 4
        end
        object lbHshoCol: TLabel
          Left = 14
          Height = 14
          Top = 134
          Width = 57
          Caption = 'Short Color:'
          ParentColor = False
        end
        object lbHSockCol: TLabel
          Left = 12
          Height = 14
          Top = 184
          Width = 61
          Caption = 'Socks Color:'
          ParentColor = False
        end
        object cbHSockCol: TColorBox
          Left = 14
          Height = 22
          Top = 200
          Width = 114
          Style = [cbCustomColor]
          ItemHeight = 16
          OnExit = CBHKitTypChange
          TabOrder = 5
        end
      end
      object grAwayKit: TGroupBox
        Left = 300
        Height = 272
        Top = 320
        Width = 280
        Caption = 'Away Kit'
        ClientHeight = 253
        ClientWidth = 276
        TabOrder = 3
        OnMouseDown = grAwayKitMouseDown
        object grAkitGfx: TGroupBox
          Left = 147
          Height = 200
          Top = 40
          Width = 120
          Caption = 'Image'
          ClientHeight = 181
          ClientWidth = 116
          TabOrder = 0
          object imASock: TImage
            Left = 9
            Height = 45
            Top = 128
            Width = 100
          end
          object imAShort: TImage
            Left = 9
            Height = 45
            Top = 83
            Width = 100
          end
          object ImAShirt: TImage
            Left = 9
            Height = 75
            Top = 8
            Width = 100
          end
        end
        object lbAKittyp: TLabel
          Left = 14
          Height = 14
          Top = 16
          Width = 35
          Caption = 'Kit Typ:'
          ParentColor = False
        end
        object cbAKitTyp: TComboBox
          Left = 94
          Height = 22
          Top = 8
          Width = 173
          ItemHeight = 14
          OnExit = CBHKitTypChange
          TabOrder = 1
        end
        object cbAShirtCol1: TColorBox
          Left = 14
          Height = 22
          Top = 72
          Width = 112
          ItemHeight = 16
          OnExit = CBHKitTypChange
          TabOrder = 2
        end
        object cbAShirtcol2: TColorBox
          Left = 14
          Height = 22
          Top = 104
          Width = 112
          ItemHeight = 16
          OnExit = CBHKitTypChange
          TabOrder = 3
        end
        object cbAShortCol: TColorBox
          Left = 14
          Height = 22
          Top = 152
          Width = 112
          ItemHeight = 16
          OnExit = CBHKitTypChange
          TabOrder = 4
        end
        object cbASockCol: TColorBox
          Left = 14
          Height = 22
          Top = 200
          Width = 112
          ItemHeight = 16
          OnExit = CBHKitTypChange
          TabOrder = 5
        end
        object lbASockCol: TLabel
          Left = 12
          Height = 14
          Top = 184
          Width = 61
          Caption = 'Socks Color:'
          ParentColor = False
        end
        object lbAshoCol: TLabel
          Left = 14
          Height = 14
          Top = 134
          Width = 57
          Caption = 'Short Color:'
          ParentColor = False
        end
        object lbAShCol: TLabel
          Left = 14
          Height = 14
          Top = 56
          Width = 59
          Caption = 'Shirt Colors:'
          ParentColor = False
        end
      end
      object grTeamStats: TGroupBox
        Left = 4
        Height = 82
        Top = 592
        Width = 280
        Caption = 'Team Statistics'
        ClientHeight = 63
        ClientWidth = 276
        TabOrder = 4
        object lbTmAtPts: TLabel
          Left = 13
          Height = 14
          Top = 8
          Width = 100
          Caption = 'Team Attribute Points'
          ParentColor = False
        end
        object lbtmAttPtsb7: TLabel
          Left = 13
          Height = 14
          Top = 32
          Width = 60
          Caption = 'lbtmAttPtsb7'
          ParentColor = False
        end
      end
    end
    object tbSquad: TTabSheet
      Caption = 'Squad'
      ClientHeight = 686
      ClientWidth = 589
      Enabled = False
      object gSqNavi: TGroupBox
        Left = 4
        Height = 72
        Top = 8
        Width = 577
        Caption = 'Navigation Box'
        ClientHeight = 53
        ClientWidth = 573
        Font.Height = -11
        Font.Name = 'Arial'
        ParentFont = False
        TabOrder = 0
        object lbSqTeamEd: TLabel
          Left = 14
          Height = 15
          Top = 8
          Width = 71
          Caption = 'Team To Edit:'
          ParentColor = False
          ParentFont = False
        end
        object CBSquad: TComboBox
          Left = 14
          Height = 22
          Top = 23
          Width = 240
          ItemHeight = 14
          OnChange = CBSquadChange
          TabOrder = 0
        end
        object UpDown1: TUpDown
          Left = 382
          Height = 20
          Top = 24
          Width = 80
          Min = 0
          OnClick = UpDownClick
          Orientation = udHorizontal
          Position = 0
          TabOrder = 1
        end
        object ImSFlag: TImage
          Left = 260
          Height = 24
          Top = 23
          Width = 24
        end
        object LbSqCnt: TLabel
          Left = 382
          Height = 15
          Top = 8
          Width = 74
          Alignment = taCenter
          AutoSize = False
          Caption = 'LbSqCnt'
          ParentColor = False
        end
        object UpDownPlaySq: TUpDown
          Left = 486
          Height = 20
          Top = 24
          Width = 80
          Min = 0
          OnClick = UpDownPlayClick
          Orientation = udHorizontal
          Position = 0
          TabOrder = 2
        end
        object lbPlCntSq: TLabel
          Left = 486
          Height = 15
          Top = 8
          Width = 80
          Alignment = taCenter
          AutoSize = False
          Caption = 'lbPlCntSq'
          ParentColor = False
        end
      end
      object LBSquad: TListView
        Left = 4
        Height = 336
        Top = 104
        Width = 578
        Columns = <>
        DragMode = dmAutomatic
        GridLines = True
        ReadOnly = True
        RowSelect = True
        SmallImages = ilPlayers
        SortType = stText
        TabOrder = 1
        ViewStyle = vsReport
        OnClick = LBSquadClick
        OnColumnClick = LBSquadColumnClick
        OnCompare = LBSquadCompare
        OnDblClick = LBSquadDblClick
        OnDragDrop = LBSquadDragDrop
        OnDragOver = LBSquadDragOver
        OnKeyDown = LBSquadKeyDown
        OnMouseDown = LBSquadMouseDown
      end
      object grTactics: TGroupBox
        Left = 4
        Height = 240
        Top = 440
        Width = 577
        Caption = 'Tactic'
        ClientHeight = 221
        ClientWidth = 573
        TabOrder = 2
        object pbTac: TPaintBox
          Left = 7
          Height = 225
          Top = 0
          Width = 326
          OnPaint = pbTacPaint
        end
        object cbForm: TComboBox
          Left = 343
          Height = 22
          Top = 24
          Width = 216
          ItemHeight = 14
          OnChange = cbFormChange
          TabOrder = 0
        end
        object lbForm: TLabel
          Left = 343
          Height = 14
          Top = 8
          Width = 50
          Caption = 'Formation:'
          ParentColor = False
        end
        object lbReserve: TLabel
          Left = 343
          Height = 14
          Top = 48
          Width = 41
          Caption = 'Reserve'
          ParentColor = False
        end
        object Reserve1: TLabel
          Left = 343
          Height = 14
          Top = 72
          Width = 47
          Caption = 'Reserve1'
          ParentColor = False
        end
        object Reserve2: TLabel
          Left = 344
          Height = 14
          Top = 88
          Width = 47
          Caption = 'Reserve2'
          ParentColor = False
        end
        object Reserve3: TLabel
          Left = 343
          Height = 14
          Top = 104
          Width = 47
          Caption = 'Reserve3'
          ParentColor = False
        end
        object Reserve4: TLabel
          Left = 343
          Height = 14
          Top = 120
          Width = 47
          Caption = 'Reserve4'
          ParentColor = False
        end
        object Reserve5: TLabel
          Left = 343
          Height = 14
          Top = 136
          Width = 47
          Caption = 'Reserve5'
          ParentColor = False
        end
        object btOrgPriceAll: TButton
          Left = 344
          Height = 16
          Top = 168
          Width = 216
          Caption = 'Compute Original Price for All Players'
          OnClick = btOrgPriceAllClick
          TabOrder = 1
        end
        object btNumber: TButton
          Left = 344
          Height = 16
          Top = 152
          Width = 216
          Caption = 'Sort Player Numbers by Position'
          OnClick = btNumberClick
          TabOrder = 2
        end
        object btCompAttributtebyVal: TButton
          Left = 344
          Height = 16
          Top = 184
          Width = 216
          Caption = 'Compute Attributtes for All Players'
          OnClick = btCompAttributtebyValClick
          TabOrder = 3
        end
        object btCompAttributtebyVal1: TButton
          Left = 343
          Height = 16
          Top = 200
          Width = 216
          Caption = 'Change Attributtes to 7 for All Players'
          OnClick = btCompAttributtebyVal1Click
          TabOrder = 4
        end
      end
      object lbSquadInf: TLabel
        Left = 4
        Height = 14
        Top = 87
        Width = 34
        Caption = 'Squad:'
        ParentColor = False
      end
    end
    object tbPlayer: TTabSheet
      Caption = 'Player'
      ClientHeight = 686
      ClientWidth = 589
      Enabled = False
      object gSqNavi1: TGroupBox
        Left = 4
        Height = 72
        Top = 8
        Width = 577
        Caption = 'Navigation Box'
        ClientHeight = 53
        ClientWidth = 573
        Font.Height = -11
        Font.Name = 'Arial'
        ParentFont = False
        TabOrder = 0
        OnMouseDown = LBSquadMouseDown
        object lbPlToEdt: TLabel
          Left = 14
          Height = 15
          Top = 8
          Width = 74
          Caption = 'Player To Edit:'
          ParentColor = False
          ParentFont = False
        end
        object CBPlayer: TComboBox
          Left = 14
          Height = 22
          Top = 24
          Width = 240
          ItemHeight = 14
          OnChange = CBPlayerChange
          TabOrder = 0
        end
        object UpDownPlay: TUpDown
          Left = 486
          Height = 20
          Top = 24
          Width = 80
          Min = 0
          OnClick = UpDownPlayClick
          Orientation = udHorizontal
          Position = 0
          TabOrder = 1
        end
        object LbFind1: TLabel
          Left = 302
          Height = 14
          Top = 8
          Width = 38
          Caption = 'LbFind1'
          ParentColor = False
          OnClick = LbFind1Click
          OnMouseEnter = LbFind1MouseEnter
          OnMouseLeave = LbFind1MouseLeave
        end
        object LbFind2: TLabel
          Left = 302
          Height = 14
          Top = 32
          Width = 38
          Caption = 'LbFind2'
          ParentColor = False
          OnClick = LbFind2Click
          OnMouseEnter = LbFind2MouseEnter
          OnMouseLeave = LbFind2MouseLeave
        end
        object lbPlCnt: TLabel
          Left = 486
          Height = 15
          Top = 8
          Width = 80
          Alignment = taCenter
          AutoSize = False
          Caption = 'lbPlCnt'
          ParentColor = False
        end
      end
      object grPlayGen: TGroupBox
        Left = 4
        Height = 152
        Top = 88
        Width = 577
        Caption = 'General Player Information'
        ClientHeight = 133
        ClientWidth = 573
        TabOrder = 1
        OnMouseDown = LBSquadMouseDown
        object lbPname: TLabel
          Left = 14
          Height = 14
          Top = 16
          Width = 63
          Caption = 'Player Name:'
          ParentColor = False
        end
        object Epname: TEdit
          Left = 302
          Height = 22
          Top = 8
          Width = 248
          CharCase = ecUppercase
          MaxLength = 22
          OnDblClick = EpnameDblClick
          OnExit = EpnameExit
          OnMouseDown = EatFMouseDown
          TabOrder = 0
        end
        object lbNum: TLabel
          Left = 14
          Height = 14
          Top = 48
          Width = 73
          Caption = 'Player Number:'
          ParentColor = False
        end
        object Enumb: TEdit
          Left = 302
          Height = 22
          Top = 40
          Width = 248
          OnExit = EnumbExit
          OnMouseDown = EatFMouseDown
          TabOrder = 1
        end
        object CBSkin: TComboBox
          Left = 302
          Height = 22
          Top = 72
          Width = 248
          ItemHeight = 14
          OnChange = CBSkinChange
          TabOrder = 2
        end
        object lbSkin: TLabel
          Left = 14
          Height = 14
          Top = 80
          Width = 94
          Caption = 'Skin and Hair Color:'
          ParentColor = False
        end
        object cbpNation: TComboBox
          Left = 302
          Height = 22
          Top = 104
          Width = 248
          ItemHeight = 14
          OnChange = cbpNationChange
          TabOrder = 3
        end
        object lbPnat: TLabel
          Left = 14
          Height = 14
          Top = 112
          Width = 52
          Caption = 'Nationality:'
          ParentColor = False
        end
        object imSkin: TBGRASpeedButton
          Left = 270
          Height = 22
          Top = 73
          Width = 23
          OnClick = imSkinClick
        end
        object ImPlNat: TImage
          Left = 270
          Height = 24
          Top = 104
          Width = 24
        end
        object ImgNat1: TImage
          Left = 238
          Height = 24
          Top = 104
          Width = 24
        end
      end
      object gbAttributess: TGroupBox
        Left = 4
        Height = 424
        Top = 248
        Width = 577
        Caption = 'Attributes'
        ClientHeight = 405
        ClientWidth = 573
        TabOrder = 2
        OnMouseDown = gbAttributessMouseDown
        object lbposition: TLabel
          Left = 14
          Height = 14
          Top = 16
          Width = 40
          Caption = 'Position:'
          ParentColor = False
        end
        object CBposit: TComboBox
          Left = 302
          Height = 22
          Top = 8
          Width = 248
          ItemHeight = 14
          OnChange = CBpositChange
          TabOrder = 0
        end
        object grPa: TGroupBox
          Left = 14
          Height = 152
          Top = 40
          Width = 64
          Caption = 'Passing'
          ClientHeight = 133
          ClientWidth = 60
          TabOrder = 1
          OnMouseDown = gbAttributessMouseDown
          object pbP: TplProgressBar
            Left = 22
            Height = 66
            Top = 16
            Width = 16
            Color = clWhite
            ColorElement = clSkyBlue
            Orientation = pbVertical
            ParentColor = False
            Min = 0
            Max = 7
            Position = 4
            OnMouseDown = gbAttributessMouseDown
          end
          object EatP: TEdit
            Left = 14
            Height = 20
            Top = 96
            Width = 32
            Alignment = taCenter
            AutoSize = False
            OnExit = EatPExit
            OnMouseDown = gbAttributessMouseDown
            TabOrder = 0
            Text = '0'
          end
          object SpeedButton1: TSpeedButton
            Left = 14
            Height = 16
            Top = 118
            Width = 32
            Caption = '7/15'
            OnClick = SpeedButton1Click
          end
        end
        object grAV: TGroupBox
          Left = 90
          Height = 152
          Top = 40
          Width = 64
          Caption = 'Shooting'
          ClientHeight = 133
          ClientWidth = 60
          TabOrder = 2
          OnMouseDown = gbAttributessMouseDown
          object pbV: TplProgressBar
            Left = 22
            Height = 66
            Top = 16
            Width = 16
            Color = clWhite
            ColorElement = clSkyBlue
            Orientation = pbVertical
            ParentColor = False
            Min = 0
            Max = 7
            Position = 4
            OnMouseDown = gbAttributessMouseDown
          end
          object EatV: TEdit
            Left = 14
            Height = 20
            Top = 96
            Width = 32
            Alignment = taCenter
            AutoSize = False
            OnExit = EatVExit
            OnMouseDown = gbAttributessMouseDown
            TabOrder = 0
            Text = '0'
          end
          object SpeedButton2: TSpeedButton
            Left = 14
            Height = 16
            Top = 118
            Width = 32
            Caption = '7/15'
            OnClick = SpeedButton2Click
          end
        end
        object grPa2: TGroupBox
          Left = 168
          Height = 152
          Top = 40
          Width = 64
          Caption = 'Heading'
          ClientHeight = 133
          ClientWidth = 60
          TabOrder = 3
          OnMouseDown = gbAttributessMouseDown
          object pbH: TplProgressBar
            Left = 22
            Height = 66
            Top = 16
            Width = 16
            Color = clWhite
            ColorElement = clSkyBlue
            Orientation = pbVertical
            ParentColor = False
            Min = 0
            Max = 7
            Position = 4
            OnMouseDown = gbAttributessMouseDown
          end
          object EatH: TEdit
            Left = 14
            Height = 20
            Top = 96
            Width = 32
            Alignment = taCenter
            AutoSize = False
            OnExit = EatHExit
            OnMouseDown = gbAttributessMouseDown
            TabOrder = 0
            Text = '0'
          end
          object SpeedButton3: TSpeedButton
            Left = 14
            Height = 16
            Top = 118
            Width = 32
            Caption = '7/15'
            OnClick = SpeedButton3Click
          end
        end
        object grPa3: TGroupBox
          Left = 246
          Height = 152
          Top = 40
          Width = 64
          Caption = 'Tackling'
          ClientHeight = 133
          ClientWidth = 60
          TabOrder = 4
          OnMouseDown = gbAttributessMouseDown
          object pbT: TplProgressBar
            Left = 22
            Height = 66
            Top = 16
            Width = 16
            Color = clWhite
            ColorElement = clSkyBlue
            Orientation = pbVertical
            ParentColor = False
            Min = 0
            Max = 7
            Position = 4
            OnMouseDown = gbAttributessMouseDown
          end
          object EatT: TEdit
            Left = 14
            Height = 20
            Top = 96
            Width = 32
            Alignment = taCenter
            AutoSize = False
            OnExit = EatTExit
            OnMouseDown = gbAttributessMouseDown
            TabOrder = 0
            Text = '0'
          end
          object SpeedButton4: TSpeedButton
            Left = 14
            Height = 16
            Top = 118
            Width = 32
            Caption = '7/15'
            OnClick = SpeedButton4Click
          end
        end
        object grPa4: TGroupBox
          Left = 326
          Height = 152
          Top = 40
          Width = 64
          Caption = 'B.Control'
          ClientHeight = 133
          ClientWidth = 60
          TabOrder = 5
          OnMouseDown = gbAttributessMouseDown
          object pbC: TplProgressBar
            Left = 22
            Height = 66
            Top = 16
            Width = 16
            Color = clWhite
            ColorElement = clSkyBlue
            Orientation = pbVertical
            ParentColor = False
            Min = 0
            Max = 7
            Position = 4
            OnMouseDown = gbAttributessMouseDown
          end
          object EatC: TEdit
            Left = 14
            Height = 20
            Top = 96
            Width = 32
            Alignment = taCenter
            AutoSize = False
            OnExit = EatCExit
            OnMouseDown = gbAttributessMouseDown
            TabOrder = 0
            Text = '0'
          end
          object SpeedButton5: TSpeedButton
            Left = 14
            Height = 16
            Top = 118
            Width = 32
            Caption = '7/15'
            OnClick = SpeedButton5Click
          end
        end
        object grPa5: TGroupBox
          Left = 406
          Height = 152
          Top = 40
          Width = 64
          Caption = 'Speed'
          ClientHeight = 133
          ClientWidth = 60
          TabOrder = 6
          OnMouseDown = gbAttributessMouseDown
          object pbS: TplProgressBar
            Left = 22
            Height = 66
            Top = 16
            Width = 16
            Color = clWhite
            ColorElement = clSkyBlue
            Orientation = pbVertical
            ParentColor = False
            Min = 0
            Max = 7
            Position = 4
            OnMouseDown = gbAttributessMouseDown
          end
          object EatS: TEdit
            Left = 14
            Height = 20
            Top = 96
            Width = 32
            Alignment = taCenter
            AutoSize = False
            OnExit = EatSExit
            OnMouseDown = gbAttributessMouseDown
            TabOrder = 0
            Text = '0'
          end
          object SpeedButton6: TSpeedButton
            Left = 14
            Height = 16
            Top = 118
            Width = 32
            Caption = '7/15'
            OnClick = SpeedButton6Click
          end
        end
        object grPa6: TGroupBox
          Left = 486
          Height = 152
          Top = 40
          Width = 64
          Caption = 'Finishing'
          ClientHeight = 133
          ClientWidth = 60
          TabOrder = 7
          OnMouseDown = gbAttributessMouseDown
          object pbF: TplProgressBar
            Left = 22
            Height = 66
            Top = 16
            Width = 16
            Color = clWhite
            ColorElement = clSkyBlue
            Orientation = pbVertical
            ParentColor = False
            Min = 0
            Max = 7
            Position = 4
            OnMouseDown = gbAttributessMouseDown
          end
          object EatF: TEdit
            Left = 14
            Height = 20
            Top = 96
            Width = 32
            Alignment = taCenter
            AutoSize = False
            OnExit = EatFExit
            OnMouseDown = gbAttributessMouseDown
            TabOrder = 0
            Text = '0'
          end
          object SpeedButton7: TSpeedButton
            Left = 14
            Height = 16
            Top = 118
            Width = 32
            Caption = '7/15'
            OnClick = SpeedButton7Click
          end
        end
        object lbValue: TLabel
          Left = 22
          Height = 14
          Top = 336
          Width = 79
          Caption = 'Market Value (£)'
          ParentColor = False
        end
        object CBValue: TComboBox
          Left = 326
          Height = 22
          Top = 328
          Width = 128
          ItemHeight = 14
          OnChange = CBValueChange
          TabOrder = 8
        end
        object Panel1: TPanel
          Left = 458
          Height = 23
          Top = 328
          Width = 92
          ClientHeight = 23
          ClientWidth = 92
          Color = 6426656
          ParentColor = False
          TabOrder = 9
          object imStars: TImage
            Left = 3
            Height = 19
            Top = 2
            Width = 84
            Stretch = True
            Transparent = True
          end
        end
        object grPStatic: TGroupBox
          Left = 14
          Height = 120
          Top = 200
          Width = 537
          Caption = 'Statistics'
          ClientHeight = 101
          ClientWidth = 533
          TabOrder = 10
          OnMouseDown = LBSquadMouseDown
          object gbChart: TGroupBox
            Left = 398
            Height = 104
            Top = 0
            Width = 128
            Caption = 'Attributes Chart'
            ClientHeight = 85
            ClientWidth = 124
            TabOrder = 0
            object pbAC1: TplProgressBar
              Left = 20
              Height = 66
              Top = 0
              Width = 10
              Color = clCream
              ColorElement = clSkyBlue
              ColorBorder = clSilver
              Orientation = pbVertical
              ParentColor = False
              Min = 0
              Max = 7
              Position = 1
              Step = 1
            end
            object pbAC3: TplProgressBar
              Left = 50
              Height = 66
              Top = 0
              Width = 10
              Color = clCream
              ColorElement = clSkyBlue
              ColorBorder = clSilver
              Orientation = pbVertical
              ParentColor = False
              Min = 0
              Max = 7
              Position = 3
              Step = 1
            end
            object pbAC4: TplProgressBar
              Left = 65
              Height = 66
              Top = 0
              Width = 10
              Color = clCream
              ColorElement = clSkyBlue
              ColorBorder = clSilver
              Orientation = pbVertical
              ParentColor = False
              Min = 0
              Max = 7
              Position = 4
              Step = 1
            end
            object pbAC5: TplProgressBar
              Left = 80
              Height = 66
              Top = 0
              Width = 10
              Color = clCream
              ColorElement = clSkyBlue
              ColorBorder = clSilver
              Orientation = pbVertical
              ParentColor = False
              Min = 0
              Max = 7
              Position = 5
              Step = 1
            end
            object pbAC6: TplProgressBar
              Left = 95
              Height = 66
              Top = 0
              Width = 10
              Color = clCream
              ColorElement = clSkyBlue
              ColorBorder = clSilver
              Orientation = pbVertical
              ParentColor = False
              Min = 0
              Max = 7
              Position = 6
              Step = 1
            end
            object pbAC7: TplProgressBar
              Left = 110
              Height = 66
              Top = 0
              Width = 10
              Color = clCream
              ColorElement = clSkyBlue
              ColorBorder = clSilver
              Orientation = pbVertical
              ParentColor = False
              Min = 0
              Max = 7
              Position = 7
              Step = 1
            end
            object LbAttCh: TLabel
              Left = 21
              Height = 14
              Top = 64
              Width = 36
              Caption = 'lbAttCH'
              ParentColor = False
            end
            object pbAC2: TplProgressBar
              Left = 35
              Height = 66
              Top = 0
              Width = 10
              Color = clCream
              ColorElement = clSkyBlue
              ColorBorder = clSilver
              Orientation = pbVertical
              ParentColor = False
              Min = 0
              Max = 7
              Position = 2
              Step = 1
            end
            object Image1: TImage
              Left = 10
              Height = 66
              Top = 0
              Width = 10
              Picture.Data = {
                1754506F727461626C654E6574776F726B477261706869632802000089504E47
                0D0A1A0A0000000D494844520000000A0000004208060000006E3947BC000000
                097048597300000B1300000B1301009A9C18000000206348524D00007A250000
                80830000F9FF000080E9000075300000EA6000003A980000176F925FC5460000
                01AE4944415478DAAC96D16DC3300C449F82FCD79DA01E41DDC0DD202364048F
                E011D20DD20D3282477036F008EE04EC0F15D002CD044D0408B62186D49D8E17
                2511E191B1E3C1B12F2F29A50C34666D1191E9F6252268F9111033C7B22622AB
                C00C74C0A08187ADC03266E06CAB798147CD96EBC01A7506AEC0748F9E0C2C2E
                3F55E90E68EB35112195A094929B243A995556AF74566AC4E3716F7ED3031FC0
                BBD2D4B8676DCACD8AFC704F3D4753C10D9CF539EA7BB305A6D39205CC313AEB
                464BB6FF267CEF906DF73C7B7B6C2A850F5B84677D7E039755B62AE360B22D40
                17F5CCA0FB9C81CB96C2B3CE51338684DBD26117B656392F53785311EF3697B5
                96D0007A038888C7454F4522A7386BE0E80864855A9CFD270F75D2F965BE43D4
                377A5E427871DD2622FC5089A2DDA2A7057E804FE0AD760A4F3D4B6983C89A01
                4E6A56C356C653F937F05AC1061EAB76EDEE29FC394BA9C1B48F10DE457BDC55
                067555D5FCD68EEBA9A7A0EF23D4A5FC0434F77A66F20CC0065EA21B80E5B16E
                FAD59DE2294BC9C67D37E9292A1F2330BD69833112EEAC3D3D853729A5E7F9BB
                D9C3811E8F859AC9F2985E7E7FFC1B00559F593D057247C50000000049454E44
                AE426082
              }
            end
          end
          object lbAttCodeStr: TLabel
            Left = 14
            Height = 14
            Top = 8
            Width = 81
            Caption = 'Attributtes Code:'
            ParentColor = False
          end
          object lbAttCode: TLabel
            Left = 246
            Height = 15
            Top = 8
            Width = 22
            Caption = 'FHS'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lbWAM: TLabel
            Left = 14
            Height = 14
            Top = 32
            Width = 56
            Caption = 'Predictions:'
            ParentColor = False
          end
          object lbWAMcalc: TLabel
            Left = 246
            Height = 14
            Top = 32
            Width = 54
            Caption = 'lbWAMcalc'
            ParentColor = False
          end
          object Label2: TLabel
            Left = 14
            Height = 14
            Top = 56
            Width = 114
            Caption = 'Player Attributes Points:'
            ParentColor = False
          end
          object Label3: TLabel
            Left = 14
            Height = 14
            Top = 80
            Width = 138
            Caption = 'Player Attributes Points by 7:'
            ParentColor = False
          end
          object lbPAP: TLabel
            Left = 246
            Height = 14
            Top = 56
            Width = 27
            Caption = 'lbPAP'
            ParentColor = False
          end
          object lbPAPb7: TLabel
            Left = 246
            Height = 14
            Top = 80
            Width = 39
            Caption = 'lbPAPb7'
            ParentColor = False
          end
        end
        object btCompOrg: TButton
          Left = 326
          Height = 20
          Top = 355
          Width = 225
          Caption = 'Compute Original Price'
          Font.Height = -11
          OnClick = btCompOrgClick
          ParentFont = False
          TabOrder = 11
        end
        object btGenPosVal: TButton
          Left = 326
          Height = 20
          Top = 376
          Width = 224
          Caption = 'Generate Attributess by Value-Position'
          OnClick = btGenPosValClick
          OnMouseDown = btGenPosValMouseDown
          TabOrder = 12
        end
      end
    end
  end
  object Menus: TMainMenu
    Left = 664
    Top = 65528
    object MFile: TMenuItem
      Caption = 'File'
      OnClick = MFileClick
      object MreadTeam: TMenuItem
        Caption = 'Open Team'
        ShortCut = 16463
        OnClick = MreadTeamClick
      end
      object MOpenAll: TMenuItem
        Caption = 'Open All'
        ShortCut = 24655
        OnClick = MOpenAllClick
      end
      object Mreload: TMenuItem
        Caption = 'Reload Current'
        Enabled = False
        ShortCut = 16466
        OnClick = MreloadClick
      end
      object MWriteCur: TMenuItem
        Caption = 'Write Current'
        Enabled = False
        ShortCut = 16467
        OnClick = MWriteCurClick
      end
      object MWriteAll: TMenuItem
        Caption = 'Write All'
        Enabled = False
        ShortCut = 24659
        OnClick = MWriteAllClick
      end
      object MUnloadAll: TMenuItem
        Caption = 'Unload All'
        ShortCut = 24661
        OnClick = MUnloadAllClick
      end
      object MenuItem2: TMenuItem
        Caption = '-'
      end
      object Mclose: TMenuItem
        Caption = 'Close'
        OnClick = McloseClick
      end
    end
    object Medit: TMenuItem
      Caption = 'Edit'
      Enabled = False
      object MaddTeam: TMenuItem
        Caption = 'Add Team'
        ShortCut = 16491
        OnClick = MaddTeamClick
      end
      object MRemoveTeam: TMenuItem
        Caption = 'Remove Team'
        ShortCut = 16493
        OnClick = MRemoveTeamClick
      end
      object MclrTeam: TMenuItem
        Caption = 'Clear Team'
        ShortCut = 16490
        OnClick = MclrTeamClick
      end
      object MenuItem5: TMenuItem
        Caption = '-'
      end
      object MShowPool: TMenuItem
        Caption = 'Show PoolPlyr'
        ShortCut = 24656
        OnClick = MShowPoolClick
      end
      object MClipShow: TMenuItem
        Caption = 'Show Clipboard'
        ShortCut = 16480
        OnClick = MClipShowClick
      end
      object MenuItem4: TMenuItem
        Caption = '-'
      end
      object McpPlayer: TMenuItem
        Caption = 'Copy Player'
        ShortCut = 16459
        OnClick = McpPlayerClick
      end
      object MPaPlayer: TMenuItem
        Caption = 'Paste Player'
        ShortCut = 16471
        OnClick = MPaPlayerClick
      end
      object MenuItem3: TMenuItem
        Caption = '-'
      end
      object McpTeam: TMenuItem
        Caption = 'Copy Team'
        ShortCut = 24651
        OnClick = McpTeamClick
      end
      object MpaTeam: TMenuItem
        Caption = 'Paste Team'
        ShortCut = 24663
        OnClick = MpaTeamClick
      end
    end
    object MGlobal: TMenuItem
      Caption = 'Global'
      object MChgTeamNr: TMenuItem
        Caption = 'Change All Team National Numbers'
        Enabled = False
        OnClick = MChgTeamNrClick
      end
      object MCHLEG: TMenuItem
        Caption = 'Verify All League Structures'
        Enabled = False
        OnClick = MCHLEGClick
      end
      object MEuroCup: TMenuItem
        Caption = 'Euro Cup Competitions in Exe'
        Enabled = False
        OnClick = MEuroCupClick
      end
      object MenuItem7: TMenuItem
        Caption = '-'
        OnClick = MenuItem7Click
      end
      object MCSVExp: TMenuItem
        Caption = 'CSV Export'
        Enabled = False
        object MCSVPl: TMenuItem
          Caption = 'Players'
          OnClick = MCSVPlClick
        end
        object MCSVTeam: TMenuItem
          Caption = 'Teams'
          OnClick = MCSVTeamClick
        end
      end
      object MXMLexp: TMenuItem
        Caption = 'XML Export'
        Enabled = False
        object MXMLPl: TMenuItem
          Caption = 'Players'
          OnClick = MXMLPlClick
        end
        object MXMLteam: TMenuItem
          Caption = 'Teams'
        end
      end
    end
    object MSearch: TMenuItem
      Caption = 'Search'
      object MFTbyName: TMenuItem
        Caption = 'Find Team by Name'
        Enabled = False
        ShortCut = 24646
        OnClick = MFTbyNameClick
      end
      object MFPbyName: TMenuItem
        Caption = 'Find Player by Name'
        Enabled = False
        ShortCut = 16454
        OnClick = MFPbyNameClick
      end
      object MenuItem1: TMenuItem
        Caption = '-'
      end
      object MShowRandom: TMenuItem
        Caption = 'Show Random Player'
        Enabled = False
        OnClick = MShowRandomClick
      end
      object MenuItem11: TMenuItem
        Caption = '-'
      end
      object MFindSWSMax: TMenuItem
        Caption = 'Find Max SWOS General Number'
        Enabled = False
        OnClick = MFindSWSMaxClick
      end
    end
    object MOptions: TMenuItem
      Caption = 'Options'
      object MSettings: TMenuItem
        Caption = 'Settings'
        ShortCut = 123
        OnClick = MSettingsClick
      end
    end
    object Mhelp: TMenuItem
      Caption = 'Help'
      object MHelpP: TMenuItem
        Caption = 'Help'
        OnClick = MHelpPClick
      end
      object MenuItem10: TMenuItem
        Caption = '-'
      end
      object MAbout: TMenuItem
        Caption = 'About...'
        OnClick = MAboutClick
      end
    end
  end
  object ope: TOpenDialog
    Options = [ofAllowMultiSelect, ofFileMustExist, ofNoNetworkButton, ofEnableSizing, ofViewDetail]
    Left = 528
  end
  object ilPlayers: TBGRAImageList
    DrawingStyle = dsTransparent
    Left = 496
    Bitmap = {
      4C69030000001000000010000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF00000016000000140000
      000F0000000700000002000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      002E0000001600000007000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00620000003A0000001C00000007000000FF000000FF000000FF000000FF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF000000FF000000FF0000
      00FF000000FF0000003A00000016000000FF000000FF000000FF000000FF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF000000FF000000FF0000
      00FF000000FF0000006A0000003A000000FF000000FF006CFCFF006CFCFFFCFC
      FCFFFCFCFCFF006CFCFF006CFCFFB4B4B4FFB4B4B4FF0048B4FF0048B4FF0000
      00FF000000FF0000009200000062000000FF000000FF006CFCFF006CFCFFFCFC
      FCFFFCFCFCFF006CFCFF006CFCFFB4B4B4FFB4B4B4FF0048B4FF0048B4FF0000
      00FF000000FF000000B60000008F0000000000000014006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF0048B4FF0048B4FF0000
      00CC000000CA000000C5000000A90000000000000014006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF0048B4FF0048B4FF0000
      00CC000000CA000000C5000000A9000000000000000F0048B4FF0048B4FF006C
      FCFF006CFCFF000000FF000000FF0048B4FF0048B4FF00246CFF00246CFF0000
      00CC000000C5000000B60000008F00000000000000070048B4FF0048B4FF006C
      FCFF006CFCFF000000FF000000FF0048B4FF0048B4FF00246CFF00246CFF0000
      00CC000000BD0000009E0000006A000000000000000200000007000000230048
      B4FF0048B4FF0048B4FF0048B4FF00246CFF00246CFF000000CC000000CC0000
      00CC000000B80000008F00000051000000000000000000000000000000140048
      B4FF0048B4FF0048B4FF0048B4FF00246CFF00246CFF000000CC000000CA0000
      00C5000000A90000007B0000003D0000000000000000000000000000000F0000
      002E000000620000008F000000B6000000C5000000CC000000CC000000C50000
      00B60000008F000000620000002E000000000000000000000000000000070000
      00160000003A000000620000008F000000A9000000B6000000B6000000A90000
      008F000000620000003A0000001600000000000000000000000000000000006C
      FCFF006CFCFF0048B4FF0048B4FF006CFCFF006CFCFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000006C
      FCFF006CFCFF0048B4FF0048B4FF006CFCFF006CFCFF000000140000000F0000
      00070000000200000000000000000000000000000000006CFCFF006CFCFF0048
      B4FF0048B4FF0048B4FF0048B4FF00246CFF00246CFF0048B4FF0048B4FF0000
      00160000000700000000000000000000000000000000006CFCFF006CFCFF0048
      B4FF0048B4FF0048B4FF0048B4FF00246CFF00246CFF0048B4FF0048B4FF0000
      003A0000001C0000000700000002006CFCFF006CFCFF0048B4FF0048B4FF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF00246CFF00246CFF0048
      B4FF0048B4FF0000001600000007006CFCFF006CFCFF0048B4FF0048B4FF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF00246CFF00246CFF0048
      B4FF0048B4FF0000003A0000001C0048B4FF0048B4FF006CFCFF006CFCFFFCFC
      FCFFFCFCFCFF006CFCFF006CFCFFB4B4B4FFB4B4B4FF0048B4FF0048B4FF0024
      6CFF00246CFF000000620000003A0048B4FF0048B4FF006CFCFF006CFCFFFCFC
      FCFFFCFCFCFF006CFCFF006CFCFFB4B4B4FFB4B4B4FF0048B4FF0048B4FF0024
      6CFF00246CFF0000008F00000062000000140000003D006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF0048B4FF0048B4FF0000
      00CA000000C5000000A90000007B000000140000003D006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF0048B4FF0048B4FF0000
      00CA000000C5000000A90000007B0000000F0000002E0048B4FF0048B4FF006C
      FCFF006CFCFF000000FF000000FF0048B4FF0048B4FF00246CFF00246CFF0000
      00C5000000B60000008F0000006200000007000000160048B4FF0048B4FF006C
      FCFF006CFCFF000000FF000000FF0048B4FF0048B4FF00246CFF00246CFF0000
      00BD0000009E0000006A0000003D000000020000000700000023000000510048
      B4FF0048B4FF0048B4FF0048B4FF00246CFF00246CFF000000CC000000CC0000
      00B80000008F00000051000000230000000000000000000000140000003D0048
      B4FF0048B4FF0048B4FF0048B4FF00246CFF00246CFF000000CA000000C50000
      00A90000007B0000003D0000001400000000000000000000000F0000002E0000
      00620000008F000000B6000000C5000000CC000000CC000000C5000000B60000
      008F000000620000002E0000000F000000000000000000000007000000160000
      003A000000620000008F000000A9000000B6000000B6000000A90000008F0000
      00620000003A0000001600000007000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF000000140000000F0000
      00070000000200000000000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00160000000700000000000000000000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      003A0000001C0000000700000002000000FF000000FF000000FF000000FF0048
      B4FF0048B4FF0048B4FF0048B4FF0048B4FF0048B4FF000000FF000000FF0000
      00FF000000FF0000001600000007000000FF000000FF000000FF000000FF0048
      B4FF0048B4FF0048B4FF0048B4FF0048B4FF0048B4FF000000FF000000FF0000
      00FF000000FF0000003A0000001C000000FF000000FF0048B4FF0048B4FFFCFC
      FCFFFCFCFCFF0048B4FF0048B4FFB4B4B4FFB4B4B4FF00246CFF00246CFF0000
      00FF000000FF000000620000003A000000FF000000FF0048B4FF0048B4FFFCFC
      FCFFFCFCFCFF0048B4FF0048B4FFB4B4B4FFB4B4B4FF00246CFF00246CFF0000
      00FF000000FF0000008F00000062000000140000003D0048B4FF0048B4FF0048
      B4FF0048B4FF0048B4FF0048B4FF0048B4FF0048B4FF00246CFF00246CFF0000
      00CA000000C5000000A90000007B000000140000003D0048B4FF0048B4FF0048
      B4FF0048B4FF0048B4FF0048B4FF0048B4FF0048B4FF00246CFF00246CFF0000
      00CA000000C5000000A90000007B0000000F0000002E00246CFF00246CFF0048
      B4FF0048B4FF000000FF000000FF00246CFF00246CFF000000FF000000FF0000
      00C5000000B60000008F00000062000000070000001600246CFF00246CFF0048
      B4FF0048B4FF000000FF000000FF00246CFF00246CFF000000FF000000FF0000
      00BD0000009E0000006A0000003D000000020000000700000023000000510024
      6CFF00246CFF00246CFF00246CFF000000FF000000FF000000CC000000CC0000
      00B80000008F00000051000000230000000000000000000000140000003D0024
      6CFF00246CFF00246CFF00246CFF000000FF000000FF000000CA000000C50000
      00A90000007B0000003D0000001400000000000000000000000F0000002E0000
      00620000008F000000B6000000C5000000CC000000CC000000C5000000B60000
      008F000000620000002E0000000F000000000000000000000007000000160000
      003A000000620000008F000000A9000000B6000000B6000000A90000008F0000
      00620000003A0000001600000007
    }
  end
  object ilStars: TBGRAImageList
    DrawingStyle = dsTransparent
    Height = 23
    Width = 96
    Left = 464
    Bitmap = {
      4C690A0000006000000017000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000001FF000001FF000001FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000001FF060011FF0C0023FF0C0025FF070014FF0100
      02FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF0D0028FF1C0054FF1D0058FF10002FFF0200
      05FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000001FF010002FF0100
      03FF010003FF010003FF020006FF100030FF210062FF220066FF130038FF0300
      09FF010003FF010003FF010003FF010003FF000001FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000005000EFF0D0026FF1000
      2FFF10002FFF10002FFF110031FF190049FF220066FF230069FF1A004EFF1100
      32FF10002FFF10002FFF10002FFF0E0029FF060011FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A001DFF1B0050FF2100
      62FF210062FF210062FF210062FF220066FF24006BFF24006BFF230067FF2100
      63FF210062FF210062FF210062FF1D0055FF0C0024FF000001FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A001FFF1C0053FF2200
      66FF230068FF24006BFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016AFF240268FF1F025AFF0E0227FF020203FF020202FF0101
      01FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000050010FF0F002CFF1200
      37FF19004AFF220065FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240269FF240A58FF241149FF221241FF191226FF121213FF0F0F0FFF0505
      05FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010002FF020005FF0200
      07FF0E002BFF1F005EFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241345FF24212AFF242227FF232224FF222222FF1C1C1CFF0A0A
      0AFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      01FF0D0027FF1F005DFF24006CFF240169FF240366FF240365FF240269FF2400
      6CFF240365FF241443FF242326FF242424FF222222FF212121FF1B1B1BFF0A0A
      0AFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      01FF0D0027FF1F005DFF24016BFF24095AFF241247FF241345FF240A58FF2401
      6AFF240365FF241443FF242326FF212121FF171717FF101010FF0D0D0DFF0505
      05FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      01FF0D0027FF1F005DFF24016AFF240F4EFF24202CFF24212AFF241249FF2402
      68FF240365FF241443FF242326FF1F1F1FFF0E0E0EFF010101FF010101FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      01FF0B0022FF1B0050FF1F015BFF211044FF242129FF242227FF221241FF1F02
      5AFF1F0358FF22143DFF242326FF1F1F1FFF0D0D0DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000005000EFF0B0022FF0E0127FF171026FF222124FF232224FF191226FF0E02
      27FF0F0327FF1A1425FF232324FF1F1F1FFF0D0D0DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000001FF010102FF101010FF212121FF222222FF121213FF0202
      03FF030304FF141415FF232323FF1F1F1FFF0D0D0DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010101FF0D0D0DFF1A1A1AFF1B1B1BFF0F0F0FFF0202
      02FF030303FF101010FF1C1C1CFF191919FF0B0B0BFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000050505FF0A0A0AFF0A0A0AFF060606FF0101
      01FF010101FF060606FF0B0B0BFF0A0A0AFF040404FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF230167FF18063CFF0C0A
      10FF0A0A0AFF050505FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF240268FF210F45FF1D1B
      21FF1A1A1AFF0D0D0DFF010101FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF010004FF10002FFF210062FF240268FF241249FF2422
      29FF212122FF101011FF010102FF000001FF000001FF000001FF000001FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000D0027FF0D0027FF0D0027FF0D0027FF0D00
      27FF0D0027FF0D0027FF0E0029FF170045FF220066FF240169FF240C55FF2416
      41FF22153CFF170A31FF0E0128FF0D0027FF0D0027FF0D0027FF0B0020FF0400
      0CFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F005DFF1F005DFF1F005DFF1F005DFF1F00
      5DFF1F005DFF1F005DFF1F005DFF210063FF24006BFF24006BFF240367FF2405
      63FF240562FF21025FFF1F005DFF1F005DFF1F005DFF1F005DFF19004CFF0900
      1CFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000230069FF230069FF23006AFF24006BFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24016BFF24016AFF1E0157FF0C01
      21FF010101FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000014003DFF14003DFF19004BFF210063FF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240268FF240A58FF24104DFF201042FF1610
      22FF101010FF0C0C0CFF040404FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003000AFF03000AFF0D0027FF1E005AFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240463FF241543FF24212CFF232129FF2221
      24FF212121FF191919FF080808FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A001FFF1C0053FF2200
      66FF230068FF24006BFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016AFF240268FF24075FFF24183DFF242425FF242424FF2323
      23FF222222FF1A1A1AFF080808FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000050010FF0F002CFF1200
      37FF19004AFF220065FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240269FF240A58FF241149FF241443FF241D31FF242424FF212121FF1717
      17FF121212FF0E0E0EFF040404FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010002FF020005FF0200
      07FF0E002BFF1F005EFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241345FF24212AFF242227FF242325FF242424FF1E1E1EFF0C0C
      0CFF020202FF020202FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010003FF020008FF0300
      0BFF0F002EFF20005FFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241347FF24202DFF24212AFF222125FF212121FF1B1B1BFF0A0A
      0AFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060012FF100032FF1400
      3DFF1A004EFF220066FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240169FF24095AFF24104EFF211045FF171026FF101011FF0D0D0DFF0505
      05FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0056FF2300
      69FF23006AFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016BFF24016AFF1F015CFF0E0127FF010102FF010101FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF240268FF240463FF240562FF240562FF240562FF240562FF240562FF2405
      62FF240563FF240268FF24006CFF20015EFF10032BFF050506FF040404FF0202
      02FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF24085BFF241444FF24173EFF24173EFF24173EFF24173EFF24173EFF2417
      3EFF241542FF240A58FF24016BFF220361FF1C0F36FF171718FF131313FF0707
      07FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6BFF240D52FF241F2FFF242425FF242425FF242425FF242425FF242425FF2424
      25FF24212BFF24104DFF24016AFF240562FF24173EFF242425FF1D1D1DFF0B0B
      0BFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009001AFF180048FF1D00
      57FF200D45FF231F2BFF242424FF212121FF1E1E1EFF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1A22FF1D0D3FFF1D0156FF1E0551FF211737FF242425FF1D1D1DFF0B0B
      0BFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003000AFF09001AFF0B00
      20FF140D21FF211F23FF232323FF191919FF0D0D0DFF0B0B0BFF0B0B0BFF0B0B
      0BFF0B0A0DFF0B0517FF0B001FFF0E0521FF1B1723FF242424FF1D1D1DFF0B0B
      0BFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF230167FF18063CFF0C0A
      10FF0A0A0AFF050505FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF240268FF210F45FF1D1B
      21FF1A1A1AFF0D0D0DFF010101FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF010004FF10002FFF210062FF240268FF241249FF2422
      29FF212122FF101011FF010102FF000001FF000001FF000001FF000001FF0000
      000000000000000000000000000000000000000001FF000002FF000003FF0000
      02FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000D0027FF0D0027FF0D0027FF0D0027FF0D00
      27FF0D0027FF0D0027FF0E0029FF170045FF220066FF240169FF240C55FF2416
      41FF22153CFF170A31FF0E0128FF0D0027FF0D0027FF0D0027FF0B0020FF0400
      0CFF0000000000000000000000000000000000001CFF00004BFF00005BFF0000
      3AFF00000CFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F005DFF1F005DFF1F005DFF1F005DFF1F00
      5DFF1F005DFF1F005DFF1F005DFF210063FF24006BFF24006BFF240367FF2405
      63FF240562FF21025FFF1F005DFF1F005DFF1F005DFF1F005DFF19004CFF0900
      1CFF00000000000000000000000000000000000042FF0000B2FF0000D8FF0000
      8AFF00001DFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000230069FF230069FF23006AFF24006BFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24016BFF24016AFF1D0158FF0B00
      25FF000007FF000007FF000007FF000007FF000051FF0000CFFF0000F9FF0000
      A3FF000028FF000007FF000007FF000007FF000007FF000004FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000014003DFF14003DFF19004BFF210063FF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240268FF240A58FF24104DFF1D0D53FF0B05
      63FF00006DFF00006DFF00006DFF00006DFF000098FF0000E2FF0000FBFF0000
      C8FF000080FF00006DFF00006DFF00006DFF000067FF000037FF000006FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003000AFF03000AFF0D0027FF1E005AFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240463FF241543FF24212CFF1D1B4DFF0B0A
      ADFF0000E5FF0000E5FF0000E5FF0000E5FF0000ECFF0000F8FF0000FCFF0000
      F4FF0000E8FF0000E5FF0000E5FF0000E5FF0000D8FF000073FF00000DFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A001FFF1C0053FF2200
      66FF230068FF24006BFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016AFF240268FF24075FFF24183DFF242425FF1D1D49FF0B0B
      B1FF0000EEFF0000F1FF0000F9FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0101F7FF0202F1FF0202E3FF020279FF02020FFF0202
      02FF010101FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000050010FF0F002CFF1200
      37FF19004AFF220065FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240269FF240A58FF241149FF241443FF241D31FF242424FF1D1D35FF0B0B
      63FF00007EFF00009CFF0000DEFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F9FF0808CDFF10109AFF121289FF121251FF121219FF1010
      10FF080808FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010002FF020005FF0200
      07FF0E002BFF1F005EFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241345FF24212AFF242227FF242325FF242424FF1D1D20FF0B0B
      15FF00000EFF000047FF0000C3FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0F0FA4FF1F1F43FF22222FFF222229FF222223FF1F1F
      1FFF0F0F0FFF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010003FF020008FF0300
      0BFF0F002EFF20005FFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241347FF24202DFF24212AFF222125FF212121FF1B1B1BFF0A0A
      0AFF0000000000003DFF0000BFFF0000FCFF0101F6FF0202ECFF0303E8FF0202
      EFFF0000F9FF0101F6FF10109FFF212138FF242424FF232323FF212121FF1E1E
      1EFF0E0E0EFF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060012FF100032FF1400
      3DFF1A004EFF220066FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240169FF24095AFF24104EFF211045FF171026FF101011FF0D0D0DFF0505
      05FF0000000000003DFF0000BFFF0000FCFF0606D7FF101098FF141482FF0D0D
      AEFF0303EBFF0101F6FF10109FFF212138FF232323FF1A1A1AFF111111FF0F0F
      0FFF070707FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0056FF2300
      69FF23006AFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016BFF24016AFF1F015CFF0E0127FF010102FF010101FF0000
      00000000000000003DFF0000BFFF0000FCFF0B0BBDFF1D1D51FF23232CFF1616
      77FF0505E0FF0101F6FF10109FFF212138FF222222FF131313FF030303FF0101
      01FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF240268FF240463FF240562FF240562FF240562FF240562FF240562FF2405
      62FF240563FF240268FF24006CFF20015EFF10032BFF050506FF040404FF0202
      02FF00000000000034FF0000A6FF0000DAFF0B0BA3FF1D1D46FF242426FF1717
      66FF0505C2FF0101D5FF10108BFF212135FF222222FF121212FF020202FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF24085BFF241444FF24173EFF24173EFF24173EFF24173EFF24173EFF2417
      3EFF241542FF240A58FF24016BFF220361FF1C0F36FF171718FF131313FF0707
      07FF00000000000016FF000046FF00005CFF0B0B4BFF1D1D2EFF242425FF1717
      38FF050554FF01015AFF101044FF212129FF222222FF121212FF020202FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6BFF240D52FF241F2FFF242425FF242425FF242425FF242425FF242425FF2424
      25FF24212BFF24104DFF24016AFF240562FF24173EFF242425FF1D1D1DFF0B0B
      0BFF00000000000001FF000002FF000003FF0B0B0DFF1D1D1EFF242424FF1717
      18FF050507FF010104FF101011FF212121FF222222FF121212FF020202FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009001AFF180048FF1D00
      57FF200D45FF231F2BFF242424FF212121FF1E1E1EFF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1A22FF1D0D3FFF1D0156FF1E0551FF211737FF242425FF1D1D1DFF0B0B
      0BFF00000000000000000000000000000000090909FF181818FF1D1D1DFF1212
      12FF040404FF010101FF0D0D0DFF1A1A1AFF1B1B1BFF0F0F0FFF020202FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003000AFF09001AFF0B00
      20FF140D21FF211F23FF232323FF191919FF0D0D0DFF0B0B0BFF0B0B0BFF0B0B
      0BFF0B0A0DFF0B0517FF0B001FFF0E0521FF1B1723FF242424FF1D1D1DFF0B0B
      0BFF00000000000000000000000000000000030303FF090909FF0B0B0BFF0707
      07FF010101FF00000000050505FF0A0A0AFF0A0A0AFF060606FF010101FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF230167FF18063CFF0C0A
      10FF0A0A0AFF050505FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0404
      A4FF0A0A2BFF0B0B0BFF060606FF010101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF240268FF210F45FF1D1B
      21FF1A1A1AFF0D0D0DFF010101FF000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000FAFF0B0B
      ABFF19193BFF1C1C1CFF101010FF030303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF010004FF10002FFF210062FF240268FF241249FF2422
      29FF212122FF101011FF010102FF000001FF000002FF000003FF000003FF0000
      03FF000003FF000003FF000003FF000003FF00004EFF0000CEFF0000FAFF0D0D
      AEFF1F1F43FF232325FF141417FF030306FF000003FF000003FF000003FF0000
      03FF000001FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000D0027FF0D0027FF0D0027FF0D0027FF0D00
      27FF0D0027FF0D0027FF0E0029FF170045FF220066FF240169FF240C55FF2416
      41FF22153CFF170A31FF0E0128FF0B002EFF050049FF00005BFF00005CFF0000
      5CFF00005CFF00005CFF00005CFF00005CFF00008CFF0000DEFF0000FBFF0808
      CAFF141485FF161672FF0D0D69FF02025EFF00005CFF00005CFF00005CFF0000
      54FF000028FF000003FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F005DFF1F005DFF1F005DFF1F005DFF1F00
      5DFF1F005DFF1F005DFF1F005DFF210063FF24006BFF24006BFF240367FF2405
      63FF240562FF21025FFF1F005DFF1B006EFF0B00ACFF0000D9FF0000DAFF0000
      DAFF0000DAFF0000DAFF0000DAFF0000DAFF0000E4FF0000F6FF0000FCFF0202
      F1FF0404E3FF0505DFFF0303DDFF0000DAFF0000DAFF0000DAFF0000DAFF0000
      C6FF00005EFF000006FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000230069FF230069FF23006AFF24006BFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF1F007FFF0E01C4FF0101F5FF0101F7FF0000
      FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0101F9FF0101F6FF0101
      E0FF01016BFF010108FF010101FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000014003DFF14003DFF19004BFF210063FF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF210273FF170A8CFF10109EFF0D0DB0FF0505
      E0FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0101F7FF0808CEFF0F0FA4FF1010
      92FF10104EFF101014FF0E0E0EFF060606FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003000AFF03000AFF0D0027FF1E005AFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240465FF22154BFF212139FF1B1B5CFF0A0A
      C1FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0202F1FF11119AFF1F1F43FF2121
      36FF21212BFF212122FF1D1D1DFF0C0C0CFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A001FFF1C0053FF2200
      66FF230068FF24006BFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016AFF240268FF24075FFF24183DFF242425FF1D1D49FF0B0B
      B1FF0000EEFF0000F1FF0000F9FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0101F7FF0202F1FF0404E5FF13138AFF22222FFF2424
      24FF232323FF222222FF1D1D1DFF0C0C0CFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000050010FF0F002CFF1200
      37FF19004AFF220065FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240269FF240A58FF241149FF241443FF241D31FF242424FF1D1D35FF0B0B
      63FF00007EFF00009CFF0000DEFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F9FF0808CDFF10109AFF13138AFF1B1B5AFF23232AFF2222
      22FF1A1A1AFF131313FF101010FF070707FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010002FF020005FF0200
      07FF0E002BFF1F005EFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241345FF24212AFF242227FF242325FF242424FF1D1D20FF0B0B
      15FF00000EFF000047FF0000C3FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0F0FA4FF1F1F43FF22222FFF23232AFF242425FF2121
      21FF111111FF030303FF020202FF010101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010003FF020008FF0300
      0BFF0F002EFF20005FFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241347FF24202DFF24212AFF222125FF212121FF1B1B1FFF0A0A
      1AFF000017FF00004EFF0000C5FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0E0EA7FF1E1E4AFF212137FF21212DFF212122FF1E1E
      1EFF0E0E0EFF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060012FF100032FF1400
      3DFF1A004EFF220066FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240169FF24095AFF24104EFF211045FF171026FF101011FF0D0D27FF0505
      69FF00008FFF0000A9FF0000E2FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000F9FF0707D4FF0F0FA8FF101097FF101058FF101018FF0F0F
      0FFF070707FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0056FF2300
      69FF23006AFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016BFF24016AFF1F015CFF0E0127FF010102FF01012EFF0000
      ACFF0000F5FF0000F7FF0000FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000F9FF0101F7FF0101E8FF01017CFF01010FFF0101
      01FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF240268FF240463FF240562FF240562FF240562FF240562FF240562FF2405
      62FF240563FF240268FF24006CFF20015EFF10032BFF050506FF040433FF0202
      B2FF0000FCFF0101F5FF0404E6FF0505DFFF0505DFFF0505DFFF0505DFFF0505
      DFFF0505DFFF0505E0FF0303ECFF0000F9FF0000EEFF030381FF050513FF0505
      05FF020202FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF24085BFF241444FF24173EFF24173EFF24173EFF24173EFF24173EFF2417
      3EFF241542FF240A58FF24016BFF220361FF1C0F36FF171718FF131341FF0707
      B7FF0000FCFF0606DBFF111194FF171773FF171773FF171773FF171773FF1717
      73FF171773FF161677FF0D0DAEFF0202EFFF0101EFFF0C0C8AFF161624FF1515
      15FF0A0A0AFF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6BFF240D52FF241F2FFF242425FF242425FF242425FF242425FF242425FF2424
      25FF24212BFF24104DFF24016AFF240562FF24173EFF242425FF1D1D4CFF0B0B
      BBFF0000FCFF0909C9FF1B1B59FF242426FF242426FF242426FF242426FF2424
      26FF242426FF23232CFF141482FF0303E8FF0202F0FF121290FF222230FF2121
      21FF101010FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009001AFF180048FF1D00
      57FF200D45FF231F2BFF242424FF212121FF1E1E1EFF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1A22FF1D0D3FFF1D0156FF1E0551FF211737FF242425FF1D1D43FF0B0B
      9BFF0000CEFF0909A5FF1B1B4DFF242424FF222222FF1E1E1EFF1D1D1DFF1D1D
      1DFF1D1D1DFF1C1C22FF101069FF0303BEFF0202C4FF121279FF22222EFF2121
      21FF101010FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003000AFF09001AFF0B00
      20FF140D21FF211F23FF232323FF191919FF0D0D0DFF0B0B0BFF0B0B0BFF0B0B
      0BFF0B0A0DFF0B0517FF0B001FFF0E0521FF1B1723FF242424FF1D1D2BFF0B0B
      40FF00004CFF090942FF1B1B2EFF242424FF1C1C1CFF101010FF0B0B0BFF0B0B
      0BFF0B0B0BFF0B0B0DFF060627FF010146FF02024AFF121238FF222226FF2121
      21FF101010FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF230167FF18063CFF0C0A
      10FF0A0A0AFF050505FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0404
      A4FF0A0A2BFF0B0B0BFF060606FF010101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF240268FF210F45FF1D1B
      21FF1A1A1AFF0D0D0DFF010101FF000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000FAFF0B0B
      ABFF19193BFF1C1C1CFF101010FF030303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF010004FF10002FFF210062FF240268FF241249FF2422
      29FF212122FF101011FF010102FF000001FF000002FF000003FF000003FF0000
      03FF000003FF000003FF000003FF000003FF00004EFF0000CEFF0000FAFF0D0D
      AEFF1F1F43FF232325FF141417FF030306FF000003FF000003FF000003FF0000
      03FF000001FF00000000000000000000000000000000000001FF000102FF0001
      03FF000102FF000001FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000D0027FF0D0027FF0D0027FF0D0027FF0D00
      27FF0D0027FF0D0027FF0E0029FF170045FF220066FF240169FF240C55FF2416
      41FF22153CFF170A31FF0E0128FF0B002EFF050049FF00005BFF00005CFF0000
      5CFF00005CFF00005CFF00005CFF00005CFF00008CFF0000DEFF0000FBFF0808
      CAFF141485FF161672FF0D0D69FF02025EFF00005CFF00005CFF00005CFF0000
      54FF000028FF000003FF000000000000000000000000000711FF001B40FF0027
      5CFF001E46FF000916FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F005DFF1F005DFF1F005DFF1F005DFF1F00
      5DFF1F005DFF1F005DFF1F005DFF210063FF24006BFF24006BFF240367FF2405
      63FF240562FF21025FFF1F005DFF1B006EFF0B00ACFF0000D9FF0000DAFF0000
      DAFF0000DAFF0000DAFF0000DAFF0000DAFF0000E4FF0000F6FF0000FCFF0202
      F1FF0404E3FF0505DFFF0303DDFF0000DAFF0000DAFF0000DAFF0000DAFF0000
      C6FF00005EFF000006FF000000000000000000000000001128FF004198FF005D
      DAFF0047A6FF001634FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000230069FF230069FF23006AFF24006BFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF1F007FFF0E01C4FF0101F5FF0101F7FF0000
      FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0101F9FF0101F6FF0101
      E0FF00026EFF00030EFF000307FF000307FF000307FF001634FF004CB2FF006C
      FCFF0053C1FF001C42FF000307FF000307FF000307FF000307FF000204FF0000
      01FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000014003DFF14003DFF19004BFF210063FF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF210273FF170A8CFF10109EFF0D0DB0FF0505
      E0FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0101F7FF0808CEFF0F0FA4FF0F13
      9AFF072283FF002E6EFF002F6DFF002F6DFF002F6DFF003A87FF005AD1FF006C
      FCFF005DDAFF003E8FFF002F6DFF002F6DFF002F6DFF002F6CFF001E45FF0006
      0FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003000AFF03000AFF0D0027FF1E005AFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240465FF22154BFF212139FF1B1B5CFF0A0A
      C1FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0202F1FF11119AFF1F1F43FF1E27
      48FF0E469AFF0160E0FF0062E5FF0062E5FF0062E5FF0064E9FF0069F5FF006C
      FCFF006AF6FF0064EBFF0062E5FF0062E5FF0062E5FF0061E3FF003E91FF000D
      1FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A001FFF1C0053FF2200
      66FF230068FF24006BFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016AFF240268FF24075FFF24183DFF242425FF1D1D49FF0B0B
      B1FF0000EEFF0000F1FF0000F9FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0101F7FF0202F1FF0404E5FF13138AFF22222FFF212A
      36FF104997FF0164E8FF0067F0FF006AF7FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF016BF8FF0269F2FF0267EEFF024399FF0210
      22FF020202FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000050010FF0F002CFF1200
      37FF19004AFF220065FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240269FF240A58FF241149FF241443FF241D31FF242424FF1D1D35FF0B0B
      63FF00007EFF00009CFF0000DEFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F9FF0808CDFF10109AFF13138AFF1B1B5AFF23232AFF2126
      2CFF102E57FF01357BFF003D8FFF0058CEFF006BFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0561DCFF0F4FA4FF12478FFF123462FF1219
      23FF111111FF0A0A0AFF020202FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010002FF020005FF0200
      07FF0E002BFF1F005EFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241345FF24212AFF242227FF242325FF242424FF1D1D20FF0B0B
      15FF00000EFF000047FF0000C3FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0F0FA4FF1F1F43FF22222FFF23232AFF242425FF2121
      22FF101318FF01070FFF00142EFF0047A5FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58BFFF1C3556FF222830FF22262BFF2223
      24FF212121FF131313FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010003FF020008FF0300
      0BFF0F002EFF20005FFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241347FF24202DFF24212AFF222125FF212121FF1B1B1FFF0A0A
      1AFF000017FF00004EFF0000C5FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0E0EA7FF1E1E4AFF212137FF21212DFF212122FF1E1E
      1EFF0E0E0EFF010101FF000F22FF0045A0FF006BF9FF016BF8FF0267EEFF0365
      E8FF0267EDFF016AF7FF006CFCFF0B56BBFF1D314CFF242424FF232323FF2121
      21FF202020FF131313FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060012FF100032FF1400
      3DFF1A004EFF220066FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240169FF24095AFF24104EFF211045FF171026FF101011FF0D0D27FF0505
      69FF00008FFF0000A9FF0000E2FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000F9FF0707D4FF0F0FA8FF101097FF101058FF101018FF0F0F
      0FFF070707FF00000000000F22FF0045A0FF006BF9FF0464E5FF0E4FA6FF1443
      81FF0F4D9FFF0562DEFF006CFCFF0B56BBFF1D314CFF242424FF1D1D1DFF1313
      13FF101010FF090909FF010101FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0056FF2300
      69FF23006AFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016BFF24016AFF1F015CFF0E0127FF010102FF01012EFF0000
      ACFF0000F5FF0000F7FF0000FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000F9FF0101F7FF0101E8FF01017CFF01010FFF0101
      01FF0000000000000000000F22FF0045A0FF006BF9FF065FD5FF183B69FF2326
      2AFF1B375CFF085BCAFF006CFCFF0B56BBFF1D314CFF242424FF171717FF0606
      06FF010101FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF240268FF240463FF240562FF240562FF240562FF240562FF240562FF2405
      62FF240563FF240268FF24006CFF20015EFF10032BFF050506FF040433FF0202
      B2FF0000FCFF0101F5FF0404E6FF0505DFFF0505DFFF0505DFFF0505DFFF0505
      DFFF0505DFFF0505E0FF0303ECFF0000F9FF0000EEFF030381FF050513FF0505
      05FF020202FF00000000000D1DFF003B8AFF005CD8FF0752B8FF19355BFF2424
      24FF1B3250FF094FAEFF005DDAFF0B4CA3FF1D2F46FF242424FF171717FF0505
      05FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF24085BFF241444FF24173EFF24173EFF24173EFF24173EFF24173EFF2417
      3EFF241542FF240A58FF24016BFF220361FF1C0F36FF171718FF131341FF0707
      B7FF0000FCFF0606DBFF111194FF171773FF171773FF171773FF171773FF1717
      73FF171773FF161677FF0D0DAEFF0202EFFF0101EFFF0C0C8AFF161624FF1515
      15FF0A0A0AFF010101FF00050CFF00193AFF00275BFF072652FF192535FF2424
      24FF1B2531FF09264FFF00275CFF0B264BFF1D252EFF242424FF171717FF0505
      05FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6BFF240D52FF241F2FFF242425FF242425FF242425FF242425FF242425FF2424
      25FF24212BFF24104DFF24016AFF240562FF24173EFF242425FF1D1D4CFF0B0B
      BBFF0000FCFF0909C9FF1B1B59FF242426FF242426FF242426FF242426FF2424
      26FF242426FF23232CFF141482FF0303E8FF0202F0FF121290FF222230FF2121
      21FF101010FF010101FF00000000000102FF000103FF070709FF19191AFF2424
      24FF1B1C1CFF09090BFF000103FF0B0C0DFF1D1E1EFF242424FF171717FF0505
      05FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009001AFF180048FF1D00
      57FF200D45FF231F2BFF242424FF212121FF1E1E1EFF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1A22FF1D0D3FFF1D0156FF1E0551FF211737FF242425FF1D1D43FF0B0B
      9BFF0000CEFF0909A5FF1B1B4DFF242424FF222222FF1E1E1EFF1D1D1DFF1D1D
      1DFF1D1D1DFF1C1C22FF101069FF0303BEFF0202C4FF121279FF22222EFF2121
      21FF101010FF010101FF000000000000000000000000050505FF141414FF1D1D
      1DFF161616FF070707FF00000000090909FF181818FF1D1D1DFF121212FF0404
      04FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003000AFF09001AFF0B00
      20FF140D21FF211F23FF232323FF191919FF0D0D0DFF0B0B0BFF0B0B0BFF0B0B
      0BFF0B0A0DFF0B0517FF0B001FFF0E0521FF1B1723FF242424FF1D1D2BFF0B0B
      40FF00004CFF090942FF1B1B2EFF242424FF1C1C1CFF101010FF0B0B0BFF0B0B
      0BFF0B0B0BFF0B0B0DFF060627FF010146FF02024AFF121238FF222226FF2121
      21FF101010FF010101FF000000000000000000000000020202FF080808FF0B0B
      0BFF080808FF030303FF00000000030303FF090909FF0B0B0BFF070707FF0101
      01FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0052BFFF001A3DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0052BFFF001A3DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF230167FF18063CFF0C0A
      10FF0A0A0AFF050505FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0404
      A4FF0A0A2BFF0B0B0BFF060606FF010101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0355C2FF082245FF0B0B0BFF080808FF020202FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF240268FF210F45FF1D1B
      21FF1A1A1AFF0D0D0DFF010101FF000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000FAFF0B0B
      ABFF19193BFF1C1C1CFF101010FF030303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0759C6FF163053FF1D1D1DFF141414FF050505FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF010004FF10002FFF210062FF240268FF241249FF2422
      29FF212122FF101011FF010102FF000001FF000002FF000003FF000003FF0000
      03FF000003FF000003FF000003FF000003FF00004EFF0000CEFF0000FAFF0D0D
      AEFF1F1F43FF232325FF141417FF030306FF000003FF000103FF000103FF0001
      03FF000103FF000103FF000103FF000103FF000103FF001531FF004CB1FF006C
      FCFF095BC9FF1B3659FF242526FF191A1BFF070809FF000103FF000103FF0001
      03FF000103FF000102FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000D0027FF0D0027FF0D0027FF0D0027FF0D00
      27FF0D0027FF0D0027FF0E0029FF170045FF220066FF240169FF240C55FF2416
      41FF22153CFF170A31FF0E0128FF0B002EFF050049FF00005BFF00005CFF0000
      5CFF00005CFF00005CFF00005CFF00005CFF00008CFF0000DEFF0000FBFF0808
      CAFF141485FF161672FF0D0D69FF02025EFF00025CFF00145CFF00255CFF0027
      5CFF00275CFF00275CFF00275CFF00275CFF00275CFF00347AFF0057CCFF006C
      FCFF0661DBFF114994FF173E73FF10376CFF042B60FF00275CFF00275CFF0027
      5CFF002659FF001634FF000408FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F005DFF1F005DFF1F005DFF1F005DFF1F00
      5DFF1F005DFF1F005DFF1F005DFF210063FF24006BFF24006BFF240367FF2405
      63FF240562FF21025FFF1F005DFF1B006EFF0B00ACFF0000D9FF0000DAFF0000
      DAFF0000DAFF0000DAFF0000DAFF0000DAFF0000E4FF0000F6FF0000FCFF0202
      F1FF0404E3FF0505DFFF0303DDFF0000DAFF0005DAFF002FDAFF0058DAFF005D
      DAFF005DDAFF005DDAFF005DDAFF005DDAFF005DDAFF0060E0FF0067F2FF006C
      FCFF016AF5FF0464E6FF0562DFFF0360DDFF015EDBFF005DDAFF005DDAFF005D
      DAFF005AD4FF00357CFF000914FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000230069FF230069FF23006AFF24006BFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF1F007FFF0E01C4FF0101F5FF0101F7FF0000
      FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0006FCFF0135F9FF0164F6FF016A
      F7FF006BF9FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006BFAFF016A
      F7FF0167EFFF013D8CFF010B17FF010101FF010101FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000014003DFF14003DFF19004BFF210063FF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF210273FF170A8CFF10109EFF0D0DB0FF0505
      E0FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0104F7FF0827CEFF0F49A4FF0F50
      A8FF075FD4FF006BF9FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFBFF0661DAFF0E51
      ACFF104B9BFF103361FF10161DFF0F0F0FFF080808FF010101FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003000AFF03000AFF0D0027FF1E005AFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240465FF22154BFF212139FF1B1B5CFF0A0A
      C1FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0202F1FF11169AFF1F2943FF1E31
      4AFF0E50A7FF016AF6FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006BFAFF0C54B4FF1D34
      52FF212B37FF21272EFF212223FF1F1F1FFF111111FF020202FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A001FFF1C0053FF2200
      66FF230068FF24006BFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016AFF240268FF24075FFF24183DFF242425FF1D1D49FF0B0B
      B1FF0000EEFF0000F1FF0000F9FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0101F7FF0202F1FF0404E5FF13138AFF22222FFF212A
      36FF104997FF0164E8FF0067F0FF006AF7FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF016BF8FF0269F2FF0267EEFF0E4FA6FF1F2D
      3FFF242424FF232323FF222222FF202020FF111111FF020202FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000050010FF0F002CFF1200
      37FF19004AFF220065FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240269FF240A58FF241149FF241443FF241D31FF242424FF1D1D35FF0B0B
      63FF00007EFF00009CFF0000DEFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F9FF0808CDFF10109AFF13138AFF1B1B5AFF23232AFF2126
      2CFF102E57FF01357BFF003D8FFF0058CEFF006BFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0561DCFF0F4FA4FF12488FFF193B69FF2229
      33FF232323FF1C1C1CFF141414FF111111FF090909FF010101FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010002FF020005FF0200
      07FF0E002BFF1F005EFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241345FF24212AFF242227FF242325FF242424FF1D1D20FF0B0B
      15FF00000EFF000047FF0000C3FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0F0FA4FF1F1F43FF22222FFF23232AFF242425FF2121
      22FF101318FF01070FFF00142EFF0047A5FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58BFFF1C3556FF222830FF23272CFF2425
      26FF232323FF151515FF050505FF020202FF010101FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010003FF020008FF0300
      0BFF0F002EFF20005FFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241347FF24202DFF24212AFF222125FF212121FF1B1B1FFF0A0A
      1AFF000017FF00004EFF0000C5FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0E0EA7FF1E1E4AFF212137FF21212DFF212122FF1E1F
      20FF0E141BFF010B17FF001736FF0048A8FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58C1FF1B375CFF212B38FF212730FF2122
      24FF202020FF131313FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060012FF100032FF1400
      3DFF1A004EFF220066FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240169FF24095AFF24104EFF211045FF171026FF101011FF0D0D27FF0505
      69FF00008FFF0000A9FF0000E2FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000F9FF0707D4FF0F0FA8FF101097FF101058FF101018FF0F14
      1CFF072A58FF003C8BFF00439EFF005BD4FF006CFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0563E0FF0D53B0FF104C9EFF10376BFF1018
      23FF101010FF090909FF010101FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0056FF2300
      69FF23006AFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016BFF24016AFF1F015CFF0E0127FF010102FF01012EFF0000
      ACFF0000F5FF0000F7FF0000FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000F9FF0101F7FF0101E8FF01017CFF01010FFF010B
      17FF003C8CFF0066EEFF0069F6FF006BF9FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006BFAFF016AF7FF0169F3FF01449DFF010F
      22FF010101FF010101FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF240268FF240463FF240562FF240562FF240562FF240562FF240562FF2405
      62FF240563FF240268FF24006CFF20015EFF10032BFF050506FF040433FF0202
      B2FF0000FCFF0101F5FF0404E6FF0505DFFF0505DFFF0505DFFF0505DFFF0505
      DFFF0505DFFF0505E0FF0303ECFF0000F9FF0000EEFF030381FF050513FF050E
      1CFF024091FF0069F5FF016BF8FF0366EAFF0562DFFF0562DFFF0562DFFF0562
      DFFF0562DFFF0562DFFF0562DFFF0365E8FF016AF7FF006BF9FF0246A2FF0413
      26FF050505FF030303FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF24085BFF241444FF24173EFF24173EFF24173EFF24173EFF24173EFF2417
      3EFF241542FF240A58FF24016BFF220361FF1C0F36FF171718FF131341FF0707
      B7FF0000FCFF0606DBFF111194FF171773FF171773FF171773FF171773FF1717
      73FF171773FF161677FF0D0DAEFF0202EFFF0101EFFF0C0C8AFF161624FF151F
      2CFF0A4799FF016AF5FF0366EAFF0F4FA5FF173E74FF173E73FF173E73FF173E
      73FF173E73FF173E73FF173E73FF104C9CFF0464E3FF006BFAFF084DA8FF1422
      36FF161616FF0D0D0DFF020202FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6BFF240D52FF241F2FFF242425FF242425FF242425FF242425FF242425FF2424
      25FF24212BFF24104DFF24016AFF240562FF24173EFF242425FF1D1D4CFF0B0B
      BBFF0000FCFF0909C9FF1B1B59FF242426FF242426FF242426FF242426FF2424
      26FF242426FF23232CFF141482FF0303E8FF0202F0FF121290FF222230FF212B
      38FF104D9FFF016AF6FF0562DFFF173F74FF242628FF242526FF242526FF2425
      26FF242526FF242526FF242526FF193A66FF075FD5FF006BFAFF0D52ADFF1F2E
      41FF232323FF141414FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009001AFF180048FF1D00
      57FF200D45FF231F2BFF242424FF212121FF1E1E1EFF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1A22FF1D0D3FFF1D0156FF1E0551FF211737FF242425FF1D1D43FF0B0B
      9BFF0000CEFF0909A5FF1B1B4DFF242424FF222222FF1E1E1EFF1D1D1DFF1D1D
      1DFF1D1D1DFF1C1C22FF101069FF0303BEFF0202C4FF121279FF22222EFF2129
      34FF104285FF0156C9FF0551B7FF173762FF242526FF232323FF1F1F1FFF1D1D
      1DFF1D1D1DFF1D1D1DFF1D1D1DFF142F52FF054DADFF0057CCFF0D4590FF1F2B
      3BFF232323FF141414FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003000AFF09001AFF0B00
      20FF140D21FF211F23FF232323FF191919FF0D0D0DFF0B0B0BFF0B0B0BFF0B0B
      0BFF0B0A0DFF0B0517FF0B001FFF0E0521FF1B1723FF242424FF1D1D2BFF0B0B
      40FF00004CFF090942FF1B1B2EFF242424FF1C1C1CFF101010FF0B0B0BFF0B0B
      0BFF0B0B0BFF0B0B0DFF060627FF010146FF02024AFF121238FF222226FF2124
      28FF10223BFF01204BFF052147FF172333FF242424FF1F1F1FFF131313FF0B0B
      0BFF0B0B0BFF0B0B0BFF0B0B0BFF08111FFF021C40FF00204CFF0D213DFF1F23
      29FF232323FF141414FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF050505FF171717FF242424FF1D1D1DFF0B0B0BFF0000
      00000000000000000000000000000000000000000000000000000D0D0DFF1F1F
      1FFF232323FF141414FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF050505FF171717FF242424FF1D1D1DFF0B0B0BFF0000
      00000000000000000000000000000000000000000000000000000D0D0DFF1F1F
      1FFF232323FF141414FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0052BFFF001A3DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0052BFFF001A3DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF230167FF18063CFF0C0A
      10FF0A0A0AFF050505FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0404
      A4FF0A0A2BFF0B0B0BFF060606FF010101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0355C2FF082245FF0B0B0BFF080808FF020202FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF240268FF210F45FF1D1B
      21FF1A1A1AFF0D0D0DFF010101FF000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000FAFF0B0B
      ABFF19193BFF1C1C1CFF101010FF030303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0759C6FF163053FF1D1D1DFF141414FF050505FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF010004FF10002FFF210062FF240268FF241249FF2422
      29FF212122FF101011FF010102FF000001FF000002FF000003FF000003FF0000
      03FF000003FF000003FF000003FF000003FF00004EFF0000CEFF0000FAFF0D0D
      AEFF1F1F43FF232325FF141417FF030306FF000003FF000103FF000103FF0001
      03FF000103FF000103FF000103FF000103FF000103FF001531FF004CB1FF006C
      FCFF095BC9FF1B3659FF242526FF191A1BFF070809FF000103FF000103FF0001
      03FF000103FF000102FF00000000000000000000000000000000000000000002
      02FF000303FF000303FF000101FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000D0027FF0D0027FF0D0027FF0D0027FF0D00
      27FF0D0027FF0D0027FF0E0029FF170045FF220066FF240169FF240C55FF2416
      41FF22153CFF170A31FF0E0128FF0B002EFF050049FF00005BFF00005CFF0000
      5CFF00005CFF00005CFF00005CFF00005CFF00008CFF0000DEFF0000FBFF0808
      CAFF141485FF161672FF0D0D69FF02025EFF00025CFF00145CFF00255CFF0027
      5CFF00275CFF00275CFF00275CFF00275CFF00275CFF00347AFF0057CCFF006C
      FCFF0661DBFF114994FF173E73FF10376CFF042B60FF00275CFF00275CFF0027
      5CFF002659FF001634FF000408FF000000000000000000000000000808FF0034
      34FF005959FF005050FF002222FF000101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F005DFF1F005DFF1F005DFF1F005DFF1F00
      5DFF1F005DFF1F005DFF1F005DFF210063FF24006BFF24006BFF240367FF2405
      63FF240562FF21025FFF1F005DFF1B006EFF0B00ACFF0000D9FF0000DAFF0000
      DAFF0000DAFF0000DAFF0000DAFF0000DAFF0000E4FF0000F6FF0000FCFF0202
      F1FF0404E3FF0505DFFF0303DDFF0000DAFF0005DAFF002FDAFF0058DAFF005D
      DAFF005DDAFF005DDAFF005DDAFF005DDAFF005DDAFF0060E0FF0067F2FF006C
      FCFF016AF5FF0464E6FF0562DFFF0360DDFF015EDBFF005DDAFF005DDAFF005D
      DAFF005AD4FF00357CFF000914FF000000000000000000000000001414FF007C
      7CFF00D4D4FF00BDBDFF005050FF000202FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000230069FF230069FF23006AFF24006BFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF1F007FFF0E01C4FF0101F5FF0101F7FF0000
      FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0006FCFF0135F9FF0164F6FF016A
      F7FF006BF9FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006BFAFF016A
      F7FF0167EFFF013F8FFF00101DFF000707FF000707FF000707FF001D1DFF0092
      92FF00F5F5FF00DBDBFF006060FF000A0AFF000707FF000707FF000707FF0005
      05FF000202FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000014003DFF14003DFF19004BFF210063FF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF210273FF170A8CFF10109EFF0D0DB0FF0505
      E0FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0104F7FF0827CEFF0F49A4FF0F50
      A8FF075FD4FF006BF9FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFBFF0661DAFF0E51
      ACFF104E9EFF095B89FF016A72FF006D6DFF006D6DFF006D6DFF007A7AFF00BE
      BEFF00F8F8FF00E9E9FF00A1A1FF006E6EFF006D6DFF006D6DFF006D6DFF0053
      53FF001A1AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003000AFF03000AFF0D0027FF1E005AFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240465FF22154BFF212139FF1B1B5CFF0A0A
      C1FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0202F1FF11169AFF1F2943FF1E31
      4AFF0E50A7FF016AF6FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006BFAFF0C54B4FF1D34
      52FF20303DFF137B83FF03D4D5FF00E5E5FF00E5E5FF00E5E5FF00E7E7FF00F2
      F2FF00FBFBFF00F9F9FF00EDEDFF00E5E5FF00E5E5FF00E5E5FF00E5E5FF00AE
      AEFF003737FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A001FFF1C0053FF2200
      66FF230068FF24006BFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016AFF240268FF24075FFF24183DFF242425FF1D1D49FF0B0B
      B1FF0000EEFF0000F1FF0000F9FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0101F7FF0202F1FF0404E5FF13138AFF22222FFF212A
      36FF104997FF0164E8FF0067F0FF006AF7FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF016BF8FF0269F2FF0267EEFF0E4FA6FF1F2D
      3FFF232A2AFF147B7BFF03DCDCFF00EFEFFF00F5F5FF00FBFBFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FAFAFF01F4F4FF02F0F0FF02B7
      B7FF023B3BFF020202FF010101FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000050010FF0F002CFF1200
      37FF19004AFF220065FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240269FF240A58FF241149FF241443FF241D31FF242424FF1D1D35FF0B0B
      63FF00007EFF00009CFF0000DEFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F9FF0808CDFF10109AFF13138AFF1B1B5AFF23232AFF2126
      2CFF102E57FF01357BFF003D8FFF0058CEFF006BFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0561DCFF0F4FA4FF12488FFF193B69FF2229
      33FF232727FF144B4BFF037676FF008585FF00BDBDFF00F5F5FF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF03E8E8FF0DB0B0FF129090FF1272
      72FF123030FF121212FF0D0D0DFF030303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010002FF020005FF0200
      07FF0E002BFF1F005EFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241345FF24212AFF242227FF242325FF242424FF1D1D20FF0B0B
      15FF00000EFF000047FF0000C3FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0F0FA4FF1F1F43FF22222FFF23232AFF242425FF2121
      22FF101318FF01070FFF00142EFF0047A5FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58BFFF1C3556FF222830FF23272CFF2425
      26FF232323FF141A1AFF031010FF001B1BFF008585FF00EFEFFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF06D6D6FF186D6DFF223030FF222D
      2DFF222525FF222222FF181818FF060606FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010003FF020008FF0300
      0BFF0F002EFF20005FFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241347FF24202DFF24212AFF222125FF212121FF1B1B1FFF0A0A
      1AFF000017FF00004EFF0000C5FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0E0EA7FF1E1E4AFF212137FF21212DFF212122FF1E1F
      20FF0E141BFF010B17FF001736FF0048A8FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58C1FF1B375CFF212B38FF212730FF2122
      24FF202020FF131313FF030303FF000E0EFF007E7EFF00EEEEFF00FAFAFF02F1
      F1FF03E9E9FF03EBEBFF01F5F5FF00FCFCFF07D4D4FF196565FF242424FF2323
      23FF222222FF212121FF171717FF060606FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060012FF100032FF1400
      3DFF1A004EFF220066FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240169FF24095AFF24104EFF211045FF171026FF101011FF0D0D27FF0505
      69FF00008FFF0000A9FF0000E2FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000F9FF0707D4FF0F0FA8FF101097FF101058FF101018FF0F14
      1CFF072A58FF003C8BFF00439EFF005BD4FF006CFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0563E0FF0D53B0FF104C9EFF10376BFF1018
      23FF101010FF090909FF010101FF000E0EFF007E7EFF00EEEEFF02F1F1FF0BB6
      B6FF138585FF119292FF07CFCFFF00FBFBFF07D4D4FF196565FF242424FF1F1F
      1FFF151515FF101010FF0B0B0BFF030303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0056FF2300
      69FF23006AFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016BFF24016AFF1F015CFF0E0127FF010102FF01012EFF0000
      ACFF0000F5FF0000F7FF0000FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000F9FF0101F7FF0101E8FF01017CFF01010FFF010B
      17FF003C8CFF0066EEFF0069F6FF006BF9FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006BFAFF016AF7FF0169F3FF01449DFF010F
      22FF010101FF010101FF00000000000E0EFF007E7EFF00EEEEFF03E9E9FF1485
      85FF223030FF1E4646FF0DAFAFFF00FAFAFF07D4D4FF196565FF242424FF1C1C
      1CFF090909FF010101FF010101FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF240268FF240463FF240562FF240562FF240562FF240562FF240562FF2405
      62FF240563FF240268FF24006CFF20015EFF10032BFF050506FF040433FF0202
      B2FF0000FCFF0101F5FF0404E6FF0505DFFF0505DFFF0505DFFF0505DFFF0505
      DFFF0505DFFF0505E0FF0303ECFF0000F9FF0000EEFF030381FF050513FF050E
      1CFF024091FF0069F5FF016BF8FF0366EAFF0562DFFF0562DFFF0562DFFF0562
      DFFF0562DFFF0562DFFF0562DFFF0365E8FF016AF7FF006BF9FF0246A2FF0413
      26FF050505FF030303FF00000000000C0CFF006D6DFF00CECEFF03C9C9FF1473
      73FF232929FF1F3C3CFF0D9898FF00D8D8FF07B8B8FF195B5BFF242424FF1B1B
      1BFF090909FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF24085BFF241444FF24173EFF24173EFF24173EFF24173EFF24173EFF2417
      3EFF241542FF240A58FF24016BFF220361FF1C0F36FF171718FF131341FF0707
      B7FF0000FCFF0606DBFF111194FF171773FF171773FF171773FF171773FF1717
      73FF171773FF161677FF0D0DAEFF0202EFFF0101EFFF0C0C8AFF161624FF151F
      2CFF0A4799FF016AF5FF0366EAFF0F4FA5FF173E74FF173E73FF173E73FF173E
      73FF173E73FF173E73FF173E73FF104C9CFF0464E3FF006BFAFF084DA8FF1422
      36FF161616FF0D0D0DFF020202FF000505FF002E2EFF005757FF035757FF143C
      3CFF232626FF1F2C2CFF0D4848FF005B5BFF075252FF193535FF242424FF1B1B
      1BFF090909FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6BFF240D52FF241F2FFF242425FF242425FF242425FF242425FF242425FF2424
      25FF24212BFF24104DFF24016AFF240562FF24173EFF242425FF1D1D4CFF0B0B
      BBFF0000FCFF0909C9FF1B1B59FF242426FF242426FF242426FF242426FF2424
      26FF242426FF23232CFF141482FF0303E8FF0202F0FF121290FF222230FF212B
      38FF104D9FFF016AF6FF0562DFFF173F74FF242628FF242526FF242526FF2425
      26FF242526FF242526FF242526FF193A66FF075FD5FF006BFAFF0D52ADFF1F2E
      41FF232323FF141414FF030303FF00000000000202FF000303FF030606FF1416
      16FF232323FF1F2020FF0D0F0FFF000303FF070909FF191A1AFF242424FF1B1B
      1BFF090909FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009001AFF180048FF1D00
      57FF200D45FF231F2BFF242424FF212121FF1E1E1EFF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1A22FF1D0D3FFF1D0156FF1E0551FF211737FF242425FF1D1D43FF0B0B
      9BFF0000CEFF0909A5FF1B1B4DFF242424FF222222FF1E1E1EFF1D1D1DFF1D1D
      1DFF1D1D1DFF1C1C22FF101069FF0303BEFF0202C4FF121279FF22222EFF2129
      34FF104285FF0156C9FF0551B7FF173762FF242526FF232323FF1F1F1FFF1D1D
      1DFF1D1D1DFF1D1D1DFF1D1D1DFF142F52FF054DADFF0057CCFF0D4590FF1F2B
      3BFF232323FF141414FF030303FF000000000000000000000000030303FF1010
      10FF1C1C1CFF191919FF0B0B0BFF00000000050505FF141414FF1D1D1DFF1616
      16FF070707FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003000AFF09001AFF0B00
      20FF140D21FF211F23FF232323FF191919FF0D0D0DFF0B0B0BFF0B0B0BFF0B0B
      0BFF0B0A0DFF0B0517FF0B001FFF0E0521FF1B1723FF242424FF1D1D2BFF0B0B
      40FF00004CFF090942FF1B1B2EFF242424FF1C1C1CFF101010FF0B0B0BFF0B0B
      0BFF0B0B0BFF0B0B0DFF060627FF010146FF02024AFF121238FF222226FF2124
      28FF10223BFF01204BFF052147FF172333FF242424FF1F1F1FFF131313FF0B0B
      0BFF0B0B0BFF0B0B0BFF0B0B0BFF08111FFF021C40FF00204CFF0D213DFF1F23
      29FF232323FF141414FF030303FF000000000000000000000000010101FF0606
      06FF0B0B0BFF0A0A0AFF040404FF00000000020202FF080808FF0B0B0BFF0808
      08FF030303FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF050505FF171717FF242424FF1D1D1DFF0B0B0BFF0000
      00000000000000000000000000000000000000000000000000000D0D0DFF1F1F
      1FFF232323FF141414FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF050505FF171717FF242424FF1D1D1DFF0B0B0BFF0000
      00000000000000000000000000000000000000000000000000000D0D0DFF1F1F
      1FFF232323FF141414FF030303FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0052BFFF001A3DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF00DADAFF005C5CFF000303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0052BFFF001A3DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF00DADAFF005C5CFF000303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF230167FF18063CFF0C0A
      10FF0A0A0AFF050505FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0404
      A4FF0A0A2BFF0B0B0BFF060606FF010101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0355C2FF082245FF0B0B0BFF080808FF020202FF00000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF01DCDCFF076363FF0B0E0EFF090909FF030303FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF240268FF210F45FF1D1B
      21FF1A1A1AFF0D0D0DFF010101FF000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000FAFF0B0B
      ABFF19193BFF1C1C1CFF101010FF030303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0759C6FF163053FF1D1D1DFF141414FF050505FF00000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF04DEDEFF126E6EFF1D1F1FFF181818FF090909FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF010004FF10002FFF210062FF240268FF241249FF2422
      29FF212122FF101011FF010102FF000001FF000002FF000003FF000003FF0000
      03FF000003FF000003FF000003FF000003FF00004EFF0000CEFF0000FAFF0D0D
      AEFF1F1F43FF232325FF141417FF030306FF000003FF000103FF000103FF0001
      03FF000103FF000103FF000103FF000103FF000103FF001531FF004CB1FF006C
      FCFF095BC9FF1B3659FF242526FF191A1BFF070809FF000103FF000203FF0003
      03FF000303FF000303FF000303FF000303FF000303FF000303FF001A1AFF0090
      90FF00F5F5FF05DFDFFF177474FF242828FF1D2020FF0B0E0EFF000303FF0003
      03FF000303FF000303FF000202FF000101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000D0027FF0D0027FF0D0027FF0D0027FF0D00
      27FF0D0027FF0D0027FF0E0029FF170045FF220066FF240169FF240C55FF2416
      41FF22153CFF170A31FF0E0128FF0B002EFF050049FF00005BFF00005CFF0000
      5CFF00005CFF00005CFF00005CFF00005CFF00008CFF0000DEFF0000FBFF0808
      CAFF141485FF161672FF0D0D69FF02025EFF00025CFF00145CFF00255CFF0027
      5CFF00275CFF00275CFF00275CFF00275CFF00275CFF00347AFF0057CCFF006C
      FCFF0661DBFF114994FF173E73FF10376CFF042B60FF00285CFF003A5CFF0055
      5CFF005C5CFF005C5CFF005C5CFF005C5CFF005C5CFF005C5CFF006B6BFF00B7
      B7FF00F7F7FF03EAEAFF0FA5A5FF177474FF136F6FFF076363FF005C5CFF005C
      5CFF005C5CFF005C5CFF004040FF001111FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F005DFF1F005DFF1F005DFF1F005DFF1F00
      5DFF1F005DFF1F005DFF1F005DFF210063FF24006BFF24006BFF240367FF2405
      63FF240562FF21025FFF1F005DFF1B006EFF0B00ACFF0000D9FF0000DAFF0000
      DAFF0000DAFF0000DAFF0000DAFF0000DAFF0000E4FF0000F6FF0000FCFF0202
      F1FF0404E3FF0505DFFF0303DDFF0000DAFF0005DAFF002FDAFF0058DAFF005D
      DAFF005DDAFF005DDAFF005DDAFF005DDAFF005DDAFF0060E0FF0067F2FF006C
      FCFF016AF5FF0464E6FF0562DFFF0360DDFF015EDBFF005EDAFF008BDAFF00C9
      DAFF00DADAFF00DADAFF00DADAFF00DADAFF00DADAFF00DADAFF00DDDDFF00ED
      EDFF00FBFBFF01F8F8FF03EAEAFF05DFDFFF04DEDEFF02DCDCFF00DADAFF00DA
      DAFF00DADAFF00DADAFF009898FF002828FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000230069FF230069FF23006AFF24006BFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF1F007FFF0E01C4FF0101F5FF0101F7FF0000
      FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0006FCFF0135F9FF0164F6FF016A
      F7FF006BF9FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006DFCFF009EFAFF01E3
      F7FF01F6F6FF01F9F9FF00FBFBFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FB
      FBFF01F7F7FF01F6F6FF01ACACFF012E2EFF010101FF010101FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000014003DFF14003DFF19004BFF210063FF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF210273FF170A8CFF10109EFF0D0DB0FF0505
      E0FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0104F7FF0827CEFF0F49A4FF0F50
      A8FF075FD4FF006BF9FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006DFBFF067FDAFF0E98
      ACFF10A2A2FF09C7C7FF01F3F3FF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF04E6
      E6FF0CB5B5FF109F9FFF107474FF102A2AFF101010FF0A0A0AFF020202FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003000AFF03000AFF0D0027FF1E005AFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240465FF22154BFF212139FF1B1B5CFF0A0A
      C1FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0202F1FF11169AFF1F2943FF1E31
      4AFF0E50A7FF016AF6FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006BFAFF0C59B4FF1D3F
      52FF203E3EFF138D8DFF03EAEAFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF08CD
      CDFF196767FF213838FF213131FF212525FF212121FF151515FF040404FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A001FFF1C0053FF2200
      66FF230068FF24006BFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016AFF240268FF24075FFF24183DFF242425FF1D1D49FF0B0B
      B1FF0000EEFF0000F1FF0000F9FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0101F7FF0202F1FF0404E5FF13138AFF22222FFF212A
      36FF104997FF0164E8FF0067F0FF006AF7FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF016BF8FF0269F2FF0267EEFF0E4FA6FF1F2D
      3FFF232A2AFF147B7BFF03DCDCFF00EFEFFF00F5F5FF00FBFBFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FAFAFF01F4F4FF02F0F0FF0ABF
      BFFF1C5555FF242424FF232323FF222222FF222222FF161616FF050505FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000050010FF0F002CFF1200
      37FF19004AFF220065FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240269FF240A58FF241149FF241443FF241D31FF242424FF1D1D35FF0B0B
      63FF00007EFF00009CFF0000DEFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F9FF0808CDFF10109AFF13138AFF1B1B5AFF23232AFF2126
      2CFF102E57FF01357BFF003D8FFF0058CEFF006BFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0561DCFF0F4FA4FF12488FFF193B69FF2229
      33FF232727FF144B4BFF037676FF008585FF00BDBDFF00F5F5FF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF03E8E8FF0DB0B0FF129090FF1676
      76FF203E3EFF242424FF1F1F1FFF151515FF121212FF0B0B0BFF020202FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010002FF020005FF0200
      07FF0E002BFF1F005EFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241345FF24212AFF242227FF242325FF242424FF1D1D20FF0B0B
      15FF00000EFF000047FF0000C3FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0F0FA4FF1F1F43FF22222FFF23232AFF242425FF2121
      22FF101318FF01070FFF00142EFF0047A5FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58BFFF1C3556FF222830FF23272CFF2425
      26FF232323FF141A1AFF031010FF001B1BFF008585FF00EFEFFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF06D6D6FF186D6DFF223030FF222D
      2DFF242727FF242424FF1A1A1AFF080808FF020202FF010101FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010003FF020008FF0300
      0BFF0F002EFF20005FFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241347FF24202DFF24212AFF222125FF212121FF1B1B1FFF0A0A
      1AFF000017FF00004EFF0000C5FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0E0EA7FF1E1E4AFF212137FF21212DFF212122FF1E1F
      20FF0E141BFF010B17FF001736FF0048A8FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58C1FF1B375CFF212B38FF212730FF2122
      24FF202121FF131D1DFF031818FF002424FF008A8AFF00EFEFFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF06D8D8FF177373FF213838FF2132
      32FF212727FF212121FF171717FF060606FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060012FF100032FF1400
      3DFF1A004EFF220066FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240169FF24095AFF24104EFF211045FF171026FF101011FF0D0D27FF0505
      69FF00008FFF0000A9FF0000E2FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000F9FF0707D4FF0F0FA8FF101097FF101058FF101018FF0F14
      1CFF072A58FF003C8BFF00439EFF005BD4FF006CFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0563E0FF0D53B0FF104C9EFF10376BFF1018
      23FF101414FF094747FF018383FF009595FF00C6C6FF00F6F6FF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF03EBEBFF0BBBBBFF109F9FFF107D
      7DFF103232FF101010FF0B0B0BFF030303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0056FF2300
      69FF23006AFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016BFF24016AFF1F015CFF0E0127FF010102FF01012EFF0000
      ACFF0000F5FF0000F7FF0000FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000F9FF0101F7FF0101E8FF01017CFF01010FFF010B
      17FF003C8CFF0066EEFF0069F6FF006BF9FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006BFAFF016AF7FF0169F3FF01449DFF010F
      22FF010808FF016A6AFF00DFDFFF00F5F5FF00F9F9FF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FBFBFF01F8F8FF01F6F6FF01BB
      BBFF013C3CFF010101FF010101FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF240268FF240463FF240562FF240562FF240562FF240562FF240562FF2405
      62FF240563FF240268FF24006CFF20015EFF10032BFF050506FF040433FF0202
      B2FF0000FCFF0101F5FF0404E6FF0505DFFF0505DFFF0505DFFF0505DFFF0505
      DFFF0505DFFF0505E0FF0303ECFF0000F9FF0000EEFF030381FF050513FF050E
      1CFF024091FF0069F5FF016BF8FF0366EAFF0562DFFF0562DFFF0562DFFF0562
      DFFF0562DFFF0562DFFF0562DFFF0365E8FF016AF7FF006BF9FF0246A2FF0413
      26FF050C0CFF037070FF00E5E5FF00FAFAFF03EEEEFF05E1E1FF05DFDFFF05DF
      DFFF05DFDFFF05DFDFFF05DFDFFF05DFDFFF04E4E4FF02F3F3FF00FCFCFF01C1
      C1FF044040FF050505FF030303FF010101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF24085BFF241444FF24173EFF24173EFF24173EFF24173EFF24173EFF2417
      3EFF241542FF240A58FF24016BFF220361FF1C0F36FF171718FF131341FF0707
      B7FF0000FCFF0606DBFF111194FF171773FF171773FF171773FF171773FF1717
      73FF171773FF161677FF0D0DAEFF0202EFFF0101EFFF0C0C8AFF161624FF151F
      2CFF0A4799FF016AF5FF0366EAFF0F4FA5FF173E74FF173E73FF173E73FF173E
      73FF173E73FF173E73FF173E73FF104C9CFF0464E3FF006BFAFF084DA8FF1422
      36FF161E1EFF0D7A7AFF02E7E7FF01F4F4FF0CB8B8FF167B7BFF177373FF1773
      73FF177373FF177373FF177373FF177373FF138C8CFF07D3D3FF00FCFCFF06C5
      C5FF114E4EFF171717FF101010FF040404FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6BFF240D52FF241F2FFF242425FF242425FF242425FF242425FF242425FF2424
      25FF24212BFF24104DFF24016AFF240562FF24173EFF242425FF1D1D4CFF0B0B
      BBFF0000FCFF0909C9FF1B1B59FF242426FF242426FF242426FF242426FF2424
      26FF242426FF23232CFF141482FF0303E8FF0202F0FF121290FF222230FF212B
      38FF104D9FFF016AF6FF0562DFFF173F74FF242628FF242526FF242526FF2425
      26FF242526FF242526FF242526FF193A66FF075FD5FF006BFAFF0D52ADFF1F2E
      41FF232A2AFF148181FF03E8E8FF02F0F0FF129191FF223232FF242626FF2426
      26FF242626FF242626FF242626FF242626FF1D4D4DFF0BBCBCFF00FCFCFF09C8
      C8FF1B5858FF242424FF191919FF070707FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009001AFF180048FF1D00
      57FF200D45FF231F2BFF242424FF212121FF1E1E1EFF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1A22FF1D0D3FFF1D0156FF1E0551FF211737FF242425FF1D1D43FF0B0B
      9BFF0000CEFF0909A5FF1B1B4DFF242424FF222222FF1E1E1EFF1D1D1DFF1D1D
      1DFF1D1D1DFF1C1C22FF101069FF0303BEFF0202C4FF121279FF22222EFF2129
      34FF104285FF0156C9FF0551B7FF173762FF242526FF232323FF1F1F1FFF1D1D
      1DFF1D1D1DFF1D1D1DFF1D1D1DFF142F52FF054DADFF0057CCFF0D4590FF1F2B
      3BFF232929FF146D6DFF03BEBEFF02C4C4FF127979FF222E2EFF232323FF2020
      20FF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF183E3EFF099999FF00CECEFF09A5
      A5FF1B4D4DFF242424FF191919FF070707FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003000AFF09001AFF0B00
      20FF140D21FF211F23FF232323FF191919FF0D0D0DFF0B0B0BFF0B0B0BFF0B0B
      0BFF0B0A0DFF0B0517FF0B001FFF0E0521FF1B1723FF242424FF1D1D2BFF0B0B
      40FF00004CFF090942FF1B1B2EFF242424FF1C1C1CFF101010FF0B0B0BFF0B0B
      0BFF0B0B0BFF0B0B0DFF060627FF010146FF02024AFF121238FF222226FF2124
      28FF10223BFF01204BFF052147FF172333FF242424FF1F1F1FFF131313FF0B0B
      0BFF0B0B0BFF0B0B0BFF0B0B0BFF08111FFF021C40FF00204CFF0D213DFF1F23
      29FF232525FF143535FF034848FF024A4AFF123838FF222626FF222222FF1616
      16FF0C0C0CFF0B0B0BFF0B0B0BFF0B0B0BFF091717FF033838FF004C4CFF0942
      42FF1B2E2EFF242424FF191919FF070707FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF050505FF171717FF242424FF1D1D1DFF0B0B0BFF0000
      00000000000000000000000000000000000000000000000000000D0D0DFF1F1F
      1FFF232323FF141414FF030303FF020202FF121212FF222222FF212121FF1010
      10FF010101FF0000000000000000000000000000000000000000000000000909
      09FF1B1B1BFF242424FF191919FF070707FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF050505FF171717FF242424FF1D1D1DFF0B0B0BFF0000
      00000000000000000000000000000000000000000000000000000D0D0DFF1F1F
      1FFF232323FF141414FF030303FF020202FF121212FF222222FF212121FF1010
      10FF010101FF0000000000000000000000000000000000000000000000000909
      09FF1B1B1BFF242424FF191919FF070707FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0052BFFF001A3DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF00DADAFF005C5CFF000303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0052BFFF001A3DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF00DADAFF005C5CFF000303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF230167FF18063CFF0C0A
      10FF0A0A0AFF050505FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0404
      A4FF0A0A2BFF0B0B0BFF060606FF010101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0355C2FF082245FF0B0B0BFF080808FF020202FF00000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF01DCDCFF076363FF0B0E0EFF090909FF030303FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF240268FF210F45FF1D1B
      21FF1A1A1AFF0D0D0DFF010101FF000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000FAFF0B0B
      ABFF19193BFF1C1C1CFF101010FF030303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0759C6FF163053FF1D1D1DFF141414FF050505FF00000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF04DEDEFF126E6EFF1D1F1FFF181818FF090909FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF010004FF10002FFF210062FF240268FF241249FF2422
      29FF212122FF101011FF010102FF000001FF000002FF000003FF000003FF0000
      03FF000003FF000003FF000003FF000003FF00004EFF0000CEFF0000FAFF0D0D
      AEFF1F1F43FF232325FF141417FF030306FF000003FF000103FF000103FF0001
      03FF000103FF000103FF000103FF000103FF000103FF001531FF004CB1FF006C
      FCFF095BC9FF1B3659FF242526FF191A1BFF070809FF000103FF000203FF0003
      03FF000303FF000303FF000303FF000303FF000303FF000303FF001A1AFF0090
      90FF00F5F5FF05DFDFFF177474FF242828FF1D2020FF0B0E0EFF000303FF0003
      03FF000303FF000303FF000202FF000101FF0000000000000000000000000000
      0000010101FF030303FF030303FF020202FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000D0027FF0D0027FF0D0027FF0D0027FF0D00
      27FF0D0027FF0D0027FF0E0029FF170045FF220066FF240169FF240C55FF2416
      41FF22153CFF170A31FF0E0128FF0B002EFF050049FF00005BFF00005CFF0000
      5CFF00005CFF00005CFF00005CFF00005CFF00008CFF0000DEFF0000FBFF0808
      CAFF141485FF161672FF0D0D69FF02025EFF00025CFF00145CFF00255CFF0027
      5CFF00275CFF00275CFF00275CFF00275CFF00275CFF00347AFF0057CCFF006C
      FCFF0661DBFF114994FF173E73FF10376CFF042B60FF00285CFF003A5CFF0055
      5CFF005C5CFF005C5CFF005C5CFF005C5CFF005C5CFF005C5CFF006B6BFF00B7
      B7FF00F7F7FF03EAEAFF0FA5A5FF177474FF136F6FFF076363FF005C5CFF005C
      5CFF005C5CFF005C5CFF004040FF001111FF0000000000000000000000000303
      03FF282828FF545454FF575757FF2E2E2EFF050505FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F005DFF1F005DFF1F005DFF1F005DFF1F00
      5DFF1F005DFF1F005DFF1F005DFF210063FF24006BFF24006BFF240367FF2405
      63FF240562FF21025FFF1F005DFF1B006EFF0B00ACFF0000D9FF0000DAFF0000
      DAFF0000DAFF0000DAFF0000DAFF0000DAFF0000E4FF0000F6FF0000FCFF0202
      F1FF0404E3FF0505DFFF0303DDFF0000DAFF0005DAFF002FDAFF0058DAFF005D
      DAFF005DDAFF005DDAFF005DDAFF005DDAFF005DDAFF0060E0FF0067F2FF006C
      FCFF016AF5FF0464E6FF0562DFFF0360DDFF015EDBFF005EDAFF008BDAFF00C9
      DAFF00DADAFF00DADAFF00DADAFF00DADAFF00DADAFF00DADAFF00DDDDFF00ED
      EDFF00FBFBFF01F8F8FF03EAEAFF05DFDFFF04DEDEFF02DCDCFF00DADAFF00DA
      DAFF00DADAFF00DADAFF009898FF002828FF0000000000000000000000000606
      06FF5E5E5EFFC6C6C6FFCECECEFF6D6D6DFF0C0C0CFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000230069FF230069FF23006AFF24006BFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF1F007FFF0E01C4FF0101F5FF0101F7FF0000
      FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0006FCFF0135F9FF0164F6FF016A
      F7FF006BF9FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006DFCFF009EFAFF01E3
      F7FF01F6F6FF01F9F9FF00FBFBFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FB
      FBFF01F7F7FF01F6F6FF03AEAEFF063333FF070707FF070707FF070707FF0E0E
      0EFF717171FFE6E6E6FFEEEEEEFF828282FF151515FF070707FF070707FF0707
      07FF060606FF030303FF00000000000000000000000000000000000000000000
      000000000000000000000000000014003DFF14003DFF19004BFF210063FF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF210273FF170A8CFF10109EFF0D0DB0FF0505
      E0FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0104F7FF0827CEFF0F49A4FF0F50
      A8FF075FD4FF006BF9FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006DFBFF067FDAFF0E98
      ACFF10A2A2FF09C7C7FF01F3F3FF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF04E6
      E6FF0CB5B5FF109F9FFF2C9090FF5C7676FF6D6D6DFF6D6D6DFF6D6D6DFF7171
      71FFABABABFFEFEFEFFFF4F4F4FFB5B5B5FF757575FF6D6D6DFF6D6D6DFF6D6D
      6DFF5E5E5EFF282828FF010101FF000000000000000000000000000000000000
      000000000000000000000000000003000AFF03000AFF0D0027FF1E005AFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240465FF22154BFF212139FF1B1B5CFF0A0A
      C1FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0202F1FF11169AFF1F2943FF1E31
      4AFF0E50A7FF016AF6FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006BFAFF0C59B4FF1D3F
      52FF203E3EFF138D8DFF03EAEAFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF08CD
      CDFF196767FF213838FF5C6C6CFFC1C5C5FFE5E5E5FFE5E5E5FFE5E5E5FFE6E6
      E6FFEFEFEFFFFAFAFAFFFBFBFBFFF1F1F1FFE6E6E6FFE5E5E5FFE5E5E5FFE5E5
      E5FFC6C6C6FF545454FF020202FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A001FFF1C0053FF2200
      66FF230068FF24006BFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016AFF240268FF24075FFF24183DFF242425FF1D1D49FF0B0B
      B1FF0000EEFF0000F1FF0000F9FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0101F7FF0202F1FF0404E5FF13138AFF22222FFF212A
      36FF104997FF0164E8FF0067F0FF006AF7FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF016BF8FF0269F2FF0267EEFF0E4FA6FF1F2D
      3FFF232A2AFF147B7BFF03DCDCFF00EFEFFF00F5F5FF00FBFBFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FAFAFF01F4F4FF02F0F0FF0ABF
      BFFF1C5555FF242424FF616161FFC9C9C9FFEEEEEEFFF3F3F3FFFAFAFAFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFFF5F5F5FFF0F0
      F0FFD0D0D0FF595959FF040404FF020202FF010101FF00000000000000000000
      00000000000000000000000000000000000000000000050010FF0F002CFF1200
      37FF19004AFF220065FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240269FF240A58FF241149FF241443FF241D31FF242424FF1D1D35FF0B0B
      63FF00007EFF00009CFF0000DEFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F9FF0808CDFF10109AFF13138AFF1B1B5AFF23232AFF2126
      2CFF102E57FF01357BFF003D8FFF0058CEFF006BFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0561DCFF0F4FA4FF12488FFF193B69FF2229
      33FF232727FF144B4BFF037676FF008585FF00BDBDFF00F5F5FF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF03E8E8FF0DB0B0FF129090FF1676
      76FF203E3EFF242424FF3F3F3FFF6D6D6DFF7F7F7FFFACACACFFEBEBEBFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF2F2F2FFBFBFBFFF9393
      93FF7F7F7FFF404040FF131313FF0F0F0FFF050505FF00000000000000000000
      00000000000000000000000000000000000000000000010002FF020005FF0200
      07FF0E002BFF1F005EFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241345FF24212AFF242227FF242325FF242424FF1D1D20FF0B0B
      15FF00000EFF000047FF0000C3FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0F0FA4FF1F1F43FF22222FFF23232AFF242425FF2121
      22FF101318FF01070FFF00142EFF0047A5FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58BFFF1C3556FF222830FF23272CFF2425
      26FF232323FF141A1AFF031010FF001B1BFF008585FF00EFEFFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF06D6D6FF186D6DFF223030FF222D
      2DFF242727FF242424FF1D1D1DFF121212FF101010FF656565FFDCDCDCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFE9E9E9FF888888FF3636
      36FF2E2E2EFF272727FF222222FF1C1C1CFF0A0A0AFF00000000000000000000
      00000000000000000000000000000000000000000000010003FF020008FF0300
      0BFF0F002EFF20005FFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241347FF24202DFF24212AFF222125FF212121FF1B1B1FFF0A0A
      1AFF000017FF00004EFF0000C5FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0E0EA7FF1E1E4AFF212137FF21212DFF212122FF1E1F
      20FF0E141BFF010B17FF001736FF0048A8FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58C1FF1B375CFF212B38FF212730FF2122
      24FF202121FF131D1DFF031818FF002424FF008A8AFF00EFEFFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF06D8D8FF177373FF213838FF2132
      32FF212727FF212121FF171717FF060606FF030303FF5C5C5CFFDADADAFFFBFB
      FBFFF3F3F3FFEAEAEAFFE9E9E9FFF2F2F2FFFBFBFBFFE8E8E8FF818181FF2A2A
      2AFF242424FF222222FF212121FF1B1B1BFF0A0A0AFF00000000000000000000
      00000000000000000000000000000000000000000000060012FF100032FF1400
      3DFF1A004EFF220066FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240169FF24095AFF24104EFF211045FF171026FF101011FF0D0D27FF0505
      69FF00008FFF0000A9FF0000E2FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000F9FF0707D4FF0F0FA8FF101097FF101058FF101018FF0F14
      1CFF072A58FF003C8BFF00439EFF005BD4FF006CFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0563E0FF0D53B0FF104C9EFF10376BFF1018
      23FF101414FF094747FF018383FF009595FF00C6C6FF00F6F6FF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF03EBEBFF0BBBBBFF109F9FFF107D
      7DFF103232FF101010FF0B0B0BFF030303FF030303FF5C5C5CFFDADADAFFF8F8
      F8FFC7C7C7FF8C8C8CFF888888FFBFBFBFFFF5F5F5FFE8E8E8FF818181FF2A2A
      2AFF212121FF171717FF101010FF0D0D0DFF050505FF00000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0056FF2300
      69FF23006AFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016BFF24016AFF1F015CFF0E0127FF010102FF01012EFF0000
      ACFF0000F5FF0000F7FF0000FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000F9FF0101F7FF0101E8FF01017CFF01010FFF010B
      17FF003C8CFF0066EEFF0069F6FF006BF9FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006BFAFF016AF7FF0169F3FF01449DFF010F
      22FF010808FF016A6AFF00DFDFFF00F5F5FF00F9F9FF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FBFBFF01F8F8FF01F6F6FF01BB
      BBFF013C3CFF010101FF010101FF00000000030303FF5C5C5CFFDADADAFFF6F6
      F6FFA1A1A1FF3D3D3DFF363636FF939393FFF0F0F0FFE8E8E8FF818181FF2A2A
      2AFF1F1F1FFF0E0E0EFF010101FF010101FF0000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF240268FF240463FF240562FF240562FF240562FF240562FF240562FF2405
      62FF240563FF240268FF24006CFF20015EFF10032BFF050506FF040433FF0202
      B2FF0000FCFF0101F5FF0404E6FF0505DFFF0505DFFF0505DFFF0505DFFF0505
      DFFF0505DFFF0505E0FF0303ECFF0000F9FF0000EEFF030381FF050513FF050E
      1CFF024091FF0069F5FF016BF8FF0366EAFF0562DFFF0562DFFF0562DFFF0562
      DFFF0562DFFF0562DFFF0562DFFF0365E8FF016AF7FF006BF9FF0246A2FF0413
      26FF050C0CFF037070FF00E5E5FF00FAFAFF03EEEEFF05E1E1FF05DFDFFF05DF
      DFFF05DFDFFF05DFDFFF05DFDFFF05DFDFFF04E4E4FF02F3F3FF00FCFCFF01C1
      C1FF044040FF050505FF030303FF010101FF020202FF505050FFBDBDBDFFD5D5
      D5FF8B8B8BFF353535FF2E2E2EFF7F7F7FFFD0D0D0FFC9C9C9FF737373FF2929
      29FF1F1F1FFF0D0D0DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF24085BFF241444FF24173EFF24173EFF24173EFF24173EFF24173EFF2417
      3EFF241542FF240A58FF24016BFF220361FF1C0F36FF171718FF131341FF0707
      B7FF0000FCFF0606DBFF111194FF171773FF171773FF171773FF171773FF1717
      73FF171773FF161677FF0D0DAEFF0202EFFF0101EFFF0C0C8AFF161624FF151F
      2CFF0A4799FF016AF5FF0366EAFF0F4FA5FF173E74FF173E73FF173E73FF173E
      73FF173E73FF173E73FF173E73FF104C9CFF0464E3FF006BFAFF084DA8FF1422
      36FF161E1EFF0D7A7AFF02E7E7FF01F4F4FF0CB8B8FF167B7BFF177373FF1773
      73FF177373FF177373FF177373FF177373FF138C8CFF07D3D3FF00FCFCFF06C5
      C5FF114E4EFF171717FF101010FF040404FF010101FF222222FF505050FF5A5A
      5AFF444444FF292929FF272727FF404040FF595959FF575757FF3C3C3CFF2626
      26FF1F1F1FFF0D0D0DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6BFF240D52FF241F2FFF242425FF242425FF242425FF242425FF242425FF2424
      25FF24212BFF24104DFF24016AFF240562FF24173EFF242425FF1D1D4CFF0B0B
      BBFF0000FCFF0909C9FF1B1B59FF242426FF242426FF242426FF242426FF2424
      26FF242426FF23232CFF141482FF0303E8FF0202F0FF121290FF222230FF212B
      38FF104D9FFF016AF6FF0562DFFF173F74FF242628FF242526FF242526FF2425
      26FF242526FF242526FF242526FF193A66FF075FD5FF006BFAFF0D52ADFF1F2E
      41FF232A2AFF148181FF03E8E8FF02F0F0FF129191FF223232FF242626FF2426
      26FF242626FF242626FF242626FF242626FF1D4D4DFF0BBCBCFF00FCFCFF09C8
      C8FF1B5858FF242424FF191919FF070707FF00000000010101FF030303FF0404
      04FF111111FF212121FF222222FF141414FF050505FF060606FF161616FF2323
      23FF1F1F1FFF0D0D0DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009001AFF180048FF1D00
      57FF200D45FF231F2BFF242424FF212121FF1E1E1EFF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1A22FF1D0D3FFF1D0156FF1E0551FF211737FF242425FF1D1D43FF0B0B
      9BFF0000CEFF0909A5FF1B1B4DFF242424FF222222FF1E1E1EFF1D1D1DFF1D1D
      1DFF1D1D1DFF1C1C22FF101069FF0303BEFF0202C4FF121279FF22222EFF2129
      34FF104285FF0156C9FF0551B7FF173762FF242526FF232323FF1F1F1FFF1D1D
      1DFF1D1D1DFF1D1D1DFF1D1D1DFF142F52FF054DADFF0057CCFF0D4590FF1F2B
      3BFF232929FF146D6DFF03BEBEFF02C4C4FF127979FF222E2EFF232323FF2020
      20FF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF183E3EFF099999FF00CECEFF09A5
      A5FF1B4D4DFF242424FF191919FF070707FF0000000000000000000000000101
      01FF0D0D0DFF1A1A1AFF1B1B1BFF0F0F0FFF020202FF030303FF101010FF1C1C
      1CFF191919FF0B0B0BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003000AFF09001AFF0B00
      20FF140D21FF211F23FF232323FF191919FF0D0D0DFF0B0B0BFF0B0B0BFF0B0B
      0BFF0B0A0DFF0B0517FF0B001FFF0E0521FF1B1723FF242424FF1D1D2BFF0B0B
      40FF00004CFF090942FF1B1B2EFF242424FF1C1C1CFF101010FF0B0B0BFF0B0B
      0BFF0B0B0BFF0B0B0DFF060627FF010146FF02024AFF121238FF222226FF2124
      28FF10223BFF01204BFF052147FF172333FF242424FF1F1F1FFF131313FF0B0B
      0BFF0B0B0BFF0B0B0BFF0B0B0BFF08111FFF021C40FF00204CFF0D213DFF1F23
      29FF232525FF143535FF034848FF024A4AFF123838FF222626FF222222FF1616
      16FF0C0C0CFF0B0B0BFF0B0B0BFF0B0B0BFF091717FF033838FF004C4CFF0942
      42FF1B2E2EFF242424FF191919FF070707FF0000000000000000000000000000
      0000050505FF0A0A0AFF0A0A0AFF060606FF010101FF010101FF060606FF0B0B
      0BFF0A0A0AFF040404FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF050505FF171717FF242424FF1D1D1DFF0B0B0BFF0000
      00000000000000000000000000000000000000000000000000000D0D0DFF1F1F
      1FFF232323FF141414FF030303FF020202FF121212FF222222FF212121FF1010
      10FF010101FF0000000000000000000000000000000000000000000000000909
      09FF1B1B1BFF242424FF191919FF070707FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF050505FF171717FF242424FF1D1D1DFF0B0B0BFF0000
      00000000000000000000000000000000000000000000000000000D0D0DFF1F1F
      1FFF232323FF141414FF030303FF020202FF121212FF222222FF212121FF1010
      10FF010101FF0000000000000000000000000000000000000000000000000909
      09FF1B1B1BFF242424FF191919FF070707FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0052BFFF001A3DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF00DADAFF005C5CFF000303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      07FF6D6D6DFFE5E5E5FFEEEEEEFF7E7E7EFF0E0E0EFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF220066FF120036FF0200
      06FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0000
      A0FF000022FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0052BFFF001A3DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF00DADAFF005C5CFF000303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      07FF6D6D6DFFE5E5E5FFEEEEEEFF7E7E7EFF0E0E0EFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF230167FF18063CFF0C0A
      10FF0A0A0AFF050505FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000F9FF0404
      A4FF0A0A2BFF0B0B0BFF060606FF010101FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0355C2FF082245FF0B0B0BFF080808FF020202FF00000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF01DCDCFF076363FF0B0E0EFF090909FF030303FF000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      07FF6D6D6DFFE5E5E5FFEEEEEEFF848484FF191919FF0A0A0AFF050505FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010003FF10002FFF210062FF240268FF210F45FF1D1B
      21FF1A1A1AFF0D0D0DFF010101FF000000000000000000000000000000000000
      00000000000000000000000000000000000000004CFF0000CEFF0000FAFF0B0B
      ABFF19193BFF1C1C1CFF101010FF030303FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000142EFF004CB0FF006C
      FCFF0759C6FF163053FF1D1D1DFF141414FF050505FF00000000000000000000
      0000000000000000000000000000000000000000000000000000001717FF008F
      8FFF00F5F5FF04DEDEFF126E6EFF1D1F1FFF181818FF090909FF000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      07FF6D6D6DFFE5E5E5FFEFEFEFFF8D8D8DFF2A2A2AFF1A1A1AFF0D0D0DFF0101
      01FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000001FF000001FF000001FF000001FF0000
      01FF000001FF000001FF010004FF10002FFF210062FF240268FF241249FF2422
      29FF212122FF101011FF010102FF000001FF000002FF000003FF000003FF0000
      03FF000003FF000003FF000003FF000003FF00004EFF0000CEFF0000FAFF0D0D
      AEFF1F1F43FF232325FF141417FF030306FF000003FF000103FF000103FF0001
      03FF000103FF000103FF000103FF000103FF000103FF001531FF004CB1FF006C
      FCFF095BC9FF1B3659FF242526FF191A1BFF070809FF000103FF000203FF0003
      03FF000303FF000303FF000303FF000303FF000303FF000303FF001A1AFF0090
      90FF00F5F5FF05DFDFFF177474FF242828FF1D2020FF0B0E0EFF000303FF0103
      03FF020303FF030303FF030303FF030303FF030303FF030303FF030303FF0A0A
      0AFF6F6F6FFFE5E5E5FFF0F0F0FF919191FF323232FF232323FF121212FF0404
      04FF030303FF030303FF030303FF020202FF010101FF00000000000000000000
      00000000000000000000000000000D0027FF0D0027FF0D0027FF0D0027FF0D00
      27FF0D0027FF0D0027FF0E0029FF170045FF220066FF240169FF240C55FF2416
      41FF22153CFF170A31FF0E0128FF0B002EFF050049FF00005BFF00005CFF0000
      5CFF00005CFF00005CFF00005CFF00005CFF00008CFF0000DEFF0000FBFF0808
      CAFF141485FF161672FF0D0D69FF02025EFF00025CFF00145CFF00255CFF0027
      5CFF00275CFF00275CFF00275CFF00275CFF00275CFF00347AFF0057CCFF006C
      FCFF0661DBFF114994FF173E73FF10376CFF042B60FF00285CFF003A5CFF0055
      5CFF005C5CFF005C5CFF005C5CFF005C5CFF005C5CFF005C5CFF006B6BFF00B7
      B7FF00F7F7FF03EAEAFF0FA5A5FF177474FF136F6FFF076363FF005C5CFF165C
      5CFF465C5CFF5C5C5CFF5C5C5CFF5C5C5CFF5C5C5CFF5C5C5CFF5C5C5CFF6161
      61FFA1A1A1FFEDEDEDFFF4F4F4FFB8B8B8FF7B7B7BFF717171FF666666FF5D5D
      5DFF5C5C5CFF5C5C5CFF5C5C5CFF4B4B4BFF1C1C1CFF00000000000000000000
      00000000000000000000000000001F005DFF1F005DFF1F005DFF1F005DFF1F00
      5DFF1F005DFF1F005DFF1F005DFF210063FF24006BFF24006BFF240367FF2405
      63FF240562FF21025FFF1F005DFF1B006EFF0B00ACFF0000D9FF0000DAFF0000
      DAFF0000DAFF0000DAFF0000DAFF0000DAFF0000E4FF0000F6FF0000FCFF0202
      F1FF0404E3FF0505DFFF0303DDFF0000DAFF0005DAFF002FDAFF0058DAFF005D
      DAFF005DDAFF005DDAFF005DDAFF005DDAFF005DDAFF0060E0FF0067F2FF006C
      FCFF016AF5FF0464E6FF0562DFFF0360DDFF015EDBFF005EDAFF008BDAFF00C9
      DAFF00DADAFF00DADAFF00DADAFF00DADAFF00DADAFF00DADAFF00DDDDFF00ED
      EDFF00FBFBFF01F8F8FF03EAEAFF05DFDFFF04DEDEFF02DCDCFF00DADAFF34DA
      DAFFA6DADAFFDADADAFFDADADAFFDADADAFFDADADAFFDADADAFFDADADAFFDBDB
      DBFFE9E9E9FFF9F9F9FFFAFAFAFFEEEEEEFFE1E1E1FFDFDFDFFFDCDCDCFFDADA
      DAFFDADADAFFDADADAFFDADADAFFB2B2B2FF424242FF00000000000000000000
      0000000000000000000000000000230069FF230069FF23006AFF24006BFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF1F007FFF0E01C4FF0101F5FF0101F7FF0000
      FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0006FCFF0135F9FF0164F6FF016A
      F7FF006BF9FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006DFCFF009EFAFF01E3
      F7FF01F6F6FF01F9F9FF00FBFBFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF3BFB
      FBFFBBF7F7FFF6F6F6FFF8F8F8FFFBFBFBFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFBFBFBFFF8F8F8FFF6F6F6FFC9C9C9FF4B4B4BFF010101FF010101FF0000
      000000000000000000000000000014003DFF14003DFF19004BFF210063FF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF210273FF170A8CFF10109EFF0D0DB0FF0505
      E0FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0104F7FF0827CEFF0F49A4FF0F50
      A8FF075FD4FF006BF9FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006DFBFF067FDAFF0E98
      ACFF10A2A2FF09C7C7FF01F3F3FF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF26E6
      E6FF79B5B5FF9F9F9FFFBBBBBBFFEBEBEBFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFEFEFEFFFC1C1C1FFA0A0A0FF858585FF3B3B3BFF101010FF101010FF0000
      000000000000000000000000000003000AFF03000AFF0D0027FF1E005AFF2400
      6CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24006CFF24006CFF240465FF22154BFF212139FF1B1B5CFF0A0A
      C1FF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000FCFF0000FCFF0202F1FF11169AFF1F2943FF1E31
      4AFF0E50A7FF016AF6FF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006CFCFF006CFCFF006BFAFF0C59B4FF1D3F
      52FF203E3EFF138D8DFF03EAEAFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF0DCD
      CDFF2B6767FF383838FF737373FFD8D8D8FFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFE2E2E2FF808080FF3A3A3AFF343434FF282828FF212121FF212121FF0000
      000000000000000000000000000000000000000000000A001FFF1C0053FF2200
      66FF230068FF24006BFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016AFF240268FF24075FFF24183DFF242425FF1D1D49FF0B0B
      B1FF0000EEFF0000F1FF0000F9FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0101F7FF0202F1FF0404E5FF13138AFF22222FFF212A
      36FF104997FF0164E8FF0067F0FF006AF7FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF016BF8FF0269F2FF0267EEFF0E4FA6FF1F2D
      3FFF232A2AFF147B7BFF03DCDCFF00EFEFFF00F5F5FF00FBFBFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FAFAFF01F4F4FF02F0F0FF0ABF
      BFFF1C5555FF242424FF616161FFC9C9C9FFEEEEEEFFF3F3F3FFFAFAFAFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFFF5F5F5FFF0F0
      F0FFD5D5D5FF6E6E6EFF262626FF242424FF232323FF222222FF222222FF0000
      00000000000000000000000000000000000000000000050010FF0F002CFF1200
      37FF19004AFF220065FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240269FF240A58FF241149FF241443FF241D31FF242424FF1D1D35FF0B0B
      63FF00007EFF00009CFF0000DEFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F9FF0808CDFF10109AFF13138AFF1B1B5AFF23232AFF2126
      2CFF102E57FF01357BFF003D8FFF0058CEFF006BFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0561DCFF0F4FA4FF12488FFF193B69FF2229
      33FF232727FF144B4BFF037676FF008585FF00BDBDFF00F5F5FF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF03E8E8FF0DB0B0FF129090FF1676
      76FF203E3EFF242424FF3F3F3FFF6D6D6DFF7F7F7FFFACACACFFEBEBEBFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF2F2F2FFBFBFBFFF9393
      93FF818181FF4B4B4BFF252525FF212121FF171717FF121212FF121212FF0000
      00000000000000000000000000000000000000000000010002FF020005FF0200
      07FF0E002BFF1F005EFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241345FF24212AFF242227FF242325FF242424FF1D1D20FF0B0B
      15FF00000EFF000047FF0000C3FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0F0FA4FF1F1F43FF22222FFF23232AFF242425FF2121
      22FF101318FF01070FFF00142EFF0047A5FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58BFFF1C3556FF222830FF23272CFF2425
      26FF232323FF141A1AFF031010FF001B1BFF008585FF00EFEFFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF06D6D6FF186D6DFF223030FF222D
      2DFF242727FF242424FF1D1D1DFF121212FF101010FF656565FFDCDCDCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFE9E9E9FF888888FF3636
      36FF2E2E2EFF282828FF242424FF1E1E1EFF0C0C0CFF020202FF020202FF0000
      00000000000000000000000000000000000000000000010003FF020008FF0300
      0BFF0F002EFF20005FFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240366FF241347FF24202DFF24212AFF222125FF212121FF1B1B1FFF0A0A
      1AFF000017FF00004EFF0000C5FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0101F6FF0E0EA7FF1E1E4AFF212137FF21212DFF212122FF1E1F
      20FF0E141BFF010B17FF001736FF0048A8FF006BFAFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0A58C1FF1B375CFF212B38FF212730FF2122
      24FF202121FF131D1DFF031818FF002424FF008A8AFF00EFEFFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF06D8D8FF177373FF213838FF2132
      32FF212727FF212121FF1E1E1EFF191919FF191919FF6B6B6BFFDDDDDDFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFEAEAEAFF8D8D8DFF3E3E
      3EFF353535FF292929FF212121FF1B1B1BFF0A0A0AFF00000000000000000000
      00000000000000000000000000000000000000000000060012FF100032FF1400
      3DFF1A004EFF220066FF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF240169FF24095AFF24104EFF211045FF171026FF101011FF0D0D27FF0505
      69FF00008FFF0000A9FF0000E2FF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000F9FF0707D4FF0F0FA8FF101097FF101058FF101018FF0F14
      1CFF072A58FF003C8BFF00439EFF005BD4FF006CFBFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF0563E0FF0D53B0FF104C9EFF10376BFF1018
      23FF101414FF094747FF018383FF009595FF00C6C6FF00F6F6FF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF03EBEBFF0BBBBBFF109F9FFF107D
      7DFF103232FF101010FF363636FF787878FF909090FFB7B7B7FFEDEDEDFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF3F3F3FFC7C7C7FFA2A2
      A2FF8C8C8CFF444444FF111111FF0D0D0DFF050505FF00000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0056FF2300
      69FF23006AFF24006CFF24006CFF24006CFF24006CFF24006CFF24006CFF2400
      6CFF24006CFF24016BFF24016AFF1F015CFF0E0127FF010102FF01012EFF0000
      ACFF0000F5FF0000F7FF0000FAFF0000FCFF0000FCFF0000FCFF0000FCFF0000
      FCFF0000FCFF0000FCFF0000F9FF0101F7FF0101E8FF01017CFF01010FFF010B
      17FF003C8CFF0066EEFF0069F6FF006BF9FF006CFCFF006CFCFF006CFCFF006C
      FCFF006CFCFF006CFCFF006CFCFF006BFAFF016AF7FF0169F3FF01449DFF010F
      22FF010808FF016A6AFF00DFDFFF00F5F5FF00F9F9FF00FCFCFF00FCFCFF00FC
      FCFF00FCFCFF00FCFCFF00FCFCFF00FCFCFF00FBFBFF01F8F8FF01F6F6FF01BB
      BBFF013C3CFF010101FF4A4A4AFFC8C8C8FFF5F5F5FFF8F8F8FFFBFBFBFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFFF9F9F9FFF6F6
      F6FFD5D5D5FF5A5A5AFF040404FF010101FF0000000000000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF240268FF240463FF240562FF240562FF240562FF240562FF240562FF2405
      62FF240563FF240268FF24006CFF20015EFF10032BFF050506FF040433FF0202
      B2FF0000FCFF0101F5FF0404E6FF0505DFFF0505DFFF0505DFFF0505DFFF0505
      DFFF0505DFFF0505E0FF0303ECFF0000F9FF0000EEFF030381FF050513FF050E
      1CFF024091FF0069F5FF016BF8FF0366EAFF0562DFFF0562DFFF0562DFFF0562
      DFFF0562DFFF0562DFFF0562DFFF0365E8FF016AF7FF006BF9FF0246A2FF0413
      26FF050C0CFF037070FF00E5E5FF00FAFAFF03EEEEFF05E1E1FF05DFDFFF05DF
      DFFF05DFDFFF05DFDFFF05DFDFFF05DFDFFF04E4E4FF02F3F3FF00FCFCFF01C1
      C1FF044040FF050505FF4F4F4FFFCECECEFFFCFCFCFFF1F1F1FFE3E3E3FFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFE2E2E2FFEFEFEFFFFBFB
      FBFFDBDBDBFF5F5F5FFF080808FF040404FF020202FF00000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6CFF24085BFF241444FF24173EFF24173EFF24173EFF24173EFF24173EFF2417
      3EFF241542FF240A58FF24016BFF220361FF1C0F36FF171718FF131341FF0707
      B7FF0000FCFF0606DBFF111194FF171773FF171773FF171773FF171773FF1717
      73FF171773FF161677FF0D0DAEFF0202EFFF0101EFFF0C0C8AFF161624FF151F
      2CFF0A4799FF016AF5FF0366EAFF0F4FA5FF173E74FF173E73FF173E73FF173E
      73FF173E73FF173E73FF173E73FF104C9CFF0464E3FF006BFAFF084DA8FF1422
      36FF161E1EFF0D7A7AFF02E7E7FF01F4F4FF0CB8B8FF167B7BFF177373FF1773
      73FF177373FF177373FF177373FF177373FF138C8CFF07D3D3FF00FCFCFF06C5
      C5FF114E4EFF171717FF5C5C5CFFD2D2D2FFFBFBFBFFCACACAFF858585FF7373
      73FF737373FF737373FF737373FF737373FF737373FF808080FFC1C1C1FFF8F8
      F8FFDDDDDDFF6B6B6BFF191919FF131313FF070707FF00000000000000000000
      000000000000000000000000000000000000000000000B0020FF1D0058FF2400
      6BFF240D52FF241F2FFF242425FF242425FF242425FF242425FF242425FF2424
      25FF24212BFF24104DFF24016AFF240562FF24173EFF242425FF1D1D4CFF0B0B
      BBFF0000FCFF0909C9FF1B1B59FF242426FF242426FF242426FF242426FF2424
      26FF242426FF23232CFF141482FF0303E8FF0202F0FF121290FF222230FF212B
      38FF104D9FFF016AF6FF0562DFFF173F74FF242628FF242526FF242526FF2425
      26FF242526FF242526FF242526FF193A66FF075FD5FF006BFAFF0D52ADFF1F2E
      41FF232A2AFF148181FF03E8E8FF02F0F0FF129191FF223232FF242626FF2426
      26FF242626FF242626FF242626FF242626FF1D4D4DFF0BBCBCFF00FCFCFF09C8
      C8FF1B5858FF242424FF656565FFD4D4D4FFFAFAFAFFAEAEAEFF434343FF2626
      26FF262626FF262626FF262626FF262626FF262626FF3A3A3AFFA0A0A0FFF6F6
      F6FFDFDFDFFF737373FF262626FF1D1D1DFF0B0B0BFF00000000000000000000
      0000000000000000000000000000000000000000000009001AFF180048FF1D00
      57FF200D45FF231F2BFF242424FF212121FF1E1E1EFF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1A22FF1D0D3FFF1D0156FF1E0551FF211737FF242425FF1D1D43FF0B0B
      9BFF0000CEFF0909A5FF1B1B4DFF242424FF222222FF1E1E1EFF1D1D1DFF1D1D
      1DFF1D1D1DFF1C1C22FF101069FF0303BEFF0202C4FF121279FF22222EFF2129
      34FF104285FF0156C9FF0551B7FF173762FF242526FF232323FF1F1F1FFF1D1D
      1DFF1D1D1DFF1D1D1DFF1D1D1DFF142F52FF054DADFF0057CCFF0D4590FF1F2B
      3BFF232929FF146D6DFF03BEBEFF02C4C4FF127979FF222E2EFF232323FF2020
      20FF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF183E3EFF099999FF00CECEFF09A5
      A5FF1B4D4DFF242424FF575757FFAFAFAFFFCCCCCCFF909090FF3B3B3BFF2424
      24FF212121FF1E1E1EFF1D1D1DFF1D1D1DFF1D1D1DFF2D2D2DFF828282FFC9C9
      C9FFB7B7B7FF626262FF262626FF1D1D1DFF0B0B0BFF00000000000000000000
      0000000000000000000000000000000000000000000003000AFF09001AFF0B00
      20FF140D21FF211F23FF232323FF191919FF0D0D0DFF0B0B0BFF0B0B0BFF0B0B
      0BFF0B0A0DFF0B0517FF0B001FFF0E0521FF1B1723FF242424FF1D1D2BFF0B0B
      40FF00004CFF090942FF1B1B2EFF242424FF1C1C1CFF101010FF0B0B0BFF0B0B
      0BFF0B0B0BFF0B0B0DFF060627FF010146FF02024AFF121238FF222226FF2124
      28FF10223BFF01204BFF052147FF172333FF242424FF1F1F1FFF131313FF0B0B
      0BFF0B0B0BFF0B0B0BFF0B0B0BFF08111FFF021C40FF00204CFF0D213DFF1F23
      29FF232525FF143535FF034848FF024A4AFF123838FF222626FF222222FF1616
      16FF0C0C0CFF0B0B0BFF0B0B0BFF0B0B0BFF091717FF033838FF004C4CFF0942
      42FF1B2E2EFF242424FF303030FF454545FF4C4C4CFF3D3D3DFF292929FF2323
      23FF191919FF0D0D0DFF0B0B0BFF0B0B0BFF0B0B0BFF111111FF303030FF4A4A
      4AFF474747FF333333FF242424FF1D1D1DFF0B0B0BFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF050505FF171717FF242424FF1D1D1DFF0B0B0BFF0000
      00000000000000000000000000000000000000000000000000000D0D0DFF1F1F
      1FFF232323FF141414FF030303FF020202FF121212FF222222FF212121FF1010
      10FF010101FF0000000000000000000000000000000000000000000000000909
      09FF1B1B1BFF242424FF191919FF070707FF000000000D0D0DFF1F1F1FFF2323
      23FF141414FF030303FF00000000000000000000000000000000000000000000
      0000050505FF171717FF242424FF1D1D1DFF0B0B0BFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0DFF1F1F1FFF232323FF141414FF030303FF00000000000000000000
      0000000000000000000000000000050505FF171717FF242424FF1D1D1DFF0B0B
      0BFF00000000090909FF1B1B1BFF242424FF191919FF070707FF000000000000
      000000000000000000000000000000000000020202FF121212FF222222FF2121
      21FF101010FF010101FF050505FF171717FF242424FF1D1D1DFF0B0B0BFF0000
      00000000000000000000000000000000000000000000000000000D0D0DFF1F1F
      1FFF232323FF141414FF030303FF020202FF121212FF222222FF212121FF1010
      10FF010101FF0000000000000000000000000000000000000000000000000909
      09FF1B1B1BFF242424FF191919FF070707FF000000000D0D0DFF1F1F1FFF2323
      23FF141414FF030303FF00000000000000000000000000000000000000000000
      0000050505FF171717FF242424FF1D1D1DFF0B0B0BFF00000000000000000000
      0000000000000000000000000000
    }
  end
  object FindD: TFindDialog
    OnClose = FindDClose
    Title = 'Find Team bt Name'
    Options = [frDown, frHideMatchCase, frHideWholeWord, frHideUpDown, frHidePromptOnReplace]
    OnFind = FindDFind
    Left = 560
  end
  object PopNotify: TPopupNotifier
    Color = 14483455
    Icon.Data = {
      07544269746D617000000000
    }
    Text = 'Text'
    Title = 'Caption'
    TitleFont.Style = [fsBold]
    Visible = False
    Left = 432
  end
  object FilFlags: TBGRAImageList
    Height = 24
    Width = 24
    Left = 400
  end
  object PGePopup: TPopupMenu
    Left = 368
    object MShSquad: TMenuItem
      Caption = 'Show Squad'
      OnClick = MShSquadClick
    end
    object MenuItem12: TMenuItem
      Caption = '-'
    end
    object MPAdd: TMenuItem
      Caption = 'Add Team'
      OnClick = MaddTeamClick
    end
    object MPdel: TMenuItem
      Caption = 'Remove Team'
      OnClick = MRemoveTeamClick
    end
    object MPClrTeam: TMenuItem
      Caption = 'Clear Team'
      OnClick = MclrTeamClick
    end
    object MenuItem6: TMenuItem
      Caption = '-'
    end
    object MPCpTeam: TMenuItem
      Caption = 'Copy Team'
      OnClick = McpTeamClick
    end
    object MPPaTeam: TMenuItem
      Caption = 'Paste Team'
      OnClick = MpaTeamClick
    end
    object MenuItem9: TMenuItem
      Caption = '-'
    end
    object MPShClip: TMenuItem
      Caption = 'Show Clipboard'
      OnClick = MClipShowClick
    end
  end
  object MSqPopup: TPopupMenu
    Left = 320
    object MPShowPlay: TMenuItem
      Caption = 'Show Player'
      OnClick = MPShowPlayClick
    end
    object MenuItem13: TMenuItem
      Caption = '-'
    end
    object MPcpPlay: TMenuItem
      Caption = 'Copy Player'
      OnClick = McpPlayerClick
    end
    object MPPaPlay: TMenuItem
      Caption = 'Paste Player'
      OnClick = MPaPlayerClick
    end
    object MenuItem8: TMenuItem
      Caption = '-'
    end
    object MPSClipShow: TMenuItem
      Caption = 'Show Clipboard'
      OnClick = MClipShowClick
    end
  end
  object MPGenPosVal: TPopupMenu
    Left = 288
    object MPcompl: TMenuItem
      Caption = 'Random Position'
      OnClick = MPcomplClick
    end
    object MPSiteBack: TMenuItem
      Caption = 'Site Back'
      OnClick = MPSiteBackClick
    end
    object MPDef: TMenuItem
      Caption = 'Defender'
      OnClick = MPDefClick
    end
    object MPSiteM: TMenuItem
      Caption = 'Site Midfielder'
      OnClick = MPSiteMClick
    end
    object MPWing: TMenuItem
      Caption = 'Winger'
      OnClick = MPWingClick
    end
    object MPDM: TMenuItem
      Caption = 'Defensive Midfielder'
      OnClick = MPDMClick
    end
    object MPMid: TMenuItem
      Caption = 'Midfielder'
      OnClick = MPMidClick
    end
    object MPAM: TMenuItem
      Caption = 'Offensive Midfielder'
      OnClick = MPAMClick
    end
    object MPAttacker: TMenuItem
      Caption = 'Attacker'
      OnClick = MPAttackerClick
    end
    object MPSc: TMenuItem
      Caption = 'Striker'
      OnClick = MPScClick
    end
  end
  object sav: TSaveDialog
    Filter = 'CSV File|*.csv|All|*.*'
    FilterIndex = 0
    Left = 560
    Top = 40
  end
  object Act: TActionList
    Left = 320
    Top = 48
    object AOverview: TAction
      Caption = 'AOverview'
      OnExecute = AOverviewExecute
      ShortCut = 112
    end
    object AGeneral: TAction
      Caption = 'AGeneral'
      OnExecute = AGeneralExecute
      ShortCut = 113
    end
    object ATeam: TAction
      Caption = 'ATeam'
      OnExecute = ATeamExecute
      ShortCut = 114
    end
    object ASquad: TAction
      Caption = 'ASquad'
      OnExecute = ASquadExecute
      ShortCut = 115
    end
    object APlayer: TAction
      Caption = 'APlayer'
      OnExecute = APlayerExecute
      ShortCut = 116
    end
  end
end
