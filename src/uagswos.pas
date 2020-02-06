unit uagswos;

{$mode objfpc}{$H+}

{ AG_SWSEDT - uagswos.pas - SWOS data Engine

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
  Classes, SysUtils, Graphics, laz2_DOM, laz2_XMLRead, Laz2_XMLCfg,
  laz2_XMLWrite, BGRABitmap, BGRACanvas2D,
  BGRABitmapTypes, strutils, fgl;

type
  TSWSCTac = array[0..10] of TPoint;
  TSWSPoTac = array[0..1] of TSWSCtac;
  TAttrByte = array[0..6] of byte;

  TGenSWSList = specialize TFPGList<Word>;

const
  CVal: array[0..$31] of string = (
    '25K-', '25K', '30K', '40K', '50K', '65K', '75K', '85K', '100K', '110K', '130K',
    '150K', '160K', '180K', '200K', '250K', '300K', '350K', '450K', '500K', '550K',
    '600K', '650K', '700K', '750K', '800K', '850K', '950K', '1M', '1.1M', '1.3M',
    '1.5M', '1.6M', '1.8M', '1.9M', '2M', '2.25M', '2.75M', '3M', '3.5M', '4.5M',
    '5M', '6M', '7M', '8M', '9M', '10M', '12M', '15M', '15M+');

  CNat: array[0..152] of string = (
    'ALB', 'AUT', 'BEL', 'BUL', 'CRO', 'CYP', 'TCH', 'DEN', 'ENG', 'EST', 'FAR', 'FIN',
    'FRA', 'GER', 'GRE', 'HUN', 'ICE', 'ISR', 'ITA', 'LAT', 'LIT', 'LUX', 'MLT', 'HOL',
    'NIR', 'NOR', 'POL', 'POR', 'ROM', 'RUS', 'SMA', 'SCO', 'SLO', 'SWE', 'TUR', 'UKR',
    'WAL', 'SRB', 'BLS', 'SVK', 'ESP', 'ARM', 'BOS', 'AZB', 'GEO', 'SUI', 'IRL', 'MAC',
    'TKM', 'LIE', 'MOL', 'CRC', 'SAL', 'GUA', 'HON', 'BHM', 'MEX', 'PAN', 'USA', 'BAH',
    'NIC', 'BER', 'JAM', 'TRI', 'CAN', 'BAR', 'ELS', 'SVC', 'ARG', 'BOL', 'BRA', 'CHL',
    'COL', 'ECU', 'PAR', 'SUR', 'URU', 'VEN', 'GUY', 'PER', 'ALG', 'SAF', 'BOT', 'BFS',
    'BUR', 'LES', 'ZAI', 'ZAM', 'GHA', 'SEN', 'CIV', 'TUN', 'MLI', 'MDG', 'CMR', 'CHD',
    'UGA', 'LIB', 'MOZ', 'KEN', 'SUD', 'SWA', 'ANG', 'TOG', 'ZIM', 'EGY', 'TAN', 'NIG',
    'ETH', 'GAB', 'SIE', 'BEN', 'CON', 'GUI', 'SRL', 'MAR', 'GAM', 'MLW', 'JAP', 'TAI',
    'IND', 'BAN', 'BRU', 'IRA', 'JOR', 'SRI', 'SYR', 'KOR', 'IRN', 'VIE', 'MLY', 'SAU',
    'YEM', 'KUW', 'LAO', 'NKR', 'OMA', 'PAK', 'PHI', 'CHN', 'SGP', 'MAU', 'MYA', 'PAP',
    'TAD', 'UZB', 'QAT', 'UAE', 'AUS', 'NZL', 'FIJ', 'SOL', 'CUS');

  CDiv: array[0..4] of string = (
    'Premier', 'Division One', 'Division Two', 'Division Three', 'Non-League');

  Ctac: array[0..17] of string = (
    '4-4-2', '5-4-1', '4-5-1', '5-3-2', '3-5-2', '4-3-3', '4-2-4', '3-4-3',
    'SWEEP', '5-2-3', 'ATTACK', 'DEFEND', 'USER A', 'USER B', 'USER C', 'USER D',
    'USER E', 'USER F');

  CPos: array[0..7] of string = (
        'GK', 'RB', 'D', 'LB', 'M', 'RW', 'LW', 'A');

  CTMPos: array[0..7] of string = (
        'GK', 'RB', 'LB', 'D', 'RW', 'LW', 'M', 'A');

  SWSExeHexDiff = $1C08;
  SWSExe2020Diff = $476C6;
  SWSExeHexCupD = $61E;

  SWSCL = $14C18C;
  SWSCWS = $14C1C8;
  SWSUC = $14c224;

  CSWScolors: array[0..9] of cardinal =
    ($b4b4b4, $FFFFFF, $000000, $006cFC, $0000FC, $FC0000, $24006c,
    $FC9090, $009024, $00fcfc);


  SWTac442: TSWSCTac = ((X: 8; Y: 0),
    (X: 3; Y: 4), (X: 5; y: 2), (X: 11; Y: 2), (X: 13; Y: 4),
    (X: 3; Y: 9), (X: 8; Y: 6), (X: 8; Y: 8), (X: 13; Y: 9),
    (X: 5; Y: 12), (X: 11; Y: 12));

  SWTac541: TSWSCTac = ((X: 8; Y: 0),
    (X: 3; Y: 4), (X: 8; y: 2), (X: 11; Y: 3), (X: 13; Y: 4),
    (X: 5; Y: 7), (X: 5; Y: 3), (X: 8; Y: 6), (X: 11; Y: 7),
    (X: 8; Y: 8), (X: 8; Y: 12));

  SWTac451: TSWSCTac = ((X: 8; Y: 0),
    (X: 3; Y: 4), (X: 5; y: 2), (X: 11; Y: 2), (X: 13; Y: 4),
    (X: 3; Y: 9), (X: 8; Y: 6), (X: 11; Y: 7), (X: 13; Y: 9),
    (X: 5; Y: 7), (X: 8; Y: 12));

  SWTac532: TSWSCTac = ((X: 8; Y: 0),
    (X: 3; Y: 4), (X: 8; y: 2), (X: 11; Y: 3), (X: 13; Y: 4),
    (X: 3; Y: 7), (X: 5; Y: 3), (X: 8; Y: 8), (X: 13; Y: 7),
    (X: 5; Y: 12), (X: 11; Y: 12));

  SWTac352: TSWSCTac = ((X: 8; Y: 0),
    (X: 5; Y: 4), (X: 8; y: 3), (X: 11; Y: 6), (X: 11; Y: 4),
    (X: 3; Y: 8), (X: 5; Y: 6), (X: 8; Y: 9), (X: 13; Y: 8),
    (X: 5; Y: 12), (X: 11; Y: 12));


  SWTac433: TSWSCTac = ((X: 8; Y: 0),
    (X: 3; Y: 4), (X: 5; y: 3), (X: 11; Y: 3), (X: 13; Y: 4),
    (X: 4; Y: 8), (X: 8; Y: 6), (X: 11; Y: 11), (X: 12; Y: 8),
    (X: 5; Y: 11), (X: 8; Y: 12));

  SWTac424: TSWSCTac = ((X: 8; Y: 0),
    (X: 3; Y: 4), (X: 5; y: 3), (X: 11; Y: 3), (X: 13; Y: 4),
    (X: 3; Y: 10), (X: 5; Y: 7), (X: 11; Y: 7), (X: 13; Y: 10),
    (X: 8; Y: 11), (X: 8; Y: 13));

  SWTac343: TSWSCTac = ((X: 8; Y: 0),
    (X: 5; Y: 4), (X: 8; y: 3), (X: 8; Y: 6), (X: 11; Y: 4),
    (X: 3; Y: 7), (X: 8; Y: 8), (X: 11; Y: 11), (X: 13; Y: 7),
    (X: 5; Y: 11), (X: 8; Y: 12));

  SWTacSwP: TSWSCTac = ((X: 8; Y: 0),
    (X: 3; Y: 4), (X: 8; y: 2), (X: 8; Y: 3), (X: 13; Y: 4),
    (X: 3; Y: 9), (X: 8; Y: 6), (X: 8; Y: 8), (X: 13; Y: 9),
    (X: 5; Y: 12), (X: 11; Y: 12));

  SWTac523: TSWSCTac = ((X: 8; Y: 0),
    (X: 3; Y: 4), (X: 8; y: 2), (X: 11; Y: 3), (X: 13; Y: 4),
    (X: 3; Y: 11), (X: 5; Y: 3), (X: 11; Y: 8), (X: 13; Y: 11),
    (X: 5; Y: 8), (X: 8; Y: 12));

  SWTacATA: TSWSCTac = ((X: 8; Y: 0),
    (X: 5; Y: 4), (X: 8; y: 3), (X: 11; Y: 8), (X: 11; Y: 4),
    (X: 3; Y: 11), (X: 5; Y: 8), (X: 8; Y: 10), (X: 13; Y: 11),
    (X: 5; Y: 12), (X: 11; Y: 12));

  SWTacDEF: TSWSCTac = ((X: 8; Y: 0),
    (X: 4; Y: 3), (X: 5; y: 2), (X: 11; Y: 2), (X: 12; Y: 3),
    (X: 3; Y: 5), (X: 5; Y: 7), (X: 11; Y: 7), (X: 13; Y: 5),
    (X: 8; Y: 9), (X: 8; Y: 12));

  SWTypForm: array[0..15] of byte = (0, 2, 3, 4, 5, 7, 8, 9, 10, 13, 14, 1, 6, 11, 12, 15);

  seUnkonwn = 0;
  seNotSWOSTEAM = 1;
  seNotTMDFile = 2;

type
  TSWSTeam = class;

  TSWSEngine = class;

  TSWSFile = class;

  TSWSPlayer = class;

  TAttr = packed record
    Val: byte;
    Str: char;
  end;

  TSWSTeamIdRec = packed record
    Nation: Byte;
    TeamNr: byte;
  end;

  TSWSExeVer = (SWSECE, SWS9697, SWS2020, SWSUnknown);

  TAttrCode = array[0..6] of TAttr;

  TOnLoadFile = procedure(Sender: TObject; TeamIdx, TeamCnt: integer) of object;
  TonLoad = procedure(Sender: TObject; AFile: TSWSFile;
    TeamIdx, TeamCnt: integer) of object;
  TOnSaveFile = procedure(Sender: TObject; TeamIdx, TeamCnt: integer) of object;
  TonSave = procedure(Sender: TObject; AFile: TSWSFile;
    TeamIdx, TeamCnt: integer) of object;
  TonValProgress = procedure(Sender: TObject; Min, Max: integer) of object;


  { TSWSEurocup }

  TSWSEurocup = class(TPersistent)
    private
      FCL: array[0..15] of TSWSTeamIdRec;
      FCWC: array[0..31] of TSWSTeamIdRec;
      FUEFA: array[0..31] of TSWSTeamIdRec;
      FEngine: TSWSEngine;
      fErrorTeam: TSWSTeam;
      function GetCL(Index: Integer): TSWSTeam;
      function GetCWC(Index: Integer): TSWSTeam;
      function GetUEFA(Index: Integer): TSWSTeam;
      procedure SetCL(Index: Integer; AValue: TSWSTeam);
      procedure SetCWC(Index: Integer; AValue: TSWSTeam);
      procedure SetUEFA(Index: Integer; AValue: TSWSTeam);
    public
      constructor Create(AEngine: TSWSEngine);
      destructor Destroy; override;
      procedure LoadDta;
      procedure WriteDta(FN:String);
      property Engine: TSWSEngine read FEngine;
      property ChampionLeague[Index: Integer]:TSWSTeam read GetCL write SetCL;
      property CupWinnersCup[Index: Integer]:TSWSTeam read GetCWC write SetCWC;
      property UEFACup[Index: Integer]: TSWSTeam read GetUEFA write SetUEFA;
  end;

  { TSWSDivision }

  TSWSDivision = class(TPersistent)
  private
    FTeams: byte;
    FProm: byte;
    FPromPO: byte;
    FRel: byte;
    FRelPO: byte;
  public
    constructor Create;
    destructor Destroy; override;
    property Teams: byte read FTeams write FTeams;
    property Promotion: byte read FProm write FProm;
    property Promotion_PO: byte read FPromPO write FPromPO;
    property Relegation: byte read FRel write FRel;
    property Relegation_PO: byte read FrelPO write FRelPO;
  end;

  TSWSDivisions = specialize TFPGObjectList<TSWSDivision>;

  { TSWSLeague }

  TSWSLeague = class(TPersistent)
  private
    FAddr: longword;
    FOrginalDivisions: Byte;
    FSWSfile: string;
    FLeagues: byte;
    FCompet: byte;
    FType: byte;
    FTeamNr: byte;
    FBMonth: byte;
    FEMonth: byte;
    FMatEach: byte;
    Fpts: byte;
    FPosSubs: byte;
    FFromSubs: byte;
    FDivs: TSWSDivisions;
    FLoaded: boolean;
    function GetDiv(idx: integer): TSWSDivision;
    procedure SetDiv(idx: integer; AValue: TSWSDivision);
    procedure ReadDta;
    procedure WriteDta(FSM: TFileStream);
  public
    constructor Create;
    destructor Destroy; override;
    procedure ReadData;
    procedure WriteData(FN: string = '');
    procedure CreatePatch(FDir: String);
    function AddDivision(): Boolean;
    function DelDivision(): Boolean;
    property Leagues: byte read FLeagues;
    property Competition: byte read Fcompet;
    property CmpType: byte read FType;
    property SWSTeamNr: byte read FTeamNr;
    property BeginMonth: byte read FBMonth write FBMonth;
    property EndMonth: byte read FEMonth write FEMonth;
    property MatchEachTime: byte read FMatEach write FMatEach;
    property PtsForwin: byte read Fpts write Fpts;
    property PossibleSubs: byte read FPosSubs write FPosSubs;
    property FromSubs: byte read FFromSubs write FFromSubs;
    property Division[idx: integer]: TSWSDivision read GetDiv write SetDiv;
    property Address: longword read FAddr write FAddr;
    property SWSExePath: string read FSWSFile write FSWSFile;
    property Loaded: boolean read FLoaded;
    property OrginalDivisions: Byte read FOrginalDivisions;
  end;


  { TSWStactic }

  TSWStactic = class(TPersistent)
  private
    FFileName: string;
    FTacName: string;
    FFieldFN: string;
    FtcName: array[0..8] of char;
    Ftacfile: array[1..10, 1..35] of byte;
    Ffield: array[0..14, 0..15] of byte;
    Fballpos: array[0..4, 0..6] of byte;
    FFlip: array[1..10] of byte;
    FOrgTac: byte;
    FTeam: TSWSTeam;
    FImgField: TBGRABitmap;
    function GetBall(X, Y: integer): byte;
    function GetField(X, Y: integer): byte;
    function GetFlip(Index: integer): byte;
    function GetTacF(Poz, Ball: integer): byte;
    procedure SetBall(X, Y: integer; AValue: byte);
    procedure SetField(X, Y: integer; AValue: byte);
    procedure SetFlip(Index: integer; AValue: byte);
    procedure SetTacF(Poz, Ball: integer; AValue: byte);
  public
    constructor Create(ATeam: TSWSTeam);
    destructor Destroy; override;
    procedure ReadTac(FN: string);
    procedure Assign(ASource: TPersistent); override;
    procedure DrawPreview(ACanvas: TCanvas; X, Y, W, H: integer; APlImg: TBGRABitmap);
    property Team: TSWSTeam read FTeam write FTeam;
    property FileName: string read FFileName write FFileName;
    property TacFile[Poz, Ball: integer]: byte read GetTacF write SetTacF;
    property Field[X, Y: integer]: byte read GetField write SetField;
    property BallPos[X, Y: integer]: byte read GetBall write SetBall;
    property Flip[Index: integer]: byte read GetFlip write SetFlip;
    property FieldImage: TBGRABitmap read FImgField write FImgField;
    property FieldFN: string read FFieldFN write FFieldFN;
  end;

  { TSWSClipboard }

  TSWSClipboard = class(TPersistent)
  private
    FPlayerInTeam: integer;
    FPlayers: array of TSWSPlayer;
    FTeams: array of TSWSTeam;
    FPlayCount: integer;
    FPlayIndex: integer;
    FPlayInTeam: integer;
    FTeamCount: integer;
    FTeamIndex: integer;
    FEngine: TSWSEngine;
    function GetPlayer(Index: integer): TSWSPlayer;
    function GetTeam(Index: integer): TSWSTeam;
    procedure SetPlayer(Index: integer; AValue: TSWSPlayer);
    procedure SetTeam(Index: integer; AValue: TSWSTeam);
  public
    constructor Create(AEngine: TSWSEngine);
    destructor Destroy; override;
    procedure CopyPlayer(const APlayer: TSWSPlayer);
    procedure CopyTeam(const Ateam: TSWSTeam);
    function PastePlayer(AIndex: integer; APlayer: TSWSPlayer): TSWSPlayer;
    function PasteTeam(AIndex: integer; ATeam: TSWSTeam): TSWSTeam;
    procedure ClearTeams;
    procedure ClearPlayers;
    procedure WriteToFile(TF: string);
    procedure ReadFromFile(TF: string);
    property PlayerCount: integer read FPlayCount;
    property PlayerIndex: integer read FPlayIndex write FPlayIndex;
    property PlayerInTeam: integer read FPlayerInTeam write FPlayerInTeam;
    property TeamCount: integer read FTeamCount;
    property TeamIndex: integer read FTeamIndex write FTeamIndex;
    property Player[Index: integer]: TSWSPlayer read GetPlayer write SetPlayer;
    property Team[Index: integer]: TSWSTeam read GetTeam write SetTeam;
  end;

  { TSWSkits }

  TSWSkits = class(TPersistent)
  private
    Ftyp: byte;
    FTshcol1: byte;
    FTshcol2: byte;
    Fshortcl: byte;
    Fsockscl: byte;
    Fchanged: boolean;
    procedure SetShortCl(AValue: byte);
    procedure Setsockscl(AValue: byte);
    procedure SetTshcol1(AValue: byte);
    procedure SetTshcol2(AValue: byte);
    procedure Settyp(AValue: byte);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property Typ: byte read Ftyp write Settyp;
    property ShirtCol1: byte read FTshcol1 write SetTshcol1;
    property ShirtCol2: byte read FTshcol2 write SetTshcol2;
    property ShortCol: byte read FShortCl write SetShortCl;
    property SocksCol: byte read Fsockscl write Setsockscl;
  end;

  { TSWSPlayer }

  TSWSPlayer = class(TPersistent)
  private
    FUniqID: integer;
    FPlay_inTeam: integer;
    FNational: byte;
    FNumber: byte;
    Fcname: array[0..21] of char;
    Fpname: string;
    Fpos: byte;
    Fposition: byte;
    Fskin: byte;
    FAtP, FAtV, FAtH, FAtT, FAtC, FAtS, FAtF: byte;
    FValue: byte;
    FTeam: TSWSTeam;
    FChanged: boolean;
    FAttrStr: string;
    function GetAttrStr: string;
    function GetPos(val: byte): byte;
    function GetSkin(val: byte): byte;
    procedure SetAtC(AValue: byte);
    procedure SetAtF(AValue: byte);
    procedure SetAtH(AValue: byte);
    procedure setAtP(AValue: byte);
    procedure SetAtS(AValue: byte);
    procedure Setatt(AValue: byte);
    procedure SetAtV(AValue: byte);
    procedure SetNational(AValue: byte);
    procedure SetNumber(AValue: byte);
    procedure Setpname(AValue: string);
    function SetPos(Pos, Skin: byte): byte;
    procedure Setposition(AValue: byte);
    procedure Setskin(AValue: byte);
    procedure SetValue(AValue: byte);
  public
    constructor Create;
    constructor Create(ATeam: TSWSTeam); overload;
    destructor Destroy; override;
    procedure Assign(ASource: TPersistent); override;
    function Get7p(val: byte): byte;
    function CalcPlay(by7: boolean): integer;
    procedure ChangeAllTo7();
    function LoadPlayer(Ptm: TStream): boolean;
    function WritePlayer(Ptm: TStream): boolean;
    function ExportToCSV(var TS: TStringList; UniqID: integer): boolean;
    function ExportXML(Doc: TXMLDocument ;ParNode: TDOMNode; UniqID: Integer): Boolean;
    function AttibutteCode(DefSwap: boolean = False): TAttrCode;
    function ShortName: string;
    function GetWAM(Nominal: boolean = True): double;
    procedure GenerateAttrbyValue;
    procedure GenerateAttrbyPosVal(Pos: integer);
    procedure ClearPlayer(nr: integer);
    property PlayInTeam: integer read Fplay_inTeam write Fplay_inTeam;
    property National: byte read FNational write SetNational;
    property Number: byte read FNumber write SetNumber;
    property PName: string read Fpname write Setpname;
    property Position: byte read Fposition write Setposition;
    property Skin: byte read Fskin write Setskin;
    property Passing: byte read FAtP write setAtP;
    property Shooting: byte read FAtV write SetAtV;
    property Heading: byte read FAtH write SetAtH;
    property Tackling: byte read FAtT write Setatt;
    property Ball_Control: byte read FAtC write SetAtC;
    property Speed: byte read FAtS write SetAtS;
    property Finishing: byte read FAtF write SetAtF;
    property Value: byte read FValue write SetValue;
    property Team: TSWSTeam read FTeam;
    property AttrbcCode: string read GetAttrStr;
    property UniqueID: integer read FUniqID;
  end;

  { TSWSTeam }

  TSWSTeam = class(TPersistent)
  private
    FUniqID: integer;
    Fnation: byte;
    FTeamNum: byte;
    FSws_gen_nr: word;
    Fctname: array[0..15] of char;
    Fteamname: string;
    Fformation: byte;
    Fdivision: byte;
    FHomeKit, FAwayKit: TSWSkits;
    Fccoach: array[0..21] of char;
    Fcoach: string;
    Fplposit: array[0..15] of byte;
    Fplayers: array[0..15] of TSWSPlayer;
    FTeamFile: TSWSFile;
    FPlayerIndex: integer;
    Fchanged: boolean;
    FTactic: TSWStactic;
    function Getplayer(Index: integer): TSWSPlayer;
    function GetPosition(Index: integer): byte;
    procedure SetAwayKit(AValue: TSWSkits);
    procedure Setcoach(AValue: string);
    procedure Setdivision(AValue: byte);
    procedure Setformation(AValue: byte);
    procedure SetHomeKit(AValue: TSWSkits);
    procedure Setnation(AValue: byte);
    procedure SetPlayer(Index: integer; AValue: TSWSPlayer);
    procedure SetPosition(AIndex: integer; AValue: byte);
    procedure SetSws_gen_nr(AValue: word);
    procedure SetTeamFile(AValue: TSWSFile);
    procedure Setteamname(AValue: string);
    procedure SetTeamNum(AValue: byte);
  public
    constructor Create;
    constructor Create(ASWSFile: TSWSFile); overload;
    destructor Destroy; override;
    procedure Assign(ASource: TPersistent); override;
    procedure ClearTeam;
    function CalcTeam(by7: boolean): integer;
    function LoadTeam(Stm: TStream): boolean;
    function WriteTeam(Stm: TStream): boolean;
    function ExportToCSV(TS: TStringList): boolean;
    function ImportTMEdtCSV(TS: TStringList): boolean;
    function Changed: boolean;
    function GetFormatPlace(playidx: byte): byte;
    property Nation: byte read Fnation write Setnation;
    property TeamNum: byte read FTeamNum write SetTeamNum;
    property SWS_Gen_Num: word read FSws_gen_nr write SetSws_gen_nr;
    property TeamNAme: string read Fteamname write Setteamname;
    property Formation: byte read Fformation write Setformation;
    property Division: byte read Fdivision write Setdivision;
    property HomeKit: TSWSkits read FHomeKit write SetHomeKit;
    property AwayKit: TSWSkits read FAwayKit write SetAwayKit;
    property Coach: string read Fcoach write Setcoach;
    property PlPosition[Index: integer]: byte read GetPosition write SetPosition;
    property Player[Index: integer]: TSWSPlayer read Getplayer write SetPlayer;
    property TeamFile: TSWSFile read FTeamFile write SetTeamFile;
    property PlayerIndex: integer read FPlayerIndex write FPlayerIndex;
    property Tactic: TSWStactic read FTactic write FTactic;
    property UniqueID: integer read FUniqID;

  end;

  { TSWSPoolPlyrRec }

  TSWSPoolPlyrRec = class(TPersistent)
  private
    FNation: byte;
    FTeamNr: byte;
    FPlay_nr: byte;
    FcTName: array[0..15] of char;
    FTeamName: string;
    FPlayer: TSWSPlayer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(ASource: TPersistent); override;
    procedure AssignPlayer(Play_InTeam: integer; Player: TSWSPlayer);
    function LoadPool(Stm: TStream): boolean;
    function WritePool(Stm: TStream): boolean;
    property Nation: byte read FNation write FNation;
    property TeamNr: byte read FTeamNr write FTeamNr;
    property Play_nr: byte read FPlay_nr write FPlay_nr;
    property TeamName: string read FTeamName write FTeamName;
    property Player: TSWSPlayer read FPlayer;
  end;

  { TSWSPoolPLyrDat }

  TSWSPoolPLyrDat = class(TComponent)
  private
    FPlayers: array [0..899] of TSWSPoolPlyrRec;
    FPlIndex: integer;
    FEngine: TSWSEngine;
    Floaded: boolean;
    function GetPlayer(Index: integer): TSWSPoolPlyrRec;
    procedure SetPlayer(Index: integer; AValue: TSWSPoolPlyrRec);
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure Load(AFN: string);
    procedure Write(AFN: string);
    property PoolPlayer[Index: integer]: TSWSPoolPlyrRec
      read GetPlayer write SetPlayer;
    property PlayIndex: integer read FPlIndex write FPlIndex;
    property Loaded: Boolean read Floaded;
  end;


  TSWSTeams = specialize TFPGObjectList<TSWSTeam>;

  { TSWSFile }

  TSWSFile = class(TComponent)
  private
    FFileName: string;
    FFileNumber: byte;
    FFileEngineID: integer;
    FLeagueName: string;
    FTeams: TSWSTeams;
    FEngine: TSWSEngine;
    FTeamIndex: integer;
    FTMDCount: Integer;
    FisTMD: boolean;
    Fpool: integer;
    FHexVal: string;
    Fchanged: boolean;
    FonLoadFile: TOnLoadFile;
    FonSaveFile: TonSaveFile;
    FLeague: TSWSLeague;
    function LoadFile: boolean;
    procedure SetTeamIndex(AValue: integer);
    function WriteFile(AFN: string): boolean;
  public
    constructor Create(AOwner: TComponent); override;
    constructor Create(AOwner: TComponent; AFileName: string); overload;
    destructor Destroy; override;
    procedure SetTMDCount(ACount: integer);
    function Load: boolean;
    function Load(FN: string): boolean; overload;
    function Write: boolean;
    function Write(AFN: string): boolean; overload;
    function TeamByDiv(Division: byte): integer;
    function Changed: boolean;
    function FindMaxTeamNum: integer;
    function FindFileByNum(Nr: integer): TSWSTeam;
    procedure AddTeam(TeamName: string);
    procedure RemoveTeam(Index: integer);
    function LoadLeague: boolean;
    function CheckLeagueTeams: boolean;
    function VerifyLeagueStrc(out Prm, One, Two, Tree: integer): boolean;
    procedure ChangeAll(prop: string; AVal: variant);
    property FileName: string read FFileName write FFileName;
    property FileNumber: byte read FFileNumber write FFileNumber;
    function TeamCount: integer;
    property Team: TSWSTeams read FTeams write FTeams;
    property Engine: TSWSEngine read FEngine write FEngine;
    property FileEngineID: integer read FFileEngineID write FFileEngineID;
    property TeamIndex: integer read FTeamIndex write SetTeamIndex;
    property isTMD: boolean read FisTMD write FisTMD;
    property HexVal: string read FHexVal write FHexVal;
    property League: TSWSLeague read FLeague write FLeague;
    property LeagueName: string read FLeagueName write FLeagueName;
    property onLoadFile: TOnLoadFile read FonLoadFile write FonLoadFile;
    property onSaveFile: TOnSaveFile read FonSaveFile write FonSaveFile;
    property Pool: integer read Fpool write Fpool;
  end;

  TSWSFiles = specialize TFPGObjectList<TSWSFile>;


  { TSWSEngine }

  TSWSEngine = class(TComponent)
  private
    FOnSave: TonSave;
    FPlUniqID: integer;
    FTmUniqID: integer;
    FSWSDataDir: string;
    FSWSExeDir: string;
    FSWSexeVer: TSWSExeVer;
    FSWSFiles: TSWSFiles;
    FSWSPoolPLyr: TSWSPoolPLyrDat;
    FClipboard: TSWSClipboard;
    FEuropeanCup: TSWSEurocup;
    FFilesInDta: integer;
    FLeaguesDir: string;
    FLeaguesVer: string;
    FSWS2020Dif: DWORD;
    FSWS2020Size: DWORD;
    FLeaguesFile: TXMLDocument;
    FFileIndex: integer;
    FLoadAll: boolean;
    FLastError: integer;
    FonLoad: TOnLoad;
    FValidateProg: TonValProgress;
    function GetFileCount: integer;
    function GetNextPlUniqiD: integer;
    function GetNextTmUniqID: integer;
    function GetSWSFiles(Index: integer): TSWSFile;
    procedure OnLoadFile(Sender: TObject; Tidx, Tcount: integer);
    procedure OnSaveFile(Sender: TObject; Tidx, Tcount: integer);
    procedure SetSWSFiles(Index: integer; AValue: TSWSFile);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ReadConf(ALeaguesFile: string): boolean;
    function LoadFile(AFileName: string; isTMD: boolean = False;
      TMDCount: integer = 0): integer;
    function WriteAll(Adir: string): integer;
    procedure CloseAll;
    function ChangedFiles(): integer;
    function CheckSWSVer(SFN: string): TSWSExeVer;
    function FindTeambyName(const TN: string; var FileIdx,TeamIdx: integer): boolean;
    function FindPlayerbyName(const TN: string;
      var FileIdx, TeamIdx, PlayIdx: integer): boolean;
    function FindPlayers(pname: string; TL: TStringList): integer;
    function FindTeambyCoach(const CoachN: string;
      var FileIdx, TeamIdx: integer): boolean;
    function FindMaxSWSGenNum: integer;
    function CheckSWSGenNum(Num: integer): boolean;
    procedure FindSWSGenDuplic();
    function FindTeambyNumb(Nat,Team: integer): TSWSTeam;
    function FindFilebyNum(Anum: integer): integer;
    function FindTeambySWSGenNum(const ANum: integer;
      var FileIdx, TeamIdx: integer): boolean;
    function FlagName(TeamNr: integer): string;
    property SWSDataDir: string read FSWSDataDir write FSWSDataDir;
    property SWSExeDir: string read FSWSExeDir write FSWSExeDir;
    property SWS2020Diff: DWORD read FSWS2020Dif;
    property LeaguesDir: string read FLeaguesDir write FLeaguesDir;
    property LeaguesFile: TXMLDocument read FLeaguesFile write FLeaguesFile;
    property LeaguesVersion: string read FLeaguesVer;
    property SWSFiles: TSWSFiles read FSWSFiles write FSWSFiles;
    function FileCount: integer;
    property FileIndex: integer read FFileIndex write FFileIndex;
    property SWSExeVer: TSWSExeVer read FSWSexeVer write FSWSexeVer;
    property EuropeanCups: TSWSEurocup read FEuropeanCup write FEuropeanCup;
    property OnLoad: TonLoad read FonLoad write FonLoad;
    property OnSave: TonSave read FOnSave write FOnSave;
    property OnValidate: TonValProgress read FValidateProg write FValidateProg;
    property Clipboard: TSWSClipboard read FClipboard write FClipboard;
    property LoadedAll: boolean read FLoadAll write FLoadAll;
    property PoolPlyr: TSWSPoolPLyrDat read FSWSPoolPLyr write FSWSPoolPLyr;
    property NextPlUniqID: integer read GetNextPlUniqiD;
    property NextTmUniqID: integer read GetNextTmUniqID;
    property FilesInDta: integer read FFilesInDta write FFilesInDta;
    property PlayerUID: integer read FPlUniqID write FPlUniqID;
    property TeamUID: integer read FTmUniqID write FTmUniqID;
    property LastError: integer read FLastError;
  end;


function HexToDec(hstr: string): integer;


implementation

{
function HexToDec(hstr: string): integer;
var
  i, j: integer;
  ch: char;
begin
  i := 0;
  for j := 1 to length(hstr) do
  begin
    i := i shl 4;
    ch := upcase(hstr[j]);
    case ch of
      '0'..'9': i := i + Ord(ch) - 48;
      'A'..'F': i := i + Ord(ch) - 55;
    end;
  end;
  Result := i;
end;
}

//??????

function HexToDec(hstr: string): integer;
begin
  Result := Hex2Dec(hstr);
end;

{ TSWSEurocup }

function TSWSEurocup.GetCL(Index: Integer): TSWSTeam;
var
  R: TSWSTeam;
begin
  R:=FEngine.FindTeambyNumb(FCL[Index].Nation,FCL[Index].TeamNr);
  if R=nil then R:=fErrorTeam;
  Result:=R;
end;

function TSWSEurocup.GetCWC(Index: Integer): TSWSTeam;
var
   R: TSWSTeam;
begin
  R:=FEngine.FindTeambyNumb(FCWC[Index].Nation,FCWC[Index].TeamNr);
  if R=nil then R:=fErrorTeam;
  Result:=R;
end;

function TSWSEurocup.GetUEFA(Index: Integer): TSWSTeam;
var
   R: TSWSTeam;
begin
  R:=FEngine.FindTeambyNumb(FUEFA[Index].Nation,FUEFA[Index].TeamNr);
  if R=nil then R:=fErrorTeam;
  Result:=R;
end;

procedure TSWSEurocup.SetCL(Index: Integer; AValue: TSWSTeam);
begin
  FCL[Index].Nation:=AValue.Nation;
  FCL[Index].TeamNr:=AValue.TeamNum;
end;

procedure TSWSEurocup.SetCWC(Index: Integer; AValue: TSWSTeam);
begin
  FCWC[Index].Nation:=AValue.Nation;
  FCWC[Index].TeamNr:=AValue.TeamNum;
end;

procedure TSWSEurocup.SetUEFA(Index: Integer; AValue: TSWSTeam);
begin
  FUEFA[Index].Nation:=AValue.Nation;
  FUEFA[Index].TeamNr:=AValue.TeamNum;
end;

constructor TSWSEurocup.Create(AEngine: TSWSEngine);
begin
  FEngine:=AEngine;
  fErrorTeam:=TSWSTeam.Create;
  fErrorTeam.TeamNAme:='ERROR TEAM';
  fErrorTeam.Nation:=152;
  fErrorTeam.TeamNum:=255;
  fErrorTeam.SWS_Gen_Num:=65535;
end;

destructor TSWSEurocup.Destroy;
begin
  inherited Destroy;
end;

procedure TSWSEurocup.LoadDta;
var
  FStm: TFileStream;
  k: integer;
  Addr: longint;
begin
  if FEngine.SWSExeDir='' then
     Exit;
  if not (FileExists(FEngine.SWSExeDir)) then
     Exit;
  if FEngine.SWSExeVer = SWSECE then Addr:=SWSExeHexCupD;
  if FEngine.SWSExeVer = SWS9697 then Addr:=0;
  if FEngine.SWSExeVer = SWSUnknown then Exit;

  FStm:=TFileStream.Create(FEngine.FSWSExeDir,fmOpenRead);
  FStm.Seek(SWSCL+Addr,soFromBeginning);
  For k:=0 to 15 do
      FStm.Read(FCL[k],Sizeof(TSWSTeamIdRec));
  FStm.Seek(SWSCWS+Addr,soFromBeginning);
  For k:=0 to 31 do
      FStm.Read(FCWC[k],Sizeof(TSWSTeamIdRec));
  FStm.Seek(SWSUC+Addr,soFromBeginning);
  For k:=0 to 31 do
      FStm.Read(FUEFA[k],Sizeof(TSWSTeamIdRec));
  FStm.Free
end;

procedure TSWSEurocup.WriteDta(FN: String);
var
  FStm: TFileStream;
  k: integer;
  Addr: longint;
begin
  if not (FileExists(FN)) then
     Exit;
  if FEngine.SWSExeVer = SWSECE then Addr:=SWSExeHexCupD;
  if FEngine.SWSExeVer = SWS9697 then Addr:=0;
  if FEngine.SWSExeVer = SWSUnknown then Exit;
  FStm:=TFileStream.Create(FN,fmOpenWrite);
  FStm.Seek(SWSCL+Addr,soFromBeginning);
  For k:=0 to 15 do
      FStm.Write(FCL[k],Sizeof(TSWSTeamIdRec));
  FStm.Seek(SWSCWS+Addr,soFromBeginning);
  For k:=0 to 31 do
      FStm.Write(FCWC[k],Sizeof(TSWSTeamIdRec));
  FStm.Seek(SWSUC+Addr,soFromBeginning);
  For k:=0 to 31 do
      FStm.Write(FUEFA[k],Sizeof(TSWSTeamIdRec));
  FStm.Free

end;

{ TSWSPoolPLyrDat }

function TSWSPoolPLyrDat.GetPlayer(Index: integer): TSWSPoolPlyrRec;
begin
  if (Index < 0) or (Index > 899) then
    Exit;
  Result := FPlayers[Index];
end;

procedure TSWSPoolPLyrDat.SetPlayer(Index: integer; AValue: TSWSPoolPlyrRec);
begin
  if (Index < 0) or (Index > 899) then
    Exit;
  FPlayers[Index] := AValue;
end;

constructor TSWSPoolPLyrDat.Create(AOwner: TComponent);
var
  a: integer;
begin
  if (AOwner is TSWSEngine) then
    FEngine := TSWSEngine(AOwner)
  else
    FEngine := nil;
  FPlIndex := -1;
  Floaded:=false;
  for a := 0 to 899 do
    FPlayers[a] := TSWSPoolPlyrRec.Create;
end;

destructor TSWSPoolPLyrDat.Destroy;
var
  a: integer;
begin
  for a := 0 to 899 do
    FPlayers[a].Free;
  inherited Destroy;
end;

procedure TSWSPoolPLyrDat.Load(AFN: string);
var
  Stm: TFileStream;
  a: integer;
begin
  Stm := TFileStream.Create(AFN, fmOpenRead);
  Stm.Seek(0, soBeginning);
  for a := 0 to 899 do
    FPlayers[a].LoadPool(Stm);
  Stm.Free;
  Floaded:=true;
end;

procedure TSWSPoolPLyrDat.Write(AFN: string);
var
  Stm: TFileStream;
  a: integer;
begin
  Stm := TFileStream.Create(AFN, fmCreate or fmShareDenyWrite);
  Stm.Seek(0, soBeginning);
  for a := 0 to 899 do
    FPlayers[a].WritePool(Stm);
  Stm.Free;
end;

{ TSWSPoolPlyrRec }

constructor TSWSPoolPlyrRec.Create;
begin
  FNation := 0;
  FPlayer := nil;
  FPlay_nr := 0;
  FTeamName := '';
  FTeamNr := 0;
  FPlayer := TSWSPlayer.Create;
end;

destructor TSWSPoolPlyrRec.Destroy;
begin
  FPlayer.Free;
  inherited Destroy;
end;

procedure TSWSPoolPlyrRec.Assign(ASource: TPersistent);
begin
  if (ASource is TSWSPlayer) then
  begin
    with FPlayer do
    begin
      FTeam := (ASource as TSWSPlayer).FTeam;
      Fpname := (ASource as TSWSPlayer).Fpname;
      FAtP := (ASource as TSWSPlayer).FAtP;
      FAtV := (ASource as TSWSPlayer).FAtV;
      FAtH := (ASource as TSWSPlayer).FAtH;
      FAtT := (aSource as TSWSPlayer).Fatt;
      FAtc := (aSource as TSWSPlayer).Fatc;
      FAtS := (ASource as TSWSPlayer).FAtS;
      FAtF := (aSource as TSWSPlayer).FAtF;
      FValue := (aSource as TSWSPlayer).FValue;
      Fcname := (aSource as TSWSPlayer).Fcname;
      Fposition := (aSource as TSWSPlayer).Fposition;
      Fpos := (aSource as TSWSPlayer).Fpos;
      Fskin := (aSource as TSWSPlayer).Fskin;
      FNumber := (ASource as TSWSPlayer).FNumber;
      FNational := (ASource as TSWSPlayer).FNational;
    end;
    FTeamName := (ASource as TSWSPlayer).FTeam.Fteamname;
    FTeamNr := (ASource as TSWSPlayer).FTeam.TeamNum;
    FNation := (ASource as TSWSPlayer).FTeam.Nation;
  end
  else
    inherited Assign(ASource);
end;

procedure TSWSPoolPlyrRec.AssignPlayer(Play_InTeam: integer; Player: TSWSPlayer);
begin
  FPlay_nr := Play_InTeam;
  Assign(Player);
end;

function TSWSPoolPlyrRec.LoadPool(Stm: TStream): boolean;
begin
  try
    FNation := Stm.ReadByte;
    FTeamNr := Stm.ReadByte;
    FPlay_nr := Stm.ReadByte;
    Stm.ReadBuffer(FctName, sizeof(FcTName));
    FTeamName := string(FcTName);
    Stm.ReadByte;
    FPlayer.LoadPlayer(Stm);
  except
    Result := False;
  end;
  Result := True;
end;

function TSWSPoolPlyrRec.WritePool(Stm: TStream): boolean;
begin
  try
    Stm.WriteByte(FNation);
    Stm.WriteByte(FTeamNr);
    Stm.WriteByte(FPlay_nr);
    FcTName := UpperCase(FTeamName) + #0;
    Stm.WriteBuffer(FcTName, sizeof(FcTName));
    Stm.WriteByte(0);
    FPlayer.WritePlayer(Stm);
  except
    Result := False;
  end;
end;

{ TSWSLeague }

function TSWSLeague.GetDiv(idx: integer): TSWSDivision;
begin
  if (idx < 0) or (idx > (FLeagues - 1)) then
    Exit;
  Result := FDivs[idx];
end;

procedure TSWSLeague.SetDiv(idx: integer; AValue: TSWSDivision);
begin
  if (idx > 0) or (idx > (FLeagues - 1)) then
    Exit;
  FDivs[idx] := AValue;
end;

procedure TSWSLeague.ReadDta;
var
  FStm: TFileStream;
  Tmp: TSWSDivision;
  tmsub: byte;
  i: integer;
begin
  FStm := TFileStream.Create(FSWSfile, fmOpenRead);
  Fstm.Seek(FAddr, soFromBeginning);
  FCompet := Fstm.ReadByte;
  FType := Fstm.ReadByte;
  FTeamNr := Fstm.ReadByte;
  FBMonth := Fstm.ReadByte div 8;
  FEMonth := FStm.ReadByte div 8;
  Fstm.ReadDWord;
  FLeagues := Fstm.ReadByte;
  FMatEach := Fstm.ReadByte;
  Fpts := FStm.ReadByte;
  tmsub := Fstm.ReadByte;
  FPosSubs := tmsub div 16;
  FFromSubs := tmsub mod 16;
  FOrginalDivisions:=FLeagues;
  for i := 0 to FLeagues - 1 do
  begin
    Tmp:=TSWSDivision.Create;
    Tmp.Teams := Fstm.ReadByte;
    Tmp.FProm := FStm.ReadByte;
    Tmp.FPromPO := Fstm.ReadByte;
    Tmp.FRel := FStm.ReadByte;
    Tmp.FRelPO := FStm.ReadByte;
    Fstm.ReadByte;
    FDivs.Add(Tmp);
  end;
  Fstm.Free;
  FLoaded := True;
end;

procedure TSWSLeague.WriteDta(FSM: TFileStream);
var
  tmSub: byte;
  i: integer;
begin
  FSM.WriteByte(FCompet);
  FSM.WriteByte(FType);
  FSM.WriteByte(FTeamNr);
  FSM.WriteByte(FBMonth * 8);
  FSM.WriteByte(FEMonth * 8);
  FSM.WriteDWord(0);
  FSM.WriteByte(FLeagues);
  FSM.WriteByte(FMatEach);
  FSM.WriteByte(Fpts);
  tmSub := (FPosSubs * 16) + FFromSubs;
  FSM.WriteByte(tmSub);
  for i := 0 to FLeagues - 1 do
  begin
    FSM.WriteByte(Fdivs[i].Teams);
    FSM.WriteByte(Fdivs[i].FProm);
    FSM.WriteByte(Fdivs[i].FPromPO);
    FSM.WriteByte(Fdivs[i].FRel);
    FSM.WriteByte(Fdivs[i].FRelPO);
    FSM.WriteByte(0);
  end;
end;

constructor TSWSLeague.Create;
begin
  FDivs:=TSWSDivisions.Create();
  inherited Create;
end;

destructor TSWSLeague.Destroy;
var
  i: integer;
begin
  FDivs.Free;
  inherited Destroy;
end;

procedure TSWSLeague.ReadData;
begin
  ReadDta;
end;

procedure TSWSLeague.WriteData(FN: string);
var
  FStm: TFileStream;
begin
  if (FN = '') then
    FStm := TFileStream.Create(FSWSfile, fmOpenReadWrite)
  else
    FStm := TFileStream.Create(FN, fmOpenReadWrite);
  Fstm.Seek(FAddr, soBeginning);
  WriteDta(FStm);
  Fstm.Free;
end;

procedure TSWSLeague.CreatePatch(FDir: String);
var
  FStm: TFileStream;
  FLP : String;
begin
  FLP:=FDir+'LEAGUE.'+Format('%.*d', [3,FTeamNr]);
  FStm := TFileStream.Create(FLP, fmCreate);
  Fstm.Seek(0, soBeginning);
  WriteDta(FStm);
  Fstm.Free;
end;

function TSWSLeague.AddDivision(): Boolean;
var
   Tmp: TSWSDivision;
begin
   if (FLeagues>3) then Exit(false);
   Tmp:=TSWSDivision.Create;
   Tmp.Teams:=10;
   Tmp.Promotion:=0;
   Tmp.Promotion_PO:=0;
   Tmp.Relegation:=0;
   Tmp.Relegation_PO:=0;
   FDivs.Add(Tmp);
   FLeagues+=1;
   Result:=True;
end;

function TSWSLeague.DelDivision(): Boolean;
begin
  if (FLeagues<2) then Exit(false);
  FDivs.Delete(FLeagues-1);
  FLeagues -= 1;
  Result:=true;
end;

{ TSWSDivision }

constructor TSWSDivision.Create;
begin
  inherited Create;
end;

destructor TSWSDivision.Destroy;
begin
  inherited Destroy;
end;

{ TSWSClipboard }

function TSWSClipboard.GetPlayer(Index: integer): TSWSPlayer;
begin
  if (Index < 0) or (Index > FPlayCount - 1) then
    Exit;
  Result := FPlayers[Index];
end;

function TSWSClipboard.GetTeam(Index: integer): TSWSTeam;
begin
  if (Index < 0) or (Index > FteamCount - 1) then
    Exit;
  Result := FTeams[Index];
end;

procedure TSWSClipboard.SetPlayer(Index: integer; AValue: TSWSPlayer);
begin
  if (Index < 0) or (Index > FPlayCount - 1) then
    Exit;
  FPlayers[Index] := AValue;
end;

procedure TSWSClipboard.SetTeam(Index: integer; AValue: TSWSTeam);
begin
  if (Index < 0) or (Index > FPlayCount - 1) then
    Exit;
  FTeams[Index] := AValue;
end;

constructor TSWSClipboard.Create(AEngine: TSWSEngine);
begin
  FPlayCount := 0;
  FTeamCount := 0;
  FPlayIndex := -1;
  FTeamIndex := -1;
  inherited Create;
end;

destructor TSWSClipboard.Destroy;
begin
  inherited Destroy;
end;

procedure TSWSClipboard.CopyPlayer(const APlayer: TSWSPlayer);
begin
  SetLength(FPlayers, FPlayCount + 1);
  FPlayers[FPlayCount] := TSWSPlayer.Create;
  FPlayers[FPlayCount].Assign(APlayer);
  Inc(FPlayCount);
end;

procedure TSWSClipboard.CopyTeam(const Ateam: TSWSTeam);
begin
  SetLength(FTeams, FTeamCount + 1);
  FTeams[FTeamCount] := TSWSTeam.Create;
  FTeams[FTeamCount].Assign(Ateam);
  Inc(FTeamCount);
end;

function TSWSClipboard.PastePlayer(AIndex: integer; APlayer: TSWSPlayer): TSWSPlayer;

begin
  if (AIndex < 0) or (AIndex > FPlayCount - 1) then
    Exit;
  Result := FPlayers[AIndex];
end;

function TSWSClipboard.PasteTeam(AIndex: integer; ATeam: TSWSTeam): TSWSTeam;
var
  Nat, num, SWSGe: integer;
begin
  if (AIndex < 0) or (AIndex > FteamCount - 1) then
    Exit;
  Nat := Ateam.Nation;
  Num := Ateam.TeamNum;
  SWSge := Ateam.SWS_Gen_Num;
  Result := FTeams[AIndex];
  Result.Nation := nat;
  Result.TeamNum := num;
  Result.SWS_Gen_Num := swsge;
end;

procedure TSWSClipboard.ClearTeams;
var
  a: integer;
begin
  for a := 0 to FTeamCount - 1 do
    FTeams[a].Free;
  SetLength(FTeams, 0);
  FTeamCount := 0;
end;

procedure TSWSClipboard.ClearPlayers;
var
  a: integer;
begin
  for a := 0 to FPlayCount - 1 do
    FPlayers[a].Free;
  SetLength(FPlayers, 0);
  FPlayCount := 0;
end;

procedure TSWSClipboard.WriteToFile(TF: string);
var
  FS: TFileStream;
  a: integer;
begin
  FS := TFileStream.Create(TF, fmCreate);
  FS.Seek(0, soBeginning);
  FS.WriteDWord(FTeamCount);
  for a := 0 to FTeamCount - 1 do
  begin
    FTeams[a].WriteTeam(FS);
  end;
  FS.WriteDWord(FPlayCount);
  for a := 0 to FPlayCount - 1 do
    FPlayers[a].WritePlayer(FS);
  FS.Free;
end;

procedure TSWSClipboard.ReadFromFile(TF: string);
var
  FS: TFileStream;
  a: integer;
begin
  FS := TFileStream.Create(TF, fmOpenRead);
  FS.Seek(0, soBeginning);
  FTeamCount := FS.ReadDWord;
  SetLength(FTeams, FTeamCount);
  for a := 0 to FTeamCount - 1 do
  begin
    FTeams[a] := TSWSTeam.Create;
    FTeams[a].LoadTeam(FS);
  end;
  FPlayCount := FS.ReadDWord;
  SetLength(FPlayers, FPlayCount);
  for a := 0 to FPlayCount - 1 do
  begin
    FPlayers[a] := TSWSPlayer.Create;
    FPlayers[a].LoadPlayer(FS);
  end;
  FS.Free;
end;

{ TSWStactic }

function TSWStactic.GetTacF(Poz, Ball: integer): byte;
begin
  if (Poz < 1) or (Poz > 10) or (Ball < 1) or (Ball > 35) then
    Exit;
  Result := Ftacfile[Poz, Ball];
end;

procedure TSWStactic.SetBall(X, Y: integer; AValue: byte);
begin
  if (X < 0) or (X > 4) or (Y < 0) or (Y > 6) then
    Exit;
  Fballpos[X, Y] := Avalue;
end;

procedure TSWStactic.SetField(X, Y: integer; AValue: byte);
begin
  if (X < 0) or (X > 14) or (Y < 0) or (Y > 15) then
    Exit;
  FField[X, Y] := AValue;
end;

procedure TSWStactic.SetFlip(Index: integer; AValue: byte);
begin
  if (Index < 1) or (Index > 10) then
    Exit;
  FFlip[Index] := AValue;
end;


function TSWStactic.GetBall(X, Y: integer): byte;
begin
  if (X < 0) or (X > 4) or (Y < 0) or (Y > 6) then
    Exit;
  Result := Fballpos[X, Y];
end;

function TSWStactic.GetField(X, Y: integer): byte;
begin
  if (X < 0) or (X > 14) or (Y < 0) or (Y > 15) then
    Exit;
  Result := Ffield[X, Y];
end;

function TSWStactic.GetFlip(Index: integer): byte;
begin
  if (Index < 1) or (Index > 10) then
    Exit;
  Result := FFlip[Index];
end;


procedure TSWStactic.SetTacF(Poz, Ball: integer; AValue: byte);
begin
  if (Poz < 1) or (Poz > 10) or (Ball < 1) or (Ball > 35) then
    Exit;
  Ftacfile[poz, Ball] := AValue;
end;

constructor TSWStactic.Create(ATeam: TSWSTeam);
begin
  FTeam := ATeam;
  FImgField := TBGRABitmap.Create(300, 220);
  inherited Create;
end;

destructor TSWStactic.Destroy;
begin
  FImgField.Free;
  inherited Destroy;
end;

procedure TSWStactic.ReadTac(FN: string);
var
  FS: TFileStream;
begin
  FS := TFileStream.Create(FN, fmOpenRead);
  try
    FS.Seek(0, soBeginning);
    FS.Read(FtcName, sizeof(FtcName));
    FS.Read(Ftacfile, sizeof(Ftacfile));
    FS.Read(FFlip, sizeof(FFlip));
  finally
    FS.Free;
  end;
end;

procedure TSWStactic.Assign(ASource: TPersistent);
var
  a,i: integer;
begin
  if (ASource is TSWStactic) then
  Begin
  FFieldFN:=(ASource as TSWStactic).FFieldFN;
  FFileName:=(ASource as TSWStactic).FFileName;
  For a:=0 to 15 do
   For i:=0 to 14 do
  Ffield[i,a]:=(ASource as TSWStactic).Ffield[i,a];
  FTeam:=(ASource as TSWStactic).FTeam;
  FImgField:=(ASource as TSWStactic).FImgField;
  FTacName:=(ASource as TSWStactic).FTacName;
  end else
  inherited Assign(ASource);
end;

procedure TSWStactic.DrawPreview(ACanvas: TCanvas; X, Y, W, H: integer;
  APlImg: TBGRABitmap);
var
  TmpTac: TSWSCTac;
  BMP: TBGRABitmap;
  CTX: TBGRACanvas2D;
  a: integer;
  col1: TBGRAPixel;
  NX, NY: double;
  TexSiz: integer;
  KX: double;
  TTX: integer;
begin
  BMP := TBGRABitmap.Create(W, H, BGRA(0, 0, 0, 255));

  //BMP.GetImageFromCanvas(FImgField.Canvas, 0, 0);

  BMP.LoadFromFile(FFieldFN);
  BMP.Canvas.Refresh;
  CTX := BMP.Canvas2D;
  case FTeam.Formation of
    0: TmpTac := SWTac442;
    1: TmpTac := SWTac541;
    2: TmpTac := SWTac451;
    3: TmpTac := SWTac532;
    4: TmpTac := SWTac352;
    5: TmpTac := SWTac433;
    6: TmpTac := SWTac424;
    7: TmpTac := SWTac343;
    8: TmpTac := SWTacSwP;
    9: TmpTac := SWTac523;
    10: TmpTac := SWTacATA;
    11: TmpTac := SWTacDEF;
    else
      TmpTac := SWTac442;
  end;
  NX := W / 16;
  NY := H / 15;
  KX := NX / 2;
  for a := 0 to 10 do
  begin
    //BMP.GetImageFromCanvas(APlImg,TmpTac[a].x*NX,TmpTac[a].y*NY);
    //    BMP.PutImage(Round(TmpTac[a].x * NX)-(APlImg.Width div 2), Round(TmpTac[a].y * NY),
    //      APlImg, dmDrawWithTransparency);
    BMP.FontName := 'Arial.ttf';
    if Team.Fplposit[a] = Team.PlayerIndex then
    begin
      BMP.FontStyle := [fsBold];
      col1 := BGRA(255, 245, 15, 255);
    end
    else
    begin
      col1 := BGRA(255, 255, 255, 255);
      BMP.FontStyle := [];
    end;
    BMP.FontHeight := 10;
    BMP.Rectangle(Round(TmpTac[a].x * NX) - 55, Round(TmpTac[a].y * NY) + 4,
      Round(TmpTac[a].x * NX) + 55, Round(TmpTac[a].y * NY) + 4 + 14, col1, BGRA(
      50, 50, 50, 100), dmDrawWithTransparency);
    TexSiz := BMP.TextSize(Trim(FTeam.player[FTeam.Fplposit[a]].ShortName)).cx;
    BMP.TextOut(Round(TmpTac[a].x * NX) ,
      Round(TmpTac[a].y * NY) + 4 + 1,
      Trim(FTeam.player[FTeam.Fplposit[a]].ShortName), BGRA(25, 25, 25), taCenter);
    BMP.TextOut(Round(TmpTac[a].x * NX) ,
      Round(TmpTac[a].y * NY) + 4,
      trim(FTeam.player[FTeam.Fplposit[a]].ShortName), col1, taCenter);
  end;
  BMP.Draw(ACanvas, X, Y, True);
  ACanvas.Refresh;
end;

{ TSWSEngine }



function TSWSEngine.GetNextPlUniqiD: integer;
begin
  Inc(FPlUniqID);
  Result := FPlUniqID;
end;

function TSWSEngine.GetFileCount: integer;
begin
  Result:= FSWSFiles.Count;
end;

function TSWSEngine.GetNextTmUniqID: integer;
begin
  Inc(FTmUniqID);
  Result := FTmUniqID;
end;

function TSWSEngine.GetSWSFiles(Index: integer): TSWSFile;
begin
  if ((Index<0) or (Index>GetFileCount-1)) then Exit(nil);
  Result:=FSWSFiles[Index];
end;


procedure TSWSEngine.OnLoadFile(Sender: TObject; Tidx, Tcount: integer);
begin
  if Assigned(FonLoad) then
    OnLoad(self, (Sender as TSWSFile), Tidx, Tcount);
end;

procedure TSWSEngine.OnSaveFile(Sender: TObject; Tidx, Tcount: integer);
begin
  if Assigned(FonSave) then
    OnSave(self, (Sender as TSWSFile), Tidx, Tcount);
end;

procedure TSWSEngine.SetSWSFiles(Index: integer; AValue: TSWSFile);
begin
  if ((Index<0) or (Index>GetFileCount-1)) then Exit;
  FSWSFiles[Index]:=AValue;
end;

constructor TSWSEngine.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPlUniqID := 0;
  FTmUniqID := 0;
  FLeaguesFile := TXMLDocument.Create;
  FClipboard := TSWSClipboard.Create(self);
  FSWSPoolPLyr := TSWSPoolPLyrDat.Create(self);
  FEuropeanCup := TSWSEurocup.Create(Self);
  FSWSFiles:= TSWSFiles.Create();
  FFileIndex := -1;
  FLoadAll := False;
end;

destructor TSWSEngine.Destroy;
begin
  FLeaguesFile.Free;
  FClipboard.Free;
  FSWSPoolPLyr.Free;
  FSWSFiles.Free;
  inherited Destroy;
end;

function TSWSEngine.ReadConf(ALeaguesFile: string): boolean;
var
  XMTmp, ETmp: TDOMNode;
begin
  if not FileExists(ALeaguesFile) then
  begin
    Result := False;
    Exit;
  end;
  FLeaguesDir := ALeaguesFile;
  try
    ReadXMLFile(FLeaguesFile, FLeaguesDir);
    XMTmp := FLeaguesFile.DocumentElement.FindNode('config');
    Etmp := XMTmp.FindNode('Version');
    FLeaguesVer := Etmp.TextContent;
    Etmp := XMTmp.FindNode('SWOS2020Diff');
    FSWS2020Dif:= StrToInt(Trim(ETmp.TextContent));
    Etmp := XMTmp.FindNode('SWOS2020Size');
    FSWS2020Size:= StrToInt(Trim(ETmp.TextContent));
  finally
    XMTmp.Free;
  end;

  if FLeaguesVer <> '' then
    Result := True
  else
    Result := False;
end;

function TSWSEngine.LoadFile(AFileName: string; isTMD: boolean;
  TMDCount: integer): integer;
var
  tmpf : TSWSFile;
begin
  //SetLength(FSWSFiles, FFileCount + 1);
  //FSWSFiles:=TSWSFiles.Create();
  tmpf := TSWSFile.Create(self, AFileName);
  tmpf.onLoadFile := @OnLoadFile;
  tmpf.onSaveFile := @OnSaveFile;
  if isTMD then
  begin
    tmpf.isTMD := True;
    tmpf.SetTMDCount(TMDCount);
  end
  else
    tmpf.isTMD := False;
  if tmpf.Load(AFileName) then
  begin
    tmpf.FileEngineID := FSWSFiles.Count;
    Result := FSWSFiles.Add(tmpf);
  end
  else
  begin
    tmpf.Free;
    Result := -1;
  end;
end;

function TSWSEngine.WriteAll(Adir: string): integer;
var
  a, lic: integer;
begin
  lic := 0;
  for a := 0 to FileCount - 1 do
  begin
    if FSWSFiles[a].Write then
      Inc(lic);
  end;
  Result := lic;
end;

procedure TSWSEngine.CloseAll;
var
  a: integer;
begin
  for a := 0 to FileCount - 1 do
    FSWSFiles[a].Free;
  FFileIndex := -1;
end;

function TSWSEngine.ChangedFiles(): integer;
var
  a, chxg: integer;
begin
  chxg := 0;
  for a := 0 to FileCount - 1 do
    if FSWSFiles[a].Changed then
      chxg += 1;
  Result := chxg;
end;

function TSWSEngine.CheckSWSVer(SFN: string): TSWSExeVer;
var
  FS: TFileStream;
  FESize: int64;
begin
  FS := TFileStream.Create(SFN, fmOpenRead);
  try
    FESize := FS.Size;
  finally
    FS.Free;
  end;
  {
  case FESize of
    2135087: FSWSExeVer := SWS9697;
    1920753: FSWSExeVer := SWSECE;
    FSWS2020Size: FSWSexeVer := SWS2020;
    else
      FSWSExeVer := SWSUnknown;
  end;
  }
  FSWSExeVer := SWSUnknown;
  if FESize = 2135087 then FSWSexeVer:=SWS9697;
  if FESize = 1920753 then FSWSexeVer:=SWSECE;
  if FESize = FSWS2020Size then FSWSexeVer:=SWS2020;
  Result := FSWSexeVer;
end;

function TSWSEngine.FindTeambyName(const TN: string;
  var FileIdx, TeamIdx: integer): boolean;
var
  i, j: integer;

begin
  i := FileIdx;
  j := TeamIdx;
  while i < FileCount do
  begin
    while j < FSWSFiles[i].TeamCount do
    begin
      if Pos(Uppercase(TN), FSWSFiles[i].FTeams[j].Fteamname) > 0 then
      begin
        Fileidx := i;
        TeamIdx := j;
        Result := True;
        exit;
      end;
      Inc(j);
    end;
    j := 0;
    Inc(i);
  end;
  Result := False;
end;

function TSWSEngine.FindPlayerbyName(const TN: string;
  var FileIdx, TeamIdx, PlayIdx: integer): boolean;
var
  i, j, k: integer;
begin
  i := FileIdx;
  j := TeamIdx;
  k := PlayIdx;
  while i < FileCount do
  begin
    while j < FSWSFiles[i].TeamCount do
    begin
      while k < 16 do
      begin
        if Pos(Uppercase(TN), FSWSFiles[i].FTeams[j].Fplayers[k].Fpname) > 0 then
        begin
          Fileidx := i;
          TeamIdx := j;
          PlayIDx := k;
          Result := True;
          exit;
        end;
        Inc(k);
      end;
      k := 0;
      Inc(j);
    end;
    j := 0;
    Inc(i);
  end;
  Result := False;
end;

function TSWSEngine.FindPlayers(pname: string; TL: TStringList): integer;
var
  f, t, p: integer;
  finded: integer;
begin
  finded := 0;
  for f:=0 to FSWSFiles.Count-1 do
      for t:=0 to FSWSFiles[f].TeamCount-1 do
          for p:=0 to 16 do begin
             if Uppercase(Name) = Uppercase(FSWSFiles[f].FTeams[t].Fplayers[p].Fpname) then begin
                finded += 1;
                TL.Add(IntToStr(finded)+','+Name+','+FSWSFiles[f].FTeams[t].TeamNAme);
             end;
          end;
  Result:=finded;
end;


function TSWSEngine.FindTeambyCoach(const CoachN: string;
  var FileIdx, TeamIdx: integer): boolean;
var
  f, t: integer;
begin
  for f:=0 to FSWSFiles.Count-1 do
      for t:=0 to FSWSFiles[f].TeamCount-1 do
        if FSWSFiles[f].Team[t].Coach = CoachN then begin
           FileIdx := f;
           TeamIdx := t;
           Exit(true);
      end;
  Result:=false;
end;

function TSWSEngine.FindMaxSWSGenNum: integer;
var
  MaxN, i, j: integer;
begin
  MaxN := 0;
  for i := 0 to FileCount - 1 do
    for j := 0 to FSWSFiles[i].TeamCount - 1 do
    begin
      if FSWSFiles[i].FTeams[j].FSws_gen_nr > MaxN then
        MaxN := FSWSFiles[i].FTeams[j].FSws_gen_nr;
    end;
  Result := MaxN;
end;

function TSWSEngine.CheckSWSGenNum(Num: integer): boolean;
var
  a, i, TMNE: integer;
begin
  TMNE := 0;
  if FLoadAll then
    for a := 0 to FileCount - 1 do
      for i := 0 to FSWSFiles[a].TeamCount - 1 do
        if FSWSFiles[a].FTeams[i].FSws_gen_nr = Num then
        begin
          Inc(tMnE);
        end;
  if TMNE > 1 then
    Result := False
  else
    Result := True;
end;

procedure TSWSEngine.FindSWSGenDuplic();
var
  TmpStr: String;
  Str: TStringList;
  g: word;
  f, t: integer;
  GCount: Integer;
begin
  //GenList:= TGenSWSList.Create;
  Str:=TStringList.Create;
  Str.Add('Finded duplicates:');
  Str.Add('INFO:: Ignore duplicates in TMD files, is correct.');
  for g:=0 to $FFFF do begin
    GCount:=0;
    for f:=0 to FSWSFiles.Count-1 do begin
      for t:=0 to FSWSFiles[f].TeamCount-1 do begin
        if (FSWSFiles[f].Team[t].SWS_Gen_Num = g) then begin
           GCount:=GCount+1;
           if (GCount>1) then
              Str.Add(FSWSFiles[f].FFileName+' :: '+FSWSFiles[f].Team[t].TeamNAme);
        end;
      end;
    end;
  end;
  Str.SaveToFile('SWS_GenNr_Duplicates.txt');
  Str.Free;
end;

function TSWSEngine.FindTeambyNumb(Nat, Team: integer): TSWSTeam;
var
  a: integer;
begin
  Result:=nil;
  For a:=0 to FileCount-1 do
      if FSWSFiles[a].FFileNumber=Nat then
         Result:=FSWSFiles[a].FindFileByNum(Team);
end;

function TSWSEngine.FindFilebyNum(Anum: integer): integer;
var
  i: integer;
begin
  for i := 0 to FileCount - 1 do
    if FSWSFiles[i].FileNumber = Anum then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

function TSWSEngine.FindTeambySWSGenNum(const ANum: integer;
  var FileIdx, TeamIdx: integer): boolean;
var
  i, j: integer;

begin
  i := FileIdx;
  j := TeamIdx;
  while i < FileCount do
  begin
    while j < FSWSFiles[i].TeamCount do
    begin
      if FSWSFiles[i].FisTMD then
        Inc(i);
      if ANum = FSWSFiles[i].FTeams[j].FSws_gen_nr then
      begin
        Fileidx := i;
        TeamIdx := j;
        Result := True;
        exit;
      end;
      Inc(j);
    end;
    j := 0;
    Inc(i);
  end;
  Result := False;
end;

function TSWSEngine.FlagName(TeamNr: integer): string;
var
  Xnod, Ynod: TDOMNode;
  Flg: string;
  i, a, Num: integer;
begin
  Result := '';
  Xnod := LeaguesFile.DocumentElement.FindNode('SWSData');
  for i := 0 to Xnod.ChildNodes.Count - 1 do
  begin
    Ynod := Xnod.ChildNodes[i];
    for a := 0 to YNod.ChildNodes.Count - 1 do
    begin
      Flg := YNod.ChildNodes[a].Attributes.GetNamedItem('Flag').NodeValue;
      Num := StrToInt(YNod.ChildNodes[a].Attributes.GetNamedItem('Num').NodeValue);
      if Num = TeamNr then
        Result := Flg;
    end;
  end;
end;

function TSWSEngine.FileCount: integer;
begin
  Result:=FSWSFiles.Count;
end;

{ TSWSkits }

procedure TSWSkits.SetShortCl(AValue: byte);
begin
  if FShortCl = AValue then
    Exit;
  FShortCl := AValue;
  Fchanged := True;
end;

procedure TSWSkits.Setsockscl(AValue: byte);
begin
  if Fsockscl = AValue then
    Exit;
  Fsockscl := AValue;
  Fchanged := True;
end;

procedure TSWSkits.SetTshcol1(AValue: byte);
begin
  if FTshcol1 = AValue then
    Exit;
  FTshcol1 := AValue;
  Fchanged := True;
end;

procedure TSWSkits.SetTshcol2(AValue: byte);
begin
  if FTshcol2 = AValue then
    Exit;
  FTshcol2 := AValue;
  Fchanged := True;
end;

procedure TSWSkits.Settyp(AValue: byte);
begin
  if Ftyp = AValue then
    Exit;
  Ftyp := AValue;
  Fchanged := True;
end;

constructor TSWSkits.Create;
begin
  inherited Create;
end;

destructor TSWSkits.Destroy;
begin
  inherited Destroy;
end;

procedure TSWSkits.Assign(Source: TPersistent);
begin
  if (Source is TSWSkits) then
  begin
    Ftyp := TSWSkits(Source).Typ;
    FTshcol1 := TSWSKits(Source).ShirtCol1;
    FTshcol2 := TSWSkits(Source).ShirtCol2;
    Fshortcl := TSWSkits(Source).ShortCol;
    Fsockscl := TSWSkits(Source).SocksCol;
  end
  else
    inherited Assign(Source);
end;

{ TSWSPlayer }

function TSWSPlayer.GetPos(val: byte): byte;
begin
  GetPos := val shr 5;
end;

function TSWSPlayer.GetAttrStr: string;
begin
  FAttrStr := AttibutteCode(True)[6].Str + AttibutteCode(True)[5].Str +
    AttibutteCode(True)[4].Str;
  Result := FAttrStr;
end;

function TSWSPlayer.GetSkin(val: byte): byte;
begin
  GetSkin := (val and $18) shr 3;
end;

procedure TSWSPlayer.SetAtC(AValue: byte);
begin
  if FAtC = AValue then
    Exit;
  if AValue > 15 then
    Avalue := 15;
  FAtC := AValue;
  Fchanged := True;
end;

procedure TSWSPlayer.SetAtF(AValue: byte);
begin
  if FAtF = AValue then
    Exit;
  if AValue > 15 then
    Avalue := 15;
  FAtF := AValue;
  Fchanged := True;
end;

procedure TSWSPlayer.SetAtH(AValue: byte);
begin
  if FAtH = AValue then
    Exit;
  if AValue > 15 then
    Avalue := 15;
  FAtH := AValue;
  Fchanged := True;
end;

procedure TSWSPlayer.setAtP(AValue: byte);
begin
  if FAtP = AValue then
    Exit;
  if AValue > 15 then
    Avalue := 15;
  FAtP := AValue;
  Fchanged := True;
end;

procedure TSWSPlayer.SetAtS(AValue: byte);
begin
  if FAtS = AValue then
    Exit;
  if AValue > 15 then
    Avalue := 15;
  FAtS := AValue;
  Fchanged := True;
end;

procedure TSWSPlayer.Setatt(AValue: byte);
begin
  if FAtT = AValue then
    Exit;
  if AValue > 15 then
    Avalue := 15;
  FAtT := AValue;
end;

procedure TSWSPlayer.SetAtV(AValue: byte);
begin
  if FAtV = AValue then
    Exit;
  if AValue > 15 then
    Avalue := 15;
  FAtV := AValue;
  Fchanged := True;
end;

procedure TSWSPlayer.SetNational(AValue: byte);
begin
  if FNational = AValue then
    Exit;
  FNational := AValue;
  FChanged := True;
end;

procedure TSWSPlayer.SetNumber(AValue: byte);
begin
  if FNumber = AValue then
    Exit;
  if AValue > 16 then
    Avalue := 16;
  FNumber := AValue;
  Fchanged := True;
end;

procedure TSWSPlayer.Setpname(AValue: string);
begin
  if Fpname = AValue then
    Exit;
  Fpname := AValue;
  Fchanged := True;
end;

function TSWSPlayer.SetPos(Pos, Skin: byte): byte;
begin
  Result := (Pos shl 5) + (Skin shl 3);
end;

procedure TSWSPlayer.Setposition(AValue: byte);
begin
  if Fposition = AValue then
    Exit;
  Fposition := AValue;
  Fchanged := True;
end;

procedure TSWSPlayer.Setskin(AValue: byte);
begin
  if Fskin = AValue then
    Exit;
  Fskin := AValue;
  Fchanged := True;
end;

procedure TSWSPlayer.SetValue(AValue: byte);
begin
  if FValue = AValue then
    Exit;
  FValue := AValue;
  Fchanged := True;
end;

function TSWSPlayer.Get7p(val: byte): byte;
begin
  if val > 7 then
    Result := val - 8
  else
    Result := val;
end;

function TSWSPlayer.CalcPlay(by7: boolean): integer;
begin
  if by7 then
    Result := Get7p(Fatp) + Get7p(Fatv) + Get7p(Fath) + Get7p(FatT) +
      Get7p(FatC) + Get7p(FatS) + Get7p(FatF)
  else
    Result := FAtP + FAtV + FAtH + FAtT + FAtC + FAtS + FAtF;
end;

procedure TSWSPlayer.ChangeAllTo7();
begin
  Passing:=Get7p(Passing);
  Shooting:=Get7p(Shooting);
  Heading:=Get7p(Heading);
  Tackling:=Get7p(Tackling);
  Ball_Control:=Get7p(Ball_Control);
  Speed:=Get7p(Speed);
  Finishing:=Get7p(Finishing);
  FChanged:=true;
end;

constructor TSWSPlayer.Create;
begin
  inherited Create;
end;

constructor TSWSPlayer.Create(ATeam: TSWSTeam);
begin
  FTeam := ATeam;
  inherited Create;
end;

destructor TSWSPlayer.Destroy;
begin
  inherited Destroy;
end;

procedure TSWSPlayer.Assign(ASource: TPersistent);
begin
  if ASource is TSWSPlayer then
  begin
    FTeam := (ASource as TSWSPlayer).FTeam;
    Fpname := (ASource as TSWSPlayer).Fpname;
    FAtP := (ASource as TSWSPlayer).FAtP;
    FAtV := (ASource as TSWSPlayer).FAtV;
    FAtH := (ASource as TSWSPlayer).FAtH;
    FAtT := (aSource as TSWSPlayer).Fatt;
    FAtc := (aSource as TSWSPlayer).Fatc;
    FAtS := (ASource as TSWSPlayer).FAtS;
    FAtF := (aSource as TSWSPlayer).FAtF;
    FValue := (aSource as TSWSPlayer).FValue;
    Fcname := (aSource as TSWSPlayer).Fcname;
    Fposition := (aSource as TSWSPlayer).Fposition;
    Fpos := (aSource as TSWSPlayer).Fpos;
    Fskin := (aSource as TSWSPlayer).Fskin;
    FNumber := (ASource as TSWSPlayer).FNumber;
    FNational := (ASource as TSWSPlayer).FNational;
    FChanged := True;
  end
  else
    inherited Assign(ASource);
end;

function TSWSPlayer.LoadPlayer(Ptm: TStream): boolean;
var
  Aval: byte;
  unqID: integer;
begin
  try
    if FTeam <> nil then
      if FTeam.FTeamFile <> nil then
        if FTeam.FTeamFile.FEngine <> nil then
          FUniqID := FTeam.FTeamFile.FEngine.NextPlUniqID;
    FNational := ptm.ReadByte;
    ptm.ReadByte;
    FNumber := Ptm.ReadByte;
    Ptm.Read(Fcname, sizeof(FcName));
    Fpname := Fcname + #0;
    Ptm.ReadByte;
    Fpos := Ptm.ReadByte;
    Fposition := GetPos(Fpos);
    Fskin := GetSkin(Fpos);
    Ptm.ReadByte;
    Aval := Ptm.ReadByte;
    FAtP := Aval mod 16;
    Aval := Ptm.ReadByte;
    FAtV := Aval div 16;
    FAtH := Aval mod 16;
    Aval := Ptm.ReadByte;
    FAtT := Aval div 16;
    FAtc := Aval mod 16;
    Aval := Ptm.ReadByte;
    FAtS := Aval div 16;
    FAtF := Aval mod 16;
    FValue := Ptm.ReadByte;
    Ptm.ReadWord;
    Ptm.ReadWord;
    ptm.ReadByte;
    Result := True;
  except
    Result := False
  end;
  FChanged := False;
end;

function TSWSPlayer.WritePlayer(Ptm: TStream): boolean;

begin
  try
    Ptm.WriteByte(FNational);
    Ptm.WriteByte(0);
    Ptm.WriteByte(FNumber);
    Fcname := UpperCase(Fpname) + #0;
    Ptm.Write(FCname, sizeof(FCname));
    Ptm.WriteByte(0);
    Fpos := SetPos(Fposition, FSkin);
    Ptm.WriteByte(Fpos);
    Ptm.WriteByte(0);
    Ptm.WriteByte(FAtP);
    Ptm.WriteByte((FAtv * 16) + Fath);
    Ptm.WriteByte((FAtT * 16) + FatC);
    Ptm.WriteByte((FAtS * 16) + FatF);
    Ptm.WriteByte(FValue);
    Ptm.WriteByte(0);
    Ptm.WriteWord(0);
    Ptm.WriteWord(0);
    Result := True;
  except
    Result := False;
  end;
  FChanged := False;
end;

function TSWSPlayer.ExportToCSV(var TS: TStringList; UniqID: integer): boolean;
var
  TmSt: string;
begin
  if UniqID <> -1 then
    TmST := (IntToStr(UniqID) + TS.Delimiter)
  else
    TmSt := IntToStr(FUniqID) + TS.Delimiter;
  tmSt := tmSt + IntToStr(National) + TS.Delimiter;
  TmST := tmSt + IntToStr(Number) + TS.Delimiter;
  TmSt := tmSt + Trim(PName) + TS.Delimiter;
  // IF POSITION //
  TmSt := tmSt + IntToStr(Fposition) + TS.Delimiter;
  Tmst := tmSt + IntToStr(Fskin) + TS.Delimiter;
  TmSt := tmSt + IntToStr(FatP) + TS.Delimiter;
  TmSt := tmSt + IntToStr(FatV) + TS.Delimiter;
  TmSt := tmSt + IntToStr(FatH) + TS.Delimiter;
  TmSt := tmSt + IntToStr(FatT) + TS.Delimiter;
  TmSt := tmSt + IntToStr(FatC) + TS.Delimiter;
  TmSt := tmSt + IntToStr(FatS) + TS.Delimiter;
  TmSt := tmSt + IntToStr(FatF) + TS.Delimiter;
  TmSt := tmSt + IntToStr(FValue) + TS.Delimiter;
  if FTeam <> nil then
  begin
    TmSt := Tmst + IntToStr(FTeam.FSws_gen_nr) + TS.Delimiter;
    TmSt := Tmst + IntToStr(FTeam.Fnation) + TS.Delimiter;
    tmSt := Tmst + IntToStr(FTeam.FTeamNum) + TS.Delimiter;
    tmSt := TmSt + IntToStr(FTeam.FUniqID) + TS.Delimiter;
  end;
  TS.Add(TmSt);
  Result:=True;
end;

function TSWSPlayer.ExportXML(Doc: TXMLDocument; ParNode: TDOMNode;
UniqID: Integer): Boolean;
var
  pNode, xNode, txtnod : TDOMNode;
begin
  pNode:=Doc.CreateElement('Player');
    //Name
    xNode:= Doc.CreateElement('Name');
    txtnod:=Doc.CreateTextNode(trim(PName));
    xNode.AppendChild(txtnod);
    pNode.AppendChild(xNode);
    //Position
    xNode:= Doc.CreateElement('Position');
    txtnod:=Doc.CreateTextNode(IntToStr(Position));
    xNode.AppendChild(txtnod);
    pNode.AppendChild(xNode);
    //
  ParNode.AppendChild(pNode);
  Result:=True;
end;

function TSWSPlayer.AttibutteCode(DefSwap: boolean): TAttrCode;
var
  AtI: TAttrCode = ((Val: 0; Str: 'P'), (Val: 0; Str: 'V'), (Val: 0;
    Str: 'H'), (Val: 0; Str: 'T'), (Val: 0; Str: 'C'), (Val: 0;
    Str: 'S'), (Val: 0; Str: 'F'));
  Tmp: TAttrCode;
  Vtt: TAttr;
  i, j, a, go: integer;

  procedure DF;
  begin
    Tmp[0] := Ati[6];
    Tmp[1] := Ati[4];
    Tmp[2] := Ati[1];
    Tmp[3] := Ati[5];
    Tmp[4] := Ati[0];
    Tmp[5] := Ati[2];
    Tmp[6] := Ati[3];
    go := 0;
    if Ati[2].Val = Ati[3].val then
    begin
      if ((FValue mod 2) <> 0) then
        Inc(go);
      if ((Ord(PName[1]) mod 2) <> 0) then
        Inc(go);
      if ((Ord(pname[2]) mod 2) <> 0) then
        Inc(go);
      if (go mod 2) <> 0 then
      begin
        Tmp[5] := Ati[3];
        Tmp[6] := Ati[2];
      end;
    end;
  end;

  procedure SD;
  begin
    Tmp[0] := Ati[6];
    Tmp[1] := Ati[4];
    Tmp[2] := Ati[2];
    Tmp[3] := Ati[1];
    Tmp[4] := Ati[0];
    Tmp[5] := Ati[3];
    Tmp[6] := Ati[5];
    if Ati[3].Val = Ati[5].val then
      if ((FValue mod 2) <> 0) then
        Inc(go);
    if ((Ord(pname[1]) mod 2) <> 0) then
      Inc(go);
    if ((Ord(pname[2]) mod 2) <> 0) then
      Inc(go);
    if (go mod 2) = 0 then
    begin
      Tmp[5] := Ati[5];
      Tmp[6] := Ati[3];
    end;
  end;

  procedure SM;
  begin
    Tmp[0] := Ati[1];
    Tmp[1] := Ati[6];
    Tmp[2] := Ati[2];
    Tmp[3] := Ati[3];
    Tmp[4] := Ati[0];
    Tmp[5] := Ati[4];
    Tmp[6] := Ati[5];
    if Ati[4].Val = Ati[5].val then
      if ((FValue mod 2) <> 0) then
        Inc(go);
    if ((Ord(pname[1]) mod 2) <> 0) then
      Inc(go);
    if ((Ord(pname[2]) mod 2) <> 0) then
      Inc(go);
    if (go mod 2) = 0 then
    begin
      Tmp[5] := Ati[5];
      Tmp[6] := Ati[4];
    end;
  end;

  procedure MF;
  begin
    Tmp[0] := Ati[6];
    Tmp[1] := Ati[5];
    Tmp[2] := Ati[1];
    Tmp[3] := Ati[2];
    Tmp[4] := Ati[4];
    Tmp[5] := Ati[3];
    Tmp[6] := Ati[0];
    if Ati[0].Val = Ati[3].val then
      if ((fValue mod 2) <> 0) then
        Inc(go);
    if ((Ord(pname[1]) mod 2) <> 0) then
      Inc(go);
    if ((Ord(pname[2]) mod 2) <> 0) then
      Inc(go);
    if (go mod 2) <> 0 then
    begin
      Tmp[5] := Ati[0];
      Tmp[6] := Ati[3];
    end;
  end;

  procedure AT;
  begin
    Tmp[0] := Ati[3];
    Tmp[1] := Ati[0];
    Tmp[2] := Ati[4];
    Tmp[3] := Ati[1];
    Tmp[4] := Ati[5];
    Tmp[5] := Ati[2];
    Tmp[6] := Ati[6];
    if Ati[2].Val = Ati[6].val then
      if ((fValue mod 2) <> 0) then
        Inc(go);
    if ((Ord(pname[1]) mod 2) <> 0) then
      Inc(go);
    if ((Ord(pname[2]) mod 2) <> 0) then
      Inc(go);
    if (go mod 2) = 0 then
    begin
      Tmp[5] := Ati[6];
      Tmp[6] := Ati[2];
    end;
  end;

begin
  Ati[0].Val := FAtp;
  Ati[1].Val := fAtV;
  Ati[2].Val := FAtH;
  Ati[3].Val := FatT;
  Ati[4].Val := FAtC;
  Ati[5].Val := FAtS;
  Ati[6].Val := FAtF;
  if DefSwap then
  begin
    if Fposition = 3 then
    begin
      Ati[2].Val := FAtT;
      Ati[3].Val := FAtH;
    end;
  end;
  go := 0;
  for i := 0 to 6 do
    if Ati[i].Val > 7 then
      Ati[i].Val := Ati[i].Val - 8;
  case Fposition of
    0:
    begin
      FAttrStr := '';
      Result := Ati;
    end;
    1: SD;
    2: SD;
    3: DF;
    4: SM;
    5: SM;
    6: MF;
    7: AT;
  end;
  for i := 0 to 5 do
    for j := 0 to 5 do
      if Tmp[j].val > Tmp[j + 1].Val then
      begin
        Vtt := Tmp[j];
        Tmp[j] := Tmp[j + 1];
        Tmp[j + 1] := Vtt;
      end;
  if Fposition = 0 then
  begin
    Result := Tmp;
    FAttrStr := '';
  end
  else
    Result := Tmp;
end;

function TSWSPlayer.ShortName: string;
var
  pt: integer;
begin
  Pt := Pos(#32, Fpname);
  Result := Copy(FPname, Pt + 1, Length(Fpname));
end;

function TSWSPlayer.GetWAM(Nominal: boolean): double;
var
  Attp: array[0..6] of byte;
  Wsk: array[0..6] of byte;


  function Def: double;
  var
    res: double;
    i, j: integer;
    Tmp: array[0..2] of byte;
    Vtt: byte;
  begin
    Res := Get7p(FAtT) * 10 / CalcPlay(True);
    Res := Res + Get7p(FAth) * 8 / CalcPlay(True);
    Res := Res + Get7p(FAtp) * 5 / CalcPlay(True);
    Res := Res + Get7p(FAtS) * 4 / CalcPlay(True);
    Tmp[0] := Get7p(FatV);
    Tmp[1] := Get7p(FatC);
    Tmp[2] := Get7p(FatF);
    for i := 0 to 1 do
      for j := 0 to 1 do
        if Tmp[j] > Tmp[j + 1] then
        begin
          Vtt := Tmp[j];
          Tmp[j] := Tmp[j + 1];
          Tmp[j + 1] := Vtt;
        end;
    Res := Res + Tmp[2] * 3 / CalcPlay(True);
    Res := Res + Tmp[1] * 2 / CalcPlay(True);
    Res := Res + Tmp[0] * 1 / CalcPlay(True);
    Result := Res;
  end;

  function RBLB: double;
  var
    res: double;
    i, j: integer;
    Tmp: array[0..2] of byte;
    Vtt: byte;
  begin

    Res := Get7p(FAtT) * 10 / CalcPlay(True);
    Res := Res + Get7p(FAtS) * 8 / CalcPlay(True);
    Res := Res + Get7p(FAtH) * 5 / CalcPlay(True);
    Res := Res + Get7p(FAtP) * 4 / CalcPlay(True);
    Tmp[0] := Get7p(FatV);
    Tmp[1] := Get7p(FatC);
    Tmp[2] := Get7p(FatF);
    for i := 0 to 1 do
      for j := 0 to 1 do
        if Tmp[j] > Tmp[j + 1] then
        begin
          Vtt := Tmp[j];
          Tmp[j] := Tmp[j + 1];
          Tmp[j + 1] := Vtt;
        end;
    Res := Res + Tmp[2] * 3 / CalcPlay(True);
    Res := Res + Tmp[1] * 2 / CalcPlay(True);
    Res := Res + Tmp[0] * 1 / CalcPlay(True);
    Result := Res;
  end;

  function RWLW: double;
  var
    res: double;
    i, j: integer;
    Vtt: byte;
  begin
    Res := Get7p(FAtS) * 10 / CalcPlay(True);
    Res := Res + Get7p(FAtP) * 8 / CalcPlay(True);
    Res := Res + Get7p(FAtC) * 5 / CalcPlay(True);
    if Get7p(FAtV) >= Get7p(FAtT) then
    begin
      Res := Res + Get7p(FAtV) * 4 / CalcPlay(True);
      Res := Res + Get7p(FAtT) * 3 / CalcPlay(True);
    end
    else
    begin
      Res := Res + Get7p(FAtT) * 4 / CalcPlay(True);
      Res := Res + Get7p(FAtV) * 3 / CalcPlay(True);
    end;
    if Get7p(FAtH) >= Get7p(FAtF) then
    begin
      Res := Res + Get7p(FAtH) * 2 / CalcPlay(True);
      Res := Res + Get7p(FAtF) * 1 / CalcPlay(True);
    end
    else
    begin
      Res := Res + Get7p(FAtF) * 2 / CalcPlay(True);
      Res := Res + Get7p(FAtH) * 1 / CalcPlay(True);
    end;
    Result := Res;
  end;

  function Mid: double;
  var
    res: double;
    i, j: integer;
    Vtt: byte;
  begin
    if Get7p(FAtP) >= Get7p(FAtT) then
    begin
      Res := Get7p(FAtP) * 10 / CalcPlay(True);
      Res := Res + Get7p(FAtT) * 8 / CalcPlay(True);
    end
    else
    begin
      Res := Get7p(FAtT) * 10 / CalcPlay(True);
      Res := Res + Get7p(FAtP) * 8 / CalcPlay(True);
    end;
    Res := Res + Get7p(FAtS) * 5 / CalcPlay(True);
    if Get7p(FAtH) >= Get7p(FAtC) then
    begin
      Res := Res + Get7p(FAtH) * 4 / CalcPlay(True);
      Res := Res + Get7p(FAtC) * 3 / CalcPlay(True);
    end
    else
    begin
      Res := Res + Get7p(FAtC) * 4 / CalcPlay(True);
      Res := Res + Get7p(FAtH) * 3 / CalcPlay(True);
    end;
    if Get7p(FAtV) >= Get7p(FAtF) then
    begin
      Res := Res + Get7p(FAtV) * 2 / CalcPlay(True);
      Res := Res + Get7p(FAtF) * 1 / CalcPlay(True);
    end
    else
    begin
      Res := Res + Get7p(FAtF) * 2 / CalcPlay(True);
      Res := Res + Get7p(FAtV) * 1 / CalcPlay(True);
    end;
    Result := Res;
  end;

  function DM: double;
  var
    res: double;
    i, j: integer;
    Vtt: byte;
  begin
    Res := Get7p(FAtT) * 10 / CalcPlay(True);
    Res := Res + Get7p(FAtP) * 8 / CalcPlay(True);
    if Get7p(FAtS) >= Get7p(FAtC) then
    begin
      Res := Res + Get7p(FAtS) * 5 / CalcPlay(True);
      Res := Res + Get7p(FAtC) * 4 / CalcPlay(True);
    end
    else
    begin
      Res := Res + Get7p(FAtC) * 5 / CalcPlay(True);
      Res := Res + Get7p(FAtS) * 4 / CalcPlay(True);
    end;
    Res := Res + Get7p(FAtH) * 3 / CalcPlay(True);
    if Get7p(FAtV) >= Get7p(FAtF) then
    begin
      Res := Res + Get7p(FAtV) * 2 / CalcPlay(True);
      Res := Res + Get7p(FAtF) * 1 / CalcPlay(True);
    end
    else
    begin
      Res := Res + Get7p(FAtF) * 2 / CalcPlay(True);
      Res := Res + Get7p(FAtV) * 1 / CalcPlay(True);
    end;
    Result := Res;
  end;

  function FC: double;
  var
    res: double;
    i, j: integer;
    Vtt: byte;
  begin
    Res := Get7p(FAtF) * 10 / CalcPlay(True);
    Res := Res + Get7p(FAtP) * 8 / CalcPlay(True);
    Res := Res + Get7p(FAtS) * 5 / CalcPlay(True);
    if Get7p(FAtV) >= Get7p(FAtC) then
    begin
      Res := Res + Get7p(FAtV) * 4 / CalcPlay(True);
      Res := Res + Get7p(FAtC) * 3 / CalcPlay(True);
    end
    else
    begin
      Res := Res + Get7p(FAtC) * 4 / CalcPlay(True);
      Res := Res + Get7p(FAtV) * 3 / CalcPlay(True);
    end;
    Res := Res + Get7p(FAtH) * 2 / CalcPlay(True);
    Res := Res + Get7p(FAtT) * 1 / CalcPlay(True);
    Result := Res;
  end;

  function SC: double;
  var
    res: double;
    i, j: integer;
    Vtt: byte;
  begin
    Res := Get7p(FAtF) * 10 / CalcPlay(True);
    Res := Res + Get7p(FAtH) * 8 / CalcPlay(True);
    if Get7p(FAtP) >= Get7p(FAtV) then
    begin
      Res := Res + Get7p(FAtP) * 5 / CalcPlay(True);
      Res := Res + Get7p(FAtV) * 4 / CalcPlay(True);
    end
    else
    begin
      Res := Res + Get7p(FAtV) * 5 / CalcPlay(True);
      Res := Res + Get7p(FAtP) * 4 / CalcPlay(True);
    end;
    if Get7p(FAtS) >= Get7p(FAtC) then
    begin
      Res := Res + Get7p(FAtS) * 3 / CalcPlay(True);
      Res := Res + Get7p(FAtC) * 2 / CalcPlay(True);
    end
    else
    begin
      Res := Res + Get7p(FAtC) * 3 / CalcPlay(True);
      Res := Res + Get7p(FAtS) * 2 / CalcPlay(True);
    end;
    Res := Res + Get7p(FAtT) * 1 / CalcPlay(True);
    Result := Res;
  end;

begin
  if CalcPlay(True) = 0 then
  begin
    Result := 0;
    Exit;
  end;
  case Fposition of
    1: Result := RBLB;
    2: Result := RBLB;
    3: Result := Def;
    4: Result := RWLW;
    5: Result := RWLW;
    6:
    begin
      if Nominal then
        Result := Mid
      else
        Result := DM;
    end;
    7:
    begin
      if Nominal then
        Result := FC
      else
        Result := SC;
    end;
  end;
end;

procedure TSWSPlayer.GenerateAttrbyValue;
var
  AMax, i, a: integer;
  tmp: byte;
  licz, kicz: integer;
  spr: boolean;
  AAtrr: array[0..6] of byte;
  APosA: array[0..6] of byte;
begin
  Randomize;
  AMax := FValue;
  i := 0;
  kicz := 7;
  for i := 0 to 6 do
    AAtrr[i] := i;
  for i := 0 to 6 do
  begin
    tmp := round(Random(kicz));
    AposA[i] := AAtrr[tmp];
    AAtrr[tmp] := AAtrr[Kicz - 1];
    Kicz -= 1;
  end;
  repeat
    licz := 0;
    tmp := Round(Random(8));
    AAtrr[0] := tmp;
    kicz := AMax - tmp;
    kicz := Round(kicz / 6);
    for i := 1 to 5 do
    begin
      kicz := round((AMax - (licz + AAtrr[i - 1])) / (7 - i));
      tmp := Round(Random(kicz + 1));
      AAtrr[i] := tmp;
      licz := licz + tmp;
    end;
    AAtrr[6] := AMax - (licz + AAtrr[0]);
    spr := True;
    for i := 0 to 6 do
      if AAtrr[i] > 7 then
        spr := False;
  until spr;
  FAtP := AAtrr[APosA[0]];
  FAtV := AAtrr[APosA[1]];
  FAtH := AAtrr[APosA[2]];
  FAtT := AAtrr[APosA[3]];
  FAtC := AAtrr[APosA[4]];
  FAtS := AAtrr[APosA[5]];
  FAtF := AAtrr[APosA[6]];
  GetAttrStr;
  FChanged:=true;
end;

procedure TSWSPlayer.GenerateAttrbyPosVal(Pos: integer);
var
  TmpAttr: TAttrByte;
  PosNum: TAttrByte;
  AMax, i: integer;
  tmp, dod, ile: integer;
  licz, kicz: integer;
  spr, kpr: boolean;

  function InitArr(b0, b1, b2, b3, b4, b5, b6: byte): TAttrByte;

  begin
    Result[0] := b0;
    Result[1] := b1;
    Result[2] := b2;
    Result[3] := b3;
    Result[4] := b4;
    Result[5] := b5;
    Result[6] := b6;
  end;

begin
  case Pos of
    0: PosNum := InitArr(3, 5, 2, 0, 4, 1, 6);  //SB
    1: PosNum := InitArr(3, 2, 0, 5, 4, 1, 6);  //D
    2: PosNum := InitArr(5, 0, 4, 3, 1, 2, 6); //SM
    3: PosNum := InitArr(1, 5, 4, 0, 6, 3, 2);  //SW
    4: PosNum := InitArr(3, 0, 4, 5, 2, 1, 6);  //DM
    5: PosNum := InitArr(0, 3, 5, 4, 2, 1, 6);  //M
    6: PosNum := InitArr(1, 0, 4, 6, 5, 3, 2); //AM
    7: PosNum := InitArr(6, 0, 5, 4, 1, 2, 3); //A
    8: PosNum := InitArr(6, 2, 1, 0, 5, 4, 3); //SC
  end;
  for i := 0 to 6 do
    TmpAttr[i] := 199;
  Randomize;
  repeat
    kpr := True;
    spr := False;
    AMax := FValue;
    if (FValue<11) then
       ile :=7;
    if (FValue>10) and (FValue < 18) then
      ile := 6;
    if (FValue > 17) and (FValue < 28) then
      ile := 5;
    if (FValue > 27) then
      ile := 4;

    tmp := Round(random(2));
    tmp -= 1;
    ile := ile + tmp;
    kicz := Round((Amax * ile) / 10);
    if kicz < 14 then
    begin
      repeat
        spr := False;
        tmp := Round(kicz / 2);
        dod := Round(Random(tmp * 2));
        dod := dod - tmp;
        TmpAttr[PosNum[0]] := tmp + dod;
        TmpAttr[PosNum[1]] := kicz - TmpAttr[PosNum[0]];
        if ((TmpAttr[PosNum[0]] + TmpAttr[PosNum[1]]) = kicz) then
          spr := True;
      until spr;
    end
    else
    begin
      TmpAttr[PosNum[0]] := 7;
      TmpAttr[PosNum[1]] := 7;
      kicz := 14;
    end;
    Amax := AMax - kicz;

    kicz := Round((Amax * 5) / 10);
    ///
    if kicz < 14 then
    begin
      repeat
        spr := False;
        tmp := Round(kicz / 2);
        dod := Round(Random((7 - tmp) * 2));
        dod := dod - (7 - tmp);
        TmpAttr[PosNum[2]] := tmp + dod;
        TmpAttr[PosNum[3]] := kicz - TmpAttr[PosNum[2]];
        if ((TmpAttr[PosNum[2]] + TmpAttr[PosNum[3]]) = kicz) then
          spr := True;
        for i := 2 to 3 do
          if TmpAttr[PosNum[i]] > 7 then
            spr := False;
      until spr;
    end
    else
    begin
      TmpAttr[PosNum[2]] := 7;
      TmpAttr[PosNum[3]] := 7;
      kicz := 14;
    end;
    Amax := Amax - kicz;

    ///
    if AMax < 21 then
    begin
      repeat
        spr := False;
        Tmp := round(Amax / 3);
        dod := Round(Random((7 - tmp) * 2));
        dod := dod - (7 - tmp);
        TmpAttr[PosNum[4]] := tmp + dod;
        kicz := Amax - TmpAttr[PosNum[4]];
        Tmp := round(kicz / 2);
        dod := Round(Random(tmp * 2));
        dod := dod - tmp;
        TmpAttr[PosNum[5]] := tmp + dod;
        TmpAttr[PosNum[6]] := kicz - TmpAttr[PosNum[5]];
        if (TmpAttr[PosNum[4]] + TmpAttr[PosNum[5]] + TmpAttr[PosNum[6]]) = AMax then
          spr := True;
      until spr;
    end
    else
    begin
      TmpAttr[PosNum[4]] := 7;
      TmpAttr[PosNum[5]] := 7;
      TmpAttr[PosNum[6]] := 7;
    end;
    for i := 0 to 6 do
      if TmpAttr[i] > 7 then
        kpr := False;
  until kpr;
  TmpAttr[PosNum[0]] += 8;
  TmpAttr[PosNum[1]] += 8;
  FAtP := TmpAttr[0];
  FAtV := tmpAttr[1];
  FAtH := tmpAttr[2];
  FAtT := tmpAttr[3];
  FAtC := tmpAttr[4];
  FAtS := tmpAttr[5];
  FAtF := tmpAttr[6];
  GetAttrStr;
  FChanged:=true;
end;

procedure TSWSPlayer.ClearPlayer(nr: integer);
begin
  Fpname:='PLAYER '+IntToStr(nr);
  FAtC:=0;
  FAtF:=0;
  FAtP:=0;
  FAtV:=0;
  FAtH:=0;
  FAtT:=0;
  FAtS:=0;
  FValue:=0;
  Fskin:=0;
  GetAttrStr;
end;



{ TSWSTeam }

function TSWSTeam.Getplayer(Index: integer): TSWSPlayer;
begin
  if (Index < 0) or (Index > 15) then
    Exit;
  Result := Fplayers[Index];
end;

function TSWSTeam.GetPosition(Index: integer): byte;
begin
  if (Index < 0) or (Index > 15) then
    Exit;
  Result := Fplposit[Index];
end;

procedure TSWSTeam.SetAwayKit(AValue: TSWSkits);
begin
  if FAwayKit = AValue then
    Exit;
  FAwayKit := AValue;
  Fchanged := True;
end;

procedure TSWSTeam.Setcoach(AValue: string);
begin
  if Fcoach = AValue then
    Exit;
  Fcoach := AValue;
  Fchanged := True;
end;

procedure TSWSTeam.Setdivision(AValue: byte);
begin
  if Fdivision = AValue then
    Exit;
  Fdivision := AValue;
  Fchanged := True;
end;

procedure TSWSTeam.Setformation(AValue: byte);
begin
  if Fformation = AValue then
    Exit;
  Fformation := AValue;
  Fchanged := True;
end;

procedure TSWSTeam.SetHomeKit(AValue: TSWSkits);
begin
  if FHomeKit = AValue then
    Exit;
  FHomeKit := AValue;
  Fchanged := True;
end;

procedure TSWSTeam.Setnation(AValue: byte);
begin
  if Fnation = AValue then
    Exit;
  Fnation := AValue;
  Fchanged := True;
end;

procedure TSWSTeam.SetPlayer(Index: integer; AValue: TSWSPlayer);
begin
  if (Index < 0) or (Index > 15) then
    Exit;
  Fplayers[Index] := AValue;
end;

procedure TSWSTeam.SetPosition(AIndex: integer; AValue: byte);
begin
  if (AIndex < 0) or (AIndex > 15) then
    Exit;
  if Fplposit[AIndex] = AValue then
    Exit;
  Fplposit[AIndex] := AValue;
  Fchanged := True;
end;

procedure TSWSTeam.SetSws_gen_nr(AValue: word);
begin
  if FSws_gen_nr = AValue then
    Exit;
  FSws_gen_nr := AValue;
  Fchanged := True;
end;

procedure TSWSTeam.SetTeamFile(AValue: TSWSFile);
begin
  if FTeamFile = AValue then
    Exit;
  FTeamFile := AValue;
  Fchanged := True;
end;

procedure TSWSTeam.Setteamname(AValue: string);
begin
  if Fteamname = AValue then
    Exit;
  Fteamname := AValue;
  Fchanged := True;
end;

procedure TSWSTeam.SetTeamNum(AValue: byte);
begin
  if FTeamNum = AValue then
    Exit;
  FTeamNum := AValue;
  Fchanged := True;
end;

constructor TSWSTeam.Create;
var
  a: integer;
begin
  FPlayerIndex := -1;
  FHomeKit := TSWSkits.Create;
  FAwayKit := TSWSkits.Create;
  FHomeKit.Fchanged := False;
  FAwayKit.Fchanged := False;
  For a:=0 to 15 do begin
    Fplayers[a]:=TSWSPlayer.Create;
  end;
  inherited Create;
end;

constructor TSWSTeam.Create(ASWSFile: TSWSFile);
var
  a: integer;
begin
  FTeamFile := ASWSFile;
  FPlayerIndex := -1;
  FHomeKit := TSWSkits.Create;
  FAwayKit := TSWSkits.Create;
  FTactic := TSWStactic.Create(self);
  FHomeKit.Fchanged := False;
  FAwayKit.Fchanged := False;
  For a:=0 to 15 do begin
    Fplayers[a]:=TSWSPlayer.Create;
  end;
  inherited Create;
end;

destructor TSWSTeam.Destroy;
var
  a: integer;
begin
  FHomeKit.Free;
  FAwayKit.Free;
  FTactic.Free;
  for a := 0 to 15 do
    Fplayers[a].Free;
  inherited Destroy;
end;

procedure TSWSTeam.Assign(ASource: TPersistent);
var
  a: integer;
  TmpPl: TSWSPlayer;
  TmpTc: TSWStactic;
begin
  if ASource is TSWSTeam then
  begin
    FTeamFile := (ASource as TSWSTeam).FTeamFile;
    Fteamname := (ASource as TSWSTeam).Fteamname;
    FTeamNum := (ASource as TSWSTeam).FTeamNum;
    Fnation := (ASource as TSWSTeam).Fnation;
    FSws_gen_nr := (aSource as TSWSTeam).FSws_gen_nr;
    Fcoach := (ASource as TSWSTeam).Fcoach;
    Fctname := (ASource as TSWSTeam).Fctname;
    Fccoach := (ASource as TSWSTeam).Fccoach;
    Fformation := (ASource as TSWSTeam).Fformation;
    Fdivision := (ASource as TSWSTeam).Fdivision;
    FHomeKit.Assign((ASource as TSWSTeam).HomeKit);
    FAwayKit.Assign((ASource as TSWSTeam).AwayKit);
    Fplposit := (ASource as TSWSTeam).Fplposit;
    TmpTc:=(ASource as TSWSTeam).FTactic;
    FTactic:=TSWStactic.Create(self);
    FTactic.Assign(TmpTc);
    FTactic.Team:=self;
    for a := 0 to 15 do
    begin
      Fplayers[a] := TSWSPlayer.Create(self);
      Tmppl := (ASource as TSWSTeam).Fplayers[a];
      Fplayers[a].Assign(Tmppl);
    end;
    Fchanged := True;
  end
  else
    inherited Assign(ASource);
end;

procedure TSWSTeam.ClearTeam;
var
  a: integer;
begin
  Coach:='';
  TeamNAme:='CLEAR TEAM';
  Division:=0;
  with HomeKit do begin
    typ:=0;
    ShirtCol1:=0;
    ShirtCol2:=0;
    ShortCol:=0;
    SocksCol:=0;
  end;
  with AwayKit do begin
    typ:=0;
    ShirtCol1:=0;
    ShirtCol2:=0;
    ShortCol:=0;
    SocksCol:=0;
  end;
  Formation:=0;
  For a:=0 to 15 do
      Player[a].ClearPlayer(a);

end;

function TSWSTeam.CalcTeam(by7: boolean): integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to 15 do
    Result := Result + Fplayers[i].CalcPlay(by7);

end;

function TSWSTeam.LoadTeam(Stm: TStream): boolean;
var
  i: integer;
begin
  try
    if FTeamFile <> nil then
      if FTeamFile.FEngine <> nil then
        FUniqID := FTeamFile.FEngine.NextTmUniqID;
    Fnation := Stm.ReadByte;
    FTeamNum := Stm.ReadByte;
    FSws_gen_nr := Swap(Stm.ReadWord);
    Stm.ReadByte;
    Stm.Read(Fctname, sizeof(Fctname));
    Fteamname := Fctname + #0;
    Stm.ReadByte;
    Stm.ReadWord;
    Fformation := Stm.ReadByte;
    Fdivision := Stm.ReadByte;
    FHomeKit.Typ := Stm.ReadByte;
    FHomeKit.ShirtCol1 := STm.ReadByte;
    FHomeKit.ShirtCol2 := Stm.ReadByte;
    FHomeKit.ShortCol := Stm.ReadByte;
    FHomeKit.SocksCol := Stm.ReadByte;
    FAwayKit.Typ := Stm.ReadByte;
    FAwayKit.ShirtCol1 := STm.ReadByte;
    FAwayKit.ShirtCol2 := Stm.ReadByte;
    FAwayKit.ShortCol := Stm.ReadByte;
    FAwayKit.SocksCol := Stm.ReadByte;
    Stm.Read(Fccoach, sizeof(Fccoach));
    Fcoach := Fccoach + #0;
    Stm.ReadWord;
    Stm.Read(Fplposit, sizeof(Fplposit));
    Result := True;
    for i := 0 to 15 do
    begin
      //Fplayers[i] := TSWSPlayer.Create(self);
      Result := Fplayers[i].LoadPlayer(Stm);
      Fplayers[i].PlayInTeam := i;
    end;
  except
    Result := False;
  end;
  Fchanged := False;
  HomeKit.Fchanged := False;
  AwayKit.Fchanged := False;
  FPlayerIndex := -1;
end;

function TSWSTeam.WriteTeam(Stm: TStream): boolean;
var
  i: integer;
begin
  try
    Stm.WriteByte(Fnation);
    Stm.WriteByte(FTeamNum);
    Stm.WriteWord(Swap(FSws_gen_nr));
    Stm.WriteByte(0);
    Fctname := UpperCase(Fteamname) + #0;
    Stm.Write(Fctname, sizeof(Fctname));
    Stm.WriteByte(0);
    Stm.WriteWord(0);
    Stm.WriteByte(Fformation);
    Stm.WriteByte(Fdivision);
    Stm.WriteByte(FHomeKit.Typ);
    Stm.WriteByte(FHomeKit.ShirtCol1);
    Stm.WriteByte(FHomeKit.ShirtCol2);
    Stm.WriteByte(FHomeKit.ShortCol);
    Stm.WriteByte(FHomeKit.SocksCol);
    Stm.WriteByte(FAwayKit.Typ);
    Stm.WriteByte(FAwayKit.ShirtCol1);
    Stm.WriteByte(FAwayKit.ShirtCol2);
    Stm.WriteByte(FAwayKit.ShortCol);
    Stm.WriteByte(FAwayKit.SocksCol);
    Fccoach := UpperCase(Fcoach) + #0;
    Stm.Write(Fccoach, sizeof(Fccoach));
    Stm.WriteWord(0);
    Stm.Write(Fplposit, sizeof(Fplposit));
    Result := True;
    for i := 0 to 15 do
      Result := Fplayers[i].WritePlayer(Stm);
  except
    Result := False;
  end;
  Fchanged := False;
  HomeKit.Fchanged := False;
  AwayKit.Fchanged := False;
end;

function TSWSTeam.ExportToCSV(TS: TStringList): boolean;
var
  TmSt: string;
begin
  TmSt := IntToStr(FUniqID) + TS.Delimiter;
  TmSt := TmSt + IntToStr(Fnation) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FTeamNum) + TS.Delimiter;
  TmSt := TmSt + IntToStr(SWS_Gen_Num) + TS.Delimiter;
  TmSt := TmSt + Trim(TeamNAme) + TS.Delimiter;
  TmSt := TmSt + Trim(Fccoach) + TS.Delimiter;
  tmSt := TmSt + IntToStr(Fformation) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FHomeKit.Typ) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FHomeKit.ShirtCol1) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FHomeKit.ShirtCol2) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FHomeKit.ShortCol) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FHomeKit.SocksCol) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FAwayKit.Typ) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FAwayKit.ShirtCol1) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FAwayKit.ShirtCol2) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FAwayKit.ShortCol) + TS.Delimiter;
  TmSt := TmSt + IntToStr(FAwayKit.SocksCol) + TS.Delimiter;
  TS.Add(TmSt);
  Result:=True;
