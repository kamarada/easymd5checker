unit MainScreen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Menus, Buttons;

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
    procedure BbAboutClick(Sender: TObject);
    procedure EdOriginalFileMD5Change(Sender: TObject);
    procedure BbPasteClick(Sender: TObject);
    procedure BbBrowseClick(Sender: TObject);
    procedure BbCloseClick(Sender: TObject);
  private
    { private declarations }
    procedure Check();
  public
    { public declarations }
  end;

var
  FmMainScreen: TFmMainScreen;

implementation

{$R *.lfm}

uses
  MD5;

procedure TFmMainScreen.Check();
begin
  if ((EdOriginalFileMD5.Text <> '') and (EdDownloadedFile.Text <> '')) then
  begin
    if (EdOriginalFileMD5.Text = EdDownloadedFileMD5.Text) then
    begin
      EdCheck.Text := 'The MD5 checksums match';
      EdCheck.Color := clGreen;
      EdCheck.Font.Color := clWhite;
    end
    else
    begin
      EdCheck.Text := 'The MD5 checksums do not match';
      EdCheck.Color := clRed;
      EdCheck.Font.Color := clWhite;
    end;
  end;
end;

procedure TFmMainScreen.BbAboutClick(Sender: TObject);
begin
  ShowMessage('Copyright 2015 The Linux Kamarada Project' + ^M + ^J +
    'https://kamarada.github.io/');
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
    EdDownloadedFileMD5.Text := 'Please wait, calculating the MD5 checksum ' +
      'of the downloaded file...';
    EdDownloadedFileMD5.Text := MD5Print(MD5File(EdDownloadedFile.Text));
    Check();
  end;
end;

procedure TFmMainScreen.BbCloseClick(Sender: TObject);
begin
  Close();
end;

end.

