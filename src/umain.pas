unit umain;

{$mode objfpc}{$H+}

{ AG_SWSEDT - umain.pas  - Main Editor Source

  Copyright (C) 2013-17 Anoxic // Atomic Group Software

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

{.$DEFINE DEBUG}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  uagswos, LResources, ExtCtrls, ComCtrls, utextstr, laz2_DOM, laz2_XMLWrite,
  AdvLed, BGRABitmap, TplProgressBarUnit, BGRAImageList, dynlibs,
  BGRASpeedButton, LCLType, LCLIntf, StdCtrls, ColorBox, PopupNotifier, Buttons,
  ActnList, usettings, uslpload, uclipfrm, ulgstufrm, upoolplyr, ueccfrm,
  uabout {$IFDEF DEBUG}, heaptrc{$ENDIF};

const
  SWSEdtVer = $0002000400090007;

type

  { TMainForm }

  TMainForm = class(TForm)
    Act: TActionList;
    ASquad: TAction;
    APlayer: TAction;
    ATeam: TAction;
    AGeneral: TAction;
    AOverview: TAction;
    AdvLed1: TAdvLed;
    btCompAttributtebyVal: TButton;
    btCompAttributtebyVal1: TButton;
    btOvrSwsChange: TButton;
    btNumber: TButton;
    btGenPosVal: TButton;
    CBTPVer: TComboBox;
    ESWSdir: TEdit;
    FilFlags: TBGRAImageList;
    btCompOrg: TButton;
    btOrgPriceAll: TButton;
    btEdtLeagStruc: TButton;
    D1T: TLabel;
    D2T: TLabel;
    D3T: TLabel;
    DNT: TLabel;
    DPT: TLabel;
    FindD: TFindDialog;
    gbChart: TGroupBox;
    grTeamStats: TGroupBox;
    grOverStats: TGroupBox;
    grPStatic: TGroupBox;
    GTeamInfo: TGroupBox;
    ilStars: TBGRAImageList;
    cbForm: TComboBox;
    grTactics: TGroupBox;
    Image1: TImage;
    ImPlNat: TImage;
    ImgNat1: TImage;
    ImTFlag: TImage;
    imStars: TImage;
    imSkin: TBGRASpeedButton;
    CBPlayer: TComboBox;
    CBSkin: TComboBox;
    cbpNation: TComboBox;
    CBposit: TComboBox;
    CBValue: TComboBox;
    EatP: TEdit;
    EatV: TEdit;
    EatH: TEdit;
    EatT: TEdit;
    EatC: TEdit;
    EatS: TEdit;
    EatF: TEdit;
    Enumb: TEdit;
    Epname: TEdit;
    gbAttributess: TGroupBox;
    grPa: TGroupBox;
    grAV: TGroupBox;
    grPa2: TGroupBox;
    grPa3: TGroupBox;
    grPa4: TGroupBox;
    grPa5: TGroupBox;
    grPa6: TGroupBox;
    grPlayGen: TGroupBox;
    gSqNavi1: TGroupBox;
    ilPlayers: TBGRAImageList;
    CBTeams: TComboBox;
    CBDivision: TComboBox;
    CBHKitTyp: TComboBox;
    cbAKitTyp: TComboBox;
    cbHShirtCol1: TColorBox;
    cbHShirtcol2: TColorBox;
    cbHShortCol: TColorBox;
    cbHSockCol: TColorBox;
    cbAShirtcol2: TColorBox;
    cbAShortCol: TColorBox;
    cbAShirtCol1: TColorBox;
    cbASockCol: TColorBox;
    CBSquad: TComboBox;
    ECoach: TEdit;
    ESWSgennum: TEdit;
    ETeamNum: TEdit;
    ENationNum: TEdit;
    ETeamname: TEdit;
    grHomeKit: TGroupBox;
    grHKitGfx: TGroupBox;
    grAwayKit: TGroupBox;
    grAkitGfx: TGroupBox;
    grTeamGen: TGroupBox;
    grTmNavi: TGroupBox;
    gSqNavi: TGroupBox;
    ImAShirt: TImage;
    imAShort: TImage;
    imHSock: TImage;
    imHShort: TImage;
    ImHShirt: TImage;
    imASock: TImage;
    ImSFlag: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbPAP: TLabel;
    lbPAPb7: TLabel;
    lbTeamEdited: TLabel;
    lbtmAttPtsb7: TLabel;
    lbTmAtPts: TLabel;
    lbFLFiDF: TLabel;
    lbFilesOverCtp: TLabel;
    lbPlCntSq: TLabel;
    lbtmCnt: TLabel;
    LbSqCnt: TLabel;
    lbPlCnt: TLabel;
    LbFind1: TLabel;
    LbFind2: TLabel;
    lbOvrActSWSDir: TLabel;
    lbVerSWS: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    lbGeTinD1: TLabel;
    lbGeTinD2: TLabel;
    lbGeTinD3: TLabel;
    LbGeTinF: TLabel;
    lbGeTinNL: TLabel;
    LbGeTinPD: TLabel;
    lbWAMcalc: TLabel;
    lbWAM: TLabel;
    LD1: TLabel;
    LD2: TLabel;
    LD3: TLabel;
    LD4: TLabel;
    LP1: TLabel;
    LP2: TLabel;
    LP3: TLabel;
    LP4: TLabel;
    LR1: TLabel;
    LR2: TLabel;
    LR3: TLabel;
    LR4: TLabel;
    LTC: TLabel;
    LV1: TLabel;
    LV2: TLabel;
    LV3: TLabel;
    LV4: TLabel;
    LX1: TLabel;
    LX2: TLabel;
    LX3: TLabel;
    LX4: TLabel;
    MenuItem1: TMenuItem;
    MCSVExp: TMenuItem;
    MCSVPl: TMenuItem;
    MCSVTeam: TMenuItem;
    MAbout: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MclrTeam: TMenuItem;
    MAddCSVTM: TMenuItem;
    MAddRAWTeam: TMenuItem;
    MDirtyRep: TMenuItem;
    MCOPAll: TMenuItem;
    MCheckTC96: TMenuItem;
    MGNonLge: TMenuItem;
    MGThree: TMenuItem;
    MGTwo: TMenuItem;
    MGone: TMenuItem;
    MGPrem: TMenuItem;
    MGChDiv: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MReplaceCSV: TMenuItem;
    MFindPlayerDup: TMenuItem;
    MFindGenSWSDupl: TMenuItem;
    MXMLteam: TMenuItem;
    MXMLexp: TMenuItem;
    MXMLPl: TMenuItem;
    MEuroCup: TMenuItem;
    MPClrTeam: TMenuItem;
    MUnloadAll: TMenuItem;
    MPShowPlay: TMenuItem;
    MShSquad: TMenuItem;
    MPcompl: TMenuItem;
    MPSc: TMenuItem;
    MPAttacker: TMenuItem;
    MPAM: TMenuItem;
    MPMid: TMenuItem;
    MPDM: TMenuItem;
    MPSiteM: TMenuItem;
    MPWing: TMenuItem;
    MPDef: TMenuItem;
    MPSiteBack: TMenuItem;
    MHelpP: TMenuItem;
    Mhelp: TMenuItem;
    MShowRandom: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem7: TMenuItem;
    MShowPool: TMenuItem;
    MPSClipShow: TMenuItem;
    MenuItem3: TMenuItem;
    McpTeam: TMenuItem;
    MenuItem4: TMenuItem;
    MClipShow: TMenuItem;
    MenuItem5: TMenuItem;
    MaddTeam: TMenuItem;
    MChgTeamNr: TMenuItem;
    MCHLEG: TMenuItem;
    MenuItem6: TMenuItem;
    MPPaPlay: TMenuItem;
    MenuItem8: TMenuItem;
    MPcpPlay: TMenuItem;
    MPShClip: TMenuItem;
    MPCpTeam: TMenuItem;
    MPPaTeam: TMenuItem;
    MenuItem9: TMenuItem;
    MPdel: TMenuItem;
    MPAdd: TMenuItem;
    MGlobal: TMenuItem;
    Mreload: TMenuItem;
    MRemoveTeam: TMenuItem;
    MpaTeam: TMenuItem;
    MPaPlayer: TMenuItem;
    McpPlayer: TMenuItem;
    MFindSWSMax: TMenuItem;
    MFPbyName: TMenuItem;
    MFTbyName: TMenuItem;
    MSearch: TMenuItem;
    PopNotify: TPopupNotifier;
    PGePopup: TPopupMenu;
    MSqPopup: TPopupMenu;
    MPGenPosVal: TPopupMenu;
    Reserve1: TLabel;
    lbForm: TLabel;
    lbReserve: TLabel;
    lbAttCode: TLabel;
    lbAttCodeStr: TLabel;
    LbAttCh: TLabel;
    lbTeamlist: TLabel;
    lbSelTeam: TLabel;
    lbSquadInf: TLabel;
    lbValue: TLabel;
    lbposition: TLabel;
    lbPnat: TLabel;
    lbSkin: TLabel;
    lbNum: TLabel;
    lbPname: TLabel;
    lbAshoCol: TLabel;
    lbAShCol: TLabel;
    lbHSockCol: TLabel;
    lbHshoCol: TLabel;
    lbHShCol: TLabel;
    lbHKittyp: TLabel;
    lbAKittyp: TLabel;
    lbCoach: TLabel;
    lbDivision: TLabel;
    lbASockCol: TLabel;
    lbPlToEdt: TLabel;
    lbSWSgennum: TLabel;
    lbTeamNum: TLabel;
    lbNationNum: TLabel;
    lbTeamName: TLabel;
    lbTmTeamEd: TLabel;
    LBTeams: TListView;
    lbSqTeamEd: TLabel;
    LBSquad: TListView;
    MenuItem2: TMenuItem;
    Mclose: TMenuItem;
    Medit: TMenuItem;
    MSettings: TMenuItem;
    MOptions: TMenuItem;
    MWriteAll: TMenuItem;
    MWriteCur: TMenuItem;
    MOpenAll: TMenuItem;
    MreadTeam: TMenuItem;
    MFile: TMenuItem;
    Menus: TMainMenu;
    ope: TOpenDialog;
    Panel1: TPanel;
    pbAC1: TplProgressBar;
    pbAC2: TplProgressBar;
    pbAC3: TplProgressBar;
    pbAC4: TplProgressBar;
    pbAC5: TplProgressBar;
    pbAC6: TplProgressBar;
    pbAC7: TplProgressBar;
    pbTac: TPaintBox;
    PCtrl: TPageControl;
    pbP: TplProgressBar;
    pbV: TplProgressBar;
    pbH: TplProgressBar;
    pbT: TplProgressBar;
    pbC: TplProgressBar;
    pbS: TplProgressBar;
    pbF: TplProgressBar;
    Reserve2: TLabel;
    Reserve3: TLabel;
    Reserve4: TLabel;
    Reserve5: TLabel;
    sav: TSaveDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SWSVer: TGroupBox;
    tbPlayer: TTabSheet;
    tbSquad: TTabSheet;
    tbTeam: TTabSheet;
    tbGeneral: TTabSheet;
    tbOver: TTabSheet;
    LBOver: TTreeView;
    UpDown: TUpDown;
    UpDown1: TUpDown;
    UpDownPlay: TUpDown;
    UpDownPlaySq: TUpDown;
    procedure APlayerExecute(Sender: TObject);
    procedure ASquadExecute(Sender: TObject);
    procedure ATeamExecute(Sender: TObject);
    procedure AGeneralExecute(Sender: TObject);
    procedure AOverviewExecute(Sender: TObject);
    procedure btCompAttributtebyVal1Click(Sender: TObject);
    procedure btCompAttributtebyValClick(Sender: TObject);
    procedure btCompOrgClick(Sender: TObject);
    procedure btEdtLeagStrucClick(Sender: TObject);
    procedure btGenPosValClick(Sender: TObject);
    procedure btGenPosValKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btGenPosValMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btNumberClick(Sender: TObject);
    procedure btOrgPriceAllClick(Sender: TObject);
    procedure CBDivisionChange(Sender: TObject);
    procedure cbFormChange(Sender: TObject);
    procedure CBHKitTypChange(Sender: TObject);
    procedure CBPlayerChange(Sender: TObject);
    procedure cbpNationChange(Sender: TObject);
    procedure CBpositChange(Sender: TObject);
    procedure CBSkinChange(Sender: TObject);
    procedure CBSquadChange(Sender: TObject);
    procedure CBTeamsChange(Sender: TObject);
    procedure CBTPVerChange(Sender: TObject);
    procedure CBValueChange(Sender: TObject);
    procedure EatCExit(Sender: TObject);
    procedure EatFExit(Sender: TObject);
    procedure EatFMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure EatHExit(Sender: TObject);
    procedure EatPExit(Sender: TObject);
    procedure EatSExit(Sender: TObject);
    procedure EatTExit(Sender: TObject);
    procedure EatVExit(Sender: TObject);
    procedure ECoachExit(Sender: TObject);
    procedure ENationNumExit(Sender: TObject);
    procedure EnumbExit(Sender: TObject);
    procedure EpnameDblClick(Sender: TObject);
    procedure EpnameExit(Sender: TObject);
    procedure ESWSgennumExit(Sender: TObject);
    procedure ETeamnameExit(Sender: TObject);
    procedure ETeamNumExit(Sender: TObject);
    procedure FindDClose(Sender: TObject);
    procedure FindDFind(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure FormPaint(Sender: TObject);
    procedure gbAttributessMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure grAwayKitMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure grHomeKitMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure grTeamGenMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imSkinClick(Sender: TObject);
    procedure LbFind1Click(Sender: TObject);
    procedure LbFind1MouseEnter(Sender: TObject);
    procedure LbFind1MouseLeave(Sender: TObject);
    procedure LbFind2Click(Sender: TObject);
    procedure LbFind2MouseEnter(Sender: TObject);
    procedure LbFind2MouseLeave(Sender: TObject);
    procedure LBOverDblClick(Sender: TObject);
    procedure LBSquadClick(Sender: TObject);
    procedure LBSquadColumnClick(Sender: TObject; Column: TListColumn);
    procedure LBSquadCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: integer; var Compare: integer);
    procedure LBSquadCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure LBSquadDblClick(Sender: TObject);
    procedure LBSquadDragDrop(Sender, Source: TObject; X, Y: integer);
    procedure LBSquadDragOver(Sender, Source: TObject; X, Y: integer;
      State: TDragState; var Accept: boolean);
    procedure LBSquadKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure LBSquadMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure LBTeamsClick(Sender: TObject);
    procedure LBTeamsColumnClick(Sender: TObject; Column: TListColumn);
    procedure LBTeamsCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: integer; var Compare: integer);
    procedure LBTeamsCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure LBTeamsDblClick(Sender: TObject);
    procedure LBTeamsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure MAboutClick(Sender: TObject);
    procedure MAddRAWTeamClick(Sender: TObject);
    procedure MaddTeamClick(Sender: TObject);
    procedure MCheckTC96Click(Sender: TObject);
    procedure MChgTeamNrClick(Sender: TObject);
    procedure MCHLEGClick(Sender: TObject);
    procedure MClipShowClick(Sender: TObject);
    procedure McloseClick(Sender: TObject);
    procedure MclrTeamClick(Sender: TObject);
    procedure McpPlayerClick(Sender: TObject);
    procedure McpTeamClick(Sender: TObject);
    procedure MCSVPlClick(Sender: TObject);
    procedure MCSVTeamClick(Sender: TObject);
    procedure MAddCSVTMClick(Sender: TObject);
    procedure MDirtyRepClick(Sender: TObject);
    procedure MCOPAllClick(Sender: TObject);
    procedure MEuroCupClick(Sender: TObject);
    procedure MFindGenSWSDuplClick(Sender: TObject);
    procedure MFindPlayerDupClick(Sender: TObject);
    procedure MFindSWSMaxClick(Sender: TObject);
    procedure MFPbyNameClick(Sender: TObject);
    procedure MFTbyNameClick(Sender: TObject);
    procedure MGNonLgeClick(Sender: TObject);
    procedure MGoneClick(Sender: TObject);
    procedure MGPremClick(Sender: TObject);
    procedure MGThreeClick(Sender: TObject);
    procedure MGTwoClick(Sender: TObject);
    procedure MHelpPClick(Sender: TObject);
    procedure MOpenAllClick(Sender: TObject);
    procedure MPAMClick(Sender: TObject);
    procedure MPaPlayerClick(Sender: TObject);
    procedure MpaTeamClick(Sender: TObject);
    procedure MPAttackerClick(Sender: TObject);
    procedure MPcomplClick(Sender: TObject);
    procedure MPDefClick(Sender: TObject);
    procedure MPDMClick(Sender: TObject);
    procedure MPMidClick(Sender: TObject);
    procedure MPScClick(Sender: TObject);
    procedure MPShowPlayClick(Sender: TObject);
    procedure MPSiteBackClick(Sender: TObject);
    procedure MPSiteMClick(Sender: TObject);
    procedure MPWingClick(Sender: TObject);
    procedure MreadTeamClick(Sender: TObject);
    procedure MreloadClick(Sender: TObject);
    procedure MRemoveTeamClick(Sender: TObject);
    procedure MReplaceCSVClick(Sender: TObject);
    procedure MSettingsClick(Sender: TObject);
    procedure MShowPoolClick(Sender: TObject);
    procedure MShowRandomClick(Sender: TObject);
    procedure MShSquadClick(Sender: TObject);
    procedure MUnloadAllClick(Sender: TObject);
    procedure MWriteAllClick(Sender: TObject);
    procedure MWriteCurClick(Sender: TObject);
    procedure MXMLPlClick(Sender: TObject);
    procedure MXMLteamClick(Sender: TObject);
    procedure pbTacPaint(Sender: TObject);
    procedure PCtrlChange(Sender: TObject);
    procedure PCtrlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SWSVerMouseEnter(Sender: TObject);
    procedure SWSVerMouseLeave(Sender: TObject);
    procedure UpDownClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownPlayClick(Sender: TObject; Button: TUDBtnType);
  private
    GenerPos: integer;
    TeamsCol: integer;
    SquadCol: integer;
    DropFile: boolean;
    NameDrop: array of string;
    procedure CustomExceptionHandler(Sender: TObject; E: Exception);
    { private declarations }
  public
    AppDir: UTF8string;
    CfgDir: UTF8String;
    FlagDir: UTF8string;
    procedure LoadTP;
    procedure LoadOver;
    procedure LoadGeneral;
    procedure RefTeam;
    procedure RefSquad;
    procedure RefPlayer;
    procedure RefReserve;
    procedure Gener(val: integer);
    procedure SetEnables(LoadAll: boolean; Ebn: boolean);
    procedure GetLangs;
    { public declarations }
    procedure OnSWSload(Sender: TObject; Afile: TSWSFile; Tinx, Tcnt: integer);
    procedure OnSWSSave(Sender: TObject; Afile: TSWSFile; Tinx, Tcnt: integer);
  end;

  hCreateLibSWOS = function(path: PChar): Pointer; cdecl;
  hDuplicateFind = procedure(db: Pointer); cdecl;
  hFreeLibSWOS = procedure(db: Pointer); cdecl;
  hLoadAllData = procedure(db: Pointer); cdecl;