end;

function TSWSTeam.ImportTMEdtCSV(TS: TStringList): boolean;
var
  TCS: TStringList;
  p, a, tmpi: integer;
  tmpn: byte;
begin
  TCS:=TStringList.Create;
  TCS.Delimiter:=',';
  TCS.StrictDelimiter:=true;
  TCS.DelimitedText:=TS[0];
  Fteamname:=TCS[0];
  //FTeamNum:=StrToInt(TCS[2]);
  //Fnation:=StrToInt(TCS[1]);
  tmpi:=0;
  for a:=0 to 17 do begin
    if TCS[3]=Ctac[a] then
       tmpi:=a;
  end;
  Fformation:=tmpi;
  Fcoach:=TCS[4];
  For p:=0 to 15 do BEGIN
    TCS.Clear;
    TCS.Delimiter:=',';
    TCS.StrictDelimiter:=true;
    TCS.DelimitedText:=TS[p+1];
    Fplayers[p].PName:=TCS[2];
    tmpn:=0;
    for a:=0 to 152 do begin
      if TCS[0]=CNat[a] then
         tmpn:=a;
    end;
    Fplayers[p].National:=tmpn;
    Fplayers[p].Number:=StrToInt(TCS[1]);
    tmpi:=0;
    for a:=0 to 7 do begin
      if TCS[3]=CTMPos[a] then
         tmpi:=a;
    end;
    Fplayers[p].Position:=tmpi;
    Fplayers[p].Passing:=StrToInt(TCS[5]);
    Fplayers[p].Shooting:=StrToInt(TCS[6]);
    Fplayers[p].Heading:=StrToInt(TCS[7]);
    Fplayers[p].Tackling:=StrToInt(TCS[8]);
    Fplayers[p].Ball_Control:=StrToInt(TCS[9]);
    Fplayers[p].Speed:=StrToInt(TCS[10]);
    Fplayers[p].Finishing:=StrToInt(TCS[11]);
    tmpi:=0;
    for a:=0 to $31 do begin
      if TCS[12]=CVal[a] then
         tmpi:=a;
    end;
    Fplayers[p].Value:=tmpi;
  end;
  for a:=0 to 15 do
  Fplposit[a]:=a;
