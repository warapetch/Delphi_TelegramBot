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
  object edToken: TRzEdit
    Left = 103
    Top = 7
    Width = 389
    Height = 29
    Text = ''
    PasswordChar = 'x'
    TabOrder = 0
  end
  object btnGetMe: TRzBitBtn
    Left = 254
    Top = 38
    Width = 146
    Height = 33
    Caption = 'GetMe ('#3586#3657#3629#3617#3641#3621#3610#3629#3607')'
    TabOrder = 1
    OnClick = btnGetMeClick
  end
  object btnGetUpdates: TRzBitBtn
    Left = 103
    Top = 147
    Width = 297
    Height = 33
    Caption = 'GetUpdates ('#3649#3594#3607#3617#3637#3585#3634#3619#3629#3633#3614#3648#3604#3605' ?)'
    TabOrder = 2
    OnClick = btnGetUpdatesClick
  end
  object edChatID: TRzEdit
    Left = 100
    Top = 278
    Width = 243
    Height = 29
    Text = '-1002474013280'
    TabOrder = 3
  end
  object edChatTitle: TRzEdit
    Left = 103
    Top = 313
    Width = 240
    Height = 29
    Text = #3585#3621#3640#3656#3617' TestBOT'
    TabOrder = 4
  end
  object edBotUserName: TRzEdit
    Left = 103
    Top = 112
    Width = 240
    Height = 29
    Text = ''
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 5
  end
  object edBotFirstName: TRzEdit
    Left = 103
    Top = 77
    Width = 240
    Height = 29
    Text = ''
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 6
  end
  object edBotID: TRzEdit
    Left = 103
    Top = 42
    Width = 145
    Height = 29
    Text = ''
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 7
  end
  object RzPageControl1: TRzPageControl
    Left = 8
    Top = 359
    Width = 487
    Height = 218
    Hint = ''
    ActivePage = TabSheet1
    HotTrackStyle = htsTabBar
    TabColors.HighlightBar = 16485664
    TabIndex = 0
    TabOrder = 8
    FixedDimension = 27
    object TabSheet1: TRzTabSheet
      Caption = #3626#3656#3591#3586#3657#3629#3588#3623#3634#3617
      object btnSendMessage: TRzBitBtn
        Left = 13
        Top = 63
        Width = 121
        Height = 33
        Caption = 'SendMessage'
        TabOrder = 0
        OnClick = btnSendMessageClick
      end
      object mmChatBox: TRzMemo
        Left = 0
        Top = 0
        Width = 483
        Height = 57
        Align = alTop
        Lines.Strings = (
          #3626#3623#3633#3626#3604#3637#3588#3619#3633#3610'  '#3592#3634#3585' Delphi Bot Client '
          #8220#55356#57266#8221', '#8220#55356#57263#8221', '#8220#55356#57280#8221', '#8220#9917#8221', '#8220#55356#57267#8221', or '#8220#55356#57264#8221'.')
        TabOrder = 1
      end
      object btnSendMessageWBTN: TRzBitBtn
        Left = 296
        Top = 63
        Width = 168
        Height = 51
        Caption = 'SendMessage'#13'('#3611#3640#3656#3617#3651#3627#3657#3585#3604#3651#3609#3649#3594#3607')'
        TabOrder = 2
        OnClick = btnSendMessageWBTNClick
      end
      object RzBitBtn1: TRzBitBtn
        Left = 140
        Top = 120
        Width = 143
        Height = 51
        Caption = 'Remove keyboard'
        TabOrder = 3
        OnClick = RzBitBtn1Click
      end
      object btnSendMessageWKB: TRzBitBtn
        Left = 296
        Top = 120
        Width = 168
        Height = 51
        Caption = 'SendMessage'#13'('#3588#3637#3618#3660#3610#3629#3619#3660#3604#3651#3627#3657#3585#3604#3648#3621#3639#3629#3585')'
        TabOrder = 4
        OnClick = btnSendMessageWKBClick
      end
      object btnSendMessage2: TRzBitBtn
        Left = 13
        Top = 102
        Width = 121
        Height = 33
        Caption = 'SendMessage2'
        TabOrder = 5
        OnClick = btnSendMessage2Click
      end
      object btnSendMessage3: TRzBitBtn
        Left = 13
        Top = 141
        Width = 121
        Height = 33
        Caption = 'SendMessage3'
        TabOrder = 6
        OnClick = btnSendMessage3Click
      end
    end
    object TabSheet4: TRzTabSheet
      Caption = #3626#3656#3591#3619#3641#3611
      object btnSendPhoto: TRzBitBtn
        Left = 12
        Top = 81
        Width = 121
        Height = 33
        Caption = 'SendPhoto'
        TabOrder = 1
        OnClick = btnSendPhotoClick
      end
      object edPhoto: TRzEdit
        Left = 12
        Top = 46
        Width = 449
        Height = 29
        Text = 'https://telegrambots.github.io/book/docs/photo-ara.jpg'
        TabOrder = 2
      end
      object edPhotoCaption: TRzEdit
        Left = 15
        Top = 11
        Width = 449
        Height = 29
        Text = 
          '<b>Ara bird</b>. <i>Source</i>: <a href="https://pixabay.com/">P' +
          'ixabay</a>'
        TabOrder = 0
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #3626#3656#3591#3626#3605#3636#3658#3585#3648#3585#3629#3619#3660
      object btnSendSticker: TRzBitBtn
        Left = 15
        Top = 49
        Width = 121
        Height = 39
        Caption = 'SendSticker'
        TabOrder = 0
        OnClick = btnSendStickerClick
      end
      object edSticker: TRzEdit
        Left = 15
        Top = 14
        Width = 449
        Height = 29
        Text = 'https://telegrambots.github.io/book/docs/sticker-fred.webp'
        TabOrder = 1
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = #3626#3656#3591#3623#3636#3604#3637#3650#3629
      object btnSendVideo: TRzBitBtn
        Left = 15
        Top = 49
        Width = 121
        Height = 33
        Caption = 'SendVideo'
        TabOrder = 0
        OnClick = btnSendVideoClick
      end
      object edVideo: TRzEdit
        Left = 15
        Top = 14
        Width = 449
        Height = 29
        Text = 'https://telegrambots.github.io/book/docs/video-hawk.mp4'
        TabOrder = 1
      end
    end
    object TabSheet9: TRzTabSheet
      Caption = #3626#3656#3591' Doc ('#3652#3615#3621#3660')'
      object btnSendDocument: TRzBitBtn
        Left = 15
        Top = 89
        Width = 121
        Height = 33
        Caption = 'SendDocument'
        TabOrder = 0
        OnClick = btnSendDocumentClick
      end
      object edDocumentFileName: TRzEdit
        Left = 15
        Top = 54
        Width = 450
        Height = 29
        Text = ''
        TabOrder = 1
        TextHint = 'Path\URL\To\File'
      end
      object edDocumentCaption: TRzEdit
        Left = 16
        Top = 19
        Width = 449
        Height = 29
        Text = 'This a Document'
        TabOrder = 2
      end
      object btnSelectFile: TRzBitBtn
        Left = 344
        Top = 89
        Width = 121
        Height = 33
        Caption = #3648#3621#3639#3629#3585#3652#3615#3621#3660
        TabOrder = 3
        OnClick = btnSelectFileClick
      end
    end
    object TabSheet8: TRzTabSheet
      Caption = '...'
      object btnSendDice: TRzBitBtn
        Left = 15
        Top = 31
        Width = 121
        Height = 33
        Caption = 'SendDice'
        TabOrder = 0
        OnClick = btnSendDiceClick
      end
      object btnSendSlot: TRzBitBtn
        Left = 15
        Top = 78
        Width = 121
        Height = 33
        Caption = 'SendSlot'
        TabOrder = 1
        OnClick = btnSendSlotClick
      end
      object btnSendBowling: TRzBitBtn
        Left = 15
        Top = 127
        Width = 121
        Height = 33
        Caption = 'SendBowling'
        TabOrder = 2
        OnClick = btnSendBowlingClick
      end
      object btnSendDart: TRzBitBtn
        Left = 159
        Top = 31
        Width = 121
        Height = 33
        Caption = 'SendDart'
        TabOrder = 3
        OnClick = btnSendDartClick
      end
      object btnSendBall: TRzBitBtn
        Left = 159
        Top = 78
        Width = 121
        Height = 33
        Caption = 'SendBall'
        TabOrder = 4
        OnClick = btnSendBallClick
      end
      object btnSendBase: TRzBitBtn
        Left = 159
        Top = 127
        Width = 121
        Height = 33
        Caption = 'SendBase'
        TabOrder = 5
        OnClick = btnSendBaseClick
      end
      object btnSendGame: TRzBitBtn
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
  object RzPageControl2: TRzPageControl
    Left = 512
    Top = 10
    Width = 412
    Height = 528
    Hint = ''
    ActivePage = TabSheet10
    HotTrackStyle = htsTabBar
    TabColors.HighlightBar = 8388863
    TabIndex = 2
    TabOrder = 9
    FixedDimension = 27
    object TabSheet5: TRzTabSheet
      Caption = 'Chat Display'
      object ScrollBoxChat: TScrollBox
        Left = 0
        Top = 35
        Width = 408
        Height = 462
        Align = alClient
        Color = clInfoBk
        ParentColor = False
        TabOrder = 0
        OnMouseWheel = ScrollBoxChatMouseWheel
      end
      object pnChatCount: TRzPanel
        Left = 0
        Top = 0
        Width = 408
        Height = 35
        Align = alTop
        BorderOuter = fsPopup
        TabOrder = 1
      end
    end
    object TabSheet7: TRzTabSheet
      Caption = 'Response'
      object mmResponse: TRzMemo
        Left = 0
        Top = 0
        Width = 408
        Height = 497
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
        FocusColor = 16776697
      end
    end
    object TabSheet10: TRzTabSheet
      Caption = 'Json'
      object JSONTreeView1: TJSONTreeView
        Left = 0
        Top = 0
        Width = 408
        Height = 497
        Align = alClient
        Indent = 19
        TabOrder = 0
        VisibleChildrenCounts = True
        VisibleByteSizes = False
      end
    end
  end
  object edWebHook: TRzEdit
    Left = 27
    Top = 213
    Width = 316
    Height = 29
    Text = ''
    TabOrder = 10
  end
  object RzBitBtn2: TRzBitBtn
    Left = 349
    Top = 186
    Width = 157
    Height = 33
    Caption = 'SetWebHook'
    TabOrder = 11
    OnClick = RzBitBtn2Click
  end
  object RzBitBtn3: TRzBitBtn
    Left = 349
    Top = 225
    Width = 157
    Height = 33
    Caption = 'GetWebHookInfo'
    TabOrder = 12
    OnClick = RzBitBtn3Click
  end
  object RzBitBtn4: TRzBitBtn
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
    BotToken = '7903367441:AAFC3BZdCYP9tz5VvXSviaP1EUSb1BcLo-k'
    OnResponse = WrpTelegramBot1Response
    OnResponseError = WrpTelegramBot1ResponseError
    OnHttpError = WrpTelegramBot1HttpError
    Left = 608
    Top = 88
  end
end
