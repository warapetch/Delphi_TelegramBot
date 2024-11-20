unit UMainWrpTelegramBot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls ,
  RzEdit, RzButton,RzTabs, RzPanel, Vcl.ComCtrls,
  System.JSON ,System.Net.HttpClient,
  UWrpTelegramBot ,UWrpTelegramBot_Type, JSONTreeView ;

type
  TFrmMainWrpTelegramBot = class(TForm)
    btnGetUpdates: TRzBitBtn;
    btnGetMe: TRzBitBtn;

    edChatID: TRzEdit;
    edChatTitle: TRzEdit;
    edToken: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edBotUserName: TRzEdit;
    Label5: TLabel;
    edBotFirstName: TRzEdit;
    edBotID: TRzEdit;
    Label6: TLabel;
    Label7: TLabel;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    btnSendMessage: TRzBitBtn;
    mmChatBox: TRzMemo;
    TabSheet4: TRzTabSheet;
    btnSendPhoto: TRzBitBtn;
    edPhoto: TRzEdit;
    btnSendSticker: TRzBitBtn;
    edSticker: TRzEdit;
    btnSendVideo: TRzBitBtn;
    edVideo: TRzEdit;
    RzPageControl2: TRzPageControl;
    TabSheet5: TRzTabSheet;
    ScrollBoxChat: TScrollBox;
    edPhotoCaption: TRzEdit;
    TabSheet7: TRzTabSheet;
    mmResponse: TRzMemo;
    TabSheet8: TRzTabSheet;
    TabSheet9: TRzTabSheet;
    btnSendDocument: TRzBitBtn;
    edDocumentFileName: TRzEdit;
    edDocumentCaption: TRzEdit;
    OpenDialog1: TOpenDialog;
    Label4: TLabel;
    btnSelectFile: TRzBitBtn;
    btnSendMessageWBTN: TRzBitBtn;
    pnChatCount: TRzPanel;
    Label8: TLabel;
    Label9: TLabel;
    TabSheet10: TRzTabSheet;
    JSONTreeView1: TJSONTreeView;
    WrpTelegramBot1: TWrpTelegramBot;
    RzBitBtn1: TRzBitBtn;
    btnSendMessageWKB: TRzBitBtn;
    Label10: TLabel;
    edWebHook: TRzEdit;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    btnSendMessage2: TRzBitBtn;
    btnSendMessage3: TRzBitBtn;
    btnSendDice: TRzBitBtn;
    btnSendSlot: TRzBitBtn;
    btnSendBowling: TRzBitBtn;
    btnSendDart: TRzBitBtn;
    btnSendBall: TRzBitBtn;
    btnSendBase: TRzBitBtn;
    btnSendGame: TRzBitBtn;

    procedure btnGetMeClick(Sender: TObject);
    procedure btnGetUpdatesClick(Sender: TObject);
    procedure btnSendMessageClick(Sender: TObject);
    procedure btnSendStickerClick(Sender: TObject);
    procedure btnSendVideoClick(Sender: TObject);
    procedure btnSendPhotoClick(Sender: TObject);
    procedure btnSendDocumentClick(Sender: TObject);
    procedure ScrollBoxChatMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
    procedure btnSelectFileClick(Sender: TObject);
    procedure btnSendMessageWBTNClick(Sender: TObject);
    procedure WrpTelegramBot1Response(MethodName: string; httpResponse: IHTTPResponse; ResponseAsStr: string;
      ResponseAsJson: TJSONValue);
    procedure WrpTelegramBot1ResponseError(MethodName: string; ErrorCode: Integer; ErrorMessage: string);
    procedure WrpTelegramBot1HttpError(MethodName, ErrorMessage: string);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure btnSendMessageWKBClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure btnSendMessage2Click(Sender: TObject);
    procedure btnSendMessage3Click(Sender: TObject);
    procedure btnSendDiceClick(Sender: TObject);
    procedure btnSendSlotClick(Sender: TObject);
    procedure btnSendBowlingClick(Sender: TObject);
    procedure btnSendDartClick(Sender: TObject);
    procedure btnSendBallClick(Sender: TObject);
    procedure btnSendBaseClick(Sender: TObject);
    procedure btnSendGameClick(Sender: TObject);
  private
    procedure CreateChat(AUpdateId : Integer; AChatFrom : TChatUser ;AChatTo : TChatUser;
    AChatMessage: TChatMessage;
    ABGColor : TColor = clWhite;Align: TAlign = alLeft);
    procedure CreateChat1(MessageInfo: String; is_bot: Boolean);
    procedure DoOnChatPanelClick(Sender: TObject);
    procedure ShowResponse(MethodName, AMessageText: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMainWrpTelegramBot: TFrmMainWrpTelegramBot;

implementation

{$R *.dfm}

uses System.Net.HttpClientComponent , System.Net.Mime,
    System.Net.URLClient;

procedure TFrmMainWrpTelegramBot.btnSelectFileClick(Sender: TObject);
begin
    if OpenDialog1.Execute() then
       edDocumentFileName.Text := OpenDialog1.FileName;
end;

procedure TFrmMainWrpTelegramBot.btnSendDocumentClick(Sender: TObject);
var Payload: TMultipartFormData;   // System.Net.Mime
//    jsonResult : TJSonValue;
begin

    Payload := TMultipartFormData.Create;
    Payload.AddField('chat_id',edChatID.text);
    Payload.AddField('caption', Trim(edDocumentCaption.Text));
    Payload.AddField('parse_mode','HTML');  // {undefined}, Markdown, MarkdownV2, HTML

    Payload.AddFile('document',Trim(edDocumentFileName.text));

    WrpTelegramBot1.sendDocument(Payload);

    Payload.Free;
end;

procedure TFrmMainWrpTelegramBot.btnSendMessageClick(Sender: TObject);
var Payload : TStringList;
    jsonResult : TJSonValue;
begin
    Payload := TStringList.Create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('text='+Trim(mmChatBox.text));
    Payload.Add('parse_mode=HTML');

    jsonResult := WrpTelegramBot1.sendMessage(Payload);

    Payload.Free;
end;

procedure TFrmMainWrpTelegramBot.btnSendMessage2Click(Sender: TObject);
var qryStr : String;
begin
    //qryStr := 'chat_id='+edChatID.text+'&text='+Trim(mmChatBox.text);
    qryStr := Format('chat_id=%s&text=%s',[edChatID.text,Trim(mmChatBox.text)]);
    WrpTelegramBot1.sendMessage(qryStr);
end;

procedure TFrmMainWrpTelegramBot.btnSendMessage3Click(Sender: TObject);
begin
    WrpTelegramBot1.sendMessage(edChatID.text,Trim(mmChatBox.text));
end;

procedure TFrmMainWrpTelegramBot.btnSendMessageWBTNClick(Sender: TObject);
var Payload : TStringList;
    jsonResult : TJSonValue;

    MarkUpBtns,MarkUpBtns2 : TTelegramButtons;
    MarkUpBtn1 : TTelegramButton;
    MarkUpButtonStr ,MarkUpButtonStr2 : string;

    UrlBtns : TTelegramButtons;
    UrlBtn1 : TTelegramButton;
    UrlButtonStr : String;
    keyboardNum : String;

begin
    // https://core.telegram.org/bots/api#inlinekeyboardmarkup

    // "[ {'เลือก 1': 'One' } ,{เลือก 2': 'Two' } ,{'เลือก 3': 'Three' }]"
    // { "text" : "เลือก 1 ","callback_data" : "One" }
    // [ [ {} ,{} ,{}] , [ {} ,{} ,{}] , [ {} ,{} ] ]

    // MarkUp Buttons
    MarkUpBtns := [ MarkUpBtn1.create('เลือก 1' ,'One').Callback,
                    MarkUpBtn1.create('เลือก 2' ,'Two').Callback,
                    MarkUpBtn1.create('เลือก 3' ,'Three').Callback
                    ];

    MarkUpBtns2 := [ MarkUpBtn1.create('เลือก 4','Four').Callback,
                     MarkUpBtn1.create('เลือก 5'  ,'Five').Callback,
                     MarkUpBtn1.create('เลือก 6'  ,'Six').Callback
                    ];

    // MarkUp แถว 1
    // Method #1
    MarkUpButtonStr  :=  WrpLib.TelegramButtonsToJsonString(MarkUpBtns);

    // Method #2
    //MarkUpButtonStr  :=  WrpLib.TelegramButtonsToJsonString(MarkUpBtns,['text','callback_data']);

    // MarkUp แถว 2
    MarkUpButtonStr2 :=  WrpLib.TelegramButtonsToJsonString(MarkUpBtns2);

    // URL Buttons
    UrlBtns := [ UrlBtn1.Create('Google.com','https://www.google.com').Url,
                 UrlBtn1.Create('FaceBook','https://www.facebook.com').Url
        ];
    UrlButtonStr := WrpLib.TelegramButtonsToJsonString(UrlBtns);
    //UrlButtonStr := WrpLib.TelegramButtonsToJsonString(UrlBtns,['text','url']);

    Payload := TStringList.Create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('text='+Trim(mmChatBox.text));

    // บนหัวข้อความจะมี Link "Reply" เพื่อให้ User คลิ๊กพิมพ์ตอบกลับมา
    Payload.Add('force_reply=true');

    // ** inline_keyboard ** คือ Array of [Array of Keyboard/Button]
    // "inline_keyboard": [ [แถว1],[แถว2],[แถว3],... ]
    // แทรกปุ่ม
    Payload.Add('reply_markup={"inline_keyboard":[' +
            MarkUpButtonStr  + ',' +
            MarkUpButtonStr2 + ',' +
            UrlButtonStr+'] }');

    WrpTelegramBot1.sendMessage(Payload);

    Payload.Free;
end;

procedure TFrmMainWrpTelegramBot.btnGetMeClick(Sender: TObject);
var jsonValue : TJsonValue;
begin
    // #1 ต้องกำหนดค่า Token ให้บอทก่อนเสมอ จะได้ ใช้งานได้ถูกตัว (ถ้ามีหลายบอท)
    // ถ้ามีตัวเดียว ก็ไม่ต้องกังวลอะไร !!
    WrpTelegramBot1.BotToken := edToken.text;
    // getMe
    jsonValue := WrpTelegramBot1.getMe;

    edBotID.Text        := WrpTelegramBot1.Bot.id;
    edBotFirstName.Text := WrpTelegramBot1.Bot.first_name;
    edBotUserName.Text  := WrpTelegramBot1.Bot.username;

end;

procedure TFrmMainWrpTelegramBot.ScrollBoxChatMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);