var
  MainForm: TMainForm;

implementation

{$R *.frm}


{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  GenerPos:=-1;
  AppDir := ExtractFilePath(Application.ExeName);
  FlagDir := AppDir + 'dta' + PathDelim + 'flags' + PathDelim;
  CfgDir := AppDir;
  LangList:=TStringList.Create;
  GetLangs;
  {$IFDEF DEBUG}
  SetHeapTraceOutput(AppDir + 'heap.log');
  {$ENDIF}
  {$IFDEF WINDOWS}
  CfgDir := GetEnvironmentVariable('appdata') + PathDelim + 'swsedt_2.2.0' + PathDelim;
  if not DirectoryExists(CfgDir) then
     CreateDir(CfgDir);
  //ForceDirectory(CfgDir);
  {$ENDIF}
  Application.CreateForm(TAboutFrm, AboutFrm);
  Application.CreateForm(TSettingForm, SettingForm);
  //Application.OnException:=@CustomExceptionHandler;
  SWSDB := TSWSEngine.Create(self);
  SWSDB.OnLoad := @OnSWSload;
  SWSDB.OnSave := @OnSWSSave;
  EdtSett := TEdtSett.Create(self);
  EdtSett.EditorVers := Lo(SWSEdtVer);
  EdtSett.FileName := CfgDir + 'config.sws';
  if not FileExists(CfgDir + 'config.sws') then
  begin
    EdtSett.SWSExePath := '';
    EdtSett.SWSDataPath := '';
    EdtSett.EditorVers := Lo(SWSEdtVer);
    SettingForm.ShowModal;
  end
  else
    EdtSett.ReadSett(CfgDir + 'config.sws');

  ESWSdir.Text := EdtSett.SWSDataPath;
  SWSDB.LeaguesDir := 'leagues.xml';
  try
    SWSDB.ReadConf('leagues.xml');
  except
    ShowMessage(rsLeaguesXmlFi)
  end;
  if FileExists(CfgDir + 'clipboard.sws') then
  try
    SWSDB.Clipboard.ReadFromFile(CfgDir + 'clipboard.sws');
  except
    DeleteFile(CfgDir + 'clipboard.sws');
  end;
  SWSDB.SWSExeDir := EdtSett.SWSExePath;
  SWSDB.SWSDataDir := EdtSett.SWSDataPath;
  //  TacField := TBGRABitmap.Create(300,200);
  //  TacField.LoadFromFile(AppDir + 'dta'+PathDelim+'tac.bmp');
  TacFN := AppDir + 'dta' + PathDelim + 'tac.bmp';
  //  TacPla := TBGRABitmap.Create(AppDir + 'dta'+PathDelim+'plim.png');
  AllowDropFiles := True;
  {$IFDEF UNIX}
  Self.Font.Size := 9;
  {$ENDIF}
  if (eoAutoUpdate in EdtSett.EditOptions) then
    if AboutFrm.CheckForUpd() then
      ShowMessage('Update Avaible. Go to About to Download new version');
  // ShowMessage(SWSDB.LeaguesVersion);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin

  SWSDB.Free;
  EdtSett.Free;
  LangList.Free;
  //  if TacField<>nil then
  //  TacField.Free;
  //  TacPla.Free;
end;

procedure TMainForm.FormDropFiles(Sender: TObject; const FileNames: array of string);
var
  i: integer;
begin
  DropFile := True;
  SetLength(NameDrop, Length(FileNames));
  for i := Low(FileNames) to High(FileNames) do
    NameDrop[i] := FileNames[i];
  MreadTeamClick(self);
  DropFile := False;
  SetLength(NameDrop, 0);
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  Caption := 'AG-SWSEDT ' + AboutFrm.GetStrVersion(False);
  if SWSDB.ChangedFiles() > 0 then
    MWriteAll.Caption := Format(rsWriteAllD, [SWSDB.ChangedFiles()])
  else
    MWriteAll.Caption := rsWriteAll;
  if SWSDB.FileIndex > -1 then
  begin
    Caption := Caption + ' - ' + ExtractFileNAme(
      SWSDB.SWSFiles[SWSDB.FileIndex].FileName);
    if SWSDB.SWSFiles[SWSDB.FileIndex].Changed then
      Caption := Caption + '*';
  end;
end;

procedure TMainForm.gbAttributessMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbRight then
    MPGenPosVal.PopUp(Mouse.CursorPos.x, Mouse.CursorPos.y);
end;

procedure TMainForm.grAwayKitMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if Button = mbRight then
    PGePopup.PopUp(Mouse.CursorPos.x, Mouse.CursorPos.y);
end;

procedure TMainForm.grHomeKitMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if Button = mbRight then
    PGePopup.PopUp(Mouse.CursorPos.x, Mouse.CursorPos.y);
end;

procedure TMainForm.grTeamGenMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if Button = mbRight then
    PGePopup.PopUp(Mouse.CursorPos.x, Mouse.CursorPos.y);
end;

procedure TMainForm.imSkinClick(Sender: TObject);

begin
  if CBSkin.ItemIndex > 1 then
    CBSkin.ItemIndex := 0
  else
    CBSkin.ItemIndex := CBSkin.ItemIndex + 1;
  CBSkinChange(self);
end;

procedure TMainForm.LbFind1Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := StringReplace(Epname.Text, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
  OpenURL(Format(EdtSett.Link[0].Form, [TmpStr]));
end;

procedure TMainForm.LbFind1MouseEnter(Sender: TObject);
begin
  LbFind1.Font.Color := clBlue;
end;

procedure TMainForm.LbFind1MouseLeave(Sender: TObject);
begin
  LbFind1.Font.Color := clDefault;
end;

procedure TMainForm.LbFind2Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := StringReplace(Epname.Text, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
  OpenURL(Format(EdtSett.Link[1].Form, [TmpStr]));
end;

procedure TMainForm.LbFind2MouseEnter(Sender: TObject);
begin
  LbFind2.Font.Color := clBlue;
end;

procedure TMainForm.LbFind2MouseLeave(Sender: TObject);
begin
  LbFind2.Font.Color := clDefault;
end;

procedure TMainForm.LBOverDblClick(Sender: TObject);
var
  AttNode: TDOMNode;
  TFN: string;
  kTMD: boolean;
  idn, TMDCount: integer;
begin
  if LBOver.Selected = nil then
    Exit;
  AttNode := TDOMNode(LBOver.Selected.Data);
  // ShowMessage(inttostr(AttNode.Attributes.Length));
  if AttNode.Attributes.GetNamedItem('DBId') = nil then
  begin
    if AttNode.Attributes.GetNamedItem('File') <> nil then
      TFN := AttNode.Attributes.GetNamedItem('File').NodeValue
    else
      Exit;
    if AttNode.Attributes.GetNamedItem('TMD') <> nil then
      try
        kTMD := boolean(StrToInt(AttNode.Attributes.GetNamedItem('TMD').NodeValue))
      except
        ShowMessage(rsDataErrorInX)
      end
    else
      Exit;

    if KTMD then
    begin
      if AttNode.Attributes.GetNamedItem('Teams') <> nil then
        try
          TMDCount := (StrToInt(AttNode.Attributes.GetNamedItem('Teams').NodeValue))
        except
          ShowMessage(rsDataErrorInX)
        end
      else
        Exit;
    end;
    SplashLoad.Show;
    Enabled := False;
    idn := SWSDB.LoadFile(EdtSett.SWSDataPath + TFN, kTMD, TMDCount);
    if AttNode.Attributes.GetNamedItem('Num') <> nil then
      SWSDB.SWSFiles[idn].FileNumber :=
        StrToInt(AttNode.Attributes.GetNamedItem('Num').NodeValue);
    if AttNode.Attributes.GetNamedItem('Hex') <> nil then
      SWSDB.SWSFiles[idn].HexVal := AttNode.Attributes.GetNamedItem('Hex').NodeValue;
    if AttNode.Attributes.GetNamedItem('Name') <> nil then
      SWSDB.SWSFiles[idn].LeagueName := AttNode.Attributes.GetNamedItem('Name').NodeValue;
    if SWSDB.SWSFiles[idn].HexVal <> '' then
      SWSDB.SWSFiles[idn].LoadLeague;
    if (AttNode.Attributes.GetNamedItem('OrgTeams') <> nil) then
       SWSDB.SWSFiles[idn].OrgTeamCount:= StrToInt(AttNode.Attributes.GetNamedItem('OrgTeams').NodeValue)
    else
       SWSDB.SWSFiles[idn].OrgTeamCount := -1;
    if (AttNode.Attributes.GetNamedItem('OrgPrem') <> nil) then
       SWSDB.SWSFiles[idn].OrgTeamsByDiv.Premier:= StrToInt(AttNode.Attributes.GetNamedItem('OrgPrem').NodeValue)
    else
       SWSDB.SWSFiles[idn].OrgTeamsByDiv.Premier:= 0;
    if (AttNode.Attributes.GetNamedItem('OrgOne') <> nil) then
       SWSDB.SWSFiles[idn].OrgTeamsByDiv.One:= StrToInt(AttNode.Attributes.GetNamedItem('OrgOne').NodeValue)
    else
       SWSDB.SWSFiles[idn].OrgTeamsByDiv.One:= 0;
    if (AttNode.Attributes.GetNamedItem('OrgTwo') <> nil) then
       SWSDB.SWSFiles[idn].OrgTeamsByDiv.Two:= StrToInt(AttNode.Attributes.GetNamedItem('OrgTwo').NodeValue)
    else
       SWSDB.SWSFiles[idn].OrgTeamsByDiv.Two:= 0;
    if (AttNode.Attributes.GetNamedItem('OrgThree') <> nil) then
       SWSDB.SWSFiles[idn].OrgTeamsByDiv.Three:= StrToInt(AttNode.Attributes.GetNamedItem('OrgThree').NodeValue)
    else
       SWSDB.SWSFiles[idn].OrgTeamsByDiv.Three:= 0;
    if (AttNode.Attributes.GetNamedItem('OrgNL') <> nil) then
       SWSDB.SWSFiles[idn].OrgTeamsByDiv.NonLge:= StrToInt(AttNode.Attributes.GetNamedItem('OrgNL').NodeValue)
    else
       SWSDB.SWSFiles[idn].OrgTeamsByDiv.NonLge:= 0;
    SplashLoad.Hide;
    Enabled := True;
    TDOMElement(AttNode).SetAttribute('DBId', IntToStr(idn));
    SWSDB.FileIndex := idn;
  end
  else
  begin
    idn := StrToInt(AttNode.Attributes.GetNamedItem('DBId').NodeValue);
    SWSDB.FileIndex := idn;
  end;
  tbGeneral.Enabled := True;
  SetEnables(False, True);
  LoadGeneral;
  PCtrl.ActivePage := tbOver;
  PCtrl.ActivePage := tbGeneral;
  PCtrlChange(self);
  Show;
end;

procedure TMainForm.LBSquadClick(Sender: TObject);
var
  TIDx: integer;

begin
  if LBSquad.Selected = nil then
    Exit;
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex :=
    PtrUInt(LBSquad.Items[LBSquad.ItemIndex].Data);
  pbTac.Refresh;
  RefReserve;
end;

procedure TMainForm.LBSquadColumnClick(Sender: TObject; Column: TListColumn);
begin
  SquadCol := Column.Index;
end;

procedure TMainForm.LBSquadCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: integer; var Compare: integer);
var
  TIDx: integer;
begin
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  case SquadCol of
    0: Compare := CompareText(Item1.Caption, Item1.Caption);
    1: Compare := StrToInt(Item1.SubItems[0]) - StrToInt(Item2.SubItems[0]);
    2: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item1.Data)].Position -
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].Position;
    3: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item1.Data)].National -
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].National;
    4: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].CalcPlay(True) - SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player
        [PtrUInt(Item1.Data)].CalcPlay(True);
    5: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].Passing -
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item1.Data)].Passing;
    6: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].Shooting -
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item1.Data)].Shooting;
    7: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].Heading -
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item1.Data)].Heading;
    8: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].Tackling -
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item1.Data)].Tackling;
    9: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].Ball_Control -
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item1.Data)].Ball_Control;
    10: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].Speed -
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item1.Data)].Speed;
    11: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].Finishing -
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item1.Data)].Finishing;
    12: Compare :=
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item2.Data)].Value -
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[PtrUInt(Item1.Data)].Value;
  end;
end;

