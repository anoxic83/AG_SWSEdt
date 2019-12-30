unit ulgstufrm;

{$mode objfpc}{$H+}

{ AG_SWSEDT - ulgestufrm.pas  - League Structure Form Source File

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
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  utextstr, uagswos, LCLType, Spin, ComCtrls;

type

  { TForm2 }

  { TLgeStrForm }

  TLgeStrForm = class(TForm)
    btCmSav: TButton;
    btExtoutSav: TButton;
    Button1: TButton;
    cbStMon: TComboBox;
    cbEnMon: TComboBox;
    cbpossub: TComboBox;
    cbFromSub: TComboBox;
    cbDiv: TComboBox;
    EcmpNr: TEdit;
    ECmpID: TEdit;
    Ediv: TEdit;
    Erelpo: TEdit;
    Erel: TEdit;
    Eprompo: TEdit;
    eprom: TEdit;
    eteams: TEdit;
    epts: TEdit;
    EmeT: TEdit;
    gbcomp: TGroupBox;
    grDivs: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lbrelpo: TLabel;
    lbRel: TLabel;
    lbprompo: TLabel;
    lbProm: TLabel;
    lbTeams: TLabel;
    lbPts: TLabel;
    lbFromSub: TLabel;
    lbPosSub: TLabel;
    lbMeT: TLabel;
    lbEnMon: TLabel;
    lbStMon: TLabel;
    lbCompNr: TLabel;
    UpDown1: TUpDown;
    procedure btCmSavClick(Sender: TObject);
    procedure btExtoutSavClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbDivChange(Sender: TObject);
    procedure cbEnMonChange(Sender: TObject);
    procedure cbFromSubChange(Sender: TObject);
    procedure cbpossubChange(Sender: TObject);
    procedure cbStMonChange(Sender: TObject);
    procedure EmeTExit(Sender: TObject);
    procedure epromExit(Sender: TObject);
    procedure EprompoExit(Sender: TObject);
    procedure eptsExit(Sender: TObject);
    procedure ErelExit(Sender: TObject);
    procedure ErelpoExit(Sender: TObject);
    procedure eteamsExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    { private declarations }
  public
    ActDiv: byte;
    procedure LoadLig(Fadd: longword);
    procedure Unloadlig(Awrite: boolean = False);
    procedure RefrLeag;
    { public declarations }
  end;

var
  LgeStrForm: TLgeStrForm;

implementation

uses umain;

{$R *.frm}

{ TForm2 }

procedure TLgeStrForm.cbDivChange(Sender: TObject);
begin
  if (cbDiv.ItemIndex<0)or(cbdiv.ItemIndex>cbdiv.Items.Count-1) then exit;
  ActDiv := cbDiv.ItemIndex;
  RefrLeag;
end;

procedure TLgeStrForm.btCmSavClick(Sender: TObject);
var
  TmpS: String;
begin
  if (SWSDB.SWSFiles[SWSDB.FileIndex].League.Leagues <> SWSDB.SWSFiles[SWSDB.FileIndex].League.OrginalDivisions) then begin
    Application.MessageBox(PChar(rsChangedDivCo),'Error',MB_OK);
    Exit;
  end;
  SWSDB.SWSFiles[SWSDB.FileIndex].League.WriteData;
  if (EdtSett.UseTP) then
  TmpS:='Saved To SWS++ Executable: '
  else
  tmpS:='Saved To SWS Executable: ';
  TmpS:=TmpS+#13+ExtractFilePath(SWSDB.SWSFiles[SWSDB.FileIndex].League.SWSExePath);
  if (EdtSett.UseTP) and (eoAutoCpExe in EdtSett.EditOptions) then begin
    SWSDB.SWSFiles[SWSDB.FileIndex].League.WriteData(
      EdtSett.SWSDataPath + 'exe' + PathDelim + 'sws.exe');
    TmpS:=TmpS+#13+'and SWS Executable: ';
    TmpS:=TmpS+#13+(EdtSett.SWSDataPath + 'exe');
  end;
  if (eoShowHints in EdtSett.EditOptions) then
    Application.MessageBox(Pchar(TmpS),'Saved',MB_OK);
  Close;
end;

procedure TLgeStrForm.btExtoutSavClick(Sender: TObject);
begin
  Close;
end;

procedure TLgeStrForm.Button1Click(Sender: TObject);
begin
  SWSDB.SWSFiles[SWSDB.FileIndex].League.CreatePatch();
end;

procedure TLgeStrForm.cbEnMonChange(Sender: TObject);
begin
  if (cbEnMon.ItemIndex<0)or(cbEnMon.ItemIndex>cbenMon.Items.Count-1) then exit;
  SWSDB.SWSFiles[SWSDB.FileIndex].League.EndMonth := cbEnMon.ItemIndex;
  RefrLeag;
end;

procedure TLgeStrForm.cbFromSubChange(Sender: TObject);
begin
  if (cbFromSub.ItemIndex<0)or(cbFromSub.ItemIndex>cbFromSub.Items.Count-1) then exit;
  if cbpossub.ItemIndex>cbFromSub.ItemIndex then
    cbpOSSub.ItemIndex:=cbFromSub.ItemIndex;
  SWSDB.SWSFiles[SWSDB.FileIndex].League.FromSubs := cbFromSub.ItemIndex;
end;

procedure TLgeStrForm.cbpossubChange(Sender: TObject);
begin
  if (cbpossub.ItemIndex<0)or(cbpossub.ItemIndex>cbpossub.Items.Count-1) then exit;
  if cbpossub.ItemIndex>cbFromSub.ItemIndex then
    cbFromSub.ItemIndex:=cbpossub.ItemIndex;
  SWSDB.SWSFiles[SWSDB.FileIndex].League.PossibleSubs := cbpossub.ItemIndex;
end;

procedure TLgeStrForm.cbStMonChange(Sender: TObject);
begin
  if (cbStMon.ItemIndex<0)or(cbStMon.ItemIndex>cbStMon.Items.Count-1) then exit;
  SWSDB.SWSFiles[SWSDB.FileIndex].League.BeginMonth := cbStMon.ItemIndex;
  RefrLeag;
end;

procedure TLgeStrForm.EmeTExit(Sender: TObject);
var
  tn: integer;
begin
  if trystrtoint(emet.Text, tn) then
  begin
    if (tn > 10) then
      tn := 10;
    if (tn < 1) then
      tn := 1;
    SWSDB.SWSFiles[SWSDB.FileIndex].League.MatchEachTime := tn;
  end
  else
    ShowMessage(rsThisValueMus);
  RefrLeag;
end;

procedure TLgeStrForm.epromExit(Sender: TObject);
var
  tn: integer;
begin
  if trystrtoint(eprom.Text, tn) then
  begin
    if (tn > SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[actdiv].Teams) then
      tn := SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[actdiv].Teams;
    if (tn < 0) then
      tn := 0;
    SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[ActDiv].Promotion := tn;
  end
  else
    ShowMessage(rsThisValueMus);
end;

procedure TLgeStrForm.EprompoExit(Sender: TObject);
var
  tn: integer;
begin
  if trystrtoint(Eprompo.Text, tn) then
  begin
    if (tn > SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[actdiv].Teams) then
      tn := SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[actdiv].Teams;
    if (tn < 0) then
      tn := 0;
    SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[ActDiv].Promotion_PO := tn;
  end
  else
    ShowMessage(rsThisValueMus);

end;

procedure TLgeStrForm.eptsExit(Sender: TObject);
var
  tn: integer;
begin
  if trystrtoint(epts.Text, tn) then
  begin
    if (tn > 3) then
      tn := 3;
    if (tn < 2) then
      tn := 2;
    SWSDB.SWSFiles[SWSDB.FileIndex].League.PtsForWin := tn;
  end
  else
    ShowMessage(rsThisValueMus);
  RefrLeag;

end;

procedure TLgeStrForm.ErelExit(Sender: TObject);
var
  tn: integer;
begin
  if trystrtoint(Erel.Text, tn) then
  begin
    if (tn > SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[actdiv].Teams) then
      tn := SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[actdiv].Teams;
    if (tn < 0) then
      tn := 0;
    SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[ActDiv].Relegation := tn;
  end
  else
    ShowMessage(rsThisValueMus);

end;

procedure TLgeStrForm.ErelpoExit(Sender: TObject);
var
  tn: integer;
begin
  if trystrtoint(Erelpo.Text, tn) then
  begin
    if (tn > SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[actdiv].Teams) then
      tn := SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[actdiv].Teams;
    if (tn < 0) then
      tn := 0;
    SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[ActDiv].Relegation_PO := tn;
  end
  else
    ShowMessage(rsThisValueMus);

end;

procedure TLgeStrForm.eteamsExit(Sender: TObject);
var
  tn: integer;
begin
  if trystrtoint(eteams.Text, tn) then
  begin
    if (tn > 99) then
      tn := 99;
    if (tn < 2) then
      tn := 2;
    if (tn mod 2) <> 0 then
    begin
      ShowMessage(rsSWOSWorksOnl);
      tn := tn + 1;
      eteams.Text := IntToStr(tn);
    end;
    SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[ActDiv].Teams := tn;
  end
  else
    ShowMessage(rsThisValueMus);
end;

procedure TLgeStrForm.FormActivate(Sender: TObject);
begin
  LoadLig(SWSDB.SWSFiles[SWSDB.FileIndex].League.Address);
  RefrLeag;
end;

procedure TLgeStrForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
end;

procedure TLgeStrForm.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then begin
    if not SWSDB.SWSFiles[SWSDB.FileIndex].League.AddDivision() then
       Application.MessageBox('Max Divions is 4','League');
    RefrLeag;
  end;

  if Button = btPrev then begin
    if not SWSDB.SWSFiles[SWSDB.FileIndex].League.DelDivision() then
      Application.MessageBox('Minimum One Division.','League');
    RefrLeag;
  end;
end;

procedure TLgeStrForm.LoadLig(Fadd: longword);
begin
  SWSDB.SWSFiles[SWSDB.FileIndex].League.ReadData;
  ActDiv := 0;
end;

procedure TLgeStrForm.Unloadlig(Awrite: boolean);
begin
  if Awrite then
    SWSDB.SWSFiles[SWSDB.FileIndex].League.WriteData;
end;

procedure TLgeStrForm.RefrLeag;
var
  i: integer;
begin
  ECmpID.Text := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].League.Competition);
  EcmpNr.Text := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].League.SWSTeamNr);
  cbStMon.Clear;
  cbEnMon.Clear;
  for i := 0 to 23 do
  begin
    cbStMon.Items.Add(swsMonth[i]);
    cbEnMon.Items.Add(swsMonth[i]);
  end;
  cbStMon.ItemIndex := SWSDB.SWSFiles[SWSDB.FileIndex].League.BeginMonth;
  cbEnMon.ItemIndex := SWSDB.SWSFiles[SWSDB.FileIndex].League.EndMonth;
  emet.Text := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].League.MatchEachTime);
  epts.Text := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].League.PtsForWin);
  cbFromSub.Clear;
  for i := 0 to 5 do
  begin
    cbFromSub.Items.Add(IntToStr(i));
  end;
  cbFromSub.ItemIndex := SWSDB.SWSFiles[SWSDB.FileIndex].League.FromSubs;
  cbpossub.Clear;
  for i := 0 to SWSDB.SWSFiles[SWSDB.FileIndex].League.FromSubs do
  begin
    cbpossub.Items.Add(IntToStr(i));
  end;
  cbpossub.ItemIndex := SWSDB.SWSFiles[SWSDB.FileIndex].League.PossibleSubs;
  EDiv.Text:=IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].League.Leagues);
  //DIVISIONS
  cbDiv.Clear;
  for i := 0 to SWSDB.SWSFiles[SWSDB.FileIndex].League.Leagues - 1 do
    cbDiv.Items.Add(CDiv[i]);
  cbDiv.ItemIndex := ActDiv;
  eTeams.Text := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[ActDiv].Teams);
  eProm.Text := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].League.Division
    [ActDiv].Promotion);
  Eprompo.Text := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[
    ActDiv].Promotion_PO);
  Erel.Text := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[
    ActDiv].Relegation);
  Erelpo.Text := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].League.Division[
    ActDiv].Relegation_PO);
end;

end.
