# AG-SWSEdt
----
AG-SWSEdt is a **Sensible World of Soccer** data editor.
Is allows to editing teams, players and them attributtes.

[First Steps](#first-steps)
[Usage](#usage)
[Advanced Options](#advanced)
[Compilation](#compilation)
[Change Log](#change-log)

----
###First Steps

Select the **SWOS DATA** directory or click **Change** to open Settings window or
load TEAM manualy with **File->Open Team**.
Optional select the swos executable file to enable league structure verification.
If SWOS DATA directory is selected:
option File-Open All is enable. (Load all SWOS Database).
or load team/nation from menu by double click.

###Usage

In **Tab General** you have all information about TEAM FILE.
Nr of teams in file, team names, and optional verification structure in file and in executable (important for career).
Double Click on Team Name to select team to edit.
All data can be edited, but edit number is strong not recomended for beginners.

In **Tab Squad** you can edit the formation, on see all information by players.
Players in squad can be changed by drag/drop method.
Double clixk on Player Name to edit player.

In **Tab Player** you can edit player name, number, nationality, skin/hair color and attributes.

###Advanced Options

**Verification Of League Structures**
Main Menu->Global->Verify All League Structures:
This option verifing all nation leagues by number of teams in divisions is correct (In File and in Executable).
Is important to career mode working corectly.

**Edit League Structure**
Tab General->Edit League Structure:
Allows to edit nr of teams in SWOS executable or create patch for [SWOS 2020 Win32 Port Competition Changer](https://www.sensiblesoccer.de/forum/swos-2020/27081-swos-2020-win32-port-competition-changer).

**Show Poolplyr**
Main Menu->Edit->Show PoolPlyr:
Allows to edit or generate **POOLPLYR.DAT**. This players shown in career mode->Transfers->View Foreign Transfer Market

**Add Team TM Editor CSV**
Main Menu->Edit->Add Team TM Editor CSV:
Add file from CSV generated by [SWOS-TMEditor](https://github.com/boskorban/swostmeditor)

###Compilation
To compilation download [CodeTyphon](https://www.pilotlogic.com/sitejoom/index.php/downloads/category/14-codetyphon).
CodeTyphon is the Next Generation "Pascal Visual Programming Studio".

###Change Log
**ver 2.4.2a**
- Change Leagues.xml, add dynamic support to SWOS 2020 1.0.1 update (File version and League Pos Vector Difference).
- Function Add Team TM Editor CSV added.

**ver 2.4.1a**
- Fix errors with cannot focus and SWOS General Nr. (thx. starwindz)
- Add Create Patch for SWOS 2020 Win32 Port Competition Changer on edit league structure.
- Change Find on 90min.com to Find on TransferMarkt.
- Add Change Attruibuttes to by 7 for all players in squad.

**ver 2.4.0a**
- Add Support to SWOS 2020 Port Win32
- Fix Some Errors

**ver 2.3.0a**
- Fix Some Errors
- Change To new CT version
- Add Customs.edt to Leagues.xml
- Add XML Export

**ver 2.2.0a**
- New Version
- Add Total Pack Options
- Add Load All Files in Data Directory
- Add Find Player and Team
- Add Player Predictions
- Fixed Sorting
- Add Search Player on Internet Sites
- Add European Cup Competitions Edit

**ver 2.1.4a**
- Add Player Attributes Chart
- Add SWS.exe League Structure Edit
- Add Selection on Tactic Graphics
- Add PopUp Edit Menu
- Fixed Hint Error

**ver 2.1.3a**
- Change Overview structure to TreeView
- Add Country Flags
- Add Player Skin/Hair Icon
- Add MainMenu Shortcuts

**ver 2.1.2a**
- Add Linux support
- Poolplyr loaded automatic
- Before load team, write option disable
- Fixed Errors

**ver 2.1.1a**
- First public release version.