procedure TMainForm.LBSquadCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  Tidx, Pidx: Integer;
begin
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  Pidx := PtrUInt(Item.Data);
  if EdtSett.UseColors then BEGIN
    begin
      if SWSDB.SWSFiles[SWSDb.FileIndex].Team[tidx].Player[pidx].Position = 0 then
         sender.Canvas.Brush.Color:=$A0FFFF;

      if ((SWSDB.SWSFiles[SWSDb.FileIndex].Team[tidx].Player[pidx].Position >= 1)and(SWSDB.SWSFiles[SWSDb.FileIndex].Team[tidx].Player[pidx].Position < 4)) then
         sender.Canvas.Brush.Color:=$C0FFC0;
      if ((SWSDB.SWSFiles[SWSDb.FileIndex].Team[tidx].Player[pidx].Position >= 4)and(SWSDB.SWSFiles[SWSDb.FileIndex].Team[tidx].Player[pidx].Position < 7)) then
             sender.Canvas.Brush.Color:=$FFC0C0;
      if SWSDB.SWSFiles[SWSDb.FileIndex].Team[tidx].Player[pidx].Position = 7 then
             sender.Canvas.Brush.Color:=$C0C0FF;
    end;
  END;
  DefaultDraw:=true;
end;

procedure TMainForm.LBSquadDblClick(Sender: TObject);
var
  TIDx: integer;

begin
  if LBSquad.Selected = nil then
    Exit;
  if LBSquad.ItemIndex < 0 then
    Exit;
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex :=
    PtrUInt(LBSquad.Items[LBSquad.ItemIndex].Data);
  tbPlayer.Enabled := True;
  RefPlayer;
  PCtrl.ActivePage := tbPlayer;
end;

procedure TMainForm.LBSquadDragDrop(Sender, Source: TObject; X, Y: integer);
var
  iItem: TListItem;
  TV: TListView;
  Aidx, Aust, Anr: integer;
  Bidx, Bust: integer;
  TIDx: integer;

begin
  if not (Source is TListView) then
    Exit;
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  TV := TlistView(Sender);
  iITem := Tv.GetItemAt(X, Y);
  Aidx := PtrUint(iItem.Data);
  Aust := SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].GetFormatPlace(Aidx);
  if Assigned(Tv.Selected) and (Tv.Selected <> iItem) then
    Bidx := PtrUInt(TV.Selected.Data);
  IF Aidx=Bidx then Exit;
  if (BIdx>15)or(Aidx>15) then Exit;
  Bust := SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].GetFormatPlace(Bidx);
  SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].PlPosition[Bust] := Aidx;
  SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].PlPosition[Aust] := Bidx;
  if (Aust > 10) or (Bust > 10) then
  begin
    Anr := SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[Aidx].Number;
    SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[Aidx].Number :=
      SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[Bidx].Number;
    SWSDB.SWSFiles[SWSDB.FileIndex].Team[TIDX].Player[Bidx].Number := Anr;
  end;
  RefSquad;
  pbTac.Refresh;
end;

procedure TMainForm.LBSquadDragOver(Sender, Source: TObject; X, Y: integer;
  State: TDragState; var Accept: boolean);
begin
  Accept := Source is TListView;
end;

procedure TMainForm.LBSquadKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);

begin
  pbTacPaint(self);
end;

procedure TMainForm.LBSquadMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  TIDX: integer;
begin
  if LBSquad.Selected = nil then
    Exit;
  if Button = mbRight then
  begin
    TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex := LBSquad.ItemIndex;
    pbTac.Refresh;
    RefReserve;
    MSqPopup.PopUp(Mouse.CursorPos.x, Mouse.CursorPos.y);
  end;
end;

procedure TMainForm.LBTeamsClick(Sender: TObject);
var
  idx: integer;
begin
  if LBTeams.Selected = nil then
    Exit;
  if (LBTeams.Selected.Data <> nil) then
     idx := PtrUInt(LBTeams.Selected.Data);
  //SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := PtrUInt(LBTeams.Selected.Data);
  SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := idx;
  //SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := LBTeams.Selected.Index;
  CBTeams.ItemIndex := LBTeams.Selected.Index;
end;

procedure TMainForm.LBTeamsColumnClick(Sender: TObject; Column: TListColumn);
begin
  TeamsCol := Column.Index;
end;

procedure TMainForm.LBTeamsCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: integer; var Compare: integer);
begin
  case TeamsCol of
    0: Compare := StrToInt(Item1.Caption) - StrToInt(Item2.Caption);
    1: Compare := CompareText(Item1.SubItems[0], Item2.SubItems[0]);
    2: Compare := SWSDB.SWSFiles[SWSDB.FileIndex].Team[PtrUint(Item1.Data)].Division - SWSDB.SWSFiles[SWSDB.FileIndex].Team[PtrUint(Item2.Data)].Division;
    3: Compare := StrToInt(Item2.SubItems[2]) - StrToInt(Item1.SubItems[2]);
    4: Compare := StrToInt(Item2.SubItems[3]) - StrToInt(Item1.SubItems[3]);
    5: Compare := StrToInt(Item2.SubItems[4]) - StrToInt(Item1.SubItems[4]);
  end;
end;

procedure TMainForm.LBTeamsCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  idx: integer;
begin
  if (Item.Data <> nil) then
     idx := PtrUInt(Item.Data);
  if EdtSett.UseColors then BEGIN
     case (SWSDB.SWSFiles[SWSDB.FileIndex].Team[idx].Division) of
       0: sender.Canvas.Brush.Color:=$B0FFFF;
       1: sender.Canvas.Brush.Color:=$A8D8FF;
       2: sender.Canvas.Brush.Color:=$A0C0FF;
       3: sender.Canvas.Brush.Color:=$98A8FF;
       4: sender.Canvas.Brush.Color:=$9090FF;
     end;
  end;

  if (SWSDB.SWSFiles[SWSDB.FileIndex].Team[idx].CalcTeamSkill(5, true) > 82) then
     Sender.Canvas.Brush.Color:=clRed;

  if (SWSDB.SWSFiles[SWSDB.FileIndex].Team[idx].Warning) then
     Sender.Canvas.Brush.Color:=clFuchsia;
end;

procedure TMainForm.LBTeamsDblClick(Sender: TObject);
var
  idx: integer;
begin
  if LBTeams.Selected = nil then
    Exit;
  idx := PtrUInt(LBTeams.Selected.Data);
  //SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := PtrUInt(LBTeams.Selected.Data);
  SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := idx;
  //SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := LBTeams.Selected.Index;
  CBTeams.ItemIndex := LBTeams.Selected.Index;
  tbTeam.Enabled := True;
  RefTeam;
  PCtrl.ActivePage := tbTeam;
end;

procedure TMainForm.LBTeamsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if LBTeams.Selected = nil then
    EXit;
  if Button = mbRight then
  begin
    SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := PtrUInt(LBTeams.Selected.Data);
    PGePopup.PopUp(Mouse.CursorPos.x, Mouse.CursorPos.y);
  end;
end;

procedure TMainForm.MAboutClick(Sender: TObject);
begin
  AboutFrm.ShowModal;
end;

procedure TMainForm.MAddRAWTeamClick(Sender: TObject);
var
  Stm: TFileStream;
  Ti: Integer;
begin
  ope.Filter:='TEAM IMPORT FILE|*.TEAM|All Files|*.*';
  if ope.Execute then
     if ope.FileName<>'' then begin
       Stm:=TFileStream.Create(ope.FileName,fmOpenRead);
       Stm.Seek(0, soBeginning);
       SWSDB.SWSFiles[SWSDB.FileIndex].AddTeam('IMPORTED');
       Ti:= SWSDB.SWSFiles[SWSDB.FileIndex].TeamCount - 1;
       SWSDB.SWSFiles[SWSDB.FileIndex].Team[Ti].LoadTeam(Stm);
       Stm.Free;
       SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := TI;
     end;
  LoadGeneral;
  RefTeam;
  RefSquad;
end;

procedure TMainForm.MaddTeamClick(Sender: TObject);
var
  NTeam: string;
  TI: Integer;
begin
  NTeam := 'NEW TEAM';
  if InputQuery(rsAddNewTeam, rsEnterTeamNam, NTeam) then
  begin
    SWSDB.SWSFiles[SWSDB.FileIndex].AddTeam(NTeam);
    Ti:= SWSDB.SWSFiles[SWSDB.FileIndex].TeamCount - 1;
    SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := TI;
    LoadGeneral;
    RefTeam;
    RefSquad;
  end;

end;

procedure TMainForm.MCheckTC96Click(Sender: TObject);
var
  owndir: Utf8String;
  tmpd: String;
  repfile: TStringList;
  i: integer;
begin
  //sab
  if (not SWSDB.LoadedAll) then begin
    ShowMessage('Load All First.');
    Exit;
  end;
  {
  if (MessageBox(nil, rsSelectCustom96, 'Compare to 96/97', MB_YESNO) = MB_YES) then begin
     if SelectDirectory('Select 96/97 data folder', SWSDB.LeaguesDir, owndir) then begin

     end;
  end else begin

  end;
  }
  repfile:= TStringList.Create;
  repfile.Add('========================================================');
  repfile.Add('AG-SWSEdt Teams Report');
  repfile.Add('Loaded Data Directory: '+ SWSDB.SWSDataDir);
  repfile.Add('Report Time: ' + DateToStr(Now) +' '+  TimeToStr(Now));
  repfile.Add('========================================================');
  repfile.Add('');
  for i:=0 to SWSDB.FileCount -1 do begin
    repfile.Add('========================================================');
    repfile.Add(SWSDB.SWSFiles[i].LeagueName + '( ' + SWSDB.SWSFiles[i].FileName + ' )');
    repfile.Add('--------------------------------------------------------');
    if ((SWSDB.SWSFiles[i].TeamCount <> SWSDB.SWSFiles[i].OrgTeamCount)or(SWSDB.SWSFiles[i].TeamByDiv(0) <> SWSDB.SWSFiles[i].OrgTeamsByDiv.Premier)or
    (SWSDB.SWSFiles[i].TeamByDiv(1) <> SWSDB.SWSFiles[i].OrgTeamsByDiv.One)or(SWSDB.SWSFiles[i].TeamByDiv(2) <> SWSDB.SWSFiles[i].OrgTeamsByDiv.Two)or
    (SWSDB.SWSFiles[i].TeamByDiv(3) <> SWSDB.SWSFiles[i].OrgTeamsByDiv.Three)or(SWSDB.SWSFiles[i].TeamByDiv(4) <> SWSDB.SWSFiles[i].OrgTeamsByDiv.NonLge)) then
      repfile.Add('WARNING!!! Diffrences');
    tmpd:= IntToStr(SWSDB.SWSFiles[i].TeamByDiv(0)) + '/' + IntToStr(SWSDB.SWSFiles[i].TeamByDiv(1)) + '/' +IntToStr(SWSDB.SWSFiles[i].TeamByDiv(2)) + '/';
    tmpd:= tmpd + IntToStr(SWSDB.SWSFiles[i].TeamByDiv(3)) + '/' + IntToStr(SWSDB.SWSFiles[i].TeamByDiv(4)) + '  SUM (' + IntToStr(SWSDB.SWSFiles[i].TeamCount) + ')';
    repfile.Add('Loaded:   '+ tmpd);
    //
    {
    tmpd:= 'OrgTeams="'+IntToStr(SWSDB.SWSFiles[i].TeamCount)+'" ';
    tmpd:= tmpd + 'OrgPrem="'+IntToStr(SWSDB.SWSFiles[i].TeamByDiv(0))+'" ';
    tmpd:= tmpd + 'OrgOne="'+IntToStr(SWSDB.SWSFiles[i].TeamByDiv(1))+'" ';
    tmpd:= tmpd + 'OrgTwo="'+IntToStr(SWSDB.SWSFiles[i].TeamByDiv(2))+'" ';
    tmpd:= tmpd + 'OrgThree="'+IntToStr(SWSDB.SWSFiles[i].TeamByDiv(3))+'" ';
    tmpd:= tmpd + 'OrgNL="'+IntToStr(SWSDB.SWSFiles[i].TeamByDiv(4))+'"';
    repfile.Add(tmpd);
    }
    //
    tmpd:= IntToStr(SWSDB.SWSFiles[i].OrgTeamsByDiv.Premier) + '/' + IntToStr(SWSDB.SWSFiles[i].OrgTeamsByDiv.One) + '/' +IntToStr(SWSDB.SWSFiles[i].OrgTeamsByDiv.Two) + '/';
    tmpd:= tmpd + IntToStr(SWSDB.SWSFiles[i].OrgTeamsByDiv.Three) + '/' + IntToStr(SWSDB.SWSFiles[i].OrgTeamsByDiv.NonLge) + '  SUM (' + IntToStr(SWSDB.SWSFiles[i].OrgTeamCount) + ')';
    repfile.Add('Original:  '+ tmpd);
    repfile.Add('========================================================');
  end;
  repfile.SaveToFile('Compare9697Report.txt');
  ShowMessage('Report Complete in file: Compare9697Report.txt');
end;

procedure TMainForm.MChgTeamNrClick(Sender: TObject);
var
  Tnr: string;
begin
  if InputQuery('Change', rsEnterNewTeam, Tnr) then
  begin
    try
      SWSDB.SWSFiles[SWSDb.FileIndex].ChangeAll('nation', StrToInt(tnr));
    except
      ShowMessage(rsThisValueMus);
      Exit;
    end;
    ShowMessage('Nation nr changed to: '+IntToStr(StrToInt(tnr)));
  end;
end;

procedure TMainForm.MCHLEGClick(Sender: TObject);
var
  a: integer;
  St: TStringList;
begin
  if not SWSDB.LoadedAll then
  begin
    ShowMessage(rsOpenAllBefor);
    Exit;
  end;
  St := TStringList.Create;
  St.Clear;
  for a := 0 to SWSDB.FileCount - 1 do
    if SWSDB.SWSFiles[a].HexVal <> '' then
      if not SWSDB.SWSFiles[a].CheckLeagueTeams then
        St.Add(SWSDB.SWSFiles[a].FileName + ' | ' + SWSDB.SWSFiles[a].LeagueName);
  if st.Count = 0 then
    ShowMessage(rsAllLeaguesOK)
  else
  begin
    st.SaveToFile(AppDir + 'LeagueErrors.log');
    ShowMessage(St.Text + #13 + 'Saved to LeagueErrors.log');
  end;
end;

procedure TMainForm.MClipShowClick(Sender: TObject);
begin
  FrmClip.Show;
end;

procedure TMainForm.McloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.MclrTeamClick(Sender: TObject);
var
  TDX: Integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX] do BEGIN
     ClearTeam;
  end;
  RefTeam;
  RefSquad;
  LoadGeneral;
end;

procedure TMainForm.McpPlayerClick(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if (PDX < 0) or (TDX < 0) then
    Exit;
  SWSDB.Clipboard.CopyPlayer(SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX]);
  FrmClip.Show;
end;

procedure TMainForm.McpTeamClick(Sender: TObject);
var
  TDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  if TDX < 0 then
    Exit;
  SWSDB.Clipboard.CopyTeam(SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX]);
  FrmClip.Show;
end;

procedure TMainForm.MCSVPlClick(Sender: TObject);
var
  TTS: TStringList;
  a, i, k: integer;
begin
  TTS := TStringList.Create;
  TTS.Delimiter := ';';
  TTS.Clear;
  if EdtSett.CSVString then
        TTS.Add('ID;Nat;Num;Name;Pos;Skin;P;V;H;T;C;S;F;Value;TeamSWSGN;TeamNat;TeamNr;TeamName;')
  else
      TTS.Add('ID;Nat;Num;Name;Pos;Skin;P;V;H;T;C;S;F;Value;TeamSWSGN;TeamNat;TeamNr;TeamUID;');
  for a := 0 to SWSDB.FileCount - 1 do
    for i := 0 to SWSDB.SWSFiles[a].TeamCount - 1 do
      for k := 0 to 15 do
        SWSDB.SWSFiles[a].Team[i].Player[k].ExportToCSV(TTS, -1, EdtSett.CSVString);
  sav.FileName:='players.csv';
  if sav.Execute then
     if sav.FileName<>'' then
        TTS.SaveToFile(sav.FileName);
  TTS.Free;
end;

procedure TMainForm.MCSVTeamClick(Sender: TObject);
var
  TTS: TStringList;
  a, i: integer;