end;

function TSWSTeam.Changed: boolean;
var
  i: integer;
  TmpCh: boolean;
begin
  TmpCh := FChanged;
  if HomeKit.Fchanged then
    TmpCh := True;
  if AwayKit.Fchanged then
    TmpCh := True;
  for i := 0 to 15 do
    if Fplayers[i].FChanged then
      TmpCh := True;
  Result := TmpCh;
end;

function TSWSTeam.GetFormatPlace(playidx: byte): byte;
var
  i: integer;
begin
  for i := 0 to 15 do
    if playidx = Fplposit[i] then
      Break;
  Result := i;
end;

{ TSWSFile }

function TSWSFile.LoadFile: boolean;
var
  FS: TFileStream;
  Tmp: TSWSTeam;
  i: integer;
  TmpCount: byte;
begin
  Result := False;
  try
    FS := TFileStream.Create(FFileName, fmOpenRead);
    if not FisTMD then
    begin
      if ((FS.Size - 2) mod 684) <> 0 then
      begin
        FEngine.FLastError := seNotSWOSTEAM;
        Result := False;
        Exit;
      end;
      FS.Seek(1, soBeginning);
      TmpCount := FS.ReadByte;
    end;
    if FisTMD then begin
      if (FS.Size mod 684) <> 0 then
      begin
        FEngine.FLastError := seNotSWOSTEAM;
        Result := False;
        Exit;
      end;
      TmpCount:=FTMDCount;
    end;
    for i := 0 to TmpCount - 1 do
    begin
      Tmp := TSWSTeam.Create(self);
      Result := Tmp.LoadTeam(FS);
      if (Result) then
         FTeams.Add(Tmp)
      else
      begin
        FEngine.FLastError := seUnkonwn;
        Exit;
      end;
      if Assigned(FonLoadFile) then
        onLoadFile(self, i + 1, TmpCount);
      //Sleep(2);
    end;
  finally
    FS.Free;
  end;
  Fchanged := False;
