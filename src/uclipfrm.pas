unit uclipfrm;

{$mode objfpc}{$H+}

{ AG_SWSEDT - uclipfrm.pas  - Clipboard Form Source File

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
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, utextstr, uagswos;

type

  { TFrmClip }

  TFrmClip = class(TForm)
    btClearT: TButton;
    btClearP: TButton;
    btnAddToCar: TButton;
    btnExp: TButton;
    ClbTeam: TListBox;
    clbPlayer: TListBox;
    lbClPlayers: TLabel;
    lbClTeam: TLabel;
    opec: TOpenDialog;
    savc: TSaveDialog;
    procedure btClearPClick(Sender: TObject);
    procedure btClearTClick(Sender: TObject);
    procedure btnAddToCarClick(Sender: TObject);
    procedure btnExpClick(Sender: TObject);
    procedure clbPlayerClick(Sender: TObject);
    procedure ClbTeamClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmClip: TFrmClip;

implementation

{$R *.frm}

{ TFrmClip }

procedure TFrmClip.FormActivate(Sender: TObject);
var
  a: integer;
begin
  Caption:='SWSEdt Clipboard';
  clbPlayer.Clear;
  ClbTeam.Clear;
  for a := 0 to SWSDB.Clipboard.TeamCount - 1 do
    ClbTeam.Items.Add(SWSDB.Clipboard.Team[a].TeamNAme);
  for a := 0 to SWSDB.Clipboard.PlayerCount - 1 do
    clbPlayer.Items.Add(SWSDB.Clipboard.Player[a].PName);
end;

procedure TFrmClip.ClbTeamClick(Sender: TObject);
begin
  SWSDB.Clipboard.TeamIndex := ClbTeam.ItemIndex;
end;

procedure TFrmClip.clbPlayerClick(Sender: TObject);
begin
  SWSDB.Clipboard.PlayerIndex := ClbPlayer.ItemIndex;
end;

procedure TFrmClip.btClearPClick(Sender: TObject);
begin
  SWSDB.Clipboard.ClearPlayers;
  FormActivate(self);
end;

procedure TFrmClip.btClearTClick(Sender: TObject);
begin
  SWSDB.Clipboard.ClearTeams;
  FormActivate(self);
end;

procedure TFrmClip.btnAddToCarClick(Sender: TObject);
var
  Sfm: TFIleStream;
  FilCnt2, FilCnt: byte;
  tname: array[0..15] of char;
  a: integer;
begin
  if SWSDB.Clipboard.TeamCount < 5 then
    FilCnt := SWSDB.Clipboard.TeamCount
  else
    FilCnt := 5;
  opec.Filter:='Career Save|*.car|All Files|*.*';
  if opec.Execute then
    if opec.FileName <> '' then
    begin
      Sfm := TFileStream.Create(Opec.FileName, fmOpenReadWrite);
      try
        Sfm.Seek($D885, soBeginning);
        FilCnt2 := 0;
        for a := 0 to FilCnt - 1 do
        begin
          if (SWSDB.Clipboard.Team[a].Nation < 86) and
            (SWSDB.Clipboard.Team[a].Division < 4) then
          begin
            Sfm.WriteByte(0);
            Sfm.WriteByte(SWSDB.Clipboard.Team[a].Nation);
            Sfm.WriteByte(SWSDB.Clipboard.Team[a].TeamNum);
            tname := Uppercase(SWSDB.Clipboard.Team[a].TeamNAme) + #0;
            Sfm.Write(tname, sizeof(tname));
            Sfm.WriteByte(0);
            Sfm.WriteByte(0);
            if (SWSDB.Clipboard.Team[a].Nation > 79) then
              Sfm.WriteDWord($FFFFFFFF)
            else
              Sfm.WriteDWord(SWSDB.Clipboard.Team[a].CalcTeam(True) * 4100);
            Sfm.WriteByte(0);
            Inc(FilCnt2);
          end;
        end;
        Sfm.Seek($D884, soBeginning);
        Sfm.WriteByte(FilCnt2);
      finally
        Sfm.Free;
      end;
      ShowMessage('Write Successfull');
    end;
end;

procedure TFrmClip.btnExpClick(Sender: TObject);
var
  Stm: TFileStream;
begin
  if ((ClbTeam.ItemIndex<0)or(ClbTeam.ItemIndex>SWSDB.Clipboard.TeamCount-1)) then
     Exit;
  savc.Filter:='TEAM Export|*.TEAM|All Files|*.*';
  if savc.Execute then
     if savc.FileName<>'' then begin
        Stm:=TFileStream.Create(savc.FileName,fmCreate);
        SWSDB.Clipboard.Team[ClbTeam.ItemIndex].WriteTeam(Stm);
        Stm.Free;
     end;
end;



end.