program DemoWrpTelegramBot;

uses
  Vcl.Forms,
  UMainWrpTelegramBot in 'UMainWrpTelegramBot.pas' {FrmMainWrpTelegramBot},
  JSONTreeView in 'D:\components\DelphiJSONComponents\JSONTreeView.pas',
  UWrpTelegramBot_type in '..\src\UWrpTelegramBot_type.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMainWrpTelegramBot, FrmMainWrpTelegramBot);
  Application.Run;
end.