end;

procedure TSWSFile.SetTeamIndex(AValue: integer);
begin
  if FTeamIndex=AValue then Exit;
  FTeamIndex:=AValue;
end;

function TSWSFile.TeamCount: integer;
begin
  Result:=FTeams.Count;
end;

function TSWSFile.WriteFile(AFN: string): boolean;
var
  FS: TFileStream;
  i: integer;
begin
  if not Changed then
  begin
    Result := False;
    Exit;
  end;
  FS := TFileStream.Create(AFN, fmCreate);
  try
    if not FisTMD then
    begin
      FS.Seek(0, soBeginning);
      FS.WriteByte(0);
      FS.WriteByte(FTeams.Count);
    end;
    for i := 0 to TeamCount - 1 do
    begin
      Result := FTeams[i].WriteTeam(FS);
      if Assigned(FonSaveFile) then
        onSaveFile(self, i + 1, TeamCount);
      //sleep(2);
    end;
  finally
    FS.Free;
  end;
  Fchanged := False;
end;


constructor TSWSFile.Create(AOwner: TComponent);
begin
  FEngine := AOwner as TSWSEngine;
  FLeague := TSWSLeague.Create;
  FTeams:= TSWSTeams.Create();
  inherited Create(AOwner);
end;

constructor TSWSFile.Create(AOwner: TComponent; AFileName: string);
begin
  FEngine := AOwner as TSWSEngine;
  FLeague := TSWSLeague.Create;
  FTeams:= TSWSTeams.Create();
  inherited Create(AOwner);