var
  LTopLeft, LTopRight, LBottomLeft, LBottomRight: SmallInt;
  LPoint: TPoint;
  ScrollBox: TScrollBox;
begin
  ScrollBox := TScrollBox(Sender);
  LPoint := ScrollBox.ClientToScreen(Point(0,0));
  LTopLeft := LPoint.X;
  LTopRight := LTopLeft + ScrollBox.ClientWidth;
  LBottomLeft := LPoint.Y;
  LBottomRight := LBottomLeft + ScrollBox.ClientWidth;
  if (MousePos.X >= LTopLeft) and
    (MousePos.X <= LTopRight) and
    (MousePos.Y >= LBottomLeft) and
    (MousePos.Y <= LBottomRight) then
  begin
    ScrollBox.VertScrollBar.Position := ScrollBox.VertScrollBar.Position - WheelDelta;
    Handled := True;
  end;

end;

procedure TFrmMainWrpTelegramBot.WrpTelegramBot1HttpError(MethodName, ErrorMessage: string);
begin
    ShowResponse(MethodName,'Http Error: '+ErrorMessage);
end;

procedure TFrmMainWrpTelegramBot.WrpTelegramBot1Response(
    MethodName: string;
    httpResponse: IHTTPResponse;   // System.Net.HttpClient
    ResponseAsStr: string;
    ResponseAsJson: TJSONValue);   // System.JSON