begin
  TTS := TStringList.Create;
  TTS.Delimiter := ';';
  TTS.Clear;
  TTS.Add('ID;Nat;Num;SWSGenNr;Name;Coach;Formation;Division;HK_typ;HK_ShirtCol1;HK_ShirtCol2;HK_Short;HK_Socks;AK_Typ;AK_ShirtCol1;AK_ShirtCol2;AK_Short;AK_Socks;');
  for a := 0 to SWSDB.FileCount - 1 do
    for i := 0 to SWSDB.SWSFiles[a].TeamCount - 1 do
      SWSDB.SWSFiles[a].Team[i].ExportToCSV(TTS, EdtSett.CSVString);
  sav.FileName:='teams.csv';
  if sav.Execute then
     if sav.FileName<>'' then
        TTS.SaveToFile(sav.FileName);
  TTS.Free;
end;

procedure TMainForm.MAddCSVTMClick(Sender: TObject);
var
  TI: Integer;
  CSVTM: TStringList;
begin
  ope.Filter:='TM Editor CSV File|*.CSV|All Files|*.*';
  if ope.Execute then
     if ope.FileName<>'' then BEGIN
        CSVTM:= TStringList.Create;
        CSVTM.LoadFromFile(ope.FileName);
        SWSDB.SWSFiles[SWSDB.FileIndex].AddTeam('CSV TEAM');
        Ti:= SWSDB.SWSFiles[SWSDB.FileIndex].TeamCount - 1;
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[Ti].ImportTMEdtCSV(CSVTM);
        SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := TI;
  end;
  LoadGeneral;
  RefTeam;
  RefSquad;
end;

procedure TMainForm.MDirtyRepClick(Sender: TObject);
var
  TS: TStringList;
  fi, ti: Integer;
begin
  if (SWSDB.LoadedAll) then BEGIN
     TS:=TStringList.Create;
       for fi:=0 to SWSDB.FileCount-1 do
         for ti:=0 to SWSDB.SWSFiles[fi].TeamCount-1 do begin
           if (SWSDB.SWSFiles[fi].Team[Ti].Warning) then
              TS.Add(ExtractFileName(SWSDB.SWSFiles[fi].FileName)+'::'+SWSDB.SWSFiles[fi].Team[ti].TeamNAme);
         end;
     TS.SaveToFile('DirtyTeams.txt');
     ShowMessage('"Dirty" Teams has saved to file <DirtyTeams.txt>');
  end;
end;

procedure TMainForm.MCOPAllClick(Sender: TObject);
var
  i, t, p: integer;
begin
  for i:=0 to SWSDB.FileCount -1 do
    for t:=0 to SWSDB.SWSFiles[i].TeamCount-1 do
      for p:=0 to 15 do begin
          if (SWSDB.SWSFiles[i].Team[t].Player[p].Position<>0) then
             SWSDB.SWSFiles[i].Team[t].Player[p].Value:=
             SWSDB.SWSFiles[i].Team[t].Player[p].CalcPlay(true);
      end;
  if SWSDB.FileIndex > -1 then
     if SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex>-1 then begin
       RefTeam;
       RefSquad;
       RefPlayer;
  end;
end;

procedure TMainForm.MEuroCupClick(Sender: TObject);
begin
  if not SWSDB.LoadedAll then
  begin
    ShowMessage(rsOpenAllBefor);
    Exit;
  end;
  ECCFrm.ReList;
  ECCFrm.Show;
end;

procedure TMainForm.MFindGenSWSDuplClick(Sender: TObject);
begin
  if not SWSDB.LoadedAll then
  begin
    ShowMessage(rsOpenAllBefor);
    Exit;
  end;
  SWSDB.FindSWSGenDuplic;
  ShowMessage('Found duplicates in File: SWS_GenNr_Duplicates.txt');
end;

procedure TMainForm.MFindPlayerDupClick(Sender: TObject);
var
  hL: TLibHandle;
  cdb: Pointer;
  createlib: hCreateLibSWOS;
  freelib: hFreeLibSWOS;
  dupllib: hDuplicateFind;
  openlib: hLoadAllData;
begin
  // HERENOW
  SplashLoad.Show;
  SplashLoad.lbLoading.Caption := 'Searching';
  SplashLoad.pbload.Hide;
  SplashLoad.lbLoadData.Caption := 'This may take a moment. Please wait.';
  SplashLoad.Refresh;
  Application.ProcessMessages;
  hl := LoadLibrary('libSwosEdt.dll');
  if (hl = 0) then begin
    ShowMessage('Failed to load dll');
    Exit;
  end;
  createlib := hCreateLibSWOS(GetProcedureAddress(hl, 'CreateDatabase'));
  if (createlib=nil) then exit;
  freelib := hFreeLibSWOS(GetProcedureAddress(hl, 'FreeDatabase'));
  if (freelib=nil) then exit;
  dupllib := hDuplicateFind(GetProcedureAddress(hl, 'FindDuplicates'));
  if (dupllib=nil) then exit;
  openlib := hLoadAllData(GetProcedureAddress(hl, 'LoadAllDatabase'));
  if (openlib=nil) then exit;

  cdb:=createlib(PChar(SWSDB.SWSDataDir));
  openlib(cdb);
  dupllib(cdb);
  freelib(cdb);
  SplashLoad.pbload.Show;
  SplashLoad.Hide;
  ShowMessage('Found duplicates in File: duplicates.txt');
end;

procedure TMainForm.MFindSWSMaxClick(Sender: TObject);
begin
  if not SWSDB.LoadedAll then
  begin
    ShowMessage(rsOpenAllBefor);
    Exit;
  end;
  ShowMessage(rsMaximalSWOSG + IntToStr(SWSDB.FindMaxSWSGenNum + 1));
end;

procedure TMainForm.MFPbyNameClick(Sender: TObject);
begin
  if SWSDB.FileCount < 1 then
    Exit;
  Findd.tag := 1;
  FindD.Title := rsFindPlayerBy;
  FindD.Execute;
end;

procedure TMainForm.MFTbyNameClick(Sender: TObject);

begin
  if SWSDB.FileCount < 1 then
    Exit;
  Findd.tag := 0;
  FindD.Title := rsFindTeamByNa;
  FindD.Execute;
end;

procedure TMainForm.MGNonLgeClick(Sender: TObject);
var
  idx : Integer;
begin
  if (LBTeams.Selected = nil) then
     Exit;
  idx := PtrUInt(LBTeams.Selected.Data);
  SWSDB.SWSFiles[SWSDB.FileIndex].Team[idx].Division:=4;
  LoadGeneral;
end;

procedure TMainForm.MGoneClick(Sender: TObject);
var
  idx : Integer;
begin
  if (LBTeams.Selected = nil) then
     Exit;
  idx := PtrUInt(LBTeams.Selected.Data);
  SWSDB.SWSFiles[SWSDB.FileIndex].Team[idx].Division:=1;
  LoadGeneral;
end;

procedure TMainForm.MGPremClick(Sender: TObject);
var
  idx : Integer;
begin
  if (LBTeams.Selected = nil) then
     Exit;
  idx := PtrUInt(LBTeams.Selected.Data);
  SWSDB.SWSFiles[SWSDB.FileIndex].Team[idx].Division:=0;
  LoadGeneral;
end;

procedure TMainForm.MGThreeClick(Sender: TObject);
var
  idx : Integer;
begin
  if (LBTeams.Selected = nil) then
     Exit;
  idx := PtrUInt(LBTeams.Selected.Data);
  SWSDB.SWSFiles[SWSDB.FileIndex].Team[idx].Division:=3;
  LoadGeneral;
end;

procedure TMainForm.MGTwoClick(Sender: TObject);
var
  idx : Integer;
begin
  if (LBTeams.Selected = nil) then
     Exit;
  idx := PtrUInt(LBTeams.Selected.Data);
  SWSDB.SWSFiles[SWSDB.FileIndex].Team[idx].Division:=2;
  LoadGeneral;
end;

procedure TMainForm.MHelpPClick(Sender: TObject);
begin
  OpenURL('https://github.com/anoxic83/AG_SWSEdt');
end;

procedure TMainForm.MOpenAllClick(Sender: TObject);
var
  i: integer;
  AttNode: TDOMNode;
  TFN: string;
  kTMD: boolean;
  idn, TMDCount: integer;
begin
  if (SWSDB.LoadedAll) then begin
    ShowMessage('All Files already loaded.');
    Exit();
  end;
  SplashLoad.FormStyle := fsNormal;
  SplashLoad.Show;
  Enabled := False;
  for i := 0 to LBOver.Items.Count - 1 do
  begin
    AttNode := TDOMNode(LBOver.Items[i].Data);
    if AttNode.Attributes.GetNamedItem('DBId') = nil then
    begin
      TFN := '';
      if AttNode.Attributes.GetNamedItem('File') <> nil then
        TFN := AttNode.Attributes.GetNamedItem('File').NodeValue;
      if AttNode.Attributes.GetNamedItem('TMD') <> nil then
        try
          kTMD := boolean(StrToInt(AttNode.Attributes.GetNamedItem('TMD').NodeValue))
        except
          ShowMessage(rsDataErrorInX)
        end;

      if KTMD then
      begin
        if AttNode.Attributes.GetNamedItem('Teams') <> nil then
          try
            TMDCount := (StrToInt(AttNode.Attributes.GetNamedItem('Teams').NodeValue))
          except
            ShowMessage(rsDataErrorInX)
          end;

      end;
      if FileExists(EdtSett.SWSDataPath + TFN) then
      begin
        idn := SWSDB.LoadFile(EdtSett.SWSDataPath + TFN, kTMD, TMDCount);
        TDOMElement(AttNode).SetAttribute('DBId', IntToStr(idn));
        if AttNode.Attributes.GetNamedItem('Num') <> nil then
          SWSDB.SWSFiles[idn].FileNumber :=
            StrToInt(AttNode.Attributes.GetNamedItem('Num').NodeValue);
        if AttNode.Attributes.GetNamedItem('Hex') <> nil then
          SWSDB.SWSFiles[idn].HexVal := AttNode.Attributes.GetNamedItem('Hex').NodeValue;
        if AttNode.Attributes.GetNamedItem('Name') <> nil then
          SWSDB.SWSFiles[idn].LeagueName :=
            AttNode.Attributes.GetNamedItem('Name').NodeValue;
        if AttNode.Attributes.GetNamedItem('Pool') <> nil then
          SWSDB.SWSFiles[idn].Pool :=
            StrToInt(AttNode.Attributes.GetNamedItem('Pool').NodeValue);
        if (AttNode.Attributes.GetNamedItem('OrgTeams') <> nil) then
           SWSDB.SWSFiles[idn].OrgTeamCount:= StrToInt(AttNode.Attributes.GetNamedItem('OrgTeams').NodeValue)
        else
           SWSDB.SWSFiles[idn].OrgTeamCount := -1;
        if (AttNode.Attributes.GetNamedItem('OrgPrem') <> nil) then
           SWSDB.SWSFiles[idn].OrgTeamsByDiv.Premier:= StrToInt(AttNode.Attributes.GetNamedItem('OrgPrem').NodeValue)
        else
           SWSDB.SWSFiles[idn].OrgTeamsByDiv.Premier:= 0;

        if (AttNode.Attributes.GetNamedItem('OrgOne') <> nil) then
           SWSDB.SWSFiles[idn].OrgTeamsByDiv.One:= StrToInt(AttNode.Attributes.GetNamedItem('OrgOne').NodeValue)
        else
           SWSDB.SWSFiles[idn].OrgTeamsByDiv.One:= 0;

        if (AttNode.Attributes.GetNamedItem('OrgTwo') <> nil) then
           SWSDB.SWSFiles[idn].OrgTeamsByDiv.Two:= StrToInt(AttNode.Attributes.GetNamedItem('OrgTwo').NodeValue)
        else
           SWSDB.SWSFiles[idn].OrgTeamsByDiv.Two:= 0;
        if (AttNode.Attributes.GetNamedItem('OrgThree') <> nil) then
           SWSDB.SWSFiles[idn].OrgTeamsByDiv.Three:= StrToInt(AttNode.Attributes.GetNamedItem('OrgThree').NodeValue)
        else
           SWSDB.SWSFiles[idn].OrgTeamsByDiv.Three:= 0;
        if (AttNode.Attributes.GetNamedItem('OrgNL') <> nil) then
           SWSDB.SWSFiles[idn].OrgTeamsByDiv.NonLge:= StrToInt(AttNode.Attributes.GetNamedItem('OrgNL').NodeValue)
        else
           SWSDB.SWSFiles[idn].OrgTeamsByDiv.NonLge:= 0;
        if SWSDB.SWSFiles[idn].HexVal <> '' then
          SWSDB.SWSFiles[idn].LoadLeague;
      end;
    end
    else
    begin
      idn := StrToInt(AttNode.Attributes.GetNamedItem('DBId').NodeValue);
      if AttNode.Attributes.GetNamedItem('File') <> nil then
        TFN := AttNode.Attributes.GetNamedItem('File').NodeValue;
      if FileExists(EdtSett.SWSDataPath + TFN) then
        SWSDB.SWSFiles[idn].Load(EdtSett.SWSDataPath + TFN);
    end;
  end;
  //testpool:=0;
  //For i:=0 to SWSDB.FileCount-1 do
  //    testpool:=testpool+SWSDB.SWSFiles[i].Pool;
  //ShowMessage(IntToStr(testpool));
  SWSDB.PoolPlyr.Load(EdtSett.SWSDataPath + 'POOLPLYR.DAT');
  SWSDB.EuropeanCups.LoadDta;
  SWSDB.LoadedAll := True;
  SetEnables(True, True);
  SplashLoad.hide;
  Enabled := True;
  PCtrlChange(self);
  ShowMessage(rsFilesLoaded + IntToStr(SWSDB.FileCount));
end;

procedure TMainForm.MPAMClick(Sender: TObject);
begin
  Gener(6);
end;

procedure TMainForm.MPaPlayerClick(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if SWSDB.Clipboard.PlayerIndex < 0 then begin
    ShowMessage(rsChooseAPlaye);
    MClipShowClick(self);
    Exit;
  end;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Assign(
    SWSDB.Clipboard.Player[SWSDB.Clipboard.PlayerIndex]);
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].PlayInTeam := PDX;
  RefSquad;
  RefPlayer;
  FrmClip.FocusControl(FrmClip.clbPlayer);
  FrmClip.clbPlayer.Selected[SWSDB.Clipboard.PlayerIndex] := True;
end;

procedure TMainForm.MpaTeamClick(Sender: TObject);
var
  TDX: integer;
begin
  if SWSDB.Clipboard.TeamIndex < 0 then begin
     ShowMessage(rsChooseATeamT);
     MClipShowClick(self);
     Exit;
  end;
  TDX:=SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  //ShowMessage('FileIdx: '+IntToStr(SWSDb.FileIndex));
  //ShowMessage('Team IDx: '+IntToStr(TDX));
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Assign(
    SWSDB.Clipboard.Team[SWSDB.Clipboard.TeamIndex]);

  LoadGeneral;
  RefTeam;
  RefSquad;
  FrmClip.FocusControl(FrmClip.ClbTeam);
  FrmClip.ClbTeam.Selected[SWSDB.Clipboard.TeamIndex] := True;
end;

procedure TMainForm.MPAttackerClick(Sender: TObject);

begin
  Gener(7);
end;

procedure TMainForm.MPcomplClick(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].GenerateAttrbyValue;
  RefPlayer;
end;

procedure TMainForm.MPDefClick(Sender: TObject);
begin
  Gener(1);
end;

procedure TMainForm.MPDMClick(Sender: TObject);
begin
  Gener(4);
end;

procedure TMainForm.MPMidClick(Sender: TObject);
begin
  Gener(5);
end;

procedure TMainForm.MPScClick(Sender: TObject);
begin
  Gener(8);
end;

procedure TMainForm.MPShowPlayClick(Sender: TObject);
var
  TIDx: integer;

