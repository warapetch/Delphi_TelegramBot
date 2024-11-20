object FrmMainWrpTelegramBot: TFrmMainWrpTelegramBot
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Telegram Bot'
  ClientHeight = 585
  ClientWidth = 932
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 21
  object Label1: TLabel
    Left = 24
    Top = 282
    Width = 70
    Height = 21
    Caption = 'To Chat ID'
  end
  object Label2: TLabel
    Left = 33
    Top = 317
    Width = 61
    Height = 21
    Caption = 'To Name'
  end
  object Label3: TLabel
    Left = 27
    Top = 10
    Width = 67
    Height = 21
    Caption = 'Bot Token'
  end
  object Label5: TLabel
    Left = 20
    Top = 115
    Width = 74
    Height = 21
    Caption = 'UserName'
  end
  object Label6: TLabel
    Left = 22
    Top = 80
    Width = 72
    Height = 21
    Caption = 'FirstName'
  end
  object Label7: TLabel
    Left = 52
    Top = 45
    Width = 42
    Height = 21
    Caption = 'Bot ID'
  end
  object Label4: TLabel
    Left = 27
    Top = 251
    Width = 221
    Height = 21
    Caption = '** '#3605#3657#3629#3591#3619#3632#3610#3640' Chat ID '#3623#3656#3634#3592#3632#3605#3636#3604#3605#3656#3629#3585#3633#3610#3651#3588#3619
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 349
    Top = 80
    Width = 79
    Height = 21
    Caption = 'Alias Name'
  end
  object Label9: TLabel
    Left = 349
    Top = 116
    Width = 96
    Height = 21
    Caption = 'Unique Name'
  end
  object Label10: TLabel
    Left = 27
    Top = 186
    Width = 101
    Height = 21
    Caption = 'URL WebHook'
  end
  object edToken: TEdit
    Left = 103
    Top = 7
    Width = 389
    Height = 29
    PasswordChar = 'x'
    TabOrder = 0
  end
  object btnGetMe: TBitBtn
    Left = 254
    Top = 38
    Width = 146
    Height = 33
    Caption = 'GetMe ('#3586#3657#3629#3617#3641#3621#3610#3629#3607')'
    TabOrder = 1
    OnClick = btnGetMeClick
  end
  object btnGetUpdates: TBitBtn
    Left = 103
    Top = 147
    Width = 297
    Height = 33
    Caption = 'GetUpdates ('#3649#3594#3607#3617#3637#3585#3634#3619#3629#3633#3614#3648#3604#3605' ?)'
    TabOrder = 2
    OnClick = btnGetUpdatesClick
  end
  object edChatID: TEdit
    Left = 100
    Top = 278
    Width = 243
    Height = 29
    TabOrder = 3
    Text = '-1002474013280'
  end
  object edChatTitle: TEdit
    Left = 103
    Top = 313
    Width = 240
    Height = 29
    TabOrder = 4
    Text = #3585#3621#3640#3656#3617' TestBOT'
  end
  object edBotUserName: TEdit
    Left = 103
    Top = 112
    Width = 240
    Height = 29
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 5
  end
  object edBotFirstName: TEdit
    Left = 103
    Top = 77
    Width = 240
    Height = 29
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 6
  end
  object edBotID: TEdit
    Left = 103
    Top = 42
    Width = 145
    Height = 29
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 7
  end
  object RzPageControl1: TPageControl
    Left = 8
    Top = 359
    Width = 487
    Height = 218
    ActivePage = TabSheet1
    TabOrder = 8
    object TabSheet1: TTabSheet
      Caption = #3626#3656#3591#3586#3657#3629#3588#3623#3634#3617
      object btnSendMessage: TBitBtn
        Left = 13
        Top = 63
        Width = 121
        Height = 33
        Caption = 'SendMessage'
        TabOrder = 0
        OnClick = btnSendMessageClick
      end
      object mmChatBox: TMemo
        Left = 0
        Top = 0
        Width = 479
        Height = 57
        Align = alTop
        Lines.Strings = (
          #3626#3623#3633#3626#3604#3637#3588#3619#3633#3610'  '#3592#3634#3585' Delphi Bot Client '
          #8220#55356#57266#8221', '#8220#55356#57263#8221', '#8220#55356#57280#8221', '#8220#9917#8221', '#8220#55356#57267#8221', or '#8220#55356#57264#8221'.')
        TabOrder = 1
      end
      object btnSendMessageWBTN: TBitBtn
        Left = 296
        Top = 63
        Width = 168
        Height = 51
        Caption = 'SendMessage'#13'('#3611#3640#3656#3617#3651#3627#3657#3585#3604#3651#3609#3649#3594#3607')'
        TabOrder = 2
        OnClick = btnSendMessageWBTNClick
      end
      object RzBitBtn1: TBitBtn
        Left = 140
        Top = 120
        Width = 143
        Height = 51
        Caption = 'Remove keyboard'
        TabOrder = 3
        OnClick = RzBitBtn1Click
      end
      object btnSendMessageWKB: TBitBtn
        Left = 296
        Top = 120
        Width = 168
        Height = 51
        Caption = 'SendMessage'#13'('#3588#3637#3618#3660#3610#3629#3619#3660#3604#3651#3627#3657#3585#3604#3648#3621#3639#3629#3585')'
        TabOrder = 4
        OnClick = btnSendMessageWKBClick
      end
      object btnSendMessage2: TBitBtn
        Left = 13
        Top = 102
        Width = 121
        Height = 33
        Caption = 'SendMessage2'
        TabOrder = 5
        OnClick = btnSendMessage2Click
      end
      object btnSendMessage3: TBitBtn
        Left = 13
        Top = 141
        Width = 121
        Height = 33
        Caption = 'SendMessage3'
        TabOrder = 6
        OnClick = btnSendMessage3Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = #3626#3656#3591#3619#3641#3611
      object btnSendPhoto: TBitBtn
        Left = 12
        Top = 81
        Width = 121
        Height = 33
        Caption = 'SendPhoto'
        TabOrder = 1
        OnClick = btnSendPhotoClick
      end
      object edPhoto: TEdit
        Left = 12
        Top = 46
        Width = 449
        Height = 29
        TabOrder = 2
        Text = 'https://telegrambots.github.io/book/docs/photo-ara.jpg'
      end
      object edPhotoCaption: TEdit
        Left = 15
        Top = 11
        Width = 449
        Height = 29
        TabOrder = 0
        Text = 
          '<b>Ara bird</b>. <i>Source</i>: <a href="https://pixabay.com/">P' +
          'ixabay</a>'
      end
    end
    object TabSheet2: TTabSheet
      Caption = #3626#3656#3591#3626#3605#3636#3658#3585#3648#3585#3629#3619#3660
      object btnSendSticker: TBitBtn
        Left = 15
        Top = 49
        Width = 121
        Height = 39
        Caption = 'SendSticker'
        TabOrder = 0
        OnClick = btnSendStickerClick
      end
      object edSticker: TEdit
        Left = 15
        Top = 14
        Width = 449
        Height = 29
        TabOrder = 1
        Text = 'https://telegrambots.github.io/book/docs/sticker-fred.webp'
      end
    end
    object TabSheet3: TTabSheet
      Caption = #3626#3656#3591#3623#3636#3604#3637#3650#3629
      object btnSendVideo: TBitBtn
        Left = 15
        Top = 49
        Width = 121
        Height = 33
        Caption = 'SendVideo'
        TabOrder = 0
        OnClick = btnSendVideoClick
      end
      object edVideo: TEdit
        Left = 15
        Top = 14
        Width = 449
        Height = 29
        TabOrder = 1
        Text = 'https://telegrambots.github.io/book/docs/video-hawk.mp4'
      end
    end
    object TabSheet9: TTabSheet
      Caption = #3626#3656#3591' Doc ('#3652#3615#3621#3660')'
      object btnSendDocument: TBitBtn
        Left = 15
        Top = 89
        Width = 121
        Height = 33
        Caption = 'SendDocument'
        TabOrder = 0
        OnClick = btnSendDocumentClick
      end
      object edDocumentFileName: TEdit
        Left = 15
        Top = 54
        Width = 450
        Height = 29
        TabOrder = 1
        TextHint = 'Path\URL\To\File'
      end
      object edDocumentCaption: TEdit
        Left = 16
        Top = 19
        Width = 449
        Height = 29
        TabOrder = 2
        Text = 'This a Document'
      end
      object btnSelectFile: TBitBtn
        Left = 344
        Top = 89
        Width = 121
        Height = 33
        Caption = #3648#3621#3639#3629#3585#3652#3615#3621#3660
        TabOrder = 3
        OnClick = btnSelectFileClick
      end
    end
    object TabSheet8: TTabSheet
      Caption = '...'
      object btnSendDice: TBitBtn
        Left = 15
        Top = 31
        Width = 121
        Height = 33
        Caption = 'SendDice'
        TabOrder = 0
        OnClick = btnSendDiceClick
      end
      object btnSendSlot: TBitBtn
        Left = 15
        Top = 78
        Width = 121
        Height = 33
        Caption = 'SendSlot'
        TabOrder = 1
        OnClick = btnSendSlotClick
      end
      object btnSendBowling: TBitBtn
        Left = 15
        Top = 127
        Width = 121
        Height = 33
        Caption = 'SendBowling'
        TabOrder = 2
        OnClick = btnSendBowlingClick
      end
      object btnSendDart: TBitBtn
        Left = 159
        Top = 31
        Width = 121
        Height = 33
        Caption = 'SendDart'
        TabOrder = 3
        OnClick = btnSendDartClick
      end
      object btnSendBall: TBitBtn
        Left = 159
        Top = 78
        Width = 121
        Height = 33
        Caption = 'SendBall'
        TabOrder = 4
        OnClick = btnSendBallClick
      end
      object btnSendBase: TBitBtn
        Left = 159
        Top = 127
        Width = 121
        Height = 33
        Caption = 'SendBase'
        TabOrder = 5
        OnClick = btnSendBaseClick
      end
      object btnSendGame: TBitBtn
        Left = 327
        Top = 31
        Width = 121
        Height = 33
        Caption = 'SendGame'
        TabOrder = 6
        OnClick = btnSendGameClick
      end
    end
  end
  object RzPageControl2: TPageControl
    Left = 512
    Top = 10
    Width = 412
    Height = 528
    ActivePage = TabSheet7
    TabOrder = 9
    object TabSheet5: TTabSheet
      Caption = 'Chat Display'
      object ScrollBoxChat: TScrollBox
        Left = 0
        Top = 35
        Width = 404
        Height = 457
        Align = alClient
        Color = clInfoBk
        ParentColor = False
        TabOrder = 0
        OnMouseWheel = ScrollBoxChatMouseWheel
      end
      object pnChatCount: TPanel
        Left = 0
        Top = 0
        Width = 404
        Height = 35
        Align = alTop
        TabOrder = 1
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Response'
      object mmResponse: TMemo
        Left = 0
        Top = 0
        Width = 404
        Height = 492
        Align = alClient
        Color = clInfoBk
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Json'
    end
  end
  object edWebHook: TEdit
    Left = 27
    Top = 213
    Width = 316
    Height = 29
    TabOrder = 10
  end
  object RzBitBtn2: TBitBtn
    Left = 349
    Top = 186
    Width = 157
    Height = 33
    Caption = 'SetWebHook'
    TabOrder = 11
    OnClick = RzBitBtn2Click
  end
  object RzBitBtn3: TBitBtn
    Left = 349
    Top = 225
    Width = 157
    Height = 33
    Caption = 'GetWebHookInfo'
    TabOrder = 12
    OnClick = RzBitBtn3Click
  end
  object RzBitBtn4: TBitBtn
    Left = 349
    Top = 264
    Width = 157
    Height = 33
    Caption = 'DeleteWebHook'
    TabOrder = 13
    OnClick = RzBitBtn4Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'All Files (*.*)|*.*'
    Title = #3648#3621#3639#3629#3585#3652#3615#3621#3660
    Left = 608
    Top = 160
  end
  object WrpTelegramBot1: TWrpTelegramBot
    OnResponse = WrpTelegramBot1Response
    OnResponseError = WrpTelegramBot1ResponseError
    OnHttpError = WrpTelegramBot1HttpError
    Left = 608
    Top = 88
  end
end
