unit usettings;

{$mode objfpc}{$H+}

{ AG_SWSEDT - usettings.pas  - Settings Form Source Code

  Copyright (C) 2013 Anoxic // Atomic Group Software

  This source is free software; you can redistribute it and/or modify it under the terms of the GNU General Public
  License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later
  version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web at
  <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing to the Free Software Foundation, Inc., 59
  Temple Place - Suite 330, Boston, MA 02111-1307, USA.
}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, utextstr, uagswos;

type

  { TSettingForm }

  TSettingForm = class(TForm)
    btBrowseData: TButton;
    btBrowExe: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    btRefrManual: TButton;
    btChaLang: TButton;
    chbUseTP: TCheckBox;
    CBShowHint: TCheckBox;
    chAutoCopyexe: TCheckBox;
    cbAutoUpd: TCheckBox;
    cbCSVString: TCheckBox;
    chUseCol: TCheckBox;
    chSafeMode: TCheckBox;
    chSelAuto: TCheckBox;
    EtotalPack: TEdit;
    EL2Frm: TEdit;
    EL2Desc: TEdit;
    EL1Frm: TEdit;
    EL1Desc: TEdit;
    ESWSExe: TEdit;
    ESWSdata: TEdit;
    grLink1: TGroupBox;
    grLink2: TGroupBox;
    grMAnual: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbSWSVer: TLabel;
    lbSWSExe: TLabel;
    lbSWSdata: TLabel;
    LBLang: TListBox;
    opee: TOpenDialog;
    PageControl1: TPageControl;
    seld: TSelectDirectoryDialog;
    tbLang: TTabSheet;
    tbLinks: TTabSheet;
    tbEditor: TTabSheet;
    tbPath: TTabSheet;
    procedure btBrowExeClick(Sender: TObject);
    procedure btBrowseDataClick(Sender: TObject);
    procedure btChaLangClick(Sender: TObject);
    procedure btRefrManualClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure chbUseTPChange(Sender: TObject);
    procedure EL1DescExit(Sender: TObject);
    procedure EL1FrmExit(Sender: TObject);
    procedure EL2DescExit(Sender: TObject);
    procedure EL2FrmExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { private declarations }
  public
    Links: array[0..1] of TSWLink;
    { public declarations }
  end;

var
  SettingForm: TSettingForm;

implementation

{$R *.frm}

uses umain;

{ TSettingForm }

procedure TSettingForm.Button1Click(Sender: TObject);
begin
  EdtSett.EditOptions := [];
  EdtSett.SWSExePath := ESWSExe.Text;
  EdtSett.SWSDataPath := CheckIsDir(ESWSdata.Text);
  if chSelAuto.Checked then
    EdtSett.EditOptions := EdtSett.EditOptions + [eoAutoSel];
  if CBShowHint.Checked then
    EdtSett.EditOptions := EdtSett.EditOptions + [eoShowHints];
  if chAutoCopyexe.Checked then
    EdtSett.EditOptions := EdtSett.EditOptions + [eoAutoCpExe];
  if cbAutoUpd.Checked then
    EdtSett.EditOptions := EdtSett.EditOptions + [eoAutoUpdate];
  if chSafeMode.Checked then
    EdtSett.EditOptions := EdtSett.EditOptions + [eoSafeMode];
  EdtSett.UseColors:=chUseCol.Checked;
  EdtSett.CSVString:=cbCSVString.Checked;
  EdtSett.Link[0] := Links[0];
  EdtSett.Link[1] := Links[1];
  EdtSett.TotalPackDir := EtotalPack.Text;
  EdtSett.UseTP := chbUseTP.Checked;
  EdtSett.WriteSett(EdtSett.FileName);
  ModalResult := mrOk;
end;

procedure TSettingForm.btBrowseDataClick(Sender: TObject);
begin
  seld.InitialDir := EdtSett.SWSDataPath;
  if seld.Execute then
    if seld.FileName <> '' then
    begin
      ESWSdata.Text := seld.FileName;
    end;
end;

procedure TSettingForm.btChaLangClick(Sender: TObject);
var
  langff:TStringList;
begin
  DefLang:=LBLang.ItemIndex;
  DefLangStr:=LangList[DefLang];
  LangFF:=TStringList.Create;
  langff.Text:=(LangList[DefLang]);
  langff.SaveToFile(MainForm.AppDir+'lang.ags');
  LangFF.Free;
  ShowMessage(rsYouMustResta);
end;

procedure TSettingForm.btRefrManualClick(Sender: TObject);
begin
  EdtSett.TotalPackDir := EtotalPack.Text;

  MainForm.LoadTP;
  if Length(TPDirectorys) < 1 then
  begin
    ShowMessage(rsNoTotalPackD);
    Exit;
  end;
  if EdtSett.TotalPackIndex < 0 then
    if MAinForm.CBTPVer.Items.Count > 0 then
      EdtSett.TotalPackIndex := 0;
  if MainForm.CBTPVer.ItemIndex > 0 then
    EdtSett.TotalPackIndex := MainForm.CBTPVer.ItemIndex;
  EdtSett.SWSDataPath := EdtSett.TotalPackDir + 'custom' + PathDelim +
    'team db' + PathDelim + TPDirectorys[EdtSett.TotalPackIndex].Path + PathDelim;
  EdtSett.SWSExePath := EdtSett.TotalPackDir + 'swos' + PathDelim + 'swos-port-Release.exe';
  SWSDB.SWSExeDir := EdtSett.SWSExePath;
  SWSDB.SWSDataDir := EdtSett.SWSDataPath;
  FormActivate(self);