begin
  if LBSquad.Selected = nil then
    Exit;
  if LBSquad.ItemIndex < 0 then
    Exit;
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex :=
    PtrUInt(LBSquad.Items[LBSquad.ItemIndex].Data);
  tbPlayer.Enabled := True;
  RefPlayer;
  PCtrl.ActivePage := tbPlayer;

end;

procedure TMainForm.MPSiteBackClick(Sender: TObject);
begin
  Gener(0);
end;

procedure TMainForm.MPSiteMClick(Sender: TObject);
begin
  Gener(2);
end;

procedure TMainForm.MPWingClick(Sender: TObject);
begin
  Gener(3);
end;

procedure TMainForm.MreadTeamClick(Sender: TObject);
var
  idn: integer;
  XNod, YNod, Mnod: TDOMNode;
  FN: UTF8String;
  i: integer;
  kTMD: boolean;
  dTmd: integer;

  procedure AddToOverList(isTMD: boolean; teTMD: integer);
  var
    lTMD: string;
  begin
    case isTMD of
      true: ltmd:='1';
      false: lTMD:='0';
    end;
    try
      Xnod := SWSDB.LeaguesFile.DocumentElement.FindNode('SWSData');
      YNOd := Xnod.FindNode('Load_Files');
      if Ynod = nil then
      begin
        YNod := SWSDB.LeaguesFile.CreateElement('Load_Files');
        TDOMElement(Ynod).SetAttribute('Name', 'Loaded Files');
        XNod.AppendChild(Ynod);
      end;
      MNod := SWSDB.LeaguesFile.CreateElement('TEAMF' + IntToStr(SWSDB.FileCount));
      TDOMElement(Mnod).SetAttribute('Name', extractFilename(FN));
      TDOMElement(Mnod).SetAttribute('Hex', '');
      TDOMElement(Mnod).SetAttribute('TMD', lTMD);
      TDOMElement(Mnod).SetAttribute('Pool', '0');
      TDOMElement(Mnod).SetAttribute('Num', '-1');
      TDOMElement(Mnod).SetAttribute('File', FN);
      TDOMElement(Mnod).SetAttribute('Flag', 'Unknown.png');
      TDOMElement(Mnod).SetAttribute('DBId', IntToStr(idn));
      if kTMD then
         TDOMElement(MNod).SetAttribute('Teams',IntToStr(teTMD));
      YNod.AppendChild(MNod);
    except
      ShowMessage('Error');
    end;
  end;

begin
  if (not DropFile) then
  begin
    ope.Filter :=
      'SWOS Team Files|TEAM.*|SWOS Custom Files|CUSTOMS.EDT|SWOS CUS File|*.CUS|All Files|*.*';
    if ope.Execute then
      if ope.Files.Count > 0 then
      begin
        SplashLoad.Show;
        Enabled := False;
        for i := 0 to ope.Files.Count - 1 do
        begin
          dTMD:=0;
          kTMD:=false;
          if ExtractFileName(ope.Files[i])='EUROCUP.TMD' then begin
             ktmd:=true;
             dTmd:=16;
          end ;
          if ExtractFileName(ope.Files[i])='EUROCWC.TMD' then begin
             ktmd:=true;
             dTmd:=32;
          end ;
          if ExtractFileName(ope.Files[i])='UEFACUP.TMD' then begin
             ktmd:=true;
             dTmd:=32;
          end ;
          idn := SWSDB.LoadFile(UTF8ToAnsi(ope.Files[i]),kTMD,dTMD);
          if idn = -1 then
          begin
            ShowMessage('Error:  Not SWOS Data File');
            SplashLoad.Hide;
            Enabled := True;
            Exit;
          end;
          FN := ope.Files[i];
          AddToOverList(kTMD,dTMD);
        end;
        SplashLoad.Hide;
        Enabled := True;
        AddToOverList(kTMD,dTMD);
        SWSDB.FileIndex := idn;
      end
      else
        Exit;
  end
  else
  begin
    SplashLoad.Show;
    Enabled := False;
    for i := Low(NameDrop) to High(NameDrop) do
    begin
      dTMD:=0;
      kTMD:=false;
      if ExtractFileName(NameDrop[i])='EUROCUP.TMD' then begin
         ktmd:=true;
         dTmd:=16;
      end ;
      if ExtractFileName(NameDrop[i])='EUROCWC.TMD' then begin
         ktmd:=true;
         dTmd:=32;
      end ;
      if ExtractFileName(NameDrop[i])='UEFACUP.TMD' then begin
         ktmd:=true;
         dTmd:=32;
      end ;
      idn := SWSDB.LoadFile(UTF8ToAnsi(NameDrop[i]),kTMD,dTMD);
      if idn = -1 then
      begin
        ShowMessage('Error:  Not SWOS Data File');
        SplashLoad.Hide;
        Enabled := True;
        Exit;
      end;
      FN := NameDrop[i];
      AddToOverList(kTMD,dTMD);
    end;
    SplashLoad.Hide;
    Enabled := True;
    SWSDB.FileIndex := idn;
  end;

  if SWSDB.FileCount > 0 then begin
    LoadOver;
    SetEnables(False, True);
    tbGeneral.Enabled := True;
    PCtrl.ActivePage := tbGeneral;
    PCtrlChange(self);
    Show;
  end;
end;

procedure TMainForm.MreloadClick(Sender: TObject);
begin
  if SWSDB.SWSFiles[SWSDB.FileIndex].Changed then
     if Application.MessageBox(Pchar('You Have Modified and not Saved files. Are You Sure Reload?'),'Not Saved',MB_YESNO)=IDNO then
     Exit;
  SWSDB.SWSFiles[SWSDB.FileIndex].Load;
  LoadGeneral;
  PCtrl.ActivePage := tbGeneral;
end;

procedure TMainForm.MRemoveTeamClick(Sender: TObject);
begin
  if (SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex < 0) or
    (SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex >
    SWSDB.SWSFiles[SWSDB.FileIndex].TeamCount - 1) then
    Exit;
  SWSDB.SWSFiles[SWSDB.FileIndex].RemoveTeam(SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex);
  SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := -1;
  LoadGeneral;
end;

procedure TMainForm.MReplaceCSVClick(Sender: TObject);
var
  TI, i: Integer;
  CSVTM: TStringList;
begin
  ope.Filter:='TM Editor CSV File|*.CSV|All Files|*.*';
  if ope.Execute then
     if ope.FileName<>'' then BEGIN
        CSVTM:= TStringList.Create;
        CSVTM.LoadFromFile(ope.FileName);
        Ti:= SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex;
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[Ti].ImportTMEdtCSV(CSVTM);
        for i := 0 to 15 do
        begin
          if SWSDB.SWSFiles[SWSDb.FileIndex].Team[Ti].Player[i].Position <> 0 then
            SWSDB.SWSFiles[SWSDb.FileIndex].Team[Ti].Player[i].Value :=
              SWSDB.SWSFiles[SWSDb.FileIndex].Team[Ti].Player[i].CalcPlay(True);
        end;
        SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := TI;
  end;
  LoadGeneral;
  RefTeam;
  RefSquad;
end;

procedure TMainForm.MSettingsClick(Sender: TObject);
var
  PCid : integer;
begin
  PCid := PCtrl.ActivePageIndex;
  SettingForm.PageControl1.ActivePageIndex := 0;
  if SettingForm.ShowModal = mrOk then
  if Application.MessageBox(Pchar('Reload All? You lost all not saved changes.'),Pchar('Reload?'),MB_YESNO)=IDYES then begin
    SWSDB.SWSExeDir := EdtSett.SWSExePath;
    SWSDB.SWSDataDir := EdtSett.SWSDataPath;
    SWSDB.CloseAll;
    SWSDB.ReadConf('leagues.xml');
    LoadOver;
  end;
  PCtrl.ActivePage := tbOver;
end;

procedure TMainForm.MShowPoolClick(Sender: TObject);
begin
  PoolForm.Show;
end;

procedure TMainForm.MShowRandomClick(Sender: TObject);
var
  FX, TX, PX: integer;
begin
  Randomize;
  FX := round(Random(SwSDB.FileCount));
  SWSDB.FileIndex := FX;
  TX := Round(Random(SWSDB.SWSFiles[FX].TeamCount));
  SWSDB.SWSFiles[fx].TeamIndex := TX;
  PX := Round(Random(15));
  SWSDB.SWSFiles[fx].Team[TX].PlayerIndex := PX;
  LoadGeneral;
  RefTeam;
  RefSquad;
  RefPlayer;
  PCtrl.ActivePage := tbPlayer;
  PCtrlChange(self);
end;

procedure TMainForm.MShSquadClick(Sender: TObject);
begin
  if LBTeams.Selected = nil then
    EXit;
  SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := PtrUInt(LBTeams.Selected.Data);
  tbTeam.Enabled := True;
  RefTeam;
  RefSquad;
  PCtrl.ActivePage := tbSquad;
end;

procedure TMainForm.MUnloadAllClick(Sender: TObject);
begin
  SWSDB.CloseAll;
  SWSDB.ReadConf('leagues.xml');
  LoadOver;
  PCtrl.ActivePage:=tbOver;
end;

procedure TMainForm.MWriteAllClick(Sender: TObject);
var
  licz: integer;
begin
  if SWSDB.ChangedFiles()=0 then
     ShowMessage(rsNothingToWri);
  SplashLoad.Show;
  licz := SWSDB.WriteAll(EdtSett.SWSDataPath);
  SplashLoad.Hide;
  ShowMessage(rsFilesSaved + IntToStr(licz));
end;

procedure TMainForm.MWriteCurClick(Sender: TObject);
begin
  if SWSDB.SWSFiles[SWSDB.FileIndex].Changed then
  begin
    SplashLoad.Show;
    SWSDB.SWSFiles[SWSDB.FileIndex].Write;
    SplashLoad.hide;
  end else
    ShowMessage(rsCanNotWriteF);
end;

procedure TMainForm.MXMLPlClick(Sender: TObject);
var
  XML2: TXMLDocument;
  Root: TDOMNode;
  a, i, k: integer;
  uid: INt64;
begin
  XML2:=TXMLDocument.Create;

  Root:=XML2.CreateElement('Players');
  XML2.AppendChild(Root);
  uid:=0;
  for a := 0 to SWSDB.FileCount - 1 do
    for i := 0 to SWSDB.SWSFiles[a].TeamCount - 1 do
      for k := 0 to 15 do begin
        SWSDB.SWSFiles[a].Team[i].Player[k].ExportXML(XML2, Root, uid);
        uid += 1;
      end;
  sav.FileName:='players.xml';
  sav.Filter:='XML File|*.xml|All Files|*.*';
  if sav.Execute then
     if sav.FileName<>'' then
        WriteXMLFile(XML2, sav.FileName);
end;

procedure TMainForm.MXMLteamClick(Sender: TObject);
var
  XML2: TXMLDocument;
  Root: TDOMNode;
  a, i, uid: integer;
begin
  XML2:=TXMLDocument.Create;

  Root:=XML2.CreateElement('Teams');
  XML2.AppendChild(Root);
  uid:=0;
  for a := 0 to SWSDB.FileCount - 1 do
    for i := 0 to SWSDB.SWSFiles[a].TeamCount - 1 do
        SWSDB.SWSFiles[a].Team[i].ExportToXML(XML2, Root);
  sav.FileName:='teams.xml';
  sav.Filter:='XML File|*.xml|All Files|*.*';
  if sav.Execute then
     if sav.FileName<>'' then
        WriteXMLFile(XML2, sav.FileName);
end;

procedure TMainForm.pbTacPaint(Sender: TObject);
var
  TDX: integer;
begin
  if tBSquad.Enabled = False then
    Exit;
  if not (PCtrl.ActivePage = tbSquad) then
    Exit;
  TDX := SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex;
  with SWSDB.SWSFiles[SWSDB.FileIndex].Team[TDX] do
  begin
    Tactic.FieldFN := TacFN;
    Tactic.FieldImage := nil;
    Tactic.DrawPreview(pbtac.Canvas, 0, 0, 326, 225, nil);
    pbTac.Canvas.Refresh;
  end;
end;

procedure TMainForm.PCtrlChange(Sender: TObject);
var
  Tidd, Pidd: integer;
begin
  Tidd := -1;
  Pidd := -1;
  if SWSDB.FileIndex > -1 then
    tidd := SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex;
  if Tidd > -1 then
    Pidd := SWSDB.SWSFiles[SWSDB.FileIndex].Team[tidd].PlayerIndex;
  if SWSDB.ChangedFiles() > 0 then
    MWriteAll.Caption := Format(rsWriteAllD, [SWSDB.ChangedFiles()])
  else
    MWriteAll.Caption := rsWriteAll;
  // OVER
  if PCtrl.ActivePage = tbOver then
  begin
    lbFLFiDF.Caption := Format('%d/%d', [SWSDB.FileCount, SWSDB.FilesInDta]);
    lbTeamEdited.Caption := Format(rsFilesEditedD, [SWSDB.ChangedFiles()]);
  end;
  if SWSDB.FileIndex > -1 then
     tbGeneral.Enabled:=true
  else
     tbGeneral.Enabled:=False;
  // GENERAL
  if PCtrl.ActivePageIndex > 0 then BEGIN
    tidd := SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex;
    if SWSDB.SWSFiles[SWSDB.FileIndex].TeamCount>0 then begin
      if ((tidd<0) or (tidd>SWSDB.SWSFiles[SWSDB.FileIndex].TeamCount-1)) then
        SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex := 0;
      tbTeam.Enabled:=true;
      tbSquad.Enabled:=true;
      tidd := SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex;
      if SWSDB.SWSFiles[SWSDB.FileIndex].Team[tidd].PlayerIndex < 0 then
        SWSDB.SWSFiles[SWSDB.FileIndex].Team[tidd].PlayerIndex:=0;
      tbPlayer.Enabled:=true;
      LoadGeneral;
      RefTeam;
      RefSquad;
      RefPlayer;
    end
    else begin
      tbTeam.Enabled:=false;
      tbSquad.Enabled:=false;
    end;
  end; // GEN

end;

procedure TMainForm.PCtrlChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange:= false;
  if SWSDB.FileIndex > -1 then
    if SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex > -1 then
       AllowChange:= true;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX] do
  begin
    if Passing < 7 then
      Passing := Passing + 8
    else
      Passing := Passing - 8;
  end;
  RefPlayer;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX] do
  begin
    if Shooting < 7 then
      Shooting := Shooting + 8
    else
      Shooting := Shooting - 8;
  end;
  RefPlayer;

end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX] do
  begin
    if Heading < 7 then
      Heading := Heading + 8
    else
      Heading := Heading - 8;
  end;
  RefPlayer;

end;

procedure TMainForm.SpeedButton4Click(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX] do
  begin
    if Tackling < 7 then
      Tackling := Tackling + 8
    else
      Tackling := Tackling - 8;
  end;
  RefPlayer;

end;

procedure TMainForm.SpeedButton5Click(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX] do
  begin
    if Ball_Control < 7 then
      Ball_Control := Ball_Control + 8
    else
      Ball_Control := Ball_Control - 8;
  end;
  RefPlayer;

end;

procedure TMainForm.SpeedButton6Click(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX] do
  begin
    if Speed < 7 then
      Speed := Speed + 8
    else
      Speed := Speed - 8;
  end;
  RefPlayer;

end;

procedure TMainForm.SpeedButton7Click(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX] do
  begin
    if Finishing < 7 then
      Finishing := Finishing + 8
    else
      Finishing := Finishing - 8;
  end;
  RefPlayer;

end;

procedure TMainForm.SWSVerMouseEnter(Sender: TObject);
begin
  if (eoShowHints in EdtSett.EditOptions) then
  begin
    PopNotify.Text := rsFileIsNotLea;
    PopNotify.Title := rsLeagueStruct;
    PopNotify.vNotifierForm.Height := 120;
    if not SWSDB.SWSFiles[SWSDB.FileIndex].League.Loaded then
      PopNotify.ShowAtPos(Left + SWSver.Left, Top + SWSVer.Top);
  end;

end;

