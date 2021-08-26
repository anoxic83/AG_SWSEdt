unit upoolplyr;

{$mode objfpc}{$H+}

{ AG_SWSEDT - upoolplyr.pas  - Poolplyr Form

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
  Classes, SysUtils, SdfData, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, StdCtrls, uagswos, utextstr;

type

  { TPoolForm }
  PoolRec = packed record
    FNr, TmNr, Plnr: integer;
  end;


  TPoolForm = class(TForm)
    BtLoadPool: TButton;
    Breplace: TButton;
    BgenRand: TButton;
    BtSavepool: TButton;
    LVpool: TListView;
    MnatEdt: TMenuItem;
    MPlaEdt: TMenuItem;
    PBrl: TProgressBar;
    MPoolEdt: TPopupMenu;
    procedure BtLoadPoolClick(Sender: TObject);
    procedure BreplaceClick(Sender: TObject);
    procedure BgenRandClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LVpoolClick(Sender: TObject);
    procedure BtSavepoolClick(Sender: TObject);
    procedure LVpoolColumnClick(Sender: TObject; Column: TListColumn);
    procedure LVpoolCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure LVpoolDblClick(Sender: TObject);
    procedure LVpoolMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MnatEdtClick(Sender: TObject);
    procedure MPlaEdtClick(Sender: TObject);
  private
    { private declarations }
  public
    ActPool: integer;
    SColumn: integer;
    procedure ReList;
    procedure RandPlay(Leag: integer; out FilNr, TeamNr, TeamNat, Playnr: integer;
      out TmName: string);
    { public declarations }
  end;

var
  PoolForm: TPoolForm;

implementation

uses umain;

{ TPoolForm }

procedure TPoolForm.BtLoadPoolClick(Sender: TObject);
begin

  SWSDB.PoolPlyr.Load(EdtSett.SWSDataPath + 'POOLPLYR.DAT');
  ReList;
end;

procedure TPoolForm.BreplaceClick(Sender: TObject);
var
  TDX, PDX: integer;
begin
  TDX := SWSDB.SWSFiles[SWSDb.FileIndex].TeamIndex;
  PDX := SWSDB.SWSFiles[SWSDb.FileIndex].Team[TDX].PlayerIndex;
  if ActPool < 0 then
    Exit;
  if SWSDB.FileIndex < 0 then
    Exit;
  if TDX < 0 then
    Exit;
  if PDX < 0 then
    Exit;
  if SWSDB.SWSFiles[SWSDb.FileIndex].HexVal = '' then
  begin
    ShowMessage(rsOnlyLeaguePl);
    Exit;
  end;
  with SWSDB.PoolPlyr do
  begin
    PoolPlayer[ActPool].nation := SWSDB.SWSFiles[SWSDB.FileIndex].Team[TDX].Nation;
    PoolPlayer[ActPool].TeamNr := SWSDB.SWSFiles[SWSDB.FileIndex].Team[TDX].TeamNum;
    PoolPlayer[ActPool].Play_nr := PDX;
    PoolPlayer[ActPool].teamname := SWSDB.SWSFiles[SWSDB.FileIndex].Team[TDX].TeamNAme;
    PoolPlayer[ActPool].player.Assign(
      SWSDB.SWSFiles[SWSDB.FileIndex].Team[TDX].Player[PDX]);
  end;
  ReList;
end;

procedure TPoolForm.BgenRandClick(Sender: TObject);
var
  a, x: integer;
  rest, actx: integer;
  pllig, filnr: integer;
  TmNr, TmNat, PlNr: integer;
  NotDup: boolean;
  tmName: string;
  PoolRecs: array[0..900] of PoolRec;
begin
  if not SWSDB.LoadedAll then
  begin
    ShowMessage(rsOpenAllBefor);
    Exit;
  end;
  Pbrl.Max := 900;
  actx := 0;
  rest := 900;
  Randomize;
  for a := 0 to SWSDB.FileCount - 1 do
  begin
    pllig := 0;
    while pllig < SWSDB.SWSFiles[a].Pool do
    begin
      repeat
        NotDup := True;
        RandPlay(a, filnr, tmnr, TmNat, plnr, tmName);
        for x := 0 to actx do
          if (PoolRecs[x].Plnr = plnr) and (PoolRecs[x].TmNr = tmnr) and (PoolRecs[x].FNr = a) then
            NotDup := False;
      until NotDup;
      PoolRecs[actx].FNr := a;
      PoolRecs[actx].TmNr := tmnr;
      PoolRecs[actx].Plnr := plnr;
      with SWSDB.PoolPlyr do
      begin
        PoolPlayer[actx].TeamName := tmName;
        PoolPlayer[actx].TeamNr := TmNr;
        PoolPlayer[actx].Nation := TmNat;
        PoolPlayer[actx].Play_nr := plnr;
        PoolPlayer[actx].Player.Assign((SWSDB.SWSFiles[a].Team[filnr].Player[plnr]));
      end;
      actx += 1;
      pllig += 1;
    end;
    PBrl.Position := actx;
  end;
  PBrl.Position := 0;
  ReList;
  ShowMessage('Generated Successfull');
end;

procedure TPoolForm.FormShow(Sender: TObject);
begin
  if EdtSett.SWSDataPath <> '' then
    if (not SWSDB.LoadedAll)and(not SWSDB.PoolPlyr.Loaded) then
      SWSDB.PoolPlyr.Load(EdtSett.SWSDataPath + 'POOLPLYR.DAT');
  ReList;
end;

procedure TPoolForm.LVpoolClick(Sender: TObject);
begin
  if LVpool.ItemIndex < 0 then
    Exit;
  ActPool := integer(LVpool.Items.Item[LVpool.ItemIndex].Data);
end;

procedure TPoolForm.BtSavepoolClick(Sender: TObject);
begin
  SWSDB.PoolPlyr.Write(EdtSett.SWSDataPath + 'POOLPLYR.DAT');
end;

procedure TPoolForm.LVpoolColumnClick(Sender: TObject; Column: TListColumn);
begin
  SColumn:=Column.Index;
end;

procedure TPoolForm.LVpoolCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
begin
  case SColumn of
       0: Compare:=CompareText(Item1.Caption,Item2.Caption);
       1: Compare:=StrToInt(Item1.SubItems[0])-StrToint(Item2.SubItems[0]);
       2: Compare:=StrToInt(Item1.SubItems[1])-StrToint(Item2.SubItems[1]);
       3: Compare:=SWSDb.PoolPlyr.PoolPlayer[PtrUint(Item1.Data)].Player.Position-SWSDb.PoolPlyr.PoolPlayer[PtrUint(Item2.Data)].Player.Position;
       4: Compare:=SWSDb.PoolPlyr.PoolPlayer[PtrUint(Item1.Data)].Player.National-SWSDb.PoolPlyr.PoolPlayer[PtrUint(Item2.Data)].Player.National;
       5: Compare:=SWSDb.PoolPlyr.PoolPlayer[PtrUint(Item1.Data)].Player.CalcPlay(true)-SWSDb.PoolPlyr.PoolPlayer[PtrUint(Item2.Data)].Player.CalcPlay(true);
       6: Compare:=SWSDb.PoolPlyr.PoolPlayer[PtrUint(Item1.Data)].Player.Value-SWSDb.PoolPlyr.PoolPlayer[PtrUint(Item2.Data)].Player.Value;
       7: Compare:=CompareText(Item1.SubItems[6],Item2.SubItems[6]);
  end;
end;

procedure TPoolForm.LVpoolDblClick(Sender: TObject);

begin
end;

procedure TPoolForm.LVpoolMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ActPool:=integer(LVpool.Items.Item[LVpool.ItemIndex].Data);
  if Button=mbRight then
    MPoolEdt.PopUp;
end;

procedure TPoolForm.MnatEdtClick(Sender: TObject);
var
  TmPNat: Integer;
begin
  if TryStrToInt(InputBox('Team Number','Enter New Team Nr',IntToStr(SWSDB.PoolPlyr.PoolPlayer[ActPool].Nation)),tmpNat) then
     SWSDB.PoolPlyr.PoolPlayer[ActPool].Nation:=tmpNat else
     ShowMessage(rsThisValueMus);
  ReList;
end;

procedure TPoolForm.MPlaEdtClick(Sender: TObject);
var
  TmPNat: Integer;
begin
  if TryStrToInt(InputBox('Player Number','Enter New Player Nr',IntToStr(SWSDB.PoolPlyr.PoolPlayer[ActPool].Play_nr)),tmpNat) then
     SWSDB.PoolPlyr.PoolPlayer[ActPool].Play_nr:=tmpNat else
     ShowMessage(rsThisValueMus);
  ReList;
end;

procedure TPoolForm.ReList;
var
  a: integer;
  LI: TlistItem;
  LC: TListColumn;
begin
  LVPool.Clear;
  LVPool.Columns.Clear;
  LC := LVPool.Columns.Add;
  LC.Caption := 'Name';
  LC.Alignment := taLeftJustify;
  LC.Width := 160;
  LC := LVPool.Columns.Add;
  LC.Caption := 'Team';
  LC.Alignment := taLeftJustify;
  LC.Width := 35;
  LC := LVPool.Columns.Add;
  LC.Caption := 'Nr';
  LC.Alignment := taLeftJustify;
  LC.Width := 30;
  LC := LVPool.Columns.Add;
  LC.Caption := 'Pos';
  LC.Alignment := taLeftJustify;
  LC.Width := 35;
  //      LC:=LVPool.Columns.Add;
  //      LC.Caption:='Attr';
  //      LC.Alignment:=taLeftJustify;
  //      LC.Width:=40;
  LC := LVPool.Columns.Add;
  LC.Caption := 'Nat';
  LC.Alignment := taLeftJustify;
  LC.Width := 40;
  LC := LVPool.Columns.Add;
  LC.Caption := 'Attrb';
  LC.Alignment := taLeftJustify;
  LC.Width := 50;
  LC := LVPool.Columns.Add;
  LC.Caption := 'Value';
  LC.Alignment := taLeftJustify;
  LC.Width := 50;
  LC := LVPool.Columns.Add;
  LC.Caption := 'Club';
  LC.Alignment := taLeftJustify;
  LC.Width := 150;
  for a := 0 to 899 do
    with SWSDB.PoolPlyr do
    begin
      LI := LVPool.Items.Add;
      Li.Caption := PoolPlayer[a].player.PName;
      Li.SubItems.Add(IntTostr(PoolPlayer[a].Nation));
      Li.SubItems.Add(IntToStr(PoolPlayer[a].Play_nr));
      Li.SubItems.Add(Cpos[PoolPlayer[a].Player.Position].short);
      Li.SubItems.Add(CNat[PoolPlayer[a].player.national]);
      Li.SubItems.Add(PoolPlayer[a].player.AttrbcCode);
      Li.SubItems.Add(Cval[PoolPlayer[a].player.Value]);
      Li.SubItems.Add(PoolPlayer[a].teamname);
      Li.Data := Pointer(a);
    end;
end;

procedure TPoolForm.RandPlay(Leag: integer; out FilNr, TeamNr, TeamNat, Playnr: integer;
  out TmName: string);
var
  TX, PX: integer;
begin
  TX := Round(Random(SWSDB.SWSFiles[Leag].TeamCount));
  PX := Round(Random(15));
  TeamNr := SWSDB.SWSFiles[Leag].Team[TX].TeamNum;
  TeamNat := SWSDB.SWSFiles[Leag].Team[TX].Nation;
  TmName := SWSDB.SWSFiles[Leag].Team[TX].TeamNAme;
  Playnr := PX;
  FilNr := TX;
end;


{$R *.frm}

end.