begin
    // View at JsonTreeView [Version Warapetch Edited]
    JSONTreeView1.JsonText := ResponseAsJson.ToString;
    JSONTreeView1.LoadJson;

    // Show at Memo
    ShowResponse(MethodName,ResponseAsStr);
end;

procedure TFrmMainWrpTelegramBot.ShowResponse(MethodName,AMessageText : String);

var sDateTime : String;
begin
    sDateTime := FormatDateTime('DD/MM/YYYY HH:NN:SS',NOW);
    mmResponse.Lines.Add('');
    mmResponse.Lines.Add(sDateTime+': Send >> '+MethodName);
    mmResponse.Lines.Add('Response >> '+AMessageText);
end;

procedure TFrmMainWrpTelegramBot.WrpTelegramBot1ResponseError(MethodName: string; ErrorCode: Integer;
  ErrorMessage: string);
begin
    ShowResponse(MethodName,'Response Error: '+ErrorMessage);
end;

procedure TFrmMainWrpTelegramBot.btnGetUpdatesClick(Sender: TObject);
var
    update_id : Integer;
    vChat_Migrate_to_Chat_id : int64;

    file_id        : String;
    file_unique_id : String;
    file_size : Integer;
    file_set_name       : String;
    file_emoji          : String;
    file_is_animated    : Boolean;
    file_is_video       : Boolean;
    file_type      : String;


    jsonSticker ,
    jsonCallbackQuery,
    jsonUpdate, jsonMyChatMember,
    jsonValue ,jsonChat,jsonChatMessage ,
    jsonNotify ,
    jsonChatFrom,jsonChatTo : TJSonValue;
    jsonChatText,
    hasJsonLanguage ,
    jsonMemberOldNotify ,
    jsonMemberNewNotify ,
    jsonMemberOldData ,
    jsonMemberNewData : TJSonValue;

    jsonArr: TJSONArray;
    I ,J: Integer;

    _ChatMessage : TChatMessage;
    _ChatFrom : TChatUser;
    _ChatTo : TChatUser;


    _MemOldState , _MemNewState : TChatUser;

    vChat_instance ,vChat_ReplyData,
    MemberOldState, MemberNewState : String;
    vChat_group_chat_created : Boolean;

