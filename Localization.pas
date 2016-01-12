unit Localization;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TLocale = class
    protected
      FAbout: string;
      FBbAbout: string;
      FBbBrowse: string;
      FBbClose: string;
      FBbPaste: string;
      FEdOriginalFileMD5: string;
      FEdCheck: string;
      FEdDownloadedFile: string;
      FEdDownloadedFileMD5: string;
      FFmMainScreen: string;
      FLaInfo: string;
      FPleaseWait: string;
      FSumsMatch: string;
      FSumsDoNotMatch: string;
    public
      constructor Create();
      property About: string read FAbout;
      property BbAbout: string read FBbAbout;
      property BbBrowse: string read FBbBrowse;
      property BbClose: string read FBbClose;
      property BbPaste: string read FBbPaste;
      property EdOriginalFileMD5: string read FEdOriginalFileMD5;
      property EdCheck: string read FEdCheck;
      property EdDownloadedFile: string read FEdDownloadedFile;
      property EdDownloadedFileMD5: string read FEdDownloadedFileMD5;
      property FmMainScreen: string read FFmMainScreen;
      property LaInfo: string read FLaInfo;
      property PleaseWait: string read FPleaseWait;
      property SumsMatch: string read FSumsMatch;
      property SumsDoNotMatch: string read FSumsDoNotMatch;
  end;

  TPortugueseBrazilianLocale = class(TLocale)
    public
      constructor Create();
  end;

var
   Locale: TLocale;

function GetSystemLanguage(): string;

implementation

uses
  GetText;

function GetSystemLanguage(): string;
var
  Lang, FallbackLang: string;
begin
  GetLanguageIDs(Lang, FallbackLang);
  Result := FallbackLang;
end;

constructor TLocale.Create();
begin
  FAbout := 'Copyright 2016 The Linux Kamarada Project' + ^M + ^J +
    'https://kamarada.github.io/';
  FBbAbout := '&About';
  FBbBrowse := '&Browse';
  FBbClose := '&Close';
  FBbPaste := '&Paste';
  FEdCheck := 'Step 3 - Check if the MD5 checksums match';
  FEdDownloadedFile := 'Step 2 - Browse to your downloaded file';
  FEdDownloadedFileMD5 := 'Downloaded file MD5 checksum';
  FEdOriginalFileMD5 := 'Step 1 - Paste the original file MD5 checksum here';
  FFmMainScreen := 'Easy MD5 Checker';
  FLaInfo := 'This tool will allow you to verify the downloaded ISO image is ' +
    'not corrupted and has not been maliciously tampered.';
  FPleaseWait := 'Please wait, calculating the MD5 checksum of the ' +
    'downloaded file...';
  FSumsMatch := 'The MD5 checksums match';
  FSumsDoNotMatch := 'The MD5 checksums do not match';
end;

constructor TPortugueseBrazilianLocale.Create();
begin
  FAbout := 'Copyright 2016 Projeto Linux Kamarada' + ^M + ^J +
    'https://kamarada.github.io/';
  FBbAbout := '&Sobre';
  FBbBrowse := '&Procurar';
  FBbClose := '&Fechar';
  FBbPaste := '&Colar';
  FEdCheck := 'Passo 3 - Verifique se as somas de verificação MD5 conferem';
  FEdDownloadedFile := 'Passo 2 - Informe onde se encontra o arquivo baixado';
  FEdDownloadedFileMD5 := 'Soma de verificação MD5 do arquivo baixado';
  FEdOriginalFileMD5 := 'Passo 1 - Copie e cole a soma de verificação MD5 ' +
    'fornecida aqui';
  FFmMainScreen := 'Verificador MD5 Fácil';
  FLaInfo := 'Esse programa ajudará você a verificar se a imagem ISO baixada ' +
    'não foi corrompida ou adulterada.';
  FSumsMatch := 'As somas de verificação MD5 conferem';
  FSumsDoNotMatch := 'As somas de verificação MD5 não conferem';
end;

initialization
  if (UpperCase(GetSystemLanguage()) = 'PT') then
    Locale := TPortugueseBrazilianLocale.Create()
  else
    Locale := TLocale.Create();

end.

