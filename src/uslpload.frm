object SplashLoad: TSplashLoad
  Left = 612
  Height = 96
  Top = 335
  Width = 294
  BorderIcons = []
  Caption = 'SWSEDT'
  ClientHeight = 96
  ClientWidth = 294
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  LCLVersion = '6.0'
  object lbLoading: TLabel
    Left = 0
    Height = 15
    Top = 16
    Width = 296
    Alignment = taCenter
    AutoSize = False
    Caption = 'Loading...'
    ParentColor = False
  end
  object lbLoadData: TLabel
    Left = 0
    Height = 15
    Top = 56
    Width = 290
    Alignment = taCenter
    AutoSize = False
    Caption = 'lbLoadData'
    ParentColor = False
  end
  object pbload: TProgressBar
    Left = 8
    Height = 12
    Top = 72
    Width = 276
    TabOrder = 0
  end
end