end;

destructor TSWSFile.Destroy;
begin
  FLeague.Free;
  FTeams.Free;
  inherited Destroy;
end;

procedure TSWSFile.SetTMDCount(ACount: integer);
begin
  FTMDCount := ACount;
end;

function TSWSFile.Load: boolean;
begin
  Result := LoadFile;
end;

function TSWSFile.Load(FN: string): boolean;
begin
  FFileName := FN;
  Result := LoadFile;
end;

function TSWSFile.Write: boolean;
begin
  Result:= WriteFile(FFileName);
end;

function TSWSFile.Write(AFN: string): boolean;
begin
  Result:= WriteFile(AFN);
end;

function TSWSFile.TeamByDiv(Division: byte): integer;
var
  cou, a, tea: integer;
begin
  cou := TeamCount;
  tea := 0;
  for a := 0 to cou - 1 do
  begin
    if FTeams[a].Division = Division then
      Inc(tea);
  end;
  Result := Tea;
end;

function TSWSFile.Changed: boolean;
var
  i: integer;
  TmpCh: boolean;
begin
  tmpch := False;
  if Fchanged then
    TmpCh := True;
  for i := 0 to TeamCount - 1 do
    if FTeams[i].Changed then
      TmpCh := True;
  Result := TmpCh;
end;

