object PoolForm: TPoolForm
  Left = 489
  Height = 578
  Top = 362
  Width = 617
  BorderStyle = bsDialog
  Caption = 'PoolPlyr.dat'
  ClientHeight = 578
  ClientWidth = 617
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Quality = fqCleartype
  OnShow = FormShow
  LCLVersion = '1.3'
  object LVpool: TListView
    Left = 0
    Height = 504
    Top = 0
    Width = 617
    Align = alTop
    Columns = <>
    ReadOnly = True
    RowSelect = True
    SortType = stBoth
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = LVpoolClick
    OnColumnClick = LVpoolColumnClick
    OnCompare = LVpoolCompare
    OnDblClick = LVpoolDblClick
    OnMouseDown = LVpoolMouseDown
  end
  object BtLoadPool: TButton
    Left = 8
    Height = 22
    Top = 512
    Width = 152
    Caption = 'Load data from SWOS'
    OnClick = BtLoadPoolClick
    TabOrder = 1
  end
  object BtSavepool: TButton
    Left = 8
    Height = 22
    Top = 544
    Width = 152
    Caption = 'Save data to SWOS'
    OnClick = BtSavepoolClick
    TabOrder = 2
  end
  object Breplace: TButton
    Left = 192
    Height = 22
    Top = 512
    Width = 232
    Caption = 'Replace Selected Player'
    OnClick = BreplaceClick
    TabOrder = 3
  end
  object BgenRand: TButton
    Left = 448
    Height = 22
    Top = 512
    Width = 152
    Caption = 'Generate Randomize List'
    OnClick = BgenRandClick
    TabOrder = 4
  end
  object PBrl: TProgressBar
    Left = 449
    Height = 10
    Top = 536
    Width = 151
    TabOrder = 5
  end
  object MPoolEdt: TPopupMenu
    left = 64
    top = 80
    object MnatEdt: TMenuItem
      Caption = 'Edit Nation Number'
      OnClick = MnatEdtClick
    end
    object MPlaEdt: TMenuItem
      Caption = 'Edit Player Number'
      OnClick = MPlaEdtClick
    end
  end
end