begin

    for J := ScrollBoxChat.ControlCount-1 downto 0 do
       begin
          ScrollBoxChat.Controls[J].free;
       end;

    // #1 ต้องกำหนดค่า Token ให้บอทก่อนเสมอ จะได้ ใช้งานได้ถูกตัว (ถ้ามีหลายบอท)
    // ถ้ามีตัวเดียว ก็ไม่ต้องกังวลอะไร !!
    WrpTelegramBot1.BotToken := edToken.text;
    // getUpdates ดึงข้อมูล ความเคลื่อนไหว ในห้องแชท (กลุ่ม หรือ 1:1)
    jsonValue := WrpTelegramBot1.getUpdates;

    // แปลง JsonValue >> JsonArray
    jsonValue.TryGetValue('result', jsonArr);

    if jsonArr <> NIL then
       begin
        pnChatCount.Caption := 'Get Updates: '+IntToStr(jsonArr.Count)+' Rows';
        pnChatCount.Update;

        if jsonArr.Count > 0 then
           begin
               for I := 0 to jsonArr.Count-1 do
                   begin
                       jsonUpdate := jsonArr[i];

                       update_id   := jsonUpdate.GetValue<integer>('update_id');
                       _ChatMessage.id   := '';
                       _ChatMessage.date := 0;
                       _ChatMessage.text := 'None';
                      _MemOldState.id := '';
                      _MemOldState.is_bot := False;
                      _MemOldState.first_name := '';
                      _MemOldState.username   := '';
                      _MemNewState.id := '';
                      _MemNewState.is_bot := False;
                      _MemNewState.first_name := '';
                      _MemNewState.username   := '';

                       vChat_Migrate_to_Chat_id := 0;
                       vChat_group_chat_created := False;
                       MemberOldState := '';
                       MemberNewState := '';

                       jsonMyChatMember  := NIL;
                       jsonCallbackQuery := NIL;

                       jsonUpdate.TryGetValue('my_chat_member',jsonMyChatMember);

                       jsonUpdate.TryGetValue('callback_query',jsonCallbackQuery);

                       // my_chat_member
                       if jsonMyChatMember <> NIL then
                          begin
                            // Memeber Or Group Notify
                            jsonChatMessage := jsonUpdate.GetValue<TJSONValue>('my_chat_member');

                            jsonChatMessage.tryGetValue('old_chat_member',jsonMemberOldData);
                            jsonChatMessage.tryGetValue('new_chat_member',jsonMemberNewData);
                            jsonChatMessage.tryGetValue('group_chat_created',vChat_group_chat_created);

                            if jsonMemberOldData <> NIL then
                               begin
                                  jsonMemberOldNotify := jsonMemberOldData.GetValue<TJSonValue>('user');
                                  MemberOldState  := jsonMemberOldData.GetValue<String>('status');

                                  _MemOldState.id     := jsonMemberOldNotify.GetValue<String>('id');
                                  _MemOldState.is_bot := jsonMemberOldNotify.GetValue<Boolean>('is_bot');
                                  _MemOldState.first_name := jsonMemberOldNotify.GetValue<String>('first_name');
                                  _MemOldState.username   := jsonMemberOldNotify.GetValue<String>('username');
                               end;


                            if jsonMemberNewData <> NIL then
                               begin
                                  jsonMemberNewNotify := jsonMemberNewData.GetValue<TJSonValue>('user');
                                  MemberNewState      := jsonMemberNewData.GetValue<String>('status');

                                  _MemNewState.id := jsonMemberNewNotify.GetValue<String>('id');
                                  _MemNewState.is_bot := jsonMemberNewNotify.GetValue<Boolean>('is_bot');
                                  _MemNewState.first_name := jsonMemberNewNotify.GetValue<String>('first_name');
                                  _MemNewState.username   := jsonMemberNewNotify.GetValue<String>('username');

                                  if MemberNewState = 'administrator' then
                                     begin
                                         { "can_be_edited": false,
                                          "can_manage_chat": true,
                                          "can_change_info": true,
                                          "can_delete_messages": true,
                                          "can_invite_users": true,
                                          "can_restrict_members": true,
                                          "can_pin_messages": true,
                                          "can_manage_topics": true,
                                          "can_promote_members": true,
                                          "can_manage_video_chats": true,
                                          "can_post_stories": true,
                                          "can_edit_stories": true,
                                          "can_delete_stories": true,
                                          "is_anonymous": false,
                                          "can_manage_voice_chats": true }
                                     end;

                               end;
                          end
                       else
                       begin
                           if jsonCallbackQuery <> NIL then
                              begin
                                jsonCallbackQuery.tryGetValue('chat_instance',vChat_instance);
                                jsonCallbackQuery.tryGetValue('data',vChat_Replydata);
                                // message
                                jsonChatMessage := jsonCallbackQuery.GetValue<TJSONValue>('message');
                              end
                           else
                           // message
                           jsonChatMessage := jsonUpdate.GetValue<TJSONValue>('message');


                           _ChatMessage.id   := jsonChatMessage.GetValue<String>('message_id');

                           _ChatMessage.date := jsonChatMessage.GetValue<integer>('date');
                           _ChatMessage.datetime := WrpLib.ConvertSecondsToDateTime(_ChatMessage.date);

                            jsonChatText := NIL;
                            jsonChatMessage.TryGetValue('text',jsonChatText);
                           if jsonChatText <> NIL then
                              begin
                                 _ChatMessage.text := jsonChatMessage.GetValue<String>('text');

                                 if (jsonCallbackQuery <> NIL)  and (vChat_Replydata <> '') then
                                    begin
                                       _ChatMessage.text := _ChatMessage.text +' Select: '+vChat_Replydata;
                                    end;

                              end;

                           jsonChatMessage.tryGetValue('group_chat_created',vChat_group_chat_created);
                           jsonChatMessage.tryGetValue('migrate_to_chat_id',vChat_Migrate_to_Chat_id);

                           jsonSticker := NIL;
                           jsonChatMessage.tryGetValue('sticker',jsonSticker);

                           if jsonSticker <> NIL then
                              begin
                                 file_id        := jsonSticker.GetValue<String>('file_id');
                                 file_unique_id := jsonSticker.GetValue<String>('file_unique_id');
                                 file_size      := jsonSticker.GetValue<Integer>('file_size');
                                 file_set_name  := jsonSticker.GetValue<String>('set_name');
                                 file_emoji     := jsonSticker.GetValue<String>('emoji');
                                 file_is_animated := jsonSticker.GetValue<Boolean>('is_animated');
                                 file_is_video  := jsonSticker.GetValue<Boolean>('is_video');
                                 file_type      := jsonSticker.GetValue<String>('file_size');

                                 _ChatMessage.text := 'Stick :: '+file_set_name+' '+file_emoji+#13#10+
                                    'file_id:'+file_id+#13#10+
                                    'Unique_id:'+file_unique_id;
                              end;
                       end;

                       jsonChatFrom := jsonChatMessage.GetValue<TJSONValue>('from');
                       jsonChatTo   := jsonChatMessage.GetValue<TJSONValue>('chat');

                       _ChatFrom.id := jsonChatFrom.GetValue<String>('id');
                       _ChatFrom.is_bot := jsonChatFrom.GetValue<Boolean>('is_bot');
                       _ChatFrom.first_name := jsonChatFrom.GetValue<String>('first_name');

                       hasJsonLanguage := NIL;
                       jsonChatFrom.TryGetValue('language_code',hasJsonLanguage);
                       if hasJsonLanguage <> NIL then
                          _ChatFrom.language_code := jsonChatFrom.GetValue<String>('language_code');

                       _ChatTo.chat_type  := jsonChatTo.GetValue<String>('type');
                       _ChatTo.id := jsonChatTo.GetValue<String>('id');
                       if _ChatTo.chat_type = 'private' then
                          _ChatTo.first_name := jsonChatTo.GetValue<String>('first_name')
                       else
                          begin
                             _ChatTo.first_name := jsonChatTo.GetValue<String>('title');
                             if (_ChatTo.chat_type = 'group') then
                                begin
                                   if (MemberOldState = 'member') and (MemberNewState = 'left') then  // Remove
                                      begin
                                         _ChatMessage.text  := 'Group/Member: '+_ChatTo.first_name+' Removed !!';
                                        mmResponse.Lines.Add('Group/Member: '+_ChatTo.first_name+' , Chat Id: '+_ChatTo.id+' Removed !!');
                                      end
                                   else
                                   if (MemberOldState = 'left') and (MemberNewState = 'member') then  // Create or Add
                                      begin
                                        _ChatMessage.text  := 'Group/Member: '+_ChatTo.first_name+' , Chat Id: '+_ChatTo.id+' Create ...';
                                        mmResponse.Lines.Add('Group/Member: '+_ChatTo.first_name+' , Chat Id: '+_ChatTo.id+' Create ...');
                                      end;

                                   if vChat_Migrate_to_Chat_id <> 0 then // Promoto to Group Admin Assign new chat id
                                      begin

                                      end;
                                end;
                          end;



                       CreateChat(update_id,_ChatFrom,_ChatTo,_ChatMessage);
                   end;
           end;
    end;
    ScrollBoxChat.VertScrollBar.Position := 10000;
