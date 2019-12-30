unit utextstr;

{ AG_SWSEDT - utextstr.pas

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


{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics, Dialogs, ExtCtrls, BGRABitmap, BGRACanvas2D, uagswos;

type

  { TEdtSett }
  TEditOption = (eoAutoSel, eoShowHints, eoAutoCpExe, eoAutoUpdate, eoSafeMode);
  TEditOptions = set of TEditOption;

  TSWLink = packed record
    Desc: string;
    Form: string;
  end;

  TEdtSett = class(TComponent)
  private
    FSWSData: string;
    FSWSExe: string;
    FFileName: string;
    FSettVer: cardinal;
    FEdtVer: cardinal;
    FToTalPack: string;
    FUseTP: boolean;
    FEdtOption: TEditOptions;
    FTPIdx: integer;
    FLinks: array[0..1] of TSWLink;
    function GetLink(Index: integer): TSWLink;
    procedure SetLink(Index: integer; AValue: TSWLink);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ReadSett(FN: string): boolean;
    function WriteSett(FN: string): boolean;
    property SWSDataPath: string read FSWSData write FSWSData;
    property SWSExePath: string read FSWSexe write FSWSExe;
    property FileName: string read FFileName write FFileName;
    property EditorVers: cardinal read FEdtVer write FedtVer;
    property SettingsVers: cardinal read FSettVer write FSettVer;
    property EditOptions: TEditOptions read FEdtOption write FEdtOption;
    property Link[Index: integer]: TSWLink read GetLink write SetLink;
    property TotalPackDir: string read FToTalPack write FToTalPack;
    property UseTP: boolean read FUseTP write FUseTP;
    property TotalPackIndex: integer read FTPIdx write FTPIdx;
  end;

  TMPosStr = packed record
    short: string[2];
    descr: string;
  end;

  TTPDirRec = packed record
    Name: string;
    Path: string;
  end;

{ TSWSValDupTh }


resourcestring
  rsLanguage = 'English';
  rsLangAuthor = 'Anoxic';
  rsLangDesc = '';
  rsGoal = 'Goal';
  rsUnableToLoad = 'Unable to load XML file';
  rsDataErrorInX = 'Data Error in XML file';
  rsLeaguesXmlFi = 'Leagues.xml File is corupted. Please repair or download '
    + 'orginal';
  rsFindPlayerBy = 'Find Player by Name';
  rsMaximalSWOSG = 'First Free SWOS General Number is: ';
  rsFindTeamByNa = 'Find Team by Name';
  rsFilesLoaded = 'Files Loaded: ';
  rsFilesSaved = 'Files Saved: ';
  rsWriteAllD = 'Write All (%d)';
  rsWriteAll = 'Write All';
  rsFilesEditedD = 'Files Edited: %d';
  rsFileIsNotLea = 'File is not League, or SWOS exe file not loaded.';
  rsLeagueStruct = 'League Structure';
  rsError = 'Error';
  rsThisValueMus = 'This value must be a number';
  rsEnterNewTeam = 'Enter new teams national numer: ';
  rsAddNewTeam = 'Add New Team';
  rsEnterTeamNam = 'Enter Team Name:';
  rsSWOSWorksOnl = 'SWOS works only for even values';
  rsOpenAllBefor = 'Open All before use this function.';
  rsAllLeaguesOK = 'All Leagues OK';
  rsTeamNotFound = 'Team not Found';
  rsPlayerNotFou = 'Player not Found';
  rsGRAY = 'GRAY';
  rsWHITE = 'WHITE';
  rsBLACK = 'BLACK';
  rsORANGE = 'ORANGE';
  rsRED = 'RED';
  rsBLUE = 'BLUE';
  rsBROWN = 'BROWN';
  rsLIGHTBLUE = 'LIGHTBLUE';
  rsGREEN = 'GREEN';
  rsYELLOW = 'YELLOW';
  rsPlain = 'Plain';
  rsSlaves = 'Slaves';
  rsVLines = 'V-Lines';
  rsHLines = 'H-Lines';
  rsGK = 'GK';
  rsGoalkeeper = 'Goalkeeper';
  rsTeamAttribut = 'Team Attribute Point: %d';
  rsTeamAttribut2 = 'Team Attribute Point by 7: %d';
  rsLoading = 'Loading...';
  rsFileSTeamsDD = 'File: %s   |   Teams: %d/%d';
  rsFile = 'File: ';
  rsSaving = 'Saving...';
  rsTeams = 'Teams: ';
  rsRB = 'RB';
  rsRightBack = 'RightBack';
  rsLB = 'LB';
  rsLeftBack = 'LeftBack';
  rsD = 'D';
  rsDefender = 'Defender';
  rsRW = 'RW';
  rsRightWing = 'RightWing';
  rsLW = 'LW';
  rsLeftWing = 'LeftWing';
  rsM = 'M';
  rsMidfielder = 'Midfielder';
  rsA = 'A';
  rsAttacker = 'Attacker';
  rsWhiteSkinBla = 'White Skin / Black Hair';
  rsWhiteSkinBlo = 'White Skin / Blond Hair';
  rsBlackSkinBla = 'Black Skin / Black Hair';
  rsUnknownSWOSV = 'Unknown SWOS version or path is not valid';
  rsSelectSWOSTo = 'Select SWOS TotalPack executable file (pc_swostp.exe)...';
  rsSWOSVer10ECE = 'SWOS ver. 1.0 (ECE)';
  rsSWOSVer20969 = 'SWOS ver. 2.0 (96/97)';
  rsSWOSVer2020W = 'SWOS 2020 Win32 Port';
  rsOnlyLeaguePl = 'Only League Players';
  rsThisFeatureI = 'This feature is intended for advanced users.%'
    + 'sModifications may cause errors SWOS.';
  rsYouHaveModif = 'You Have Modified and not Saved files. Are You Sure Reload'
    + ' All ?';
  rsYouHaveModi2 = 'You Have Modified and not Saved files. Are You Sure Quit ?';
  rsGoalkeepersA = 'Goalkeepers are in SWOS attributes set to 0.';
  rsCanNotWriteF = 'Can not write. File has not been modified.';
  rsNothingToWri = 'Nothing to Write';
  rsPleaseReport = 'Please report bugs on site or via email: %s';
  rsCheckForUpda = 'Check for Updates';
  rsClickToVisit = 'Click To Visit Site for download new version';
  rsSWSEdtIsIsAl = 'SWSEdt is is already the newest version';
  rsSerwerNotRes = 'Serwer not respond. Please Try again later.';
  rsYouMustResta = 'You must restart application to apply changes';
  rsNoTotalPackD = 'No TotalPack Directorys. Check TotalPack path';
  rsChooseAPlaye = 'Choose a player in the clipboard before you paste';
  rsChooseATeamT = 'Choose a team to the clipboard before you paste';
  rsMustBe32Team = 'Must be 32 teams in CLipboard';
  rsMustBeAEurop = 'Must be a European Team';
  rsTMDFileGener = 'TMD File Generated Successful. Check values is correct and'
    +' save after.';
  rsMustBe16Team = 'Must be 16 teams in CLipboard';
  rsMustBeOnTeam = 'Must be minimum one team in Clipboard';
  rsChangedDivCo = 'Divisions Count Changed. This value cannot be write to orginal SWOS.exe file';


function CheckisDir(Path: string): string;
function getlanguagename(langcode:string):string;
procedure DRAWSHIRT(image: Timage; typ: byte; col1, col2: longint);
procedure DRAWSHORT(image: Timage; col: longint);
procedure DRAWSOCKS(image: Timage; col: longint);


procedure DumpExceptionCallStack(E: Exception);

var
  SWSDB: TSWSEngine;
  EdtSett: TEdtSett;
  //  TacField: TBGRABitmap;
  TacFN: UTF8string;
  //  TacPla: TBGRABitmap;
  //SWSTexts
  LangList: TStringList;
  DefLangStr: String;
  DefLang: Integer;
  CSWStrCol: array[0..9] of string = (rsGRAY, rsWHITE, rsBLACK, rsORANGE,
    rsRED, rsBLUE, rsBROWN, rsLIGHTBLUE, rsGREEN, rsYELLOW);
  CSWkitType: array [0..3] of string = (rsPlain, rsSlaves, rsVLines, rsHLines);
  CPos: array[0..7] of TMPosStr = ((short: rsGK;
    descr: rsGoalkeeper), (short: rsRB; descr: rsRightBack), (short: rsLB;
    descr: rsLeftBack), (short: rsD; descr: rsDefender), (short: rsRW;
    descr: rsRightWing), (short: rsLW; descr: rsLeftWing), (short: rsM;
    descr: rsMidfielder), (short: rsA; descr: rsAttacker));
  Cskin: array[0..2] of string = (rsWhiteSkinBla, rsWhiteSkinBlo, rsBlackSkinBla);
  swsMonth: array[0..23] of
  string = ('January', 'February', 'March', 'April', 'May', 'Juni', 'July', 'August',
    'September', 'October', 'November', 'December',
    'January (NY)', 'February (NY)',
    'March (NY)', 'April (NY)', 'May (NY)', 'Juni (NY)', 'July (NY)', 'August (NY)',
    'September (NY)', 'October (NY)',
    'November (NY)', 'December (NY)');

  StLongNat: array[0..152] of
  string = ('Albania', 'Austria', 'Belgium', 'Bulgaria', 'Croatia', 'Cyprus',
    'Czech-Republic', 'Denmark', 'England', 'Estonia', 'Faroes', 'Finland',
    'France', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Israel', 'Italy',
    'Latvia', 'Lithuania', 'Luxembourg', 'Malta', 'Netherlands', 'Northern-Ireland',
    'Norway', 'Poland', 'Portugal', 'Romania', 'Russia', 'San-Marino', 'Scotland',
    'Slovenia', 'Sweden', 'Turkey', 'Ukraine', 'Wales', 'Serbia', 'Belarus',
    'Slovakia', 'Spain', 'Armenia', 'Bosnia-and-Herzegovina', 'Azerbaijan',
    'Georgia', 'Switzerland', 'Ireland', 'Macedonia', 'Turkmenistan',
    'Liechtenstein', 'Moldova', 'Costa-Rica', 'El-Salvador', 'Guatemala',
    'Honduras', 'Bahamas', 'Mexico', 'Panama', 'United-States', 'Bahrain',
    'Nicaragua', 'Bermuda', 'Jamaica', 'Trinidad-and-Tobago', 'Canada',
    'Barbados', 'El-Salvador', 'Saint-Vincent-and-the-Grenadines', 'Argentina',
    'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Paraguay', 'Suriname',
    'Uruguay', 'Venezuela', 'Guyana', 'Peru', 'Algeria', 'South-Africa',
    'Botswana', 'Burkina-Faso', 'Burundi', 'Lesotho', 'Democratic-Republic-of-the-Congo',
    'Zambia', 'Ghana', 'Senegal', 'Cote-dIvoire', 'Tunisia', 'Mali', 'Madagascar',
    'Cameroon', 'Chad', 'Uganda', 'Liberia', 'Mozambique', 'Kenya', 'Sudan',
    'Swaziland', 'Angola', 'Togo', 'Zimbabwe', 'Egypt', 'Tanzania', 'Nigeria',
    'Ethiopia', 'Gabon', 'Sierra-Leone', 'Benin', 'Republic-of-the-Congo',
    'Guinea', 'Sierra-Leone', 'Morocco', 'Gambia', 'Malawi', 'Japan', 'Taiwan',
    'India', 'Bangladesh', 'Brunei', 'Iraq', 'Jordan', 'Sri-Lanka', 'Syria',
    'South-Korea', 'Iran', 'Vietnam', 'Malaysia', 'Saudi-Arabia', 'Yemen',
    'Kuwait', 'Laos', 'North-Korea', 'Oman', 'Pakistan', 'Philippines', 'China',
    'Singapore', 'Mauritius', 'Myanmar', 'Papua-New-Guinea', 'Tajikistan',
    'Uzbekistan', 'Qatar', 'United-Arab-Emirates', 'Australia', 'New-Zealand',
    'Fiji', 'Solomon-Islands', 'Unknown');


  TPDirectorys: array of TTPDirRec;



implementation

uses umain;

function CheckisDir(Path: string): string;
begin
  if Length(path) < 2 then
    Exit('');
  if path[length(path)] <> PathDelim then
    Result := path + PathDelim
  else
    Result := path;
end;

function getlanguagename(langcode:string):string;
begin
  if langcode='aa' then Result:='Afar' else
  if langcode='ab' then Result:='Abkhazian' else
  if langcode='ae' then Result:='Avestan' else
  if langcode='af' then Result:='Afrikaans' else
  if langcode='ak' then Result:='Akan' else
  if langcode='am' then Result:='Amharic' else
  if langcode='an' then Result:='Aragonese' else
  if langcode='ar' then Result:='Arabic' else
  if langcode='as' then Result:='Assamese' else
  if langcode='av' then Result:='Avaric' else
  if langcode='ay' then Result:='Aymara' else
  if langcode='az' then Result:='Azerbaijani' else
  if langcode='ba' then Result:='Bashkir' else
  if langcode='be' then Result:='Belarusian' else
  if langcode='bg' then Result:='Bulgarian' else
  if langcode='bh' then Result:='Bihari' else
  if langcode='bi' then Result:='Bislama' else
  if langcode='bm' then Result:='Bambara' else
  if langcode='bn' then Result:='Bengali' else
  if langcode='bo' then Result:='Tibetan' else
  if langcode='br' then Result:='Breton' else
  if langcode='bs' then Result:='Bosnian' else
  if langcode='ca' then Result:='Catalan' else
  if langcode='ce' then Result:='Chechen' else
  if langcode='ch' then Result:='Chamorro' else
  if langcode='co' then Result:='Corsican' else
  if langcode='cr' then Result:='Cree' else
  if langcode='cs' then Result:='Czech' else
  if langcode='cv' then Result:='Chuvash' else
  if langcode='cy' then Result:='Welsh' else
  if langcode='da' then Result:='Danish' else
  if langcode='de' then Result:='German' else
  if langcode='de_AT' then Result:='Austrian German' else
  if langcode='de_CH' then Result:='Swiss German' else
  if langcode='dv' then Result:='Divehi' else
  if langcode='dz' then Result:='Dzongkha' else
  if langcode='ee' then Result:='Ewe' else
  if langcode='el' then Result:='Greek' else
  if langcode='en' then Result:='English' else
  if langcode='en_AU' then Result:='Australian English' else
  if langcode='en_CA' then Result:='Canadian English' else
  if langcode='en_GB' then Result:='British English' else
  if langcode='en_US' then Result:='American English' else
  if langcode='eo' then Result:='Esperanto' else
  if langcode='es' then Result:='Spanish' else
  if langcode='et' then Result:='Estonian' else
  if langcode='eu' then Result:='Basque' else
  if langcode='fa' then Result:='Persian' else
  if langcode='ff' then Result:='Fulah' else
  if langcode='fi' then Result:='Finnish' else
  if langcode='fj' then Result:='Fijian' else
  if langcode='fo' then Result:='Faroese' else
  if langcode='fr' then Result:='French' else
  if langcode='fr_BE' then Result:='Walloon' else
  if langcode='fy' then Result:='Frisian' else
  if langcode='ga' then Result:='Irish' else
  if langcode='gd' then Result:='Gaelic' else
  if langcode='gl' then Result:='Gallegan' else
  if langcode='gn' then Result:='Guarani' else
  if langcode='gu' then Result:='Gujarati' else
  if langcode='gv' then Result:='Manx' else
  if langcode='ha' then Result:='Hausa' else
  if langcode='he' then Result:='Hebrew' else
  if langcode='hi' then Result:='Hindi' else
  if langcode='ho' then Result:='Hiri Motu' else
  if langcode='hr' then Result:='Croatian' else
  if langcode='ht' then Result:='Haitian' else
  if langcode='hu' then Result:='Hungarian' else
  if langcode='hy' then Result:='Armenian' else
  if langcode='hz' then Result:='Herero' else
  if langcode='ia' then Result:='Interlingua' else
  if langcode='id' then Result:='Indonesian' else
  if langcode='ie' then Result:='Interlingue' else
  if langcode='ig' then Result:='Igbo' else
  if langcode='ii' then Result:='Sichuan Yi' else
  if langcode='ik' then Result:='Inupiaq' else
  if langcode='io' then Result:='Ido' else
  if langcode='is' then Result:='Icelandic' else
  if langcode='it' then Result:='Italian' else
  if langcode='iu' then Result:='Inuktitut' else
  if langcode='ja' then Result:='Japanese' else
  if langcode='jv' then Result:='Javanese' else
  if langcode='ka' then Result:='Georgian' else
  if langcode='kg' then Result:='Kongo' else
  if langcode='ki' then Result:='Kikuyu' else
  if langcode='kj' then Result:='Kuanyama' else
  if langcode='kk' then Result:='Kazakh' else
  if langcode='kl' then Result:='Greenlandic' else
  if langcode='km' then Result:='Khmer' else
  if langcode='kn' then Result:='Kannada' else
  if langcode='ko' then Result:='Korean' else
  if langcode='kr' then Result:='Kanuri' else
  if langcode='ks' then Result:='Kashmiri' else
  if langcode='ku' then Result:='Kurdish' else
  if langcode='kw' then Result:='Cornish' else
  if langcode='kv' then Result:='Komi' else
  if langcode='ky' then Result:='Kirghiz' else
  if langcode='la' then Result:='Latin' else
  if langcode='lb' then Result:='Luxembourgish' else
  if langcode='lg' then Result:='Ganda' else
  if langcode='li' then Result:='Limburgan' else
  if langcode='ln' then Result:='Lingala' else
  if langcode='lo' then Result:='Lao' else
  if langcode='lt' then Result:='Lithuanian' else
  if langcode='lu' then Result:='Luba-Katanga' else
  if langcode='lv' then Result:='Latvian' else
  if langcode='mg' then Result:='Malagasy' else
  if langcode='mh' then Result:='Marshallese' else
  if langcode='mi' then Result:='Maori' else
  if langcode='mk' then Result:='Macedonian' else
  if langcode='ml' then Result:='Malayalam' else
  if langcode='mn' then Result:='Mongolian' else
  if langcode='mo' then Result:='Moldavian' else
  if langcode='mr' then Result:='Marathi' else
  if langcode='ms' then Result:='Malay' else
  if langcode='mt' then Result:='Maltese' else
  if langcode='my' then Result:='Burmese' else
  if langcode='na' then Result:='Nauru' else
  if langcode='nb' then Result:='Norwegian Bokmaal' else
  if langcode='nd' then Result:='Ndebele, North' else
  if langcode='ne' then Result:='Nepali' else
  if langcode='ng' then Result:='Ndonga' else
  if langcode='nl' then Result:='Dutch' else
  if langcode='nl_BE' then Result:='Flemish' else
  if langcode='nn' then Result:='Norwegian Nynorsk' else
  if langcode='no' then Result:='Norwegian' else
  if langcode='nr' then Result:='Ndebele, South' else
  if langcode='nv' then Result:='Navajo' else
  if langcode='ny' then Result:='Chichewa' else
  if langcode='oc' then Result:='Occitan' else
  if langcode='oj' then Result:='Ojibwa' else
  if langcode='om' then Result:='Oromo' else
  if langcode='or' then Result:='Oriya' else
  if langcode='os' then Result:='Ossetian' else
  if langcode='pa' then Result:='Panjabi' else
  if langcode='pi' then Result:='Pali' else
  if langcode='pl' then Result:='Polish' else
  if langcode='ps' then Result:='Pushto' else
  if langcode='pt' then Result:='Portuguese' else
  if langcode='pt_BR' then Result:='Brazilian Portuguese' else
  if langcode='qu' then Result:='Quechua' else
  if langcode='rm' then Result:='Raeto-Romance' else
  if langcode='rn' then Result:='Rundi' else
  if langcode='ro' then Result:='Romanian' else
  if langcode='ru' then Result:='Russian' else
  if langcode='rw' then Result:='Kinyarwanda' else
  if langcode='sa' then Result:='Sanskrit' else
  if langcode='sc' then Result:='Sardinian' else
  if langcode='sd' then Result:='Sindhi' else
  if langcode='se' then Result:='Northern Sami' else
  if langcode='sg' then Result:='Sango' else
  if langcode='si' then Result:='Sinhalese' else
  if langcode='sk' then Result:='Slovak' else
  if langcode='sl' then Result:='Slovenian' else
  if langcode='sm' then Result:='Samoan' else
  if langcode='sn' then Result:='Shona' else
  if langcode='so' then Result:='Somali' else
  if langcode='sq' then Result:='Albanian' else
  if langcode='sr' then Result:='Serbian' else
  if langcode='ss' then Result:='Swati' else
  if langcode='st' then Result:='Sotho, Southern' else
  if langcode='su' then Result:='Sundanese' else
  if langcode='sv' then Result:='Swedish' else
  if langcode='sw' then Result:='Swahili' else
  if langcode='ta' then Result:='Tamil' else
  if langcode='te' then Result:='Telugu' else
  if langcode='tg' then Result:='Tajik' else
  if langcode='th' then Result:='Thai' else
  if langcode='ti' then Result:='Tigrinya' else
  if langcode='tk' then Result:='Turkmen' else
  if langcode='tl' then Result:='Tagalog' else
  if langcode='tn' then Result:='Tswana' else
  if langcode='to' then Result:='Tonga' else
  if langcode='tr' then Result:='Turkish' else
  if langcode='ts' then Result:='Tsonga' else
  if langcode='tt' then Result:='Tatar' else
  if langcode='tw' then Result:='Twi' else
  if langcode='ty' then Result:='Tahitian' else
  if langcode='ug' then Result:='Uighur' else
  if langcode='uk' then Result:='Ukrainian' else
  if langcode='ur' then Result:='Urdu' else
  if langcode='uz' then Result:='Uzbek' else
  if langcode='ve' then Result:='Venda' else
  if langcode='vi' then Result:='Vietnamese' else
  if langcode='vo' then Result:='Volapuk' else
  if langcode='wa' then Result:='Walloon' else
  if langcode='wo' then Result:='Wolof' else
  if langcode='xh' then Result:='Xhosa' else
  if langcode='yi' then Result:='Yiddish' else
  if langcode='yo' then Result:='Yoruba' else
  if langcode='za' then Result:='Zhuang' else
  if langcode='zh' then Result:='Chinese' else
  if langcode='zu' then Result:='Zulu' else
  Result:='';
end;


procedure DRAWSHIRT(image: Timage; typ: byte; col1, col2: longint);
var
  cbmp: TBGRABitmap;
  ctx: TBGRACanvas2D;
begin
  cbmp := TBGRABitmap.Create(100, 75, $606060);
  ctx := cbmp.Canvas2D;
  image.Canvas.Brush.Style := bsSolid;
  image.Canvas.Brush.Color := $606060;
  image.Canvas.Clear;
  image.Repaint;
  ctx.beginPath;
  ctx.rect(30, 10, 40, 60);
  ctx.rect(40, 7, 20, 3);
  ctx.strokeStyle(col1);
  ctx.fillStyle(col1);
  ctx.fill;
  ctx.stroke;
  ctx.beginPath;
  ctx.moveTo(30, 10);
  ctx.lineTo(0, 45);
  ctx.lineTo(10, 55);
  ctx.lineTo(30, 30);
  ctx.fillStyle(col1);
  ctx.fill;
  ctx.stroke;

  ctx.beginPath;
  ctx.moveTo(70, 10);
  ctx.lineTo(100, 45);
  ctx.lineTo(90, 55);
  ctx.lineTo(69, 30);
  ctx.fillStyle(col1);
  ctx.fill;
  ctx.stroke;
  case typ of
    1:
    begin
      ctx.beginPath;
      ctx.moveTo(29, 10);
      ctx.lineTo(29, 32);
      ctx.moveTo(29, 10);
      ctx.LineTo(2, 42);
      ctx.LineTo(13, 53);
      ctx.LineTo(30, 32);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;
      ctx.beginPath;
      ctx.MoveTo(70, 10);
      ctx.LineTo(70, 32);
      ctx.MoveTo(70, 10);
      ctx.LineTo(98, 42);
      ctx.LineTo(87, 53);
      ctx.LineTo(70, 32);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;
    end;
    2:
    begin
      ctx.beginPath;
      ctx.rect(38, 10, 8, 60);
      ctx.rect(54, 10, 8, 60);
      ctx.rect(38, 10, 24, 3);
      ctx.strokeStyle(col2);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;
      ctx.beginPath;
      ctx.MoveTo(29, 16);
      ctx.LineTo(6, 46);
      ctx.LineTo(9, 50);
      ctx.LineTo(29, 24);
      ctx.LineTo(29, 16);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;

      ctx.beginPath;
      ctx.MoveTo(70, 16);
      ctx.LineTo(94, 46);
      ctx.LineTo(91, 50);
      ctx.LineTo(70, 24);
      ctx.LineTo(70, 16);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;
    end;
    3:
    begin
      ctx.beginPath;
      ctx.rect(40, 7, 20, 3);
      ctx.rect(30, 60, 40, 10);
      ctx.rect(30, 40, 40, 10);
      ctx.rect(30, 20, 40, 10);
      ctx.MoveTo(29, 10);
      ctx.LineTo(29, 21);
      ctx.LineTo(25, 15);
      ctx.strokeStyle(col2);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;
      ctx.beginPath;
      ctx.MoveTo(29, 30);
      ctx.LineTo(20, 21);
      ctx.LineTo(14, 28);
      ctx.lineTo(23, 38);
      ctx.lineTo(29, 30);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;
      ctx.beginPath;
      ctx.MoveTo(16, 48);
      ctx.lineTo(6, 38);
      ctx.lineTo(0, 45);
      ctx.lineTo(10, 55);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;
      ctx.beginPath;
      ctx.moveTo(70, 10);
      ctx.lineTo(70, 21);
      ctx.lineTo(75, 15);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;
      ctx.beginPath;
      ctx.MoveTo(70, 30);
      ctx.LineTo(79, 20);
      ctx.LineTo(86, 28);
      ctx.LineTo(77, 40);
      ctx.lineTo(70, 30);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;
      ctx.beginPath;
      ctx.moveTo(84, 49);
      ctx.lineTo(94, 38);
      ctx.lineTo(100, 45);
      ctx.lineTo(90, 55);
      ctx.fillStyle(col2);
      ctx.fill;
      ctx.stroke;
    end;
  end;
  cbmp.Draw(image.Canvas, 0, 0);
  //ctx.Free;
  cbmp.Free;
  image.Refresh;
end;

procedure DRAWSHORT(image: Timage; col: longint);
var
  cbmp: TBGRABitmap;
  ctx: TBGRACanvas2D;
begin
  cbmp := TBGRABitmap.Create(100, 75, $606060);
  ctx := cbmp.Canvas2D;
  image.Canvas.Brush.Style := bsSolid;
  image.Canvas.Brush.Color := $606060;
  image.Canvas.Clear;
  image.Canvas.Refresh;
  image.Repaint;
  ctx.beginPath;
  ctx.MoveTo(30, 5);
  ctx.lineTo(70, 5);
  ctx.LineTo(77, 30);
  ctx.lineto(55, 35);
  ctx.LineTo(50, 30);
  ctx.LineTo(45, 35);
  ctx.LineTo(23, 30);
  ctx.LineTo(30, 5);
  ctx.strokeStyle(col);
  ctx.fillStyle(col);
  ctx.fill;
  ctx.stroke;
  cbmp.Draw(image.Canvas, 0, 0);
  cbmp.Free;
  image.Refresh;
end;

procedure DRAWSOCKS(image: Timage; col: longint);
var
  cbmp: TBGRABitmap;
  ctx: TBGRACanvas2D;
begin
  cbmp := TBGRABitmap.Create(100, 75, $606060);
  ctx := cbmp.Canvas2D;
  image.Canvas.Brush.Style := bsSolid;
  image.Canvas.Brush.Color := $606060;
  image.Canvas.Clear;
  image.Canvas.Refresh;
  image.Repaint;
  ctx.beginPath;
  ctx.MoveTo(27, 5);
  ctx.LineTo(45, 10);
  ctx.LineTo(30, 35);
  ctx.lineto(23, 32);
  ctx.LineTo(27, 5);
  ctx.strokeStyle(col);
  ctx.fillStyle(col);
  ctx.fill;
  ctx.stroke;
  ctx.beginPath;
  ctx.MoveTo(73, 5);
  ctx.LineTo(55, 10);
  ctx.LineTo(70, 35);
  ctx.lineto(77, 32);
  ctx.LineTo(73, 5);
  ctx.strokeStyle(col);
  ctx.fillStyle(col);
  ctx.fill;
  ctx.stroke;
  cbmp.Draw(image.Canvas, 0, 0);
  cbmp.Free;
  image.Refresh;
end;

procedure DumpExceptionCallStack(E: Exception);
var
  I: integer;
  Frames: PPointer;
  Report: string;
  SL: TStringList;
begin
  Report := 'Program exception! ' + LineEnding + 'Stacktrace:' +
    LineEnding + LineEnding;
  if E <> nil then
  begin
    Report := Report + 'Exception class: ' + E.ClassName + LineEnding +
      'Message: ' + E.Message + LineEnding;
  end;
  Report := Report + BackTraceStrFunc(ExceptAddr);
  Frames := ExceptFrames;
  for I := 0 to ExceptFrameCount - 1 do
    Report := Report + LineEnding + BackTraceStrFunc(Frames[I]);
  ShowMessage(Report);
  SL := TStringList.Create;
  SL.Clear;
  SL.Text := Report;
  SL.SaveToFile(MainForm.Appdir + 'Error_' + FormatDateTime(
    'YYYY-MM-DD_HH-MM-SS', Now) + '.log');
  SL.Free;
  Halt; // End of program execution

end;



{ TEdtSett }

function TEdtSett.GetLink(Index: integer): TSWLink;
begin
  if (Index < 0) or (Index > 1) then
    Exit();
  Result := FLinks[Index];
end;

procedure TEdtSett.SetLink(Index: integer; AValue: TSWLink);
begin
  if (Index < 0) or (Index > 1) then
    Exit;
  Flinks[Index] := AValue;
end;

constructor TEdtSett.Create(AOwner: TComponent);
begin
  FEdtOption := [eoAutoSel, eoShowHints, eoAutoUpdate, eoSafeMode];
  FSWSData := '';
  FSWSExe := '';
  inherited Create(AOwner);
end;

destructor TEdtSett.Destroy;
begin
  inherited Destroy;
end;

function TEdtSett.ReadSett(FN: string): boolean;
var
  FS: TFileStream;
  a: integer;
begin
  try
    try
      FS := TFileStream.Create(FN, fmOpenRead);
      FS.Seek(0, soBeginning);
      FSettVer := FS.ReadDWord;
      if FSettVer < FEdtVer then
      begin
        Result := False;
        DeleteFile(FN);
        Exit;
      end;
      FSWSData := FS.ReadAnsiString;
      FSWSExe := FS.ReadAnsiString;
      FS.Read(FEdtOption, sizeof(TEditOptions));
      for a := 0 to 1 do
      begin
        FLinks[a].Desc := FS.ReadAnsiString;
        FLinks[a].Form := FS.ReadAnsiString;
      end;
      FToTalPack := FS.ReadAnsiString;
      FUseTP := boolean(FS.ReadByte);
      FTPIdx := FS.ReadDWord;
      Result := True;
    finally
      FS.Free;
    end;
  except
    Result := False;
  end;
end;

function TEdtSett.WriteSett(FN: string): boolean;
var
  FS: TFileStream;
  a: integer;
begin
  Result := False;
  FSettVer := FEdtVer;
  try
    FS := TFileStream.Create(FN, fmCreate);
    FS.Seek(0, soBeginning);
    FS.WriteDWord(FSettVer);
    FS.WriteAnsiString(FSWSData);
    FS.WriteAnsiString(FSWSExe);
    FS.Write(FEdtOption, sizeof(TEditOptions));
    for a := 0 to 1 do
    begin
      FS.WriteAnsiString(FLinks[a].Desc);
      FS.WriteAnsiString(FLinks[a].Form);
    end;
    FS.WriteAnsiString(FToTalPack);
    FS.WriteByte(byte(FUseTP));
    FS.WriteDWord(FTPIdx);
    Result := True
  finally
    FS.Free;
  end;
end;

end.