function TSWSFile.FindMaxTeamNum: integer;
var
  MaxN, i: integer;
begin
  MaxN := 0;
  for i := 0 to TeamCount - 1 do
    if FTeams[i].TeamNum > MaxN then
      MaxN := FTeams[i].TeamNum;
  Result := MaxN;
end;

function TSWSFile.FindFileByNum(Nr: integer): TSWSTeam;
var
  a: integer;
begin
  Result:=nil;
  For a:=0 to TeamCount-1 do
      if FTeams[a].FTeamNum=Nr then Result:=FTeams[a];
end;


procedure TSWSFile.AddTeam(TeamName: string);
var
  a: integer;
  Tmp: TSWSTeam;
begin
  Tmp:= TSWSTeam.Create(self);
  //FillByte(FTeams[FTeamCount],sizeof(TSWSTeam),0);
  Tmp.TeamNAme := TeamName;
  Tmp.Nation := FFileNumber;
  Tmp.Coach := 'THE GREAT MANAGER';
  Tmp.SWS_Gen_Num := Round(Random(65535));
  Tmp.TeamNum := TeamCount;
  Tmp.Formation := 0;
  Tmp.Fplposit := SWTypForm;
  //for a := 0 to 15 do
    //Tmp.Fplayers[a] := TSWSPlayer.Create(Tmp);
  for a := 0 to 15 do
  begin
    Tmp.Fplayers[Tmp.PlPosition[a]].PName :=
      'PLAYER ' + IntToStr(a + 1);
    Tmp.Fplayers[Tmp.PlPosition[a]].Number := a + 1;
  end;
  for a := 0 to 1 do
    Tmp.Fplayers[a].Position := 0;
  Tmp.Fplayers[2].Position := 1;
  Tmp.Fplayers[3].Position := 3;
  Tmp.Fplayers[4].Position := 3;
  Tmp.Fplayers[5].Position := 2;
  Tmp.Fplayers[6].Position := 3;
  Tmp.Fplayers[7].Position := 4;
  Tmp.Fplayers[10].Position := 5;
  for a := 8 to 9 do
    Tmp.Fplayers[a].Position := 6;
  for a := 11 to 12 do
    Tmp.Fplayers[a].Position := 6;
  for a := 13 to 15 do
    Tmp.Fplayers[a].Position := 7;
  FTeams.Add(Tmp);
  Fchanged := True;