end;

procedure TSettingForm.btBrowExeClick(Sender: TObject);
begin
  opee.InitialDir := EdtSett.SWSExePath;
  opee.Filter := 'Executable Files|*.exe|All Files|*.*';
  if opee.Execute then
    if opee.FileName <> '' then
    begin
      ESWSExe.Text := opee.FileName;
      SWSDB.CheckSWSVer(ESWSExe.Text);
    end;
  if ESWSExe.Text = '' then
    lbSWSVer.Caption := rsUnknownSWOSV
  else
    case SWSDB.SWSExeVer of
      SWSECE: lbSWSVer.Caption := rsSWOSVer10ECE;
      SWS9697: lbSWSVer.Caption := rsSWOSVer20969;
      SWS2020: lbSWSver.Caption := rsSWOSVer2020W;
      else
        lbSWSVer.Caption := rsUnknownSWOSV;
    end;
end;

procedure TSettingForm.Button2Click(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TSettingForm.Button3Click(Sender: TObject);
begin
  opee.Title := rsSelectSWOSTo;
  opee.Filter := 'new_total_pack.exe|*.exe';
  if opee.Execute then
    if opee.FileName <> '' then
    begin
      EtotalPack.Text := ExtractFilePath(opee.FileName);
      EdtSett.TotalPackDir := EtotalPack.Text;
    end;
end;

procedure TSettingForm.chbUseTPChange(Sender: TObject);
begin
  if chbUseTP.Checked then
  begin
    grMAnual.Enabled := False;
    EtotalPack.Enabled := True;
  end
  else
  begin
    grMAnual.Enabled := True;
    EtotalPack.Enabled := False;
  end;
end;

procedure TSettingForm.EL1DescExit(Sender: TObject);
begin
  Links[0].Desc := EL1Desc.Text;
end;

procedure TSettingForm.EL1FrmExit(Sender: TObject);
begin
  Links[0].Form := EL1Frm.Text;
end;

procedure TSettingForm.EL2DescExit(Sender: TObject);
begin
  Links[1].Desc := EL2Desc.Text;
end;

procedure TSettingForm.EL2FrmExit(Sender: TObject);
begin
  Links[1].Form := EL2Frm.Text;
end;

procedure TSettingForm.FormActivate(Sender: TObject);
var
  a: integer;
begin
  PageControl1.ActivePage:=tbPath;
  if not FileExists(EdtSett.SWSExePath) then
    EdtSett.SWSExePath := '';
  ESWSdata.Text := EdtSett.SWSDataPath;
  ESWSExe.Text := EdtSett.SWSExePath;
  chSelAuto.Checked := (eoAutoSel in EdtSett.EditOptions);
  CBShowHint.Checked := (eoShowHints in EdtSett.EditOptions);
  chAutoCopyexe.Checked := (eoAutoCpExe in EdtSett.EditOptions);
  cbAutoUpd.Checked := (eoAutoUpdate in EdtSett.EditOptions);
  chSafeMode.Checked := (eoSafeMode in EdtSett.EditOptions);
  chUseCol.Checked:= EdtSett.UseColors;
  cbCSVString.Checked:= EdtSett.CSVString;
  Links[0] := EdtSett.Link[0];
  Links[1] := EdtSett.Link[1];
  if ESWSExe.Text <> '' then BEGIN
    SWSDB.CheckSWSVer(ESWSExe.Text);
    case SWSDB.SWSExeVer of
      SWSECE: lbSWSVer.Caption := rsSWOSVer10ECE;
      SWS9697: lbSWSVer.Caption := rsSWOSVer20969;
      SWS2020: lbSWSVer.Caption := rsSWOSVer2020W;
      else
        lbSWSVer.Caption := rsUnknownSWOSV;
    end;
  END;
  if Links[1].Form = '' then
  begin
    Links[1].Form := 'https://www.transfermarkt.com/schnellsuche/ergebnis/schnellsuche?query=%s';
    Links[1].Desc := 'Find on TransferMarkt.com';
  end;
  if Links[0].Form = '' then
  begin
    Links[0].Form := 'http://en.wikipedia.org/w/index.php?search=%s';
    Links[0].Desc := 'Find on Wiki';
  end;
  EL1Desc.Text := Links[0].Desc;
  EL1Frm.Text := Links[0].Form;
  EL2Desc.Text := Links[1].Desc;
  EL2Frm.Text := Links[1].Form;
  EtotalPack.Text := EdtSett.TotalPackDir;
  chbUseTP.Checked := EdtSett.UseTP;
  LBLang.Clear;
  For a:=0 to LangList.Count-1 do
      LBLang.Items.Add(getlanguagename(LangList[a]));
  LBLang.ItemIndex:=DefLang;
end;


end.