{
https://core.telegram.org/bots/api
version Bot API 7.11 @ October 31, 2024

Create by Warapetch  Ruangpornvisuthi
@ Create :: 11/11/2567 (11/11/2024)
@ Last Update :: 20/11/2567 11.30
}
unit UWrpTelegramBot;

interface
    uses System.SysUtils,Vcl.Dialogs , System.Classes ,
         System.Net.HttpClientComponent ,System.Net.HttpClient,
         System.Net.Mime ,
         System.JSON, UWrpTelegramBot_Type;

const FVersion = 'Create By :: Warapetch  Ruangpornvisuthi'+#13#10+
                'Last Build :: 6711-20 11.30';

    Type
        // Event
        TWrpResponseEvent      = procedure (MethodName : String;httpResponse : IHTTPResponse;ResponseAsStr : String;ResponseAsJson : TJSonValue) of Object;
        TWrpResponseErrorEvent = procedure (MethodName : String;ErrorCode : Integer;ErrorMessage : String) of Object;
        TWrpHttpErrorEvent     = procedure (MethodName : String;ErrorMessage : String) of Object;

        // Main
        TWrpTelegramBot = Class(TComponent)

        private
            FBotToken: String;
            FBot : TBotUser;
            FOnResponse: TWrpResponseEvent;
            FOnResponseError: TWrpResponseErrorEvent;
            FOnHttpError: TWrpHttpErrorEvent;
            FShowMessageOnError: Boolean;
            FWebHookUrl: String;

            procedure setBotToken(const Value: String);
            procedure setBotData(data: TJsonValue);
            procedure SetShowMessageOnError(const Value: Boolean);

            ///<summary>
            ///<code>ตัวอย่าง :: getBotURL('/getMe')  <para/>อย่าลืม "/"
            ///</code>
            ///</summary>
            function getBotURL(method: String): String;
            function GetBot: TBotUser;
            procedure DoOnHttpError(Method, ErrorMessage: String);
            function DoOnServerResponse(Method : String;httpResponse: IHTTPResponse;NeedFullJsonResponse : Boolean = False): TJsonValue;
            function getAbout: String;
            procedure SetWebHookUrl(const Value: String);



        protected
            clientTgBot : TNetHTTPClient;
            ///<summary>
            ///<code>ตัวอย่าง :: DoGET('/getMe')  <para/>อย่าลืม "/"
            ///</code>
            ///</summary>
            function DoGET(Method: String;NeedFullJsonResponse : Boolean = True): TJSonValue;virtual;
            function DoPOST(Method : String;QueryString: String;ContentType : String = 'application/x-www-form-urlencoded'): TJSonValue; Overload; virtual;
            function DoPOST(Method : String;Data : TStringlist;ContentType : String = 'application/x-www-form-urlencoded'): TJSonValue; Overload; virtual;
            function DoPOST(Method : String;Data : TMultipartFormData;ContentType : String = 'multipart/form-data'): TJSonValue; Overload; virtual;
            function DoPOST(Method : String;Data : TStream;ContentType : String = 'application/octet-stream'): TJSonValue; Overload; virtual;

        public
            constructor create(AOwner : TComponent); Override;
            destructor destroy(); Override;

            function getMe() : TJSonValue;
            function getUpdates() : TJSonValue;
            // Base on Bot API 7.11
            function copyMessage(Payload : TStringlist) : TJSonValue;
            function sendAnimation(Payload : TStringlist) : TJSonValue;
            function sendAudio(Payload : TStringlist) : TJSonValue;
            function sendContact(Payload : TStringlist) : TJSonValue;
            function sendDice(Payload : TStringlist) : TJSonValue;
            function sendDocument(Payload : TMultipartFormData) : TJSonValue;
            function sendGame(Payload : TStringlist) : TJSonValue;
            function sendInvoice(Payload : TStringlist) : TJSonValue;
            function sendLocation(Payload : TStringlist) : TJSonValue;
            function sendMediaGroup(Payload : TStringlist) : TJSonValue;
            function sendMessage(QueryString : String): TJSonValue; Overload;
            function sendMessage(Payload : TStringlist) : TJSonValue; Overload;
            function sendMessage(ChatId : String; Text: String; ParseMode : String = 'HTML') : TJSonValue; Overload;
            function sendPaidMedia(Payload : TStringlist) : TJSonValue;
            function sendPhoto(Payload : TStringlist) : TJSonValue;
            function sendPoll(Payload : TStringlist) : TJSonValue;
            function sendSticker(Payload : TStringlist) : TJSonValue;
            function sendVenue(Payload : TStringlist) : TJSonValue;
            function sendVideo(Payload : TStringlist) : TJSonValue;
            function sendVideoNote(Payload : TStringlist) : TJSonValue;
            function sendVoice(Payload : TStringlist) : TJSonValue;

            // WebHook
            function setWebHook(Url: String = '') : TJSonValue;
            function deleteWebHook() : TJSonValue;
            function getWebhookInfo() : TJSonValue;

        published
            property About : String read getAbout;
            // Property
            property BotToken : String   read FbotToken write SetbotToken;
            property Bot      : TBotUser read GetBot;
            property WebHookUrl : String read FWebHookUrl write SetWebHookUrl;
            property ShowMessageOnError : Boolean read FShowMessageOnError write SetShowMessageOnError default True;

            // Event
            property OnResponse      : TWrpResponseEvent      read FOnResponse      write FOnResponse;
            property OnResponseError : TWrpResponseErrorEvent read FOnResponseError write FOnResponseError;
            property OnHttpError     : TWrpHttpErrorEvent     read FOnHttpError     write FOnHttpError;
    end;