end;

procedure TFrmMainWrpTelegramBot.CreateChat(AUpdateId : Integer; AChatFrom : TChatUser ;AChatTo : TChatUser;
    AChatMessage: TChatMessage;
    ABGColor : TColor = clWhite;Align: TAlign = alLeft);

var pnPanelBG: TPanel;
    mmChat: TMemo;
    MessageInfo : String;
    is_bot : Boolean;

begin

    is_bot := AChatFrom.is_bot;
    MessageInfo := 'Update ID: '+IntToStr(AUpdateId)+#13#10+
                   'From: '+AChatFrom.first_name+'[ID: '+AChatFrom.id+']'+#13#10+
                   'To: '+AChatTo.chat_type+': '+AChatTo.first_name+#13#10+
                   '** Chat ID: '+AChatTo.id+' **'+#13#10+
                   'Message:[ID: '+AChatMessage.id+']:'+AChatMessage.text+#13#10+
                   '@: '+FormatDateTime('YYYY-MM-DD HH:NN',AChatMessage.datetime);

    pnPanelBG:= TPanel.Create(ScrollBoxChat);
    pnPanelBG.Hint   := AChatTo.id+'|'+AChatTo.first_name;
    pnPanelBG.Height := 150;
    pnPanelBG.Align  := alTop;
    pnPanelBG.Top    := 3000; // Go to Bottom
    pnPanelBG.OnClick := DoOnChatPanelClick;

    mmChat:= TMemo.Create(pnPanelBG);
    mmChat.ReadOnly := True;
    mmChat.Text := MessageInfo;
    mmChat.AlignWithMargins := True;
    mmChat.Width := 250;
    if is_bot then
       mmChat.Align      := alLeft
    else
       mmChat.Align      := alRight;

    mmChat.Font.Color := clWindowText;
    mmChat.Font.Name  := 'Sarabun';
    mmChat.Font.Style := [];
    mmChat.ParentFont := False;

    pnPanelBG.InsertControl(mmChat);

    ScrollBoxChat.InsertControl(pnPanelBG);
