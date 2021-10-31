object MainForm: TMainForm
  Left = 401
  Height = 733
  Top = 213
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
  LCLVersion = '7.5'
  object PCtrl: TPageControl
    Left = 0
    Height = 713
    Top = 0
    Width = 597
    ActivePage = tbGeneral
    Align = alClient
    TabIndex = 1
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
        end
        object lbFLFiDF: TLabel
          Left = 7
          Height = 15
          Top = 32
          Width = 201
          Alignment = taCenter
          AutoSize = False
          Caption = 'lbFLFiDF'
        end
        object lbTeamEdited: TLabel
          Left = 7
          Height = 15
          Top = 56
          Width = 201
          Alignment = taCenter
          AutoSize = False
        end
      end
    end
    object tbGeneral: TTabSheet
      Caption = 'General'
      ClientHeight = 686
      ClientWidth = 589
      Enabled = False
      object LBTeams: TListView
        Left = 4
        Height = 464
        Top = 208
        Width = 584
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
        OnCustomDrawItem = LBTeamsCustomDrawItem
        OnDblClick = LBTeamsDblClick
        OnMouseDown = LBTeamsMouseDown
      end
      object lbTeamlist: TLabel
        Left = 4
        Height = 14
        Top = 192
        Width = 48
        Caption = 'Team List:'
      end
      object GTeamInfo: TGroupBox
        Left = 4
        Height = 128
        Top = 8
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
          ParentFont = False
        end
        object LbGeTinPD: TLabel
          Left = 6
          Height = 14
          Top = 22
          Width = 124
          Caption = 'Teams in Premier Division:'
        end
        object lbGeTinD2: TLabel
          Left = 6
          Height = 14
          Top = 56
          Width = 109
          Caption = 'Teams in Division Two:'
        end
        object lbGeTinD3: TLabel
          Left = 6
          Height = 14
          Top = 72
          Width = 116
          Caption = 'Teams in Division Three:'
        end
        object lbGeTinD1: TLabel
          Left = 6
          Height = 14
          Top = 40
          Width = 108
          Caption = 'Teams in Division One:'
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
          ParentFont = False
        end
        object lbGeTinNL: TLabel
          Left = 6
          Height = 14
          Top = 88
          Width = 105
          Caption = 'Teams non in League:'
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
        end
        object Label39: TLabel
          Left = 62
          Height = 14
          Top = 1
          Width = 58
          Caption = 'Prom - P-off'
        end
        object Label40: TLabel
          Left = 142
          Height = 14
          Top = 1
          Width = 65
          Caption = 'Rele  -   R-off'
        end
        object LD1: TLabel
          Left = 22
          Height = 1
          Top = 22
          Width = 1
        end
        object LD2: TLabel
          Left = 22
          Height = 1
          Top = 40
          Width = 1
        end
        object LD3: TLabel
          Left = 22
          Height = 1
          Top = 56
          Width = 1
        end
        object LD4: TLabel
          Left = 22
          Height = 1
          Top = 72
          Width = 1
        end
        object LP1: TLabel
          Left = 62
          Height = 1
          Top = 22
          Width = 1
        end
        object LP2: TLabel
          Left = 62
          Height = 1
          Top = 40
          Width = 1
        end
        object LP3: TLabel
          Left = 62
          Height = 1
          Top = 56
          Width = 1
        end
        object LP4: TLabel
          Left = 62
          Height = 1
          Top = 72
          Width = 1
        end
        object LX1: TLabel
          Left = 102
          Height = 1
          Top = 22
          Width = 1
        end
        object LX2: TLabel
          Left = 102
          Height = 1
          Top = 40
          Width = 1
        end
        object LX3: TLabel
          Left = 102
          Height = 1
          Top = 56
          Width = 1
        end
        object LX4: TLabel
          Left = 102
          Height = 1
          Top = 72
          Width = 1
        end
        object LR1: TLabel
          Left = 142
          Height = 1
          Top = 22
          Width = 1
        end
        object LR2: TLabel
          Left = 142
          Height = 1
          Top = 40
          Width = 1
        end
        object LR3: TLabel
          Left = 142
          Height = 1
          Top = 56
          Width = 1
        end
        object LR4: TLabel
          Left = 142
          Height = 1
          Top = 72
          Width = 1
        end
        object LV1: TLabel
          Left = 182
          Height = 1
          Top = 22
          Width = 1
        end
        object LV2: TLabel
          Left = 182
          Height = 1
          Top = 40
          Width = 1
        end
        object LV3: TLabel
          Left = 182
          Height = 1
          Top = 56
          Width = 1
        end
        object LV4: TLabel
          Left = 182
          Height = 1
          Top = 72
          Width = 1
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
      object btOrgPriceTeamsGen: TButton
        Left = 4
        Height = 16
        Top = 168
        Width = 190
        Caption = 'Compute Original Price for All Teams'
        OnClick = btOrgPriceTeamsGenClick
        TabOrder = 4
      end
      object btCompAttributteto7Gen: TButton
        Left = 198
        Height = 16
        Top = 168
        Width = 190
        Caption = 'Change Attributtes to 7 for All Teams'
        OnClick = btCompAttributteto7GenClick
        TabOrder = 5
      end
      object btNumberTeamsGen: TButton
        Left = 392
        Height = 16
        Top = 168
        Width = 190
        Caption = 'Sort Players No. by Pos. All Teams'
        OnClick = btNumberTeamsGenClick
        TabOrder = 6
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
          Width = 69
          Caption = 'Team To Edit:'
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
        end
        object lbCoach: TLabel
          Left = 14
          Height = 14
          Top = 176
          Width = 62
          Caption = 'Team Coach:'
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
        end
        object lbHSockCol: TLabel
          Left = 12
          Height = 14
          Top = 184
          Width = 61
          Caption = 'Socks Color:'
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
        end
        object lbAshoCol: TLabel
          Left = 14
          Height = 14
          Top = 134
          Width = 57
          Caption = 'Short Color:'
        end
        object lbAShCol: TLabel
          Left = 14
          Height = 14
          Top = 56
          Width = 59
          Caption = 'Shirt Colors:'
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
        end
        object lbtmAttPtsb7: TLabel
          Left = 13
          Height = 14
          Top = 32
          Width = 60
          Caption = 'lbtmAttPtsb7'
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
          Width = 69
          Caption = 'Team To Edit:'
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
        OnCustomDrawItem = LBSquadCustomDrawItem
        OnDblClick = LBSquadDblClick
        OnDragDrop = LBSquadDragDrop
        OnDragOver = LBSquadDragOver
        OnKeyDown = LBSquadKeyDown
        OnMouseDown = LBSquadMouseDown
      end
      object grTactics: TGroupBox
        Left = 4
        Height = 248
        Top = 440
        Width = 577
        Caption = 'Tactic'
        ClientHeight = 229
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
          Left = 344
          Height = 22
          Top = 16
          Width = 216
          ItemHeight = 14
          OnChange = cbFormChange
          TabOrder = 0
        end
        object lbForm: TLabel
          Left = 343
          Height = 14
          Top = 0
          Width = 50
          Caption = 'Formation:'
        end
        object lbReserve: TLabel
          Left = 343
          Height = 14
          Top = 40
          Width = 41
          Caption = 'Reserve'
        end
        object Reserve1: TLabel
          Left = 343
          Height = 14
          Top = 56
          Width = 47
          Caption = 'Reserve1'
        end
        object Reserve2: TLabel
          Left = 344
          Height = 14
          Top = 72
          Width = 47
          Caption = 'Reserve2'
        end
        object Reserve3: TLabel
          Left = 343
          Height = 14
          Top = 88
          Width = 47
          Caption = 'Reserve3'
        end
        object Reserve4: TLabel
          Left = 343
          Height = 14
          Top = 104
          Width = 47
          Caption = 'Reserve4'
        end
        object Reserve5: TLabel
          Left = 343
          Height = 14
          Top = 120
          Width = 47
          Caption = 'Reserve5'
        end
        object btOrgPriceAll: TButton
          Left = 344
          Height = 16
          Top = 152
          Width = 216
          Caption = 'Compute Original Price for All Players'
          OnClick = btOrgPriceAllClick
          TabOrder = 1
        end
        object btNumber: TButton
          Left = 344
          Height = 16
          Top = 136
          Width = 216
          Caption = 'Sort Player Numbers by Position'
          OnClick = btNumberClick
          TabOrder = 2
        end
        object btCompAttributtebyVal: TButton
          Left = 344
          Height = 16
          Top = 168
          Width = 216
          Caption = 'Compute Attributtes for All Players'
          OnClick = btCompAttributtebyValClick
          TabOrder = 3
        end
        object btCompAttributtebyVal1: TButton
          Left = 344
          Height = 16
          Top = 184
          Width = 216
          Caption = 'Change Attributtes to 7 for All Players'
          OnClick = btCompAttributtebyVal1Click
          TabOrder = 4
        end
        object btRandTeamSum: TButton
          Left = 343
          Height = 16
          Top = 208
          Width = 216
          Caption = 'Generate Random Team'
          OnClick = btRandTeamSumClick
          TabOrder = 5
        end
      end
      object lbSquadInf: TLabel
        Left = 4
        Height = 14
        Top = 87
        Width = 34
        Caption = 'Squad:'
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
          Width = 73
          Caption = 'Player To Edit:'
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
          ArrowKeys = False
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
          end
          object lbAttCode: TLabel
            Left = 246
            Height = 15
            Top = 8
            Width = 22
            Caption = 'FHS'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbWAM: TLabel
            Left = 14
            Height = 14
            Top = 32
            Width = 56
            Caption = 'Predictions:'
          end
          object lbWAMcalc: TLabel
            Left = 246
            Height = 14
            Top = 32
            Width = 54
            Caption = 'lbWAMcalc'
          end
          object Label2: TLabel
            Left = 14
            Height = 14
            Top = 56
            Width = 114
            Caption = 'Player Attributes Points:'
          end
          object Label3: TLabel
            Left = 14
            Height = 14
            Top = 80
            Width = 138
            Caption = 'Player Attributes Points by 7:'
          end
          object lbPAP: TLabel
            Left = 246
            Height = 14
            Top = 56
            Width = 27
            Caption = 'lbPAP'
          end
          object lbPAPb7: TLabel
            Left = 246
            Height = 14
            Top = 80
            Width = 39
            Caption = 'lbPAPb7'
          end
        end
        object btCompOrg: TButton
          Left = 326
          Height = 20
          Top = 352
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
          OnKeyDown = btGenPosValKeyDown
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
      object MAddCSVTM: TMenuItem
        Caption = 'Add Team TM Editor CSV'
        OnClick = MAddCSVTMClick
      end
      object MAddRAWTeam: TMenuItem
        Caption = 'Add Raw Team'
        OnClick = MAddRAWTeamClick
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
      object MReplaceCSV: TMenuItem
        Caption = 'Replace From CSV'
        OnClick = MReplaceCSVClick
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
      object MenuItem15: TMenuItem
        Caption = '-'
      end
      object MCOPAll: TMenuItem
        Caption = 'Compute Original Price for loaded Teams'
        Enabled = False
        OnClick = MCOPAllClick
      end
      object MenuItem7: TMenuItem
        Caption = '-'
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
          OnClick = MXMLteamClick
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
      object MFindGenSWSDupl: TMenuItem
        Caption = 'Find SWOS General Duplicates'
        Enabled = False
        OnClick = MFindGenSWSDuplClick
      end
      object MFindPlayerDup: TMenuItem
        Caption = 'Find Player Duplicates'
        Enabled = False
        OnClick = MFindPlayerDupClick
      end
      object MDirtyRep: TMenuItem
        Caption = 'Report "Dirty" Teams'
        Enabled = False
        OnClick = MDirtyRepClick
      end
      object MCheckTC96: TMenuItem
        Caption = 'Report Comparing to 96/97'
        Enabled = False
        OnClick = MCheckTC96Click
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
      4C7A030000001000000010000000820100000000000078DACD96B16AC3301086
      45168D5E44A66CE9DC073064EFDA57F058F2067D88401E207B7663BA74CC52F2
      4886F61C9D2CE9A4B3CF722915FC10C7FA2E67E9FFAD28958C6F46D2C1F15B90
      0155200DDA0839AA67ACA50BF9065483765823BE7FECF34AEBD4D84729FF8635
      22AEEFADDC75DBB60FA91794E7CFF82CA57C073AE1DA19B66F27CFDF415FA01B
      E8FA4B7C35DEA7EBE5BE7F3A5A59FE46FAD70BF94FD005F740A117072FECC7F9
      79CEE9037FFB9578D0CCF0E173BF830E84AFD0DF0DD6EF70FE3DF3DC0DCE0D87
      464FD6418D2B321D7E3E0519D826E9A5FBE5D75336787E2AFB2947D7CFFB2797
      FD257C98FD0DDB2F15D747396FFB20DC6C7EBD9FEC1E96F3CE07E6E143797EA9
      87D7F2D6F3F2FCD20C58CFCBF930FB8728FB439EE7F31F667F1F657FA8C7F3B9
      EC9B95D9AF56665FABBF3BFFA7F32F3FBF97F69D3BB777411FF17DBA7FE9B949
      FB28E55D1F1137E617AFC7FC7A1FD1FF31A57C9C7FAEEF791FAFE5ADEFD3F7A3
      55DA773EFF727E3AFF6E7ECAC9F2CFF3FF32FF3FD8595BA4
    }
  end
  object ilStars: TBGRAImageList
    DrawingStyle = dsTransparent
    Height = 23
    Width = 96
    Left = 464
    Bitmap = {
      4C7A0A0000006000000017000000911900000000000078DAED9D09745375BEC7
      FF37499BA669DA340DDDD3344B5B0A584028F058957DDF95AD8220CB2082A3A8
      4FC5515139CF513CA0CE9C51679EB8E1F88E888E671C3887510FF314C5E3F61C
      98C703770451144465F79CEFFBFDFE49DA8426A569D292E57FCFF99DC2CDCDA5
      7CFFF7FED64F6E84509BDAD4A636B5A92DD2A6A1C9D4D691BA678A7CE4080F59
      158CC20E4DE8D41A7494FA420F8BE88C72311D0E311356D11D3A91A1F46FA76B
      9DAF6DD63C603A91499AF7804B2C805B2C4681E807BD30851CC3A6FC52EC5B86
      C8A56BBD5A5EE301CB173D5122C648ED3D62294AC544DA7771C831B9A256FA28
      A5606C5BB670A04C4C96D77AB0B1F65EB14C9A472CA17D5785BCEE1097516CF0
      AA7B2066FD9DE4E7A7F9AFF55FF935BF26B26957C3ABFB159CBAD9C8D5D540A7
      237FA523FFA5A975689BFFB1224F74834DF4259F3396D6615164ED754BE1CD9E
      096F3EF926DBA528B155C3662B405E5E1E3232547C6E5BAEA393B98D4E18C9A7
      778553CC8DACBF9E7C52C108785D5DE075D7C0E3F6C2ED76A3BCBC1CD9D9D94A
      FF18F3208BA821FDAFF0FB99A53EBDF58B7CD7BDD49FFE6C1F06AFA71A5EAF4F
      7B97CB85B2B232A57F3CF5D728069866C36B1BE5BBDED9E7B0DF0FD29F752F2A
      2A82D56A85C56251FE27AEFA93D67913E1ADECE6F335B63132E606EBEF743A91
      9B9B2BE3AE8ABDF1D1DF2CDC3217756A73E0B20E27ED6BA59FE758CBF98E533F
      136EFBA046FDF9BA57BAC5B716E335C8D56A5064AD86DBE5953196F31CCE35F3
      F43528B557C1E3F12AFDDBB31FA1E9A45F671FCF3196734CCEF3F57A03ECF64E
      A4BF47E9DF9E2B40FE9CB52D2D2D95B90DE7F75C63E9F57AB92E9C6F969494C0
      6C362BFDDBCB17513EC339255B666666639CE53FB3EEBCDF603028FDD5A636B5
      C5B927A1973DE6401FD426FAC899805246E99F6EFA7BB42528CE1C889C6CAB8C
      B9AACFD0B1FA73DFC19537028E3297CC47392F55FD86F8D459914C138610FD65
      FFC75D4BF5989BF2FF7C599F357F9FDAA2D9B8D716C978B65B2446F86690DC87
      CEB90CDEC24BE1EE341045D93D91AB750E39DE2C2A6110396A0DA2D8B8CFD992
      F1BC3730FFF5EA97C09B417FCF5800976E5EB3634BC4789844B9D23F8A8DB906
      9F5D7DFE996FC459F032D9ABAED066204773A95E74149B5D0C025B8918E7BFD6
      A3D49EE302CF65AC1350691D8A42AB5BF686727272545FA2159B5E64838DFD77
      85981DBDFE065AB34EC3E0757583C7552B7BD5DC2FE5BE5C565696D2BF955B5B
      F913AF711EBCC583E0F556C95930F7A4B957CD39AAD2BFF55B5BF913398774F4
      94DA0766C1369B4DCE2495FF89A6D66A3B7FE2F5F8AEFD8A8A0AE9F77946C0A6
      548DAED6D5892C8A0566BA0FEA5029E69D47FF51F0565E24D7C0EDAA52FC498C
      5BA6B051AD7BB1CC8598B3F5719F917CFF521F97629D089775849C11733DACF8
      93B66F5CBB3AC4E541B540EB727EA7D620E7F4DC8B50397FACFACF6CCAE90DBE
      3A37BC5DE53B868EADD4E6C2AAEF4AD77DA68CB7CAEFC741FFAC3994D70C87B7
      687078EB34D4CFC22D835B3F1FE5797D28EF29464141018C46A3D23F26FDC9AF
      58A6C2EBECEECFE9C398ABABAC77650DC0F703AF09ED77381C8A8568E36612A5
      2816A3690D66A0D232021E67D7C69C9EF34AD6B6D14ADD705886C0A15D8E8A8C
      297015F555FAC7A10FC16BC0F781DDE282CBE991B52CF71138AF615D1B2D9BFE
      9E5144C73A919B4179679147AE95D23F3E1BEBCD5C1BEB6FB7DB256F15B16EA6
      7C936B5EA5BFD23F156B62C53F28FD95FE8A3FB9D0FA2BFEA4DD54EE00FE84F7
      F3B17AFF4FB535E63A1DC29F3013318E6C0E597F32C5A804B68EE14F86D2BE97
      C9F690DD47E650FAFBB778F2270E6D26DD0355A4ADF11C9B42F601D969B2A7C9
      3A8739263D6795F1E44F1C966930D3FD21C4F273EC11B22FC9CE92BD4D76E739
      AF2F21EB4B967EB96D3CF91347D90498B35F200D0F9C63DF919D22FB85EC67B2
      43E7BCCE7E692559FA7E8E2F1EFC89C3310666F35F48C32364C7FCFEE69788A6
      6927A1D31D23DB4F760B595EDA3E43251EFC89C3514FFAB3FFB99DEC4F649FB6
      A0FD696465BD4779EC63B0D97E4B3685AC44B273CC0DA5DB1AC4833F71382A49
      FF4EA45B2ED928B2FF6E41FF13C8CB7B064EE730B8DDDDC96AC97C9F27E6CFB9
      A69FFEF1E64F06D1CFD71BB5D6E9BE835E7F887E1E957E89F759AD1BE87DFD1A
      B9B9C0AC27F03C8974D23FFEFC4993FE9999FF4BAF3F02BBFD2E3A6633ADC3E1
      10FD597BEE69E4E7E7CB6B3F1D67C8F1E74F9AF4379B5F25DF348574EE86C2C2
      7FA735FA3C447FE6457976CF738674ED29C59F3FE94D3F9F25DB4BFA3F4DFA8F
      243F538DA2A2C574EC3F48E7DDA4FFFDA47FBDFFD912B6B46657E2CF9F14D2CF
      91640DA4FF38D2BF4EE6A84545FD48FFE9A4FF6CD27F38E95FABF417EDC19F34
      F53CCD660BBD5621E32CAF53468691F437C898D1F46C95F4D6BF3DF91393C984
      E2E262F93AEBCC7E2AD2B355D255FFF6E44F38AEF21AF06BEC9F023136DCB355
      544754F10F4A7FB5056AE2F8F00FE3E93DEFFBFB714F90B9D51A29FD934AFFD8
      F89326FD0D8667E8FD5DA59F5231B7F5FAC7C69F04F43F43BA3F4F39D500F9EC
      3EEE35B7145BD244E538F02701B624924D6CD49FFB6FDC73F678AA28B61791FE
      99618E4F9F7B2256FEC42CEA9021C6F8D9928608B6D63F8B398BACAC7748F735
      282CBC9ED66229D55C73CF3976BA7F3E9F1EF745ACFC499958416BB089B4FA3F
      D96B0B6F5F919D90BD509E371A0CFB297E7C46D7FE27618EDD4136376D66F1B1
      F2274E7107DD076F902F3A2EE7B9EC635A9AF9B6348FE49EB4A6716F7A19597A
      CC2063E54F5CBA95E48BD6523C789CFCC94BB2B71FBDF627C92FBD2FE79156EB
      436413C9EC720EC63952AAF77D62E34F16513CA0B573FD1BCACA1A28B7DC1EB5
      FEEC93F2F31F9371D9E5EA43D655C678AEA7F97906E9E0872E247F62301C4041
      C17D720E1FFC0C9574D2FF42F227AC7D59D96CD2BD4BE3B36B7896C3F541BACC
      822F347FC2DAF33DC4F3069EC3735D964E2C567CF81327F9FF52D2ABC85F73BD
      D9A2FEB9B97F4645C5587A6F5FB28BA4CF57FC492CFC490DE53F4B49B77564FF
      E5676E23F9FFD3E45B76D13DF01CBDF70F6433C98A157F12137F5247BA712D76
      9CAC35B5C069198335ED10D96D64798A3F89893FE9453EFB65BF7F394E7F3F28
      EBDCF0F639F9F8EFFC39D211FAF36ADA5720FBAAE938078E0F7F7229F98E2D7E
      E66D1FC5D1DFD1FE95618D392CEEC5318FA8694729CFBC8FF679D1A95327D9DF
      4EB7FB203EFCC978CA7FB649FD4DA69D148F6749E62A9C310BC73CA28F09FD01
      36DB7ACA837AC838CE7967BAE91F1FFE6418E9FF47D96B36993692FE131ABF9F
      F0DC739497730F7B29E9FF1AE9FF06E97F0B1D5797B6FAC7873FE1B9D625E079
      8BC93494F4AF93FB03B3969073982DE4A3386E8F24FDC792FECC8156A7ADFE21
      338138F00FCCFB3057C5FB790D5BCA2939DE329715F81E4FA5BFD23F516A62C5
      3F28FD95FE8A3FB9D0FA2BFEA4DD544E12FE84F6F1BFA7E97D3F538451491AFE
      C4980F5146B5450D1D533112C2549812FA270D7F924F6B72E9231057D031A39E
      8528EC9D12FA27227F22742B20F4B964C62663BDC7BF0C710D1D3F6D3B44F9D0
      D0D7D97486A4F34B89C69FE4153C06A3FB6E883A5A83EECB9BACFF7F40CCFE1F
      9FFE7C0F0C5E17FA7AF76BC82F8D80C8CC4B2AFD138D3FA9A8198DDC918F41BB
      92D671C181265BF80DC4D2E33EFDAF265FB6F070E8EBF3F7D39A3C08617126A5
      5F4A14FEC4D5A50FAC63FE006DE12188253F90D6277D9A47306DD929E896FE08
      DD9223D00D7B143AAB3B29E7F689C29FB8AABBC15A37035AFD2A8841E4636652
      DEBAEC6C44FD33E67F8CBC49CFC0366A1D6CBD17C056E291FC04D788C934474B
      1CFE846A8B82626846F2E3F63ACA753692FE6722EA9F3DF37594D75F0E77E71E
      70577785DBE39B59049E67904CB56EC2F127796E88114F90FEA77D7E867C8C7E
      D121FAF93D34BF5F325FBE0D8E9EE3439EA15259599974FA27247F12A4BF61E1
      01E44E7A16F661AB9137610332167CDA4C7FEE7F07B839EE7F27530C4848FE24
      48FFCC79BB513C807EB7EA2E28EBDB80AC39EF34D39FE710819E5EB2C5DF84E4
      4F2C0E8801F74134EC8171EA5694D4CF913A975D3C19A6499B651D601EFF341C
      DD4736EA9FACCFA54E48FE242307A2A43F44CD1C18ABA7A2A4AADEA77F554F98
      AA27C95E90B97A1C1C557529A47F82F127FE9EA7D168424949A94FFFF2723ABF
      59EE37E758E0A8A8487AFD139D3F615D7916CDEF2D2C2C6C8CD1E19EAD928CFA
      273A7FC231819F4BC9EFE59F81DC32D2B355927A26A0F807A5BF9A0B2716FFC0
      BD88F12FF9FA0E535F87281D04A5BFD2BFA3F4BFE0FC4990FEFACBFE812CF788
      C6589CAA9F174828FE24487FE3AC1D28EC314DC61B8E4FC9FD5D4C09C29F68E7
      B14E3D49FFBF48FD4D73A8B6EB43B55D55354A4ACB60CC3285794F72DC1309C1
      9FE8E8183B5955838F2F0967BD6F8598F1AED43F73FE3EE48FF91D8A06AF84B5
      EF353074BD32F4D8EA59BE79BD212BE1D72021F8930CB2EE6433F7FA66EBE18C
      E7C14B7EF4CD1CAF3E0EC3C283C85840E7B8F2136873F7851E3B7B1744FD6D10
      267BC2EB9F10FC4926695A7F1ADAC213BEB9CAB2D32DCE7C23DAB233F2FDDA92
      A3D006AD85662E4AF85E7442F0278693C8AA791F79639E41DEE4E7609CB7AB0D
      6B7096FCD25EE44ED904EBB83FC2DA6B3EAC850E39CF49E4EFD34818FEA4F031
      386B87A1A2E758E44EFE335DC727A2BEF673A6FF158EDE53E1EADA17AE9A3AB8
      FCDFA7C1F3F844CF5153813FE1F9A4F3A22121CF50E1597032E89FF4FCC9E875
      2819B014EEDA5E527BAE2FB83660ED9361169C0AFC89A7A69BAC09587F9EA305
      6699C9D0CB4B18FEC459895C7B99CC5D44511F88D1CF9D47FFED721EEFEADA8F
      7C7E0FF2F95EC59FC4C29FD8CB61EC321362E0FD10C31E8798B34BE63611FDCF
      559FC332ED2558C73F4EB5D832588B3D8A3F89853FE1EB7E20D5CB8B29862F3D
      71FE3C3490F32FFD09DAF0FF8496E756FC492CFC496E3974973C285967CE6DF4
      8BBF95756E24631E2E50B3E9463E054341B5F4FBC9F6B9B284E14F9CDD903DEA
      51D96360EDF3266D44D1E01B64AF279C59C7FF098685FBE57D9035E139D8DD7D
      E47C9EFBB3C9D4974E18FE84E2A875C206597FF1F55D34E40678AB3BCBBC269C
      95F45F4CF5F26EA9BF65EA0B70D65DDAAAB969A26D09C39FD4F68675E81A6897
      EF44C6942D28EABBA031A7E45A36E4F7E0FE7FF7A9C898F082EC8D5A46AC87B3
      EB80A4D43F61F8136F6758DD03A0558E43866B148A3CBDE439587BCE2943CF61
      4656BE13BA72FA372BC7C3E21A04A7A73629F50F99092408FF10ED77CB44F37B
      2BFD95FED1CC7F15FFA0F457FC89E24F2E94FE8A3F693795D38B3FE17B85D79C
      2D017A4469C59F90AF12BD69FF2C7A7DF26408CAB72EF41AA4157F42BE4ADC46
      FB77D1EBAFBEEA5B830B1C3B52963F19B20EC2EA80E0BA2360142FC4430F411C
      3F0EB18FD6EC4ABA6F2897083986634907AE494AF227131FA718F15B5A8BEB21
      962F6FB25BC987BDF61AC4A95310DF7C03F1E493102B56841E336D1AE5B6A51D
      A67F2AF227953D06A160D5DDD0EFDA0D71E040937DFD35C48FE4C3CE9E85384D
      EBFBFDF7A1AFB36DDE0CD1B76F87FBA454E24F3C5DBAC0BE6A15F41F7F0C71F4
      A8CFDFB0E6BFFC12DECE90DFFAF967E87EF801BA2D5BA01B30A0C3E7F629C59F
      D4D4C03E6E1CF437DD04B1668D2FD6F21A44D05F7FE8102C2FBD04DBFAF5B05D
      7F3D6C3D7AC87E14D7381DD5434A35FEC44E3E5C4FF59D282BF3AD01DF0711F4
      CFFCD7BF504CBEDF4DBABB2FBA08EEAA2AD90BE4CFB576D4F7BFA52C7F924BD7
      C2ED743F1E3922FD8CEED831E829F6EA0F1F86E6BF278C948F962C5A14C2CDF1
      FF27F03C09C59FC4C09F04E9CFDA9BFFF63714D0FD904F79A8F1830F645C08D6
      9FFBD7CC6E05E6451DE57F52963F09D29FAF7B3B69CF7EA662E448585E7C51DE
      13C1FA97CB671B983A9C614959FE84BFBF90F3FAF7DF877EE74ED857AE84A7B6
      16CE81036179E411883D7B60DCBA152573FCCF56A178C1FA2BFE244EFC09D7B3
      75745FCE98013D999D74F75457C3D9AD1B2CA347937F9B03E3D4A928A9AF4F10
      FD53903FF1F73CF5144BEDB43692A5A0186DC9CB93FB8DA4774969E905D53F1D
      F813FE3BC755F6F13C930ECC93233D5B45F127F1E54F389E723EC9EFE3195EE0
      5935919EADA2F807C59F28FD15FF1037FE81D652AC5BE7EB05EDDD0BD1D0E09B
      432AFD95FEE9C09F04E9AF7DFC318C575D0533D5C7EC2B13D157A51C7F12A4BF
      E1D34F615BB1020E8A17DCE7BC10397FCAF1273A7D135B12CE78AEB87EBDD43F
      E333AAED6EA0DAAE736738A816E3FBA0D9F17C5FB5730F2865F893CE744C7FB2
      CB1A7C7E3D9C2D5B06B1650BC4C993D07FFB2DF2366E946B5070EDB5D217353B
      FE12AA2BF2F3DB55FF94E14FE6D231F793EDDCEB8BADE1EC934F7C33DFB367A1
      9D3A25D780EF03F6453A9E559E7B3CF7E73A776E57FD53863F594EF6F81968FB
      4F423B41E7E1F97A4B33DF48C66B73D27F8E4D9BA0D5D5B56B2F3A65F893E567
      9179C75EE43EB209D6A79E82E9ADB7A0FDF453D4FA1B0E1E44CE2BAFC0BA6103
      ACE49BAC5DBAC83CA1BDBE4F23A5F893597F8563C854540E1E8C82071E90FE25
      5AFDB3DE7B0F254B96C0D5AF1F5C3D7BC255E59BADF24CAC3D9F6DACF8131F7F
      92FDFAEB28BFECB29059301BF745DB93B356FC898F3F29A4F7F0FD133C0BE6DE
      14D77AEDF93903C59F34F1275E5A3FFEFF709D19A8AFDB7B169C52FC097FFF11
      D5C67AAA6B05E928EEBBAF65FDF7EC41D1CA953E9F7FF1C5749E1AC59FC4C29F
      D8ED308D1A05EDEEBB217EFF7B881D3B20289F8CE87F0E1F8679DB365FCEF39B
      DFC04A6BA0F89318F8137EDEDED55743506D25FD3ED702E7CBF9A91E93393FAD
      833670A0E24F62E14F7272A0FFF5AF7D3C33E536FA234790F1C517B2D60D6786
      AFBE82CE5F2B68DBB7C370C9258D0C4B47AD414AF1271515B0DC7A2B745F7F2D
      F3CA9CAD5B5148F928FBF87056B0762D8CFFFCA72F16BCF926F2274E94BE9F7D
      50477D9F494AF1279CFFAF5E2DF34ACEE96D0F3E0837F9746F757558734C9800
      F3DFFF2EF537BDFD36CA66CE6CD5DC54F12711F893DA5AD8299FD4BF46E77E83
      CE7D0B9DBBAE4E9E83D9DC73CF514CF9BEE9D147252367DA48BFF784091DAE7F
      4AF1275555B0D7D7433F7A347463E9DC9457BAE93A0FD4B139141F82CF61225F
      A3A763C478FABD87D2EF5D57D7E1FAA72AFF10ED77CB44F37B2BFD53537FC53F
      28FE44E9AFF813C59F28FE44F127CDAF31BEEEF8BA09C477C59F741C7FC29A77
      A6359B3E7D3A66CC98813AAA1562998B29FE243AFE8463D6DCB973B163C70EBC
      4FF5F272AAB3B99E53FC49FCF913FDE6CDC8ECD54BD60001CB253F75DD75D7E1
      E0C1833872E408EEBAEB2E39A30C3E86D7A8B5714DF12791F9936E142B1A6EBA
      495EE30163ED9F7FFE791C3D7A143FFFFC335EA1636FBCF1C69063F8FE601FD5
      9AFC44F12791F993866BAEC1F637DFC48103071A8DAF7BD6FECC9933384BF7CA
      B163C7E4BEE063D837717C8826362BFEA4397F327FFE7CECDCB953FA999FE85E
      62CD7FA1E3C319AFC571FA777EA0737CF8E18798356B969C1DB47676AFF893E6
      FCC9902143A43FB9E38E3BB069D3261C3E7C38A2FE3FFEF8235EA7B57BF8E187
      E5F19750EEC4FD5AFEFEB1D6E4478A3F69CE9F707DC7BD3BAE13172D5A848FE9
      7E8AA4FF37DF7C837BEFBD177DFAF49139690D9D837B7E5C6772BF40F1276DE7
      4F389769A07A602FE5A4EC67D8177D4BB18535E7EB9EF71DA27B68F5EAD5E8D2
      A54BE3CCC9A74959ABF457FC4964FE2458FF535437BC45B9D5DAB56BE5F5CE3E
      87FD7EB0FE81B5E373709FA635FE47F12791F99360FD4FD0314F3EF924060D1A
      247D0DFB7B8EB9C1FAF30C82EB84681816C59F44E64F3887993C79325EA538BE
      7BF76EDC7FFFFDA8AFAF977E9E632DE73B9C27AD241F56CBCF5621FDF9BA57FC
      497CF8135E03F6E7BC06B367CFC6F0E1C3A5CE1C6339CFE15C937B4103E9BEA9
      E667ABC4A4BFE24FC2F127819E27AF077FA724FB785E9340FF9BE37461E0D92A
      6DD05FF127ADE34F781D585B9E81706EC3F93DFBA748CF5651FC49FCF913BEDE
      39A7640BCCF0223D5B45F10F8A3F51FA2BFE215EFC03AF07F784B8CFC97DB9DB
      6FBF5DE6FA4AFFD4D65FF127E1F5BFE79E7BA49F8A5E13C59FB4853F09D69FE7
      300F3CF080EC3944AF89E24FC2F1271AC76C7FCF2D9CF1757EEDB5D74AFDB9EF
      F320D57617536DC7319FE33CE79DC1C79F6FFEA2F89350FEA4906C24594304E3
      9918F7DFBEFFFE7B39FFDDBA752B56AD5A25E7C28B172FC615575C1172FCB871
      E3E4BDAEF893D6F127BDC99E25DB1BC1F6EDDB27FBFEA74F9F96F3488E015F7C
      F1053EA3F3F07CE6DCE35F7EF9650CA59A4EF127ADB301F49E6D747F709F997B
      FD3C5B8934F36A6916CCEFE573705F94EF8148BD68C59F845AF5C183B8E59557
      B061C3066CDBB6ADC5996F24E3B8BC7DFB763CF1C41358B3660D060C1820730D
      36C59FB46C96F7DE43D7254BD0AF5F3FD9CFDFB3674FD4FA7FF9E597B8F3CE3B
      D1BF7F7FF4EEDD5BB2405C7BB329FEA4FDF9139ED1ACA0DC966701E73E4745F1
      27EDCF9FF01C927D7E95FFD941DCC3E2DC944DF1271DC39FB0CFE173F0DC83FB
      DD5C07B454A72BFEA4397FC2DA716F816D19D50E9F50FE1A497FE651B8161E4C
      F70ECF86793EA9F893D8F813BE966FBEF966AC27BFB485EA36AEB922E9CFF181
      B994A728F762368567C43CA754FC49DBF993B163C7E2EDB7DF9671F57CB500BF
      C63519E7FC1C7F794E1F98DD2BFEA46DFCC9A44993E4672C585FE69CF7EFDF2F
      EBDC70C63927E7FDBC0E5C23CF9B374FF666030CAEE24FA2E74FB87FF3D1471F
      494DDF79E71D594B714D10CE38DFE79A8BEF138E131C2F386EF0CCBA353334C5
      9F34E74F38E7D9B56B97CCFB376FDE8C61C386C99C3E9C71ADC5F52EFB1FBE1F
      784D787F6BE6A68A3F09CF9F3053F5E28B2FE2DD77DF953198FB089134B988F2
      56FE2C12D76B1CAB172C581095FE8A3F69CE9FF4A07A60C48811184FFB99F7E4
      9C3292269CEBF0F11CB34751EED5AB57AF5673038A7F383FFF100F4D94FE89A7
      FFFF034C0028C9
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
    object MenuItem16: TMenuItem
      Caption = '-'
    end
    object MGChDiv: TMenuItem
      Caption = 'Change Division'
      object MGPrem: TMenuItem
        Caption = 'Premier'
        OnClick = MGPremClick
      end
      object MGone: TMenuItem
        Caption = 'Division One'
        OnClick = MGoneClick
      end
      object MGTwo: TMenuItem
        Caption = 'Division Two'
        OnClick = MGTwoClick
      end
      object MGThree: TMenuItem
        Caption = 'Division Three'
        OnClick = MGThreeClick
      end
      object MGNonLge: TMenuItem
        Caption = 'Non-League'
        OnClick = MGNonLgeClick
      end
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
  object PM_RandomTeam: TPopupMenu
    Left = 248
    Top = 8
    object MPVWeak: TMenuItem
      Caption = 'Very Weak'
      OnClick = MPVWeakClick
    end
    object MPWeak: TMenuItem
      Caption = 'Weak'
      OnClick = MPWeakClick
    end
    object MPMed: TMenuItem
      Caption = 'Medium'
      OnClick = MPMedClick
    end
    object MPGood: TMenuItem
      Caption = 'Good'
      OnClick = MPGoodClick
    end
    object MPVgood: TMenuItem
      Caption = 'Very Good'
      OnClick = MPVgoodClick
    end
    object MPStar: TMenuItem
      Caption = 'Star'
      OnClick = MPStarClick
    end
  end
end