procedure TMainForm.SWSVerMouseLeave(Sender: TObject);
begin
  if (eoShowHints in EdtSett.EditOptions) then
    PopNotify.Hide;
end;

procedure TMainForm.UpDownClick(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
    if SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex <
      SWSDB.SWSFiles[SWSDb.FileIndex].TeamCount - 1 then
      SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex :=
        SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex + 1
    else
      SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex := 0;
  if Button = btPrev then
    if SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex > 0 then
      SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex :=
        SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex - 1
    else
      SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex := SWSDB.SWSFiles[SWSDb.FileIndex].TeamCount - 1;
  RefTeam;
  RefSquad;
  RefReserve;
  pbTacPaint(self);
end;

procedure TMainForm.UpDownPlayClick(Sender: TObject; Button: TUDBtnType);
var
  TIDX: integer;
begin
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  if Button = btNext then
    if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex < 15 then
      SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex :=
        SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex + 1
    else
      SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex := 0;
  if Button = btPrev then
    if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex > 0 then
      SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex :=
        SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex - 1
    else
      SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex := 15;
  LBSquad.ItemIndex := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex;
  pbTacPaint(self);
  RefReserve;
  RefSquad;
  RefPlayer;
end;

procedure TMainForm.CustomExceptionHandler(Sender: TObject; E: Exception);
begin
  DumpExceptionCallStack(E);
  Halt;
end;

procedure TMainForm.LoadTP;

  procedure ListFileDir(Path: string; FileList: TStrings);
  var
    SR: TSearchRec;
  begin
    if FindFirst(Path + '*.*', faDirectory, SR) = 0 then
    begin
      repeat
        if (SR.Attr or faDirectory = SR.Attr) then
        begin
          FileList.Add(SR.Name);
        end;
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;
  end;

var
  TPDir: TStringList;
  a, x: integer;
  TmpNam, TmpPat: string;
begin
  TPDir := TStringList.Create;
  TPDir.Clear;
  SetLength(TPDirectorys, 0);
  ListFileDir(EdtSett.TotalPackDir + 'custom' + PathDelim + 'team db' + PathDelim, TPDir);
  x := 0;
  for a := 0 to TPDir.Count - 1 do
  begin
    if ((TPDir[a] <> '.')and(TPDir[a] <> '..')) then
    begin
      SetLength(TPDirectorys, x + 1);
      TPDirectorys[x].Name := TPDir.Strings[a];
      //TPDirectorys[x].Name := Copy(TPDir.strings[a], 1, Length(TPDir.Strings[a]));
      TPDirectorys[x].Path := TPDir.Strings[a];
      Inc(x);
    end;
   end;
end;

procedure TMainForm.LoadOver;
var
  Xnod, Ynod: TDOMNode;
  LBNod, LVNod: TtreeNode;
  i, a, flx: integer;
  NFN: string;
  Flg: string;
  BMP: TBGRABitmap;
begin
  LBOver.Items.Clear;
  SWSDB.FilesInDta := 0;
  CBSkin.Clear;
  for i := 0 to 2 do
    CBSKin.AddItem(Cskin[i], nil);
  cbpNation.Clear;
  for i := 0 to 152 do
    cbpNation.AddItem(CNat[i], nil);
  CBposit.Clear;
  for i := 0 to 7 do
    CBposit.AddItem(CPos[i].descr + ' (' + Cpos[i].short + ')', nil);
  CBValue.Clear;
  for i := 0 to $31 do
    CBValue.AddItem(CVal[i], nil);
  ESWSdir.Text := EdtSett.SWSDataPath;
  if EdtSett.UseTP then
  begin
    CBTPVer.Enabled := True;
    LoadTP;
    CBTPVer.Clear;
    for a := 0 to Length(TPDirectorys) - 1 do
      CBTPVer.Items.Add(TPDirectorys[a].Name);
    if EdtSett.TotalPackIndex < 0 then
      if CBTPVer.Items.Count > 0 then
        EdtSett.TotalPackIndex := 0;
    CBTPVer.ItemIndex := EdtSett.TotalPackIndex;
  end
  else
    CBTPVer.Enabled := False;

  try
    Xnod := SWSDB.LeaguesFile.DocumentElement.FindNode('SWSData');
    for i := 0 to Xnod.ChildNodes.Count - 1 do
    begin
      Ynod := Xnod.ChildNodes[i];
      LBNod := LBover.Items.Add(nil, Ynod.Attributes[0].NodeValue);
      LBNod.Data := Pointer(Ynod);
      LVNod := LBNod;
      for a := 0 to YNod.ChildNodes.Count - 1 do
      begin
        NFN := YNod.ChildNodes[a].Attributes.GetNamedItem('File').NodeValue;
        Flg := YNod.ChildNodes[a].Attributes.GetNamedItem('Flag').NodeValue;

        if Ynod.NodeName <> 'Load_Files' then
          NFN := EdtSett.SWSDataPath + NFN;
        if FileExists(NFN) then
        begin
          LBNod := LBOver.Items.AddChild(LVNod,
            YNod.ChildNodes[a].Attributes[0].NodeValue);
          LBNod.Data := Pointer(Ynod.ChildNodes[a]);
          SWSDB.FilesInDta := SWSDB.FilesInDta + 1;
          if Flg <> '' then
            if FileExists(FlagDir + '24\' + Flg) then
            begin
              //LOAD FLAG
              BMP := TBGRABitmap.Create(FlagDir + '24\' + Flg);
              flx := FilFlags.Add(BMP.Bitmap, nil);
              LBNod.ImageIndex := flx;
            end;
        end;
      end;
    end;
  except
    Application.MessageBox(PChar(rsUnableToLoad), PChar(rsError), MB_ICONERROR + MB_OK);
  end;
  //PCtrl.ActivePage := tbGeneral;
  PCtrl.ActivePage := tbOver;
  Refresh;
end;

procedure TMainForm.LoadGeneral;
var
  TI: TListItem;
  TC: TListColumn;
  a, lig: integer;
  Prm, One, Two, Tree: integer;

  procedure ClearDiv;

  begin
    LD1.Font.Color := clDefault;
    LD2.Font.Color := clDefault;
    LD3.Font.Color := clDefault;
    LD4.Font.Color := clDefault;
    LD1.Caption := '0';
    LP1.Caption := '0';
    LX1.Caption := '0';
    LR1.Caption := '0';
    LV1.Caption := '0';
    LD2.Caption := '0';
    LP2.Caption := '0';
    LX2.Caption := '0';
    LR2.Caption := '0';
    LV2.Caption := '0';
    LD3.Caption := '0';
    LP3.Caption := '0';
    LX3.Caption := '0';
    LR3.Caption := '0';
    LV3.Caption := '0';
    LD4.Caption := '0';
    LP4.Caption := '0';
    LX4.Caption := '0';
    LR4.Caption := '0';
    LV4.Caption := '0';
  end;

begin
  LBTeams.Clear;
  LBTeams.Columns.Clear;
  TC := LBTeams.Columns.Add;
  TC.Caption := 'Nr';
  TC.Width := 50;
  TC.Alignment := taLeftJustify;
  tC := LBTeams.Columns.Add;
  TC.Caption := 'Name';
  TC.Width := 200;
  TC.Alignment := taLeftJustify;
  TC := LBTeams.Columns.Add;
  TC.Caption := 'Division';
  TC.Width := 120;
  TC.Alignment := taLeftJustify;
  TC := LBTeams.Columns.Add;
  TC.Caption := 'Pts_Gen';
  TC.Width := 60;
  TC.Alignment := taLeftJustify;
  TC := LBTeams.Columns.Add;
  TC.Caption := 'Pts_7';
  TC.Width := 60;
  TC.Alignment := taLeftJustify;
  //
  TC := LBTeams.Columns.Add;
  TC.Caption := 'Speed';
  TC.Width := 60;
  TC.Alignment := taLeftJustify;
  CBTeams.Clear;
  CBSquad.Clear;


  for a := 0 to SWSDB.SWSFiles[SWSDB.FileIndex].TeamCount - 1 do
  begin
    with SWSDB.SWSFiles[SWSDB.FileIndex].Team[a] do
    begin
      TI := LBTeams.Items.Add;
      TI.Caption := IntToStr(TeamNum);
      TI.SubItems.Add(TeamNAme);
      CBTeams.AddItem(TeamNAme, TObject(PtrUint(a)));
      CBSquad.AddItem(TeamNAme, TObject(PtrUint(a)));
      TI.SubItems.Add(Cdiv[Division]);
      TI.SubItems.Add(IntToStr(CalcTeam(False)));
      TI.SubItems.Add(IntToStr(CalcTeam(True)));
      TI.SubItems.Add(IntToStr(CalcTeamSkill(5, true)));
      TI.Data := Pointer(PtrUInt(a));
      LBTeams.RowSelect := True;
    end;
  end;
  if SWSDB.SWSFiles[SWSDB.FileIndex].TeamCount>0 then
     if ((SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex < 0)or(SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex > SWSDB.SWSFiles[SWSDB.FileIndex].TeamCount-1)) then
         SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex:=0;
  if SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex > -1 then
  begin
    lbTeams.Items[SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex].Selected := True;
    LBTeams.ItemIndex := SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex;
    CBTeams.ItemIndex := SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex;
    CBSquad.ItemIndex := SWSDB.SWSFiles[SWSDB.FileIndex].TeamIndex;
    tbTeam.Enabled := True;
  end
  else
    tbTeam.Enabled := False;

  // Team File Information

  LTC.Caption := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].TeamCount);
  DPT.Caption := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].TeamByDiv(0));
  D1T.Caption := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].TeamByDiv(1));
  D2T.Caption := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].TeamByDiv(2));
  D3T.Caption := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].TeamByDiv(3));
  DNT.Caption := IntToStr(SWSDB.SWSFiles[SWSDB.FileIndex].TeamByDiv(4));
  // SWS League Structure
  with SWSDB.SWSFiles[SWSDB.FileIndex] do
  begin
    ClearDiv;
    if League.Loaded then
    begin
      lig := League.Leagues;
      SWSDB.SWSFiles[SWSDB.FileIndex].VerifyLeagueStrc(prm, one, two, tree);
      if lig > 0 then
      begin
        if Prm <> 0 then
          LD1.Font.Color := clRed
        else
          LD1.Font.Color := clDefault;
        LD1.Caption := IntToStr(League.Division[0].Teams);
        LP1.Caption := IntToStr(League.Division[0].Promotion);
        LX1.Caption := IntToStr(League.Division[0].Promotion_PO);
        LR1.Caption := IntToStr(League.Division[0].Relegation);
        LV1.Caption := IntToStr(League.Division[0].Relegation_PO);
      end;
      if lig > 1 then
      begin
        if One <> 0 then
          LD2.Font.Color := clRed
        else
          LD2.Font.Color := clDefault;
        LD2.Caption := IntToStr(League.Division[1].Teams);
        LP2.Caption := IntToStr(League.Division[1].Promotion);
        LX2.Caption := IntToStr(League.Division[1].Promotion_PO);
        LR2.Caption := IntToStr(League.Division[1].Relegation);
        LV2.Caption := IntToStr(League.Division[1].Relegation_PO);
      end;
      if lig > 2 then
      begin
        if Two <> 0 then
          LD3.Font.Color := clRed
        else
          LD3.Font.Color := clDefault;
        LD3.Caption := IntToStr(League.Division[2].Teams);
        LP3.Caption := IntToStr(League.Division[2].Promotion);
        LX3.Caption := IntToStr(League.Division[2].Promotion_PO);
        LR3.Caption := IntToStr(League.Division[2].Relegation);
        LV3.Caption := IntToStr(League.Division[2].Relegation_PO);
      end;
      if lig > 3 then
      begin
        if Tree <> 0 then
          LD4.Font.Color := clRed
        else
          LD4.Font.Color := clDefault;
        LD4.Caption := IntToStr(League.Division[3].Teams);
        LP4.Caption := IntToStr(League.Division[3].Promotion);
        LX4.Caption := IntToStr(League.Division[3].Promotion_PO);
        LR4.Caption := IntToStr(League.Division[3].Relegation);
        LV4.Caption := IntToStr(League.Division[3].Relegation_PO);
      end;
    end;
    case CheckLeagueTeams of
      True:
      begin
        AdvLed1.Kind := lkGreenLight;
        AdvLed1.State := lsOn;
      end;
      False:
      begin
        AdvLed1.Kind := lkRedLight;
        AdvLed1.State := lsOn;
      end;
    end;
    if not League.Loaded then
    begin
      AdvLed1.Kind := lkYellowLight;
      AdvLed1.State := lsOn;
      btEdtLeagStruc.Enabled := False;
    end;
    SWSVer.Enabled := League.Loaded;
    btEdtLeagStruc.Enabled := League.Loaded;
  end;
end;

procedure TMainForm.RefTeam;
var
  TIDx, i: integer;
  BMPF: TBGRABitmap;
  FlgT: string;
begin

  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  CBTeams.ItemIndex := TIDX;
  CBHKitTyp.Clear;
  cbAKitTyp.Clear;
  for i := 0 to 3 do
  begin
    cbAKitTyp.Items.Add(CSWkitType[i]);
    cbHKitTyp.Items.Add(CSWkitType[i]);
  end;
  cbHShirtCol1.Clear;
  cbHShirtcol2.Clear;
  cbHShortCol.Clear;
  cbHSockCol.Clear;
  cbAShirtCol1.Clear;
  cbAShirtcol2.Clear;
  cbAShortCol.Clear;
  cbASockCol.Clear;
  for i := 0 to 9 do
  begin
    cbHShirtCol1.Items.AddObject(CSWStrCol[i], TObject(PtrUint(CSWScolors[i])));
    cbHShirtcol2.Items.AddObject(CSWStrCol[i], TObject(PtrUint(CSWScolors[i])));
    cbHShortCol.Items.AddObject(CSWStrCol[i], TObject(PtrUint(CSWScolors[i])));
    cbHSockCol.Items.AddObject(CSWStrCol[i], TObject(PtrUint(CSWScolors[i])));
    cbAShirtCol1.Items.AddObject(CSWStrCol[i], TObject(PtrUint(CSWScolors[i])));
    cbAShirtcol2.Items.AddObject(CSWStrCol[i], TObject(PtrUint(CSWScolors[i])));
    cbAShortCol.Items.AddObject(CSWStrCol[i], TObject(PtrUint(CSWScolors[i])));
    cbASockCol.Items.AddObject(CSWStrCol[i], TObject(PtrUint(CSWScolors[i])));
  end;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX] do
  begin
    ETeamname.Text := TeamNAme;
    ETeamNum.Text := IntToStr(TeamNum);
    ENationNum.Text := IntToStr(Nation);
    ESWSgennum.Text := IntToStr(SWS_Gen_Num);
    CBDivision.Clear;
    for i := 0 to 4 do
      CBDivision.AddItem(CDiv[i], nil);
    CBDivision.ItemIndex := Division;
    ECoach.Text := Coach;
    cbAKitTyp.ItemIndex := AwayKit.Typ;
    CBHKitTyp.ItemIndex := HomeKit.Typ;
    cbHShirtCol1.ItemIndex := HomeKit.ShirtCol1;
    cbHShirtcol2.ItemIndex := HomeKit.ShirtCol2;
    cbHShortCol.ItemIndex := HomeKit.ShortCol;
    cbHSockCol.ItemIndex := HomeKit.SocksCol;
    cbAShirtCol1.ItemIndex := AwayKit.ShirtCol1;
    cbAShirtcol2.ItemIndex := AwayKit.ShirtCol2;
    cbAShortCol.ItemIndex := AwayKit.ShortCol;
    cbASockCol.ItemIndex := AwayKit.SocksCol;
    DRAWSHIRT(ImHShirt, HomeKit.Typ, CSWScolors[HomeKit.ShirtCol1],
      CSWScolors[HomeKit.ShirtCol2]);
    DRAWSHORT(imHShort, CSWScolors[HomeKit.ShortCol]);
    DRAWSOCKS(imHSock, CSWScolors[HomeKit.SocksCol]);
    DRAWSHIRT(ImAShirt, AwayKit.Typ, CSWScolors[AwayKit.ShirtCol1],
      CSWScolors[AwayKit.ShirtCol2]);
    DRAWSHORT(imAShort, CSWScolors[AwayKit.ShortCol]);
    DRAWSOCKS(imASock, CSWScolors[AwayKit.SocksCol]);
    FlgT := SWSDB.FlagName(Nation);
    lbTmAtPts.Caption := Format(rsTeamAttribut, [CalcTeam(False)]);
    lbtmAttPtsb7.Caption := Format(rsTeamAttribut2, [CalcTeam(True)]);
  end;
  if (FileExists(FlagDir + '24' + PathDelim + FlgT)) then
  begin
    ImTFlag.Picture.LoadFromFile(FlagDir + '24' + PathDelim + FlgT);

    ImTFlag.Picture.Bitmap.Canvas.Refresh;
    ImTFlag.Refresh;
  end
  else
  begin
    ImTFlag.Picture.Bitmap.Clear;
    ImTFlag.Refresh;
  end;
  lbtmCnt.Caption := Format('%d/%d', [SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex +
    1, SWSDB.SWSFiles[SWSDb.FileIndex].TeamCount]);