end;

procedure TFrmMainWrpTelegramBot.DoOnChatPanelClick(Sender : TObject);
var _hint : String;
begin
    _hint := TPanel(Sender).Hint;
    edChatID.Text    := Copy(_hint,1,POS('|',_hint)-1);
    edChatTitle.Text := Copy(_hint,POS('|',_hint)+1,255);
end;

procedure TFrmMainWrpTelegramBot.RzBitBtn1Click(Sender: TObject);
var Payload : TStringList;
begin
    // ** NOT WORK / UNKNOW USAGE **
    Payload := TStringList.Create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('text=Remove Keybord');
    Payload.Add('keyboard={"remove_keyboard":true}');

    WrpTelegramBot1.sendMessage(Payload);
    FreeAndNil(Payload);
end;

procedure TFrmMainWrpTelegramBot.RzBitBtn2Click(Sender: TObject);
begin
    if Trim(edWebHook.Text) <> '' then
       WrpTelegramBot1.setWebHook(edWebHook.Text);
end;

procedure TFrmMainWrpTelegramBot.RzBitBtn3Click(Sender: TObject);
begin
    WrpTelegramBot1.getWebhookInfo;
end;

procedure TFrmMainWrpTelegramBot.RzBitBtn4Click(Sender: TObject);
begin
    WrpTelegramBot1.deleteWebHook;
