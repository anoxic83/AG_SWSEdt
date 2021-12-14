object SplashLoad: TSplashLoad
  Left = 616
  Height = 96
  Top = 327
  Width = 294
  BorderIcons = []
  Caption = 'SWSEDT'
  ClientHeight = 96
  ClientWidth = 294
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  LCLVersion = '7.6'
  object lbLoading: TLabel
    Left = 0
    Height = 15
    Top = 16
    Width = 296
    Alignment = taCenter
    AutoSize = False
    Caption = 'Loading...'
  end
  object lbLoadData: TLabel
    Left = 0
    Height = 15
    Top = 56
    Width = 290
    Alignment = taCenter
    AutoSize = False
    Caption = 'lbLoadData'
  end
  object pbload: TProgressBar
    Left = 8
    Height = 12
    Top = 72
    Width = 276
    TabOrder = 0
  end
end
