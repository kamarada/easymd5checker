program EasyMD5Checker;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, MainScreen, Localization
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Easy MD5 Checker';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TFmMainScreen, FmMainScreen);
  Application.Run;
end.