end;

procedure TSWSFile.RemoveTeam(Index: integer);
begin
  {
  if Index + 1 = FTeamCount then
  begin
    SetLength(FTeams, FTeamCount - 1);
    Dec(FTeamCount);
  end
  else
  begin
    for x := Index to FTeamCount - 2 do
      FTeams[x] := FTeams[x + 1];
    SetLength(FTeams, FTeamCount - 1);
    Dec(FTeamCount);
  end;
  }
  FTeams.Delete(Index);
  Fchanged := True;
end;

function TSWSFile.LoadLeague: boolean;
begin
  if (FHexVal = '') or (FEngine.FSWSExeDir = '') or (FEngine = nil) then
  begin
    Result := False;
    Exit;
  end;
  FEngine.CheckSWSVer(FEngine.SWSExeDir);
  case FEngine.SWSExeVer of
    SWSECE: FLeague.Address := HexToDec(FHexVal) - $D - SWSExeHexDiff;
    SWS9697: FLeague.Address := HexToDec(FHexVal) - $D;
    SWS2020: FLeague.Address := HexToDec(FHexVal) - $D - Engine.SWS2020Diff;
    SWSUnknown:
    begin
      Result := False;
      Exit;
    end;
  end;
  FLeague.SWSExePath := FEngine.SWSExeDir;
  try
    FLeague.ReadData;
  except
    Result := False;
  end;
  Result := True;
