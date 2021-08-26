unit ueccfrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Menus, utextstr, uagswos;

type

  { TECCFrm }

  TECCFrm = class(TForm)
    btGenTMDCL: TButton;
    btGenTMDCL1: TButton;
    btGenTMDCL2: TButton;
    btnGenClip: TButton;
    btnGenClip1: TButton;
    btnGenClip2: TButton;
    Button1: TButton;
    Button2: TButton;
    grCL: TGroupBox;
    grCWC: TGroupBox;
    grInfo: TGroupBox;
    grUEFA: TGroupBox;
    Label1: TLabel;
    lbCL: TListBox;
    lbCWC: TListBox;
    lbUEFA: TListBox;
    MPEReplace: TMenuItem;
    PoMenuECC: TPopupMenu;
    procedure btGenTMDCL1Click(Sender: TObject);
    procedure btGenTMDCL2Click(Sender: TObject);
    procedure btGenTMDCLClick(Sender: TObject);
    procedure btnGenClip1Click(Sender: TObject);
    procedure btnGenClip2Click(Sender: TObject);
    procedure btnGenClipClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lbCLClick(Sender: TObject);
    procedure lbCWCClick(Sender: TObject);
    procedure lbUEFAClick(Sender: TObject);
    procedure MPEReplaceClick(Sender: TObject);
  private
    { private declarations }
  public
    CupID: integer;
    TeamID: integer;
    procedure ReList;
    { public declarations }
  end;

var
  ECCFrm: TECCFrm;

implementation

uses umain;

{$R *.frm}

{ TECCFrm }

procedure TECCFrm.FormActivate(Sender: TObject);
begin
  ReList;
end;

procedure TECCFrm.lbCLClick(Sender: TObject);
begin
  CupID:=1;
  if (lbCL.ItemIndex<0)or(lbCL.ItemIndex>lbCL.Count-1) then exit;
  TeamID:=lbCL.ItemIndex;
end;

procedure TECCFrm.lbCWCClick(Sender: TObject);
begin
   CupID:=2;
  if (lbCWC.ItemIndex<0)or(lbCWC.ItemIndex>lbCWC.Count-1) then exit;
  TeamID:=lbCWC.ItemIndex;
end;

procedure TECCFrm.lbUEFAClick(Sender: TObject);
begin
  CupID:=3;
  if (lbUEFA.ItemIndex<0)or(lbUEFA.ItemIndex>lbUEFA.Count-1) then exit;
  TeamID:=lbUEFA.ItemIndex;
end;

procedure TECCFrm.MPEReplaceClick(Sender: TObject);
begin
  if SWSDB.Clipboard.TeamCount<1 then begin
     ShowMessage(rsMustBeOnTeam);
     Exit;
  end;
  if not((SWSDB.Clipboard.Team[0].Nation<42)or(SWSDB.Clipboard.Team[0].Nation=78)or(SWSDB.Clipboard.Team[0].Nation=76)) then begin
     ShowMessage(rsMustBeAEurop);
     Exit;
  end;
  case CupID of
       1: SWSDB.EuropeanCups.ChampionLeague[TeamID]:=SWSDb.Clipboard.Team[0];
       2: SWSDB.EuropeanCups.CupWinnersCup[TeamID]:=SWSDb.Clipboard.Team[0];
       3: SWSDB.EuropeanCups.UEFACup[TeamID]:=SWSDb.Clipboard.Team[0];
  end;
  ReList;
end;

procedure TECCFrm.btGenTMDCLClick(Sender: TObject);
var
  a, k: integer;
begin
  For a:=0 to SWSDB.FileCount-1 do
   if SWSDB.SWSFiles[a].isTMD then begin
     For k:=0 to 15 do
     SWSDB.SWSFiles[a].Team[k].Assign(SWSDB.EuropeanCups.ChampionLeague[k]);
     ShowMessage(rsTMDFileGener);
     Exit;
  end;
end;

procedure TECCFrm.btnGenClip1Click(Sender: TObject);
var
  a: integer;
begin
  if SWSDB.Clipboard.TeamCount<>32 then begin
     ShowMessage(rsMustBe32Team);
     Exit;
  end;
  For a:=0 to 31 do
  if not((SWSDB.Clipboard.Team[a].Nation<42)or(SWSDB.Clipboard.Team[a].Nation=78)or(SWSDB.Clipboard.Team[a].Nation=76)) then begin
     ShowMessage(rsMustBeAEurop);
     Exit;
  end;

  For a:=0 to 31 do
      SWSDB.EuropeanCups.CupWinnersCup[a]:=SWSDB.Clipboard.Team[a];
  Relist;