end;

procedure TFrmMainWrpTelegramBot.btnSendGameClick(Sender: TObject);
var Payload : TStringList;
begin
    // ไม่ผ่าน !!
    Payload := TStringList.create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('game_short_name=Lumberjack'); // ต้องทำในมือถือ แท็บเล็ต ??

    WrpTelegramBot1.sendGame(Payload);

    FreeAndNil(Payload);
end;

procedure TFrmMainWrpTelegramBot.btnSendDartClick(Sender: TObject);
var Payload : TStringList;
begin
    Payload := TStringList.create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('emoji=🎯'); //  “🎲”, “🎯”, “🏀”, “⚽”, “🎳”, or “🎰”

    WrpTelegramBot1.sendDice(Payload);

    FreeAndNil(Payload);
end;

procedure TFrmMainWrpTelegramBot.btnSendSlotClick(Sender: TObject);
var Payload : TStringList;
begin
    Payload := TStringList.create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('emoji=🎰'); //  “🎲”, “🎯”, “🏀”, “⚽”, “🎳”, or “🎰”

    WrpTelegramBot1.sendDice(Payload);

    FreeAndNil(Payload);

end;

procedure TFrmMainWrpTelegramBot.btnSendBallClick(Sender: TObject);
var Payload : TStringList;
begin
    Payload := TStringList.create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('emoji=⚽');  //  “🎲”, “🎯”, “🏀”, “⚽”, “🎳”, or “🎰”

    WrpTelegramBot1.sendDice(Payload);

    FreeAndNil(Payload);

end;

procedure TFrmMainWrpTelegramBot.btnSendBaseClick(Sender: TObject);
var Payload : TStringList;
begin
    Payload := TStringList.create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('emoji=🏀');  //  “🎲”, “🎯”, “🏀”, “⚽”, “🎳”, or “🎰”

    WrpTelegramBot1.sendDice(Payload);

    FreeAndNil(Payload);

end;

procedure TFrmMainWrpTelegramBot.btnSendBowlingClick(Sender: TObject);
var Payload : TStringList;
begin
    Payload := TStringList.create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('emoji=🎳');  //  “🎲”, “🎯”, “🏀”, “⚽”, “🎳”, or “🎰”

    WrpTelegramBot1.sendDice(Payload);

    FreeAndNil(Payload);
end;

procedure TFrmMainWrpTelegramBot.btnSendDiceClick(Sender: TObject);
var Payload : TStringList;
begin
    Payload := TStringList.create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('emoji=🎲'); //  “🎲”, “🎯”, “🏀”, “⚽”, “🎳”, or “🎰”

    WrpTelegramBot1.sendDice(Payload);

    FreeAndNil(Payload);
end;