procedure Register;

implementation

{ TWrpTelegramBot }
procedure Register;
begin
    RegisterComponents('Warapetch',[TWrpTelegramBot]);
end;

constructor TWrpTelegramBot.create(AOwner : TComponent);
begin
    inherited;
    FShowMessageOnError := True;
end;

destructor TWrpTelegramBot.destroy;
begin
    inherited;
end;

function TWrpTelegramBot.getBotURL(method : String): String;
begin
    //https://api.telegram.org/bot<token>/Method
    Result := Format('https://api.telegram.org/bot%s%s',[FbotToken,method]);
end;

function TWrpTelegramBot.getMe: TJSonValue;
var respJson : TJsonValue;
begin
    respJson := DoGET('/getMe',False);

    setBotData(respJson);

    Result := respJson;
end;

function TWrpTelegramBot.getUpdates: TJSonValue;
begin
    Result := DoGET('/getUpdates');
end;

function TWrpTelegramBot.copyMessage(Payload: TStringlist): TJSonValue;
begin
    Result := DoGET('/copyMessage');
end;

function TWrpTelegramBot.sendAnimation(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendAnimation',Payload);
end;

function TWrpTelegramBot.sendAudio(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendAudio',Payload);
end;

function TWrpTelegramBot.sendContact(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendContact',Payload);
end;

function TWrpTelegramBot.sendDice(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendDice',Payload);
end;

function TWrpTelegramBot.sendDocument(Payload: TMultipartFormData): TJSonValue;
begin
    Result := DoPOST('/sendDocument',Payload);
end;

function TWrpTelegramBot.sendGame(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendGame',Payload);
end;

function TWrpTelegramBot.sendInvoice(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendInvoice',Payload);
end;

function TWrpTelegramBot.sendLocation(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendLocation',Payload);
end;

function TWrpTelegramBot.sendMediaGroup(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendMediaGroup',Payload);
end;

function TWrpTelegramBot.sendMessage(QueryString : String): TJSonValue;
begin
    Result := DoPOST('/sendMessage',QueryString);
end;

function TWrpTelegramBot.sendMessage(Payload : TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendMessage',Payload);
end;

function TWrpTelegramBot.sendMessage(ChatId : String; Text: String; ParseMode : String = 'HTML') : TJSonValue;
var paramStr : String;
begin
    paramStr := Format('chat_id=%s&text=%s&parse_mode=%s',[ChatId,Text,ParseMode]);
    Result := DoPOST('/sendMessage',paramStr);
end;

function TWrpTelegramBot.sendPaidMedia(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendPaidMedia',Payload);
end;

function TWrpTelegramBot.sendPhoto(Payload : TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendPhoto',Payload);
end;

function TWrpTelegramBot.sendPoll(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendPoll',Payload);
end;

function TWrpTelegramBot.sendSticker(Payload : TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendSticker',Payload);
end;

function TWrpTelegramBot.sendVenue(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendVenue',Payload);
end;

function TWrpTelegramBot.sendVideo(Payload : TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendVideo',Payload);
end;

function TWrpTelegramBot.sendVideoNote(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendVideoNote',Payload);
end;

function TWrpTelegramBot.sendVoice(Payload: TStringlist): TJSonValue;
begin
    Result := DoPOST('/sendVoice',Payload);
end;

// getME , getUpdates
function TWrpTelegramBot.DoGET(Method : String;NeedFullJsonResponse : Boolean = True): TJSonValue;
var url : String;
    httpResponse : IHTTPResponse;
begin

    Result := NIL;
    url := getBotURL(Method);

    try
        try
           clientTgBot := TNetHTTPClient.Create(NIL);
           clientTgBot.CustHeaders['Content-Type'] := 'application/json';
           //-- GET
           httpResponse := clientTgBot.GET(url);
           //-- Response
           Result := DoOnServerResponse(Method,httpResponse,NeedFullJsonResponse);

        except
        on E : ENetHTTPClientException do
            begin
               DoOnHttpError(Method,E.Message);
            end;
        end;

    finally
       FreeAndNil(clientTgBot);
    end;

end;

// [ String ]
function TWrpTelegramBot.DoPOST(Method : String;QueryString : String;
    ContentType : String = 'application/x-www-form-urlencoded'): TJSonValue;

var url : String;
    httpResponse : IHTTPResponse;
    payload : TStringlist;

begin
    Result := NIL;
    // Get URL
    url := getBotURL(Method);

    try
        try
           payload := TStringlist.Create;
           payload.Add(QueryString);
           payload.Text := StringReplace(payload.Text,'&',#13#10,[rfReplaceAll]);

           clientTgBot := TNetHTTPClient.Create(NIL);
           clientTgBot.CustHeaders['Content-Type'] := ContentType;
           //-- POST
           httpResponse := clientTgBot.POST(url,payload);
           //-- Response
           Result := DoOnServerResponse(Method,httpResponse);

        except
        on E : ENetHTTPClientException do
            begin
               DoOnHttpError(Method,E.Message);
            end;
        end;

    finally
       FreeAndNil(payload);
       FreeAndNil(clientTgBot);
    end;

end;

// [ TStrings ]
function TWrpTelegramBot.DoPOST(Method : String; Data : TStringlist;
    ContentType : String = 'application/x-www-form-urlencoded'): TJSonValue;

var url : String;
    httpResponse : IHTTPResponse;
begin
    Result := NIL;
    // Get URL
    url := getBotURL(Method);

    try
        try
           clientTgBot := TNetHTTPClient.Create(NIL);
           clientTgBot.CustHeaders['Content-Type'] := ContentType;
           //-- POST
           httpResponse := clientTgBot.POST(url,Data);
           //-- Response
           Result := DoOnServerResponse(Method,httpResponse);

        except
        on E : ENetHTTPClientException do
            begin
               DoOnHttpError(Method,E.Message);
            end;
        end;

    finally
       FreeAndNil(clientTgBot);
    end;

end;


// Send Files
function TWrpTelegramBot.DoPOST(Method : String;Data : TMultipartFormData;
    ContentType : String = 'multipart/form-data'): TJSonValue;

var url: String;
    httpResponse : IHTTPResponse;
begin
    Result := NIL;
    // Get URL
    url := getBotURL(Method);

    try
        try
           clientTgBot := TNetHTTPClient.Create(NIL);
           clientTgBot.CustHeaders['Content-Type'] := ContentType;
           //-- POST
           httpResponse := clientTgBot.POST(url,Data);
           //-- Response
           Result := DoOnServerResponse(Method,httpResponse);

        except
        on E : ENetHTTPClientException do
            begin
               DoOnHttpError(Method,E.Message);
            end;
        end;

    finally
       FreeAndNil(clientTgBot);
    end;

end;

// Send SomeThing ?? as Stream [Openwide]
function TWrpTelegramBot.DoPOST(Method : String;Data : TStream;
    ContentType : String = 'application/octet-stream'): TJSonValue;

var url : String;
    httpResponse : IHTTPResponse;
begin
    Result := NIL;
    // Get URL
    url := getBotURL(Method);

    try
        try
           clientTgBot := TNetHTTPClient.Create(NIL);
           clientTgBot.CustHeaders['Content-Type'] := ContentType;
           //-- POST
           httpResponse := clientTgBot.POST(url,Data);
           //-- Response
           Result := DoOnServerResponse(Method,httpResponse);

        except
        on E : ENetHTTPClientException do
            begin
               DoOnHttpError(Method,E.Message);
            end;
        end;

    finally
       FreeAndNil(clientTgBot);
    end;

end;

function TWrpTelegramBot.getAbout: String;
begin
    Result := FVersion;
end;

procedure TWrpTelegramBot.DoOnHttpError(Method : String;ErrorMessage : String);
begin
    if FShowMessageOnError then
       ShowMessage('NetHTTPClient/HTTP/Server Error !!'+#13#10+
            'Method: '+Method+#13#10+
            'ErrorDesc: '+ErrorMessage
            );

    // Event
    If Assigned(FOnHttpError) then
       FOnHttpError(Method,ErrorMessage);
end;

function TWrpTelegramBot.DoOnServerResponse(Method : String;httpResponse : IHTTPResponse;NeedFullJsonResponse : Boolean = False) : TJsonValue;
var respStr ,respOK : String;
    respJson : TJsonValue;
begin
    respStr  := httpResponse.ContentAsString(TEncoding.UTF8);
    respJson := TJsonObject.ParseJSONValue(respStr);
    // Default Result
    Result := respJson;

    // Event
    if Assigned(FOnResponse) then
       begin
          FOnResponse(Method, httpResponse, respStr, respJson);
       end;

    // check Response 'OK' ? >> true / false
    respOK := respJson.GetValue<String>('ok');
    if respOK = 'true' then
       begin
          // Get Start from 'Result'
          if NeedFullJsonResponse = false then
             respJson := respJson.GetValue<TJSonValue>('result');

          Result := respJson;
       end
    else
    begin
        var errorCode := respJson.GetValue<Integer>('error_code');
        var errorDesc := respJson.GetValue<String>('description');

        if FShowMessageOnError then
           ShowMessage('Response Error !!'+#13#10+
            'ErrorCode: '+errorCode.ToString+#13#10+
            'ErrorDesc: '+errorDesc
            ) ;

        // Event
        if Assigned(FOnResponseError) then
           FOnResponseError(Method, errorCode,errorDesc);
    end;
end;

function TWrpTelegramBot.GetBot: TBotUser;
begin
    Result := FBot;
end;

procedure TWrpTelegramBot.setBotData(data : TJsonValue);
var ID : String;//Int64;
    first_name, last_name , username ,
    language_code  : String;

    can_join_groups,
    can_read_all_group_messages,
    supports_inline_queries,
    can_connect_to_business,
    has_main_web_app,
    added_to_attachment_menu : Boolean;

begin
    // Json Start from 'result'
    data.TryGetValue('id',ID);
    data.TryGetValue('first_name',first_name); // Alias Name
    data.TryGetValue('last_name',last_name);
    data.TryGetValue('username',username);    // Unique Name
    data.TryGetValue('language_code',language_code);
    data.TryGetValue('can_join_groups',can_join_groups);
    data.TryGetValue('can_read_all_group_messages',can_read_all_group_messages);
    data.TryGetValue('supports_inline_queries',supports_inline_queries);
    data.TryGetValue('can_connect_to_business',can_connect_to_business);
    data.TryGetValue('has_main_web_app',has_main_web_app);
    data.TryGetValue('added_to_attachment_menu',added_to_attachment_menu);

    FBot.ID                 := ID;
    FBot.first_name         := first_name;  // Alias
    FBot.last_name          := last_name;
    FBot.username           := username;    // ID ,Unique Name
    FBot.language_code      := language_code;
    FBot.can_join_groups    := can_join_groups;
    FBot.can_read_all_group_messages := can_read_all_group_messages;
    FBot.supports_inline_queries  := supports_inline_queries;
    FBot.can_connect_to_business  := can_connect_to_business;
    FBot.has_main_web_app         := has_main_web_app;
    FBot.added_to_attachment_menu := added_to_attachment_menu;
end;

procedure TWrpTelegramBot.setBotToken(const Value: String);
begin
  FBotToken := Value;
end;

procedure TWrpTelegramBot.SetShowMessageOnError(const Value: Boolean);
begin
  FShowMessageOnError := Value;
end;

function TWrpTelegramBot.deleteWebHook: TJSonValue;
var payload : TStringlist;
begin
    payload := TStringlist.Create;
    Result := DoPOST('/deleteWebHook',payload);
    FreeAndNil(payload);
end;

function TWrpTelegramBot.getWebhookInfo: TJSonValue;
begin
    Result := DoGET('/getWebhookInfo');
end;

function TWrpTelegramBot.setWebHook(Url: String = ''): TJSonValue;
var payload : TStringlist;
begin
    if (Url = '') then  // use property WebHookUrl
       Url := FWebHookUrl;

    if (Url = '') then
       begin
          ShowMessage('ต้องกำหนดค่า Property WebHookUrl หรือ ส่ง พารามิเตอร์ ก่อน !!');
          exit;
       end;

    payload := TStringlist.Create;
    payload.Add('url='+url);
    Result := DoPOST('/setWebHook',payload);
    FreeAndNil(payload);
end;

procedure TWrpTelegramBot.SetWebHookUrl(const Value: String);
begin
  FWebHookUrl := Value;
end;

end.
