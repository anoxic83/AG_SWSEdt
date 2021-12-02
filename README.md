# AG-SWSEdt
----
AG-SWSEdt is a **Sensible World of Soccer** data editor.
Is allows to editing teams, players and them attributtes.

[First Steps](#first-steps)

[Usage](#usage)

[Advanced Options](#advanced-options)

[Compilation](#compilation)

[Change Log](#change-log)

----
### Donations

Support the author of the project with a donation:

[![paypal](https://www.paypalobjects.com/en_US/PL/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/donate?cmd=_s-xclick&hosted_button_id=VJE4C4DGHF2CU)

----
### First Steps

Select the **SWOS DATA** directory or click **Change** to open Settings window or
load TEAM manualy with **File->Open Team**.
For Total-Pack 2020 go to settings, Select total pack directory (file new_total_pack.exe) click Refresh Manual, and check use new Total Pack.
All team data configuration will be access from combo box on tab overview.
Optional select the swos executable file to enable league structure verification.
If SWOS DATA directory is selected:
option File-Open All is enable. (Load all SWOS Database).
or load team/nation from menu by double click.

### Usage

In **Tab General** you have all information about TEAM FILE.
Nr of teams in file, team names, and optional verification structure in file and in executable (important for career).
Double Click on Team Name to select team to edit.
All data can be edited, but edit number is strong not recomended for beginners.

In **Tab Squad** you can edit the formation, on see all information by players.
Players in squad can be changed by drag/drop method.
Double clixk on Player Name to edit player.

In **Tab Player** you can edit player name, number, nationality, skin/hair color and attributes.

### Advanced Options

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

**Manual update league.xml**

If file xml/leagues.xml is newer than you have, copy this file to folder bin where AG-SWSEdt.exe is.

### Compilation
To compilation download [CodeTyphon](https://www.pilotlogic.com/sitejoom/index.php/downloads/category/14-codetyphon).
CodeTyphon is the Next Generation "Pascal Visual Programming Studio".

### Change Log
**ver 2.5.1a**
- Fix Generate team player (more randomization).
- Update to SWOS 2020 v3.0.0

**ver 2.5.0a**
- Add Compute original price for all teams (General Tab)
- Add Change attributtes to 7 for all teams (General Tab)
- Add Sort players No. by position for all teams (General Tab)
- Add Generate all Team players [very weak - star] (Squad Tab)
- Update to SWOS 2020 v.2.4.1

**ver 2.4.91**
- Update league executable veryfication to SWOS 2020 v.2.3.8

**ver 2.4.9a**
- Add Compare Report to original 96/97 data.
- Support executable veryfication to version SWOS 2020 1.3.5

**ver 2.4.8a**
- Fix some errors
- Add Change Division in General Tab -> TeamList -> (RMB)Popup Menu

**ver 2.4.7a**
- Add Compute Original Price for all loaded files.
- Add option to export csv data (formation, position, etc) as raw string (optional in settings).

**ver 2.4.6a**
- Add function Replace Team from CSV (TM Editor CSV struct)
- Add highlight for warning/"dirty" team (player no > 16, player in first "11" has no > 11 or two players has this same number).
- Add report to file for "dirty" teams.
- Fix find player duplicates

**ver 2.4.5a**
- Add speed skill comparison, column in General Tab, and highlight column to red if value > 82
- Fix CSV/XML Export to all Players and Teams.
- Add highlights teams by division and players by position (Can off in settings)

**ver 2.4.4a**
- Function Add Raw Team added. (Added files EXPORTED by SwoEditorS v1.3).
- Add Function Export in Show Clipboard menu (Format RAW/SwoEditorS v1.3).
- Find duplicates function integrated from "C/C++" library SwosEdt.

**ver 2.4.3a**
- Add Support to New-Total-Pack (team sets can be edited by switch in editor).
- Add Find SWS Gen.No Duplicates. (Generates txt file with FileName::TeamName duplicate).
- Fix errors with reloading after change settings.

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