procedure TFrmMainWrpTelegramBot.btnSendMessageWKBClick(Sender: TObject);
var Payload : TStringList;
    jsonResult : TJSonValue;

    MarkUpBtns,MarkUpBtns2 : TTelegramButtons;
    MarkUpBtn1 : TTelegramButton;
    MarkUpButtonStr ,MarkUpButtonStr2 : string;

    UrlBtns : TTelegramButtons;
    UrlBtn1 : TTelegramButton;
    UrlButtonStr : String;

begin
    // https://core.telegram.org/bots/api#inlinekeyboardmarkup
    // MarkUp Buttons
    MarkUpBtns := [ MarkUpBtn1.create('เลือก 1','One'),
                    MarkUpBtn1.create('เลือก 2'  ,'Two'),
                    MarkUpBtn1.create('เลือก 3'  ,'Three')
                    ];
    MarkUpBtns2 := [ MarkUpBtn1.create('เลือก 4','Four'),
                    MarkUpBtn1.create('เลือก 5'  ,'Five'),
                    MarkUpBtn1.create('เลือก 6'  ,'Six')
                    ];

    // MarkUp แถว 1
    MarkUpButtonStr  :=  WrpLib.TelegramButtonsToJsonString(MarkUpBtns,['text','value']);
    // MarkUp แถว 2
    MarkUpButtonStr2 :=  WrpLib.TelegramButtonsToJsonString(MarkUpBtns2,['text','value']);

    // URL Buttons
    UrlBtns := [ UrlBtn1.Create('Google.com','https://www.google.com'),
                 UrlBtn1.Create('FaceBook.com','https://www.facebook.com')
        ];
    UrlButtonStr := WrpLib.TelegramButtonsToJsonString(UrlBtns,['text','value']);

    Payload := TStringList.Create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('text='+Trim(mmChatBox.text));

    // แทรกปุ่ม แทน คีย์บอร์ด
    Payload.Add('reply_markup={"keyboard":[' +
            MarkUpButtonStr  + ',' +
            MarkUpButtonStr2 + ',' +
            UrlButtonStr+'] '+ ',' +
            '"one_time_keyboard":true , '+
            '"resize_keyboard":true     '+
            '}');

    WrpTelegramBot1.sendMessage(Payload);

    Payload.Free;

end;

procedure TFrmMainWrpTelegramBot.CreateChat1(MessageInfo: String;is_bot : Boolean);

var pnPanelBG: TPanel;
    mmChat: TMemo;

begin

    pnPanelBG:= TPanel.Create(ScrollBoxChat);
    pnPanelBG.Height := 330;
    pnPanelBG.Align := alTop;
    mmChat:= TMemo.Create(pnPanelBG);
    mmChat.ReadOnly := True;
    mmChat.Text := MessageInfo;
    mmChat.AlignWithMargins := True;
    mmChat.Align      := Align;
    mmChat.Font.Color := clWindowText;
    mmChat.Font.Name  := 'Sarabun';
    mmChat.Font.Style := [];
    mmChat.ParentFont := False;

    pnPanelBG.InsertControl(mmChat);

    ScrollBoxChat.InsertControl(pnPanelBG);
end;

procedure TFrmMainWrpTelegramBot.btnSendPhotoClick(Sender: TObject);
var Payload : TStringList;

begin
    Payload := TStringList.Create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('photo='+Trim(edPhoto.text));
    Payload.Add('caption='+ Trim(edPhotoCaption.Text));
    Payload.Add('parse_mode=HTML');  // "", Markdown, MarkdownV2, HTML

    WrpTelegramBot1.sendPhoto(Payload);

    Payload.Free;
end;

procedure TFrmMainWrpTelegramBot.btnSendStickerClick(Sender: TObject);
var Payload : TStringList;

begin
    Payload := TStringList.Create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('sticker='+Trim(edSticker.text));

    WrpTelegramBot1.sendSticker(Payload);

    Payload.Free;
end;

procedure TFrmMainWrpTelegramBot.btnSendVideoClick(Sender: TObject);
var Payload : TStringList;

begin
    Payload := TStringList.Create;
    Payload.Add('chat_id='+edChatID.text);
    Payload.Add('video='+Trim(edVideo.text));
    WrpTelegramBot1.SendVideo(Payload);
    Payload.Free;
end;

end.