end;

procedure TMainForm.RefSquad;
var
  TIDx, i: integer;
  LI: TListItem;
  LC: TListColumn;
  a : integer;
  FlgT: string;
begin
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  CBSquad.ItemIndex := TIDX;
  CBPlayer.Clear;
  LBSquad.Clear;
  cbForm.Clear;
  for a := 0 to 17 do
    cbForm.AddItem(Ctac[a], nil);
  LBSquad.Columns.Clear;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'Name';
  LC.Alignment := taLeftJustify;
  LC.Width := 180;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'Nr';
  LC.Alignment := taRightJustify;
  LC.Width := 25;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'Pos';
  LC.Alignment := taCenter;
  LC.Width := 40;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'Nat';
  LC.Alignment := taCenter;
  LC.Width := 40;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'Attrb';
  LC.Alignment := taCenter;
  LC.Width := 40;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'P';
  LC.Alignment := taRightJustify;
  LC.Width := 25;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'V';
  LC.Alignment := taRightJustify;
  LC.Width := 25;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'H';
  LC.Alignment := taRightJustify;
  LC.Width := 25;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'T';
  LC.Alignment := taRightJustify;
  LC.Width := 25;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'C';
  LC.Alignment := taRightJustify;
  LC.Width := 25;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'S';
  LC.Alignment := taRightJustify;
  LC.Width := 25;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'F';
  LC.Alignment := taRightJustify;
  LC.Width := 25;
  LC := LBSquad.Columns.Add;
  LC.Caption := 'Value';
  LC.Alignment := taRightJustify;
  LC.Width := 50;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX] do
  begin
    for i := 0 to 15 do
    begin
      Player[i].AttibutteCode;
      CBPlayer.AddItem(Player[i].PName, nil);
      LI := LBSquad.Items.Add;
      LI.Caption := Player[i].PName;
      Li.SubItems.Add(IntToStr(player[i].number));
      LI.subItems.Add(CPos[player[i].position].short);
      LI.SubItems.Add(CNat[player[i].national]);
      if Player[i].Position > 0 then
        LI.SubItems.Add(player[i].AttrbcCode)
      else
        LI.SubItems.Add('---');
      LI.SubItems.Add(IntToStr(player[i].Passing));
      LI.SubItems.Add(IntToStr(player[i].Shooting));
      LI.SubItems.Add(IntToStr(player[i].Heading));
      LI.SubItems.Add(IntToStr(player[i].Tackling));
      LI.SubItems.Add(IntToStr(player[i].Ball_Control));
      LI.SubItems.Add(IntToStr(player[i].Speed));
      LI.SubItems.Add(IntToStr(player[i].Finishing));
      LI.SubItems.Add(CVal[player[i].Value]);
      LI.Data := Pointer(i);
      LI.ImageIndex := player[i].Skin;
      cbForm.ItemIndex := Formation;
      FlgT := SWSDB.FlagName(Nation);
      RefReserve;
    end;
  end;
  pbTac.Canvas.Refresh;
  if ((SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex < 0) or (SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex > 15)) then
     SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex:= 0;
  LBSquad.ItemIndex := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex;
  if (FileExists(FlagDir + '24' + PathDelim + FlgT)) then
  begin
    ImSFlag.Picture.LoadFromFile(FlagDir + '24' + PathDelim + FlgT);
    ImSFlag.Picture.Bitmap.Canvas.Refresh;
    ImSFlag.Refresh;
  end
  else
  begin
    ImSFlag.Picture.Bitmap.Clear;
    ImSFlag.Refresh;
  end;
  lbPlCntSq.Caption := Format('%d/%d',
    [SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex + 1, 16]);
  LbSqCnt.Caption := Format('%d/%d', [SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex +
    1, SWSDB.SWSFiles[SWSDb.FileIndex].TeamCount]);

end;

procedure TMainForm.RefPlayer;
var
  TIDx, PIDX, i: integer;
  kStr: integer;
  FlagNat: string;
  BMPx: TBGRABitmap;

begin
  BMPx := TBGRABitmap.Create();
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PIDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex;
  CBPlayer.ItemIndex := PIDX;

  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].Player[PIDX] do
  begin
    Epname.Text := PName;
    Enumb.Text := IntToStr(Number);
    CBSkin.ItemIndex := Skin;
    imSkin.Glyph.Clear;
    ilPlayers.GetBitmap(Skin, imSkin.Glyph);
    FlagNat := AppDir + 'dta' + PathDelim + 'flags' + PathDelim + '24' + PathDelim +
      StLongNat[National] + '.png';
    if FileExists(FlagNat) then
      ImPlNat.Picture.LoadFromFile(FlagNat)
    else
      ImPlNat.Picture.Clear;
    case national of
      54:
      begin
        imgNat1.Picture.LoadFromFile(AppDir + 'dta' + PathDelim +
          'flags' + PathDelim + '24' + PathDelim + 'Hong-Kong.png');
        imgNat1.Refresh;
      end;
      $6B:
      begin
        imgNat1.Picture.LoadFromFile(AppDir + 'dta' + PathDelim +
          'flags' + PathDelim + '24' + PathDelim + 'Niger.png');
        imgNat1.Refresh;
      end;
      $78:
      begin
        imgNat1.Picture.LoadFromFile(AppDir + 'dta' + PathDelim +
          'flags' + PathDelim + '24' + PathDelim + 'Indonesia.png');
        imgNat1.Refresh;
      end;
      else
        imgNat1.Picture.Clear;
    end;
    Implnat.Refresh;
    imskin.Refresh;
    cbpNation.ItemIndex := National;
    CBposit.ItemIndex := Position;
    CBValue.ItemIndex := Value;
    EatP.Text := IntToStr(Passing);
    EatV.Text := IntToStr(Shooting);
    EatH.Text := IntToStr(Heading);
    EatT.Text := IntToStr(Tackling);
    EatC.Text := IntToStr(Ball_Control);
    EatS.Text := IntToStr(Speed);
    EatF.Text := IntToStr(Finishing);
    pbP.Position := Get7p(Passing);
    pbv.Position := Get7p(Shooting);
    pbh.Position := Get7p(Heading);
    pbt.Position := Get7p(Tackling);
    pbc.Position := Get7p(Ball_Control);
    pbs.Position := Get7p(Speed);
    pbf.Position := Get7p(Finishing);
    if Value < 4 then
      kstr := 0;
    if Value > 3 then
      kstr := 1;
    if Value > 6 then
      kstr := 2;
    if Value > 10 then
      kstr := 3;
    if Value > 15 then
      kstr := 4;
    if Value > 21 then
      kstr := 5;
    if Value > 28 then
      kstr := 6;
    if Value > 33 then
      kstr := 7;
    if Value > 39 then
      kstr := 8;
    if Value > 46 then
      kstr := 9;
    ilStars.GetBitmap(kstr, BMPx.Bitmap);
    imStars.Picture.Bitmap.Assign(BMPx.Bitmap);
    imStars.Refresh;
    if Position > 0 then
      lbAttCode.Caption := AttrbcCode
    else
      lbAttCode.Caption := '---';
    if position > 0 then
    begin
      pbAC1.Position := AttibutteCode[6].Val;
      LbAttCh.Caption := AttibutteCode[6].Str;
      pbAC2.Position := AttibutteCode[5].Val;
      LbAttCh.Caption := LbAttCh.Caption + '   ' + AttibutteCode[5].Str;
      pbAC3.Position := AttibutteCode[4].Val;
      LbAttCh.Caption := LbAttCh.Caption + '   ' + AttibutteCode[4].Str;
      pbAC4.Position := AttibutteCode[3].Val;
      LbAttCh.Caption := LbAttCh.Caption + '   ' + AttibutteCode[3].Str;
      pbAC5.Position := AttibutteCode[2].Val;
      LbAttCh.Caption := LbAttCh.Caption + '   ' + AttibutteCode[2].Str;
      pbAC6.Position := AttibutteCode[1].Val;
      LbAttCh.Caption := LbAttCh.Caption + '   ' + AttibutteCode[1].Str;
      pbAC7.Position := AttibutteCode[0].Val;
      LbAttCh.Caption := LbAttCh.Caption + '   ' + AttibutteCode[0].Str;
    end
    else
    begin
      for i := 1 to 7 do
        TplProgressBar(self.FindComponent('pbAC' + IntToStr(i))).Position := i;
      LbAttCh.Caption := rsGoalkeeper;
    end;
    lbWAMcalc.Caption := CPos[Position].short + ': ' +
      FloatToStrF(GetWAM(True), ffFixed, 1, 4);
    if Position = 6 then
      lbWAMcalc.Caption := lbWAMcalc.Caption + ' | DM: ' +
        FloatToStrF(GetWAM(False), ffFixed, 1, 4);
    if Position = 7 then
      lbWAMcalc.Caption := lbWAMcalc.Caption + ' | SC: ' +
        FloatToStrF(GetWAM(False), ffFixed, 1, 4);
    lbPAP.Caption:=IntToStr(CalcPlay(false));
    lbPAPb7.Caption:=IntToStr(CalcPlay(true));
  end;
  LbFind1.Caption := EdtSett.Link[0].Desc;
  LbFind2.Caption := EdtSett.Link[1].Desc;
  lbPlCnt.Caption := Format('%d/%d',
    [SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex + 1, 16]);

end;

procedure TMainForm.RefReserve;
var
  TIDx: integer;
  a, XP: integer;
begin
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX] do
  begin
    for a := 1 to 5 do
    begin
      XP := PlPosition[a + 10];
      if XP = SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex then
        (FindComponent('Reserve' + IntToStr(a)) as TLabel).Font.Style := [fsBold]
      else
        (FindComponent('Reserve' + IntToStr(a)) as TLabel).font.style := [];
      (FindComponent('Reserve' + IntToStr(a)) as TLabel).Caption := Trim(Player[XP].ShortName);
    end;
  end;
end;

procedure TMainForm.Gener(val: integer);
var
  TDX, PDX: integer;
begin
  GenerPos:=val;
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].GenerateAttrbyPosVal(Val);
  RefPlayer;

end;

procedure TMainForm.SetEnables(LoadAll: boolean; Ebn: boolean);
begin
  MWriteAll.Enabled := ebn;
  MWriteCur.Enabled := ebn;
  MFTbyName.Enabled := ebn;
  MFPbyName.Enabled := ebn;
  Medit.Enabled := ebn;
  Mreload.Enabled:=ebn;
  MChgTeamNr.Enabled := ebn;
  MCSVExp.Enabled := ebn;
  MCOPAll.Enabled:= ebn;
  MXMLexp.Enabled:= ebn;
  MShowRandom.Enabled := ebn;
  MDirtyRep.Enabled:=ebn;
  MCheckTC96.Enabled:=ebn;
  //  if LoadAll then begin
  MFindSWSMax.Enabled := ebn;
  MFindGenSWSDupl.Enabled:=ebn;
  MFindPlayerDup.Enabled:=ebn;
  MCHLEG.Enabled := ebn;
  MEuroCup.Enabled:=ebn;
  //  end;
end;

procedure TMainForm.GetLangs;
var
  LangDir: String;
  LangTList: TStringList;
  a: integer;
  TmpDr: string;

  procedure ListFileDir(Path: string; FileList: TStrings);
  var
    SR: TSearchRec;
    lcFileAttr: Integer;
  begin
    {$IFDEF WINDOWS}
      lcFileAttr:=faDirectory;
    {$ENDIF}
    {$IFDEF UNIX}
      lcFileAttr:=48;
    {$ENDIF}

    if FindFirst(Path + '*', faDirectory, SR) = 0 then
    begin
      repeat
        if (SR.Attr or lcFileAttr = SR.Attr) then
        begin
          FileList.Add(SR.Name);
        end;
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;
  end;

begin
  LangDir:=AppDir+'locale'+PathDelim;
  LangTList:=TStringList.Create;
  ListFileDir(LangDir,LangTList);
  For a:=0 to LangTList.Count-1 do begin
      TmpDr:=LangDir+LangTList[a]+PathDelim;
      if FileExists(TmpDr+'AG_SWSEDT.po') then
      LangList.Add(LangTList[a]);
  end;
  For a:=0 to LangList.Count-1 do
      if LangList[a]=DefLangStr then
         DefLang:=a;

end;

procedure TMainForm.OnSWSload(Sender: TObject; Afile: TSWSFile; Tinx, Tcnt: integer);
begin
  if Afile <> nil then
  begin
    SplashLoad.lbLoading.Caption := rsLoading;
    SplashLoad.pbload.Max := Tcnt;
    SplashLoad.pbload.Position := tinx;
    SplashLoad.lbLoadData.Caption :=
      Format(rsFileSTeamsDD, [ExtractFileName(Afile.FileName), Tinx, Tcnt]);
    SplashLoad.Refresh;
    Application.ProcessMessages;
  end
  else begin
    SplashLoad.lbLoading.Caption := rsLoading;
    SplashLoad.pbload.Max := Tcnt;
    SplashLoad.pbload.Position := tinx;
    SplashLoad.lbLoadData.Caption :=
      Format('Searching:   |   Teams: %d/%d', [Tinx, Tcnt]);
    SplashLoad.Refresh;
    Application.ProcessMessages;
  end;
end;

procedure TMainForm.OnSWSSave(Sender: TObject; Afile: TSWSFile; Tinx, Tcnt: integer);
begin
  SplashLoad.lbLoading.Caption := rsSaving;
  SplashLoad.pbload.Max := Tcnt;
  SplashLoad.pbload.Position := tinx;
  SplashLoad.lbLoadData.Caption :=
    Format(rsFileSTeamsDD, [ExtractFileName(Afile.FileName), Tinx, Tcnt]);
  SplashLoad.Refresh;
  Application.ProcessMessages;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  if not tbGeneral.Enabled then
    LoadOver;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  SWSDB.Clipboard.WriteToFile(CfgDir + 'clipboard.sws');
  EdtSett.WriteSett(CfgDir + 'config.sws');
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := True;
  if SWSDB.ChangedFiles() > 0 then
  begin
    CanClose := False;
    if Application.MessageBox(PChar(rsYouHaveModi2), 'Not Saved', MB_YESNO) = idYes then
      CanClose := True;
  end;
end;

procedure TMainForm.CBTeamsChange(Sender: TObject);
begin
  if (CBTeams.ItemIndex<0) or (CBTeams.ItemIndex>CBTeams.Items.Count-1) then EXit;
  CBSquad.ItemIndex:=CBTeams.ItemIndex;
  SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex := CBTeams.ItemIndex;
  RefTeam;
end;

