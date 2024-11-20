{
https://core.telegram.org/bots/api
version Bot API 7.11 @ October 31, 2024

Create by Warapetch  Ruangpornvisuthi
@ Create :: 11/11/2567 (11/11/2024)
@ Last Update :: 20/11/2567 11.30
}
unit UWrpTelegramBot_type;

interface
    uses System.sysUtils, System.DateUtils ,
         System.Generics.Collections , System.Json;

    Type
        TTelegramButtonType = (tgbCallback ,tgbUrl ,tgbKeyboard);

        TTelegramButton = record
            Title: String;
            Value: String;
            ButtonType : TTelegramButtonType;

            ///<summary>
            ///<code>ตัวอย่าง :: Create({Title},{Value})  <para/>
            /// MarkUpBtns := [ MarkUpBtn1.create('เลือก 1','One'),
            ///                 MarkUpBtn1.create('เลือก 2','Two') ];
            /// JsonValue  := TelegramButtonsToJson(MarkUpBtns,['text','callback_data']);
            /// JsonValue  := TelegramButtonsToJson(MarkUpBtns,['text','url']);
            /// JsonValue  := TelegramButtonsToJson(MarkUpBtns,['text','value']);
            ///</code>
            ///</summary>
            constructor Create(ATitle: String;AValue: String);
            private
                function ToJson: TJSONObject;
            public
                function Callback: TTelegramButton;
                function Keyboard: TTelegramButton;
                function Url: TTelegramButton;
                function ToJsonString : String;
        end;

        TTelegramButtons = TArray<TTelegramButton>;

        TBotUser = record
            id:String;//Int64;
            is_bot:Boolean;
            first_name:String;
            last_name:String;
            username:String;
            language_code:String;
            is_premium:Boolean;
            added_to_attachment_menu:Boolean;
            can_join_groups:Boolean;
            can_read_all_group_messages:Boolean;
            supports_inline_queries:Boolean;
            can_connect_to_business:Boolean;
            has_main_web_app:Boolean;
        end;

       TChat = record
            id : String;
            chattype: String;
            title: String;
            username: String;
            first_name: String;
            last_name: String;
            is_forum: Boolean;
        end;

       TChatMessage = record
           id : String; // int64
           from : TBotUser;
           chat: TChat;
           date: int64;
           datetime: TDateTime;
           chat_type : String;
           text: String;
       end;

        TChatUser = record
            id:String;//Int64;
            is_bot:Boolean;
            first_name:String;
            last_name:String;
            username:String;
            language_code:String;
            chat_type: String;
        end;

       TWrpLib = Class
       private

       public
         function ConvertSecondsToDateTime(secondsDateTime: int64): TDateTime;
         function TelegramButtonsToJsonString(TelegramButtons: TTelegramButtons): String; Overload;
         function TelegramButtonsToJsonString(TelegramButtons: TTelegramButtons;keys : Array of String): String;Overload;
    end;

var WrpLib : TWrpLib;

implementation

function TWrpLib.ConvertSecondsToDateTime(secondsDateTime: int64) : TDateTime;
begin
    Result := UnixToDateTime(secondsDateTime,False);  // Return UTC True == +0 , False == +7
end;

function TWrpLib.TelegramButtonsToJsonString(TelegramButtons: TTelegramButtons) : String;
var jsonArr : TJSONArray;
    jsonButton : TJSONObject;
    TelegramButton : TTelegramButton;
    key : String;
begin
    jsonArr := TJSONArray.Create;

    for TelegramButton in TelegramButtons do
        begin
           jsonArr.AddElement(TelegramButton.toJson);
        end;

    Result := jsonArr.ToJSON;
end;

function TWrpLib.TelegramButtonsToJsonString(TelegramButtons: TTelegramButtons;keys : Array of String) : String;
var jsonArr : TJSONArray;
    jsonButton : TJSONObject;
    TelegramButton : TTelegramButton;
    key : String;
begin
    {
    Keys = ['text','callback_data']
    Keys = ['text','url']
    Keys = ['text','value']
    }

    jsonArr := TJSONArray.Create;

    for TelegramButton in TelegramButtons do
        begin
            jsonArr.AddElement(
               TJSONObject.Create
                    .AddPair(keys[0],TelegramButton.Title)
                    .AddPair(keys[1],TelegramButton.Value)
                );
        end;

    Result := jsonArr.ToJSON;
end;

{ TTelegramButton }
constructor TTelegramButton.Create(ATitle, AValue: String);
begin
    inherited;
    Title := ATitle;
    Value := AValue;
end;

function TTelegramButton.ToJson(): TJSONObject;
var APairJson : TJSONObject;
begin
    APairJson := TJSONObject.Create;
    case ButtonType of
       tgbCallback : begin
                        APairJson.AddPair('text',self.Title);
                        APairJson.AddPair('callback_data',self.Value);
                     end;

       tgbUrl      : begin
                        APairJson.AddPair('text',self.Title);
                        APairJson.AddPair('url',self.Value);
                     end;

       tgbKeyboard : begin
                        APairJson.AddPair('text',self.Title);
                     end;
    end;


    Result := APairJson;

end;

function TTelegramButton.ToJsonString(): String;
begin
    case ButtonType of
       tgbCallback : Result := Format('{"text" : %s,"callback_data": %s}' ,[self.Title,self.Value]);
       tgbUrl      : Result := Format('{"text" : %s,"url": %s}' ,[self.Title,self.Value]);
       tgbKeyboard : Result := Format('{"text" : %s}' ,[self.Title]);
    end;
end;

function TTelegramButton.Callback() : TTelegramButton;
begin
    ButtonType := tgbCallback;
    Result := Self;
end;

function TTelegramButton.Url() : TTelegramButton;
begin
    ButtonType := tgbUrl;
    Result := Self;
end;

function TTelegramButton.Keyboard() : TTelegramButton;
begin
    ButtonType := tgbKeyboard;
    Result := Self;
end;

initialization
    WrpLib := TWrpLib.Create;
finalization
    wrpLib.Free;
end.
