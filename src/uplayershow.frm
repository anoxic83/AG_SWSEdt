object PlayerShowFrm: TPlayerShowFrm
  Left = 373
  Height = 539
  Top = 156
  Width = 592
  BorderStyle = bsSingle
  Caption = 'PlayerList'
  ClientHeight = 539
  ClientWidth = 592
  OnShow = FormShow
  LCLVersion = '7.6'
  object lvPlayers: TListView
    Left = 8
    Height = 488
    Top = 8
    Width = 576
    Columns = <>
    SortType = stText
    TabOrder = 0
    ViewStyle = vsReport
    OnColumnClick = lvPlayersColumnClick
    OnCompare = lvPlayersCompare
  end
  object btnSPClose: TButton
    Left = 509
    Height = 25
    Top = 504
    Width = 75
    Caption = 'Close'
    OnClick = btnSPCloseClick
    TabOrder = 1
  end
end