procedure TMainForm.CBTPVerChange(Sender: TObject);
begin
  if SWSDB.ChangedFiles() > 0 then
    if Application.MessageBox(PChar(rsYouHaveModif), 'Not Saved', MB_YESNO) = idNo then
      Exit;
  EdtSett.TotalPackIndex := CBTPVer.ItemIndex;
  EdtSett.SWSDataPath := EdtSett.TotalPackDir + 'custom' + PathDelim +
    'team db' + PathDelim + TPDirectorys[CBTPVer.ItemIndex].Path + PathDelim;
  EdtSett.SWSExePath := EdtSett.TotalPackDir + 'swos' + PathDelim + 'swos-port-Release.exe';
  SWSDB.SWSExeDir := EdtSett.SWSExePath;
  SWSDB.SWSDataDir := EdtSett.SWSDataPath;
  SWSDB.CloseAll;
  SWSDB.ReadConf('leagues.xml');
  //SetEnables(True, False);
  LoadOver;
end;

procedure TMainForm.CBValueChange(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Value := CBValue.ItemIndex;
  RefPlayer;
end;

procedure TMainForm.EatCExit(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if (eoSafeMode in EdtSett.EditOptions) then
     if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Position=0 then begin
       ShowMessage(rsGoalkeepersA);
     end;
  try
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Ball_Control :=
      StrToInt(EatC.Text);
  except
    ShowMessage(rsThisValueMus);
    EAtC.Text := IntToStr(SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[
      PDX].Ball_Control);
  end;
  RefPlayer;
end;

procedure TMainForm.EatFExit(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if (eoSafeMode in EdtSett.EditOptions) then
     if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Position=0 then begin
       ShowMessage(rsGoalkeepersA);
     end;
  try
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Finishing :=
      StrToInt(EatF.Text);
  except
    ShowMessage(rsThisValueMus);
    EAtF.Text := IntToStr(SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[
      PDX].Finishing);
  end;
  RefPlayer;
end;

procedure TMainForm.EatFMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if button = mbLeft then
    if eoAutoSel in EdtSett.EditOptions then
      (Sender as TEdit).SelectAll;
end;

procedure TMainForm.EatHExit(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if (eoSafeMode in EdtSett.EditOptions) then
     if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Position=0 then begin
       ShowMessage(rsGoalkeepersA);
     end;
  try
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Heading := StrToInt(EatH.Text);
  except
    ShowMessage(rsThisValueMus);
    EAtH.Text := IntToStr(SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Heading);
  end;
  RefPlayer;
end;

procedure TMainForm.EatPExit(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if (eoSafeMode in EdtSett.EditOptions) then
     if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Position=0 then begin
       ShowMessage(rsGoalkeepersA);
     end;
  try
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Passing := StrToInt(EatP.Text);
  except
    ShowMessage(rsThisValueMus);
    EAtP.Text := IntToStr(SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Passing);
  end;
  RefPlayer;
end;

procedure TMainForm.EatSExit(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if (eoSafeMode in EdtSett.EditOptions) then
     if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Position=0 then begin
       ShowMessage(rsGoalkeepersA);
     end;
  try
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Speed := StrToInt(EatS.Text);
  except
    ShowMessage(rsThisValueMus);
    EAtS.Text := IntToStr(SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Speed);
  end;
  RefPlayer;
end;

procedure TMainForm.EatTExit(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if (eoSafeMode in EdtSett.EditOptions) then
     if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Position=0 then begin
       ShowMessage(rsGoalkeepersA);
     end;
  try
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Tackling :=
      StrToInt(EatT.Text);
  except
    ShowMessage(rsThisValueMus);
    EAtT.Text := IntToStr(SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[
      PDX].Tackling);
  end;
  RefPlayer;
end;

procedure TMainForm.EatVExit(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  try
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Shooting :=
      StrToInt(EatV.Text);
  except
    ShowMessage(rsThisValueMus);
    EAtV.Text := IntToStr(SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[
      PDX].Shooting);
  end;
  RefPlayer;
end;

procedure TMainForm.ECoachExit(Sender: TObject);
begin
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[
    SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex].Coach :=
    ECoach.Text;
end;

procedure TMainForm.CBDivisionChange(Sender: TObject);
begin
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[
    SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex].Division :=
    CBDivision.ItemIndex;
end;

procedure TMainForm.btCompOrgClick(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Position = 0 then
    Exit;
  CBValue.ItemIndex := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[
    PDX].CalcPlay(True);
  CBValueChange(self);
end;

procedure TMainForm.AOverviewExecute(Sender: TObject);
begin
  PCtrl.ActivePage:=tbOver;
end;

procedure TMainForm.btCompAttributtebyVal1Click(Sender: TObject);
var
  TDX, i: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  for i := 0 to 15 do
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[i].ChangeAllTo7();
  RefSquad;
end;

procedure TMainForm.btCompAttributtebyValClick(Sender: TObject);
var
  TDX, i: integer;
  pos: byte;
  ll: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  for i := 0 to 15 do
  begin
    if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[i].Position <> 0 then begin
        case SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[i].Position of
             1: Pos:=0;
             2: Pos:=0;
             3: Pos:=1;
             4: begin
             ll:=Round(Random(2));
             Pos:=2+ll;
             end;
             5: begin
               ll:=Round(Random(2));
             Pos:=2+ll;
             end;
             6: begin
             ll:=Round(Random(3));
             Pos:=4+ll;
             end;
             7: begin
               ll:=Round(Random(2));
             Pos:=7+ll;
             end;
        end;
        SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[i].GenerateAttrbyPosVal(Pos);
    end;
  end;
  RefSquad;
end;

procedure TMainForm.AGeneralExecute(Sender: TObject);
begin
  PCtrl.ActivePage:=tbGeneral;
end;

procedure TMainForm.ATeamExecute(Sender: TObject);
begin
  PCtrl.ActivePage:=tbTeam;
end;

procedure TMainForm.ASquadExecute(Sender: TObject);
begin
  PCtrl.ActivePage:=tbSquad;
end;

procedure TMainForm.APlayerExecute(Sender: TObject);
begin
  Pctrl.ActivePage:=tbPlayer;
end;

procedure TMainForm.btEdtLeagStrucClick(Sender: TObject);
begin
  if (eoSafeMode in EdtSett.EditOptions) then
    Application.MessageBox(PChar(Format(rsThisFeatureI, [#13])), 'Safe Mode', MB_OK);
  LgeStrForm.Show;
end;

procedure TMainForm.btGenPosValClick(Sender: TObject);
begin
  if (GenerPos<0)or(GenerPos>9) then
  MPGenPosVal.PopUp
  else
  Gener(GenerPos);
end;

procedure TMainForm.btGenPosValKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  TIDX: Integer;
begin
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  if Key = VK_TAB then begin
    if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex < 15 then
      SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex :=
        SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex + 1
    else
      SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex := 0;
  LBSquad.ItemIndex := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlayerIndex;
  pbTacPaint(self);
  RefReserve;
  RefSquad;
  RefPlayer;
  end;
end;

procedure TMainForm.btGenPosValMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  MPGenPosVal.PopUp
end;

procedure TMainForm.btNumberClick(Sender: TObject);
var
  a, PIDX: integer;
  TIDX: integer;
begin
  TIDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  for a := 0 to 15 do
  begin
    PIDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].PlPosition[a];
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TIDX].Player[PIDX].Number := a + 1;
  end;
  RefSquad;
end;

procedure TMainForm.btOrgPriceAllClick(Sender: TObject);
var
  TDX, i: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  for i := 0 to 15 do
  begin
    if SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[i].Position <> 0 then
      SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[i].Value :=
        SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[i].CalcPlay(True);
  end;
  RefSquad;
end;

procedure TMainForm.cbFormChange(Sender: TObject);
begin
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[
    SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex].Formation :=
    cbForm.ItemIndex;
  pbTac.Refresh;
end;

procedure TMainForm.CBHKitTypChange(Sender: TObject);
begin
  if (CBHKitTyp.ItemIndex<0) or (CBHKitTyp.ItemIndex>CBHKitTyp.Items.Count-1) then Exit;
  if (CBAKitTyp.ItemIndex<0) or (CBAKitTyp.ItemIndex>CBAKitTyp.Items.Count-1) then Exit;
  if (cbHShirtCol1.ItemIndex<0) or (cbHShirtCol1.ItemIndex>cbHShirtCol1.Items.Count-1) then Exit;
  if (cbHShirtcol2.ItemIndex<0) or (cbHShirtcol2.ItemIndex>cbHShirtcol2.Items.Count-1) then Exit;
  if (cbHShortCol.ItemIndex<0) or (cbHShortCol.ItemIndex>cbHShortCol.Items.Count-1) then Exit;
  if (cbHSockCol.ItemIndex<0) or (cbHSockCol.ItemIndex>cbHSockCol.Items.Count-1) then Exit;
  if (cbAShirtCol1.ItemIndex<0) or (cbAShirtCol1.ItemIndex>cbAShirtCol1.Items.Count-1) then Exit;
  if (cbAShirtcol2.ItemIndex<0) or (cbAShirtcol2.ItemIndex>cbAShirtcol2.Items.Count-1) then Exit;
  if (cbAShortCol.ItemIndex<0) or (cbAShortCol.ItemIndex>cbAShortCol.Items.Count-1) then Exit;
  if (cbASockCol.ItemIndex<0) or (cbASockCol.ItemIndex>cbASockCol.Items.Count-1) then Exit;
  with SWSDB.SWSFiles[SWSDb.FileIndex].Team[SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex] do
  begin
    HomeKit.Typ := CBHKitTyp.ItemIndex;
    AwayKit.Typ := CBAKitTyp.ItemIndex;
    HomeKit.ShirtCol1 := cbHShirtcol1.ItemIndex;
    HomeKit.ShirtCol2 := cbHShirtcol2.ItemIndex;
    HomeKit.ShortCol := cbHShortCol.ItemIndex;
    HomeKit.SocksCol := cbHSockCol.ItemIndex;
    AwayKit.ShirtCol1 := cbAShirtcol1.ItemIndex;
    AwayKit.ShirtCol2 := cbAShirtcol2.ItemIndex;
    AwayKit.ShortCol := cbAShortCol.ItemIndex;
    AwayKit.SocksCol := cbASockCol.ItemIndex;
  end;
  RefTeam;
end;

procedure TMainForm.CBPlayerChange(Sender: TObject);
var
  Tdx: integer;
begin
  tdx := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  if (CBPlayer.ItemIndex<0) or (CBPlayer.ItemIndex>15) then EXit;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[tdx].PlayerIndex := CBPlayer.ItemIndex;
  RefPlayer;
end;

procedure TMainForm.cbpNationChange(Sender: TObject);
var
  TDX, PDX: integer;
begin
  if (cbpNation.ItemIndex < 0) or (cbpNation.ItemIndex > 152) then
    Exit;
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if (cbpNation.ItemIndex > -1) or (cbpNation.ItemIndex < cbpNation.Items.Count) then
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].National := cbpNation.ItemIndex;
  RefPlayer;

end;

procedure TMainForm.CBpositChange(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if (CBposit.ItemIndex<0)or(CBposit.ItemIndex>CBposit.Items.Count-1) then Exit;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Position := CBposit.ItemIndex;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].AttrbcCode;
  RefPlayer;
end;

procedure TMainForm.CBSkinChange(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if (CBSkin.ItemIndex<0)or(CBSkin.ItemIndex>CBSkin.Items.Count-1) then Exit;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Skin := CBSkin.ItemIndex;
  RefPlayer;
end;

procedure TMainForm.CBSquadChange(Sender: TObject);
begin
  if (CBSquad.ItemIndex<0) or (CBSquad.ItemIndex>CBSquad.Items.Count-1) then EXit;
  CBTeams.ItemIndex:=CBSquad.ItemIndex;
  SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex := CBSquad.ItemIndex;
  RefSquad;
  RefReserve;
  pbTacPaint(self);
end;

procedure TMainForm.ENationNumExit(Sender: TObject);
begin
  try
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[
      SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex].Nation :=
      StrToInt(ENationNum.Text);
  except
    ShowMessage(rsThisValueMus);
    ENationNum.Text := IntToStr(
      SWSDB.SWSFiles[SWSDb.FileIndex].Team[
      SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex].Nation);
  end;
  RefTeam;
  RefSquad;
end;

procedure TMainForm.EnumbExit(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  try
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Number := StrToInt(Enumb.Text);
  except
    ShowMessage(rsThisValueMus);
    Enumb.Text := IntToStr(SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].Number);
  end;

end;

procedure TMainForm.EpnameDblClick(Sender: TObject);
begin
  ShowMessage(Format('http://www.90minut.pl/szukaj.php?tekst=%s', [Epname.Text]));
end;

procedure TMainForm.EpnameExit(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].PName := Epname.Text;
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].Player[PDX].AttrbcCode;
  RefPlayer;
end;

procedure TMainForm.ESWSgennumExit(Sender: TObject);
var
  SNum: integer;
begin
  if (eoSafeMode in EdtSett.EditOptions) then
    Application.MessageBox(PChar(Format(rsThisFeatureI, [#13])), 'Safe Mode', MB_OK);
  try
    Snum := StrToInt(ESWSgennum.Text);
    if SWSDB.CheckSWSGenNum(Snum) then
      SWSDB.SWSFiles[SWSDb.FileIndex].Team[
        SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex].SWS_Gen_Num :=
        StrToInt(ESWSgennum.Text)
    else
      ShowMessage('Duplicate SWS General Number');
  except
    ShowMessage(rsThisValueMus);
    ESWSgennum.Text := IntToStr(
      SWSDB.SWSFiles[SWSDb.FileIndex].Team[
      SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex].SWS_Gen_Num);
  end;
end;

procedure TMainForm.ETeamnameExit(Sender: TObject);
begin
  SWSDB.SWSFiles[SWSDb.FileIndex].Team[
    SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex].TeamNAme :=
    ETeamname.Text;

end;

procedure TMainForm.ETeamNumExit(Sender: TObject);
begin
  try
    SWSDB.SWSFiles[SWSDb.FileIndex].Team[
      SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex].TeamNum := StrToInt(ETeamNum.Text);
  except
    ShowMessage(rsThisValueMus);
    ETeamNum.Text := IntToStr(SWSDB.SWSFiles[SWSDb.FileIndex].Team[
      SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex].TeamNum);
  end;
end;

procedure TMainForm.FindDClose(Sender: TObject);
begin
  Show;
end;

procedure TMainForm.FindDFind(Sender: TObject);
var
  FID, TID, PID: integer;
begin
  if (frEntireScope in Findd.Options) then
  begin
    FID := 0;
    TID := 0;
    PID := 0;
  end
  else
  begin
    FID := SWSDB.FileIndex;
    TID := SWSDB.SWSFiles[FID].TeamIndex;
    if Findd.Tag = 0 then
      Inc(TID);
    PID := SWSDB.SWSFiles[FID].Team[TID].PlayerIndex + 1;
    if PID > 15 then
    begin
      PID := 0;
      Inc(TID);
    end;
  end;
  if TID < 0 then
    TID := 0;
  if PID < 0 then
    PID := 0;
  case Findd.Tag of
    0:
    begin
      if FindD.FindText <> '' then
        if SWSDB.FindTeambyName(Findd.FindText, FID, TID) then
        begin
          Findd.CloseDialog;
          SWSDB.FileIndex := FID;
          SWSDB.SWSFiles[FID].TeamIndex := TID;
          LoadGeneral;
          RefTeam;
          RefSquad;
          Pctrl.ActivePage := tbTeam;
          PCtrlChange(self);
        end
        else
          ShowMessage(rsTeamNotFound);

    end;
    1:
    begin
      if FindD.FindText <> '' then
        if SWSDB.FindPlayerbyName(Findd.FindText, FID, TID, PID) then
        begin
          Findd.CloseDialog;
          SWSDB.FileIndex := FID;
          SWSDB.SWSFiles[FID].TeamIndex := TID;
          SWSDB.SWSFiles[FID].Team[TID].PlayerIndex := PID;
          LoadGeneral;
          RefTeam;
          RefSquad;
          Pctrl.ActivePage := tbPlayer;
          PCtrlChange(self);
        end
        else
          ShowMessage(rsPlayerNotFou);

    end;
  end;
end;



end.
