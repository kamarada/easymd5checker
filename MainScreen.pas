unit MainScreen;

{$mode objfpc}{$H+}

interface

uses
  {Classes, SysUtils, FileUtil, }Forms, {Controls, }Graphics, Dialogs, StdCtrls,
  ExtCtrls, {Menus, }Buttons;

type

  { TFmMainScreen }

  TFmMainScreen = class(TForm)
    ImInfo: TImage;
    LaInfo: TLabel;
    BbAbout: TBitBtn;
    EdOriginalFileMD5: TLabeledEdit;
    BbPaste: TBitBtn;
    EdDownloadedFile: TLabeledEdit;
    BbBrowse: TBitBtn;
    EdDownloadedFileMD5: TLabeledEdit;
    EdCheck: TLabeledEdit;
    BbClose: TBitBtn;
    DgBrowse: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure BbAboutClick(Sender: TObject);
    procedure EdOriginalFileMD5Change(Sender: TObject);
    procedure BbPasteClick(Sender: TObject);
    procedure BbBrowseClick(Sender: TObject);
    procedure BbCloseClick(Sender: TObject);
  private
    { private declarations }
    procedure Check();
    procedure TranslateInterface();
  public
    { public declarations }
  end;

var
  FmMainScreen: TFmMainScreen;

implementation

{$R *.lfm}

uses
  Localization, MD5;

procedure TFmMainScreen.Check();
begin
  if ((EdOriginalFileMD5.Text <> '') and (EdDownloadedFile.Text <> '')) then
  begin
    if (EdOriginalFileMD5.Text = EdDownloadedFileMD5.Text) then
    begin
      EdCheck.Text := Locale.SumsMatch;
      EdCheck.Color := clGreen;
      EdCheck.Font.Color := clWhite;
    end
    else
    begin
      EdCheck.Text := Locale.SumsDoNotMatch;
      EdCheck.Color := clRed;
      EdCheck.Font.Color := clWhite;
    end;
  end;
end;

procedure TFmMainScreen.TranslateInterface();
begin
  Application.Title := Locale.FmMainScreen;
  Caption := Locale.FmMainScreen;
  LaInfo.Caption := Locale.LaInfo;
  BbAbout.Caption := Locale.BbAbout;
  EdOriginalFileMD5.EditLabel.Caption := Locale.EdOriginalFileMD5;
  BbPaste.Caption := Locale.BbPaste;
  EdDownloadedFile.EditLabel.Caption := Locale.EdDownloadedFile;
  BbBrowse.Caption := Locale.BbBrowse;
  EdDownloadedFileMD5.EditLabel.Caption := Locale.EdDownloadedFileMD5;
  EdCheck.EditLabel.Caption := Locale.EdCheck;
  BbClose.Caption := Locale.BbClose;
end;

procedure TFmMainScreen.FormCreate(Sender: TObject);
begin
  TranslateInterface();
end;

procedure TFmMainScreen.BbAboutClick(Sender: TObject);
begin
  ShowMessage(Locale.About);
end;

procedure TFmMainScreen.EdOriginalFileMD5Change(Sender: TObject);
begin
  Check();
end;

procedure TFmMainScreen.BbPasteClick(Sender: TObject);
begin
  EdOriginalFileMD5.Clear();
  EdOriginalFileMD5.PasteFromClipboard();
end;

procedure TFmMainScreen.BbBrowseClick(Sender: TObject);
begin
  if DgBrowse.Execute() then
  begin
    EdDownloadedFile.Text := DgBrowse.FileName;
    EdDownloadedFileMD5.Text := Locale.PleaseWait;
    EdDownloadedFileMD5.Text := MD5Print(MD5File(EdDownloadedFile.Text));
    Check();
  end;
end;

procedure TFmMainScreen.BbCloseClick(Sender: TObject);
begin
  Close();
end;

end.

