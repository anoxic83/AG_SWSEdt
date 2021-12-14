unit uabout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, utextstr, LCLIntf, fpjson, jsonparser, uagswos, strutils, httpsend, ssl_openssl;

type

  { TAboutFrm }

  TAboutFrm = class(TForm)
    btAbCheck: TButton;
    Image1: TImage;
    lbabbug: TLabel;
    lbAbCopy: TLabel;
    lbAbSup: TLabel;
    lbAbCod: TLabel;
    lbAbPrgVer: TLabel;
    lbAbPrgName: TLabel;
    procedure btAbCheckClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    EUpdate: boolean;
    UpdNow: boolean;
    VerHTTP: THTTPSend;
    function GetStrVersion(WithBuild: boolean = True): string;
    function CheckForUpd(): boolean;

    { public declarations }
  end;

var
  AboutFrm: TAboutFrm;

implementation

{$R *.frm}

uses umain;

{ TAboutFrm }

procedure TAboutFrm.FormActivate(Sender: TObject);
begin
  lbAbPrgName.Caption := 'AG-SWSEdt';
  lbAbPrgVer.Caption := GetStrVersion();
  lbAbCod.Caption := 'Programming: Anoxic';
  lbAbSup.Caption := 'Thanks for Support: Bliszka, Tom+ (www.swos.pl)';
  lbAbBug.Caption := Format(rsPleaseReport, ['https://github.com/anoxic83/AG_SWSEdt']);
  lbAbCopy.Caption :=
    '© 2013-21 Anoxic . All rights reserved. Upper Silesia. Poland. License: GPL3';
  if (eoAutoUpdate in EdtSett.EditOptions) then
  begin
    UpdNow := True;
    EUpdate := CheckForUpd();
  end
  else
  begin
    btAbCheck.Caption := rsCheckForUpda;
    btAbCheck.Enabled := True;
  end;

  if UpdNow then
    if EUpdate then
    begin
      btAbCheck.Caption := rsClickToVisit;
      btAbCheck.Enabled := True;
    end
    else
    begin
      btAbCheck.Caption := rsSWSEdtIsIsAl;
      btAbCheck.Enabled := False;
    end;

end;

procedure TAboutFrm.btAbCheckClick(Sender: TObject);
begin
  if UpdNow then
    OpenURL('https://github.com/anoxic83/AG_SWSEdt')
  else
  begin
    EUpdate := CheckForUpd();
    UpdNow := True;
    FormActivate(self);
  end;
end;

procedure TAboutFrm.FormCreate(Sender: TObject);
begin
end;

function TAboutFrm.GetStrVersion(WithBuild: boolean): string;
var
  TmpStr: string;
begin
  TmpStr := '';
  TmpStr := IntToStr(Hi(hi(umain.SWSEdtVer)));
  TmpStr := TmpStr + '.' + IntToStr(Lo(Hi(umain.SWSEdtVer)));
  TmpStr := TmpStr + '.' + IntToStr(Hi(Lo(umain.SWSEdtVer)));
  if WithBuild then
    TmpStr := TmpStr + ' build ' + IntToStr(Lo(Lo(umain.SWSEdtVer)));
  Result := TmpStr;

end;

function TAboutFrm.CheckForUpd: boolean;
var
  StrV, StrVV: string;

  IntV: Integer;
  js : TJSONData;
  jobjl: TJSONObject;
begin
  Result := False;
  VerHTTP := THTTPSend.Create;
  VerHTTP.Sock.CreateWithSSL(TSSLOpenSSL);
  VerHTTP.Sock.SSLDoConnect();
  with VerHTTP do
  begin
    if HTTPMethod('GET', 'https://api.github.com/repos/anoxic83/AG_SWSEdt/releases/latest') then
    begin
      js := GetJSON(Document);
      jobjl := js as TJSONObject;
      StrV := jobjl.Get('name');
      IntV := Pos('v', StrV);
      StrVV:= Copy(StrV, IntV, Length(StrV)-IntV+1);
      if (SWSStrVer <> StrVV) then
        Result := True
      else
        Result := False;
    end
    else
    begin
      ShowMessage(rsSerwerNotRes);
      Result := False;
    end;
  end;
  VerHTTP.Sock.SSLDoShutdown();
  VerHTTP.Free;
end;

end.