end;

function TSWSFile.CheckLeagueTeams: boolean;
begin
  Result := False;
  if not FLeague.Loaded then
    Exit;
  if TeamByDiv(0) = FLeague.Division[0].Teams then
    Result := True
  else
    Result := False;
  if FLeague.Leagues > 1 then
    if TeamByDiv(1) = FLeague.Division[1].Teams then
      Result := True
    else
      Result := False;
  if FLeague.Leagues > 2 then
    if TeamByDiv(2) = FLeague.Division[2].Teams then
      Result := True
    else
      Result := False;
  if FLeague.Leagues > 3 then
    if TeamByDiv(3) = FLeague.Division[3].Teams then
      Result := True
    else
      Result := False;
end;

function TSWSFile.VerifyLeagueStrc(out Prm, One, Two, Tree: integer): boolean;
begin
  Result := False;
  One := 0;
  Two := 0;
  Tree := 0;
  Prm := 0;
  if not FLeague.Loaded then
    Exit;
  Prm := TeamByDiv(0) - FLeague.Division[0].Teams;
  if FLeague.Leagues > 1 then
    One := TeamByDiv(1) - FLeague.Division[1].Teams;
  if FLeague.Leagues > 2 then
    Two := TeamByDiv(2) - FLeague.Division[2].Teams;
  if FLeague.Leagues > 3 then
    Tree := TeamByDiv(3) - FLeague.Division[3].Teams;
end;

procedure TSWSFile.ChangeAll(prop: string; AVal: variant);
var
  a: integer;
begin
  if prop = 'nation' then
    for a := 0 to TeamCount - 1 do
      FTeams[a].Nation := AVal;
end;


end.