end;

procedure TECCFrm.btnGenClip2Click(Sender: TObject);
var
  a: integer;
begin
  if SWSDB.Clipboard.TeamCount<>32 then begin
     ShowMessage(rsMustBe32Team);
     Exit;
  end;
  For a:=0 to 31 do
  if not((SWSDB.Clipboard.Team[a].Nation<42)or(SWSDB.Clipboard.Team[a].Nation=78)or(SWSDB.Clipboard.Team[a].Nation=76)) then begin
     ShowMessage(rsMustBeAEurop);
     Exit;
  end;
  For a:=0 to 31 do
      SWSDB.EuropeanCups.UEFACup[a]:=SWSDB.Clipboard.Team[a];
  Relist;

end;

procedure TECCFrm.btGenTMDCL1Click(Sender: TObject);
var
  a, k: integer;
begin
  For a:=0 to SWSDB.FileCount-1 do
   if SWSDB.SWSFiles[a].isTMD then begin
     For k:=0 to 31 do
     SWSDB.SWSFiles[a+1].Team[k].Assign(SWSDB.EuropeanCups.CupWinnersCup[k]);
     ShowMessage(rsTMDFileGener);
     Exit;
  end;
end;

procedure TECCFrm.btGenTMDCL2Click(Sender: TObject);
var
  a, k: integer;
begin
  For a:=0 to SWSDB.FileCount-1 do
   if SWSDB.SWSFiles[a].isTMD then begin
     For k:=0 to 31 do
     SWSDB.SWSFiles[a+2].Team[k].Assign(SWSDB.EuropeanCups.UEFACup[k]);
     ShowMessage(rsTMDFileGener);
     Exit;
  end;
end;

procedure TECCFrm.btnGenClipClick(Sender: TObject);
var
  a: integer;
begin
  if SWSDB.Clipboard.TeamCount<>16 then begin
     ShowMessage(rsMustBe16Team);
     Exit;
  end;
  For a:=0 to 15 do
   if not((SWSDB.Clipboard.Team[a].Nation<42)or(SWSDB.Clipboard.Team[a].Nation=78)or(SWSDB.Clipboard.Team[a].Nation=76)) then begin
     ShowMessage(rsMustBeAEurop);
     Exit;
  end;
  For a:=0 to 15 do
      SWSDB.EuropeanCups.ChampionLeague[a]:=SWSDB.Clipboard.Team[a];
  Relist;
end;

procedure TECCFrm.Button1Click(Sender: TObject);
var
  TmpS: String;
begin
  SWSDB.EuropeanCups.WriteDta(SWSDB.SWSFiles[SWSDB.FileIndex].League.SWSExePath);
  if (EdtSett.UseTP) then
  TmpS:='Saved To SWS++ Executable: '
  else
  tmpS:='Saved To SWS Executable: ';
  TmpS:=TmpS+#13+ExtractFilePath(SWSDB.SWSFiles[SWSDB.FileIndex].League.SWSExePath);
  if (EdtSett.UseTP) and (eoAutoCpExe in EdtSett.EditOptions) then begin
    SWSDB.EuropeanCups.WriteDta(
      EdtSett.SWSDataPath + 'exe' + PathDelim + 'sws.exe');
    TmpS:=TmpS+#13+'and SWS Executable: ';
    TmpS:=TmpS+#13+(EdtSett.SWSDataPath + 'exe');
  end;
end;

procedure TECCFrm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TECCFrm.ReList;
var
  i: integer;
begin
  lbcl.Clear;
  lbCWC.Clear;
  lbUEFA.Clear;
  For i:=0 to 15 do
     lbCL.Items.Add(SWSDB.EuropeanCups.ChampionLeague[i].TeamNAme);
  For i:=0 to 31 do
     lbCWC.Items.Add(SWSDB.EuropeanCups.CupWinnersCup[i].TeamNAme);
  For i:=0 to 31 do
     lbUEFA.Items.Add(SWSDB.EuropeanCups.UEFACup[i].TeamNAme);
end;

end.

