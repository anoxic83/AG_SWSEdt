unit uplayershow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls, uagswos, uslpload,
  utextstr;

type

  { TPlayerShowFrm }

  TPlayerShowFrm = class(TForm)
    btnSPClose: TButton;
    lvPlayers: TListView;
    procedure btnSPCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvPlayersColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvPlayersCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
  private
    ColumnIdx: Integer;
  public

  end;

var
  PlayerShowFrm: TPlayerShowFrm;

implementation

uses umain;

{$R *.frm}

{ TPlayerShowFrm }

procedure TPlayerShowFrm.FormShow(Sender: TObject);
var
  LC: TListColumn;
  LI: TListItem;
  t, c, p: Integer;
  pla: TSWSPlayer;
  pi: Integer;
begin
  if SWSDB.LoadedAll then begin
    SplashLoad.Show();
    //SplashLoad.Caption:='Preparing Data...';
    SplashLoad.lbLoading.Caption:='Preparing Data...';
    SplashLoad.lbLoadData.Caption:='Clearing...';
    Application.ProcessMessages;
    lvPlayers.Clear;
    LC:= lvPlayers.Columns.Add;
    LC.Caption:='Name';
    LC.Width := 200;
    LC.Alignment := taLeftJustify;
    LC:= lvPlayers.Columns.Add;
    LC.Caption:='Club';
    LC.Width := 200;
    LC.Alignment := taLeftJustify;
    LC:= lvPlayers.Columns.Add;
    LC.Caption:='Pos';
    LC.Width := 50;
    LC.Alignment := taLeftJustify;
    LC:= lvPlayers.Columns.Add;
    LC.Caption:='Value';
    LC.Width := 120;
    LC.Alignment := taLeftJustify;
    LC:= lvPlayers.Columns.Add;
    pi:=0;
    for t:=0 to SWSDB.SWSFiles.Count-1 do
      for c:=0 to SWSDB.SWSFiles[t].TeamCount-1 do begin
        for p:=0 to 15 do begin
            pla := SWSDB.SWSFiles[t].Team[c].Player[p];
            LI:= lvPlayers.Items.Add;
            LI.Caption:= pla.PName;
            LI.SubItems.Add(pla.Team.TeamNAme);
            LI.SubItems.Add(CPos[pla.Position].short);
            LI.SubItems.Add(CVal[pla.Value]);
            LI.Data:= pla;
            SplashLoad.lbLoadData.Caption:='Player No: '+IntToStr(pi);
            SplashLoad.pbload.Style:=pbstMarquee;
            Inc(pi);
        end;
        Application.ProcessMessages;
      end;
    SplashLoad.pbload.Style:=pbstNormal;
    SplashLoad.Hide;
  end else begin
    ShowMessage('This feature is avaible only if all teams is loaded.');
    ModalResult:=mrAbort;
  end;
end;

procedure TPlayerShowFrm.lvPlayersColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  ColumnIdx:= Column.Index;
end;

procedure TPlayerShowFrm.lvPlayersCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  case ColumnIdx of
    0: Compare:= CompareText(Item1.Caption,Item2.Caption);
    1: Compare:= CompareText(Item1.SubItems[0],Item2.SubItems[0]);
    2: Compare:= TSWSPlayer(Item1.Data).Position - TSWSPlayer(Item2.Data).Position;
    3: Compare:= TSWSPlayer(Item2.Data).Value - TSWSPlayer(Item1.Data).Value;
  end;
end;

procedure TPlayerShowFrm.btnSPCloseClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

end.

