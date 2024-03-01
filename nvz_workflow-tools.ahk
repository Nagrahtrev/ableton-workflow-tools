; ※※※ THIS SCRIPT REQUIRES AUTOHOTKEY V2 ※※※
; <Tray Icon Menu> → <Documentation> to Visit AHK Official Documentation

; -------------------------------------------------------------------------------
;
;
;       === Ableton Live 12 Workflow Tools by nova+z (aka. Nagrahtrev) ===
;
;
; -------------------------------------------------------------------------------

; ↓↓↓ Your Ableton Live Language Setting ↓↓↓
Language := 'English'

; ↓↓↓ Change Hotkey to Suit Your Preference ↓↓↓
ShowPluginPopupMenu := 'MButton'
CloseVstWindow := '~Esc'
ClearAutomation := '^``'
SelectAllNExport := '^+r'
CollectAllNSave := '^!s'
DuplicateTo8 := '!d'
PasteTo8 := '!v'
SearchVst := '^+f'
Deactivate := 'XButton1'
NonLoopedMidiClip := 'XButton2'
CreateXFade := '!f'
NewLaneAutomation := '!a'  ;; ※ Mouse Keep Hovering
AssignTrackColor := '!c'  ;; ※ Mouse Keep Hovering
OpenPreferences := 'F12'
LocateSidebarLabel := 'F1'  ;; <Tray Icon Menu> → <Window Spy> → <Mouse Position> → <Window>
    Xpos := 30
    Ypos := 150
MidiNoteUp := '+WheelUp'
MidiNoteDn := '+WheelDown'
MidiOctaveUp := '^+WheelUp'
MidiOctaveDn := '^+WheelDown'

; ↓↓↓ Optional Features (On/Off) ↓↓↓
SwapTabShiftTab := 'On'
CtrlShiftZRedo := 'On'
ClearSearchBox := 'On'  ;; When Using [Ctrl+F]
LeftHandDelete := 'On'  ;; Double Press [~] Key
AutoEnglishIme := 'Off'  ;; ※ Microsoft English(US) IME

RandomNameSampleExporter := 'On'  ;; Select a Range of Time First
RandomNameSampleExporterShortcut := '!s'
RandomNameLength := 6

GetPluginList := 'Off' ; ※※※ Requires Python 3 & Add Python to PATH ※※※ 
GetPluginListShortcut := '^+!p'

; ↓↓↓ Popup Menu Customization ↓↓↓
MainMenu := Menu()
;------------------------------------------------------;
;             menuitem                                 ;
;           /            menuitem                      ;
;          /           /                               ;
; MainMenu -- SubMenu1 -- SubMenu1_1                   ;
;          \             menuitem                      ;
;           \          /                               ;
;             SubMenu2 -- SubMenu2_1                   ;
;                      \                               ;
;                       SubMenu2_2 -- SubMenu2_2_1     ;
;                                  \                   ;
;                                    SubMenu2_2_2...   ;
;                                                      ;
;              Level 1     Level 2     Level 3         ;
;------------------------------------------------------;

; ↓↓↓ Add Menu Items Here ↓↓↓
; <<< FORMAT >>> : CURRENT MENU.Add 'DISPLAY NAME IN LIVE BROWSER', DEVICE TYPE(ableton/vst/vst3/preset/rack/max)
MainMenu.Add 'Utility', ableton
MainMenu.Add '-- ADD ITEM HERE --', vst

MainMenu.Add  ;; Separator Line

; --------------------------------------------------------------

; ↓↓↓ Create Multi-Level Menus ↓↓↓
; <<< FORMAT >>> : PARENT MENU.Add "CATEGORY NAME", CURRENT MENU
SubMenu1 := Menu()
MainMenu.Add 'EQ', SubMenu1

; ↓↓↓ Add Sub Menu Items Here ↓↓↓
SubMenu1.Add 'EQ Eight', ableton
SubMenu1.Add 'Fabfilter Pro-Q 3', vst
SubMenu1.Add '-- ADD ITEM HERE --', ableton

SubMenu1.Add  ;; Separator Line

; --------------------------------------------------------------

; ↓↓↓ Create Extra Level of Sub Menu ↓↓↓
SubMenu1_1 := Menu()
SubMenu1.Add 'Filter', SubMenu1_1

SubMenu1_1.Add 'Auto Filter', ableton
SubMenu1_1.Add '-- ADD ITEM HERE--', rack

; --------------------------------------------------------------

SubMenu2 := Menu()
MainMenu.Add 'Compressor', SubMenu2

SubMenu2.Add 'Glue Compressor', ableton
SubMenu2.Add 'Fabfilter Pro-C 2', vst

SubMenu2.Add

; --------------------------------------------------------------

SubMenu2_1 := Menu()
SubMenu2.Add 'Analog', SubMenu2_1

SubMenu2_1.Add 'API-2500 Stereo', vst3
SubMenu2_1.Add 'CLA-2A Mono', vst3

; --------------------------------------------------------------

SubMenu2_2 := Menu()
SubMenu2.Add 'Multiband', SubMenu2_2

SubMenu2_2.Add 'OTT', preset
SubMenu2_2.Add 'Fabfilter Pro-MB', vst

; --------------------------------------------------------------

; ↓↓↓ Back to Main Menu ↓↓↓
MainMenu.Add  ;; Separator Line

; ↓↓↓ Add Disabled (Gray Color) Menu Item to Categorize Following Items ↓↓↓
MainMenu.Add '------ Tools ------', category
MainMenu.Disable '------ Tools ------'

MainMenu.Add 'Velocity', ableton
MainMenu.Add 'Arpeggiator', ableton

; -------------------------------------------------------------------------------
;
;
;
;                            ※※※ DON'T TOUCH ※※※
;
;
;
; -------------------------------------------------------------------------------

; ---- Script Settings ----
SetWorkingDir A_ScriptDir
InstallKeybdHook
#UseHook
#SingleInstance force
#MaxThreadsPerHotkey 2
#SuspendExempt
RShift & F11::Reload
RShift & F12::Suspend
#SuspendExempt False
CoordMode 'Mouse', 'Window'

A_TrayMenu.Insert('&Window Spy', 'List of Keys', keylist)
A_TrayMenu.Insert('&Window Spy', 'Documentation', doc)
A_TrayMenu.Insert('&Window Spy')
keylist(*) {
    Run 'https://www.autohotkey.com/docs/v2/KeyList.htm'
}
doc(*) {
    Run 'https://www.autohotkey.com/docs/v2/'
}

; ---- Register Hotkeys ----
GroupAdd 'Ableton', 'ahk_class Ableton Live Window Class'
GroupAdd 'Ableton', 'ahk_class AbletonVstPlugClass'
GroupAdd 'Ableton', 'ahk_class Vst3PlugWindow'
HotIfWinActive('ahk_group Ableton')
Hotkey ShowPluginPopupMenu, myFuncShowPluginPopupMenu
Hotkey CloseVstWindow, myFuncCloseVstWindow
Hotkey ClearAutomation, myFuncClearAutomation
Hotkey SelectAllNExport, myFuncSelectAllNExport
Hotkey CollectAllNSave, myFuncCollectAllNSave
Hotkey DuplicateTo8, myFuncDuplicateTo8
Hotkey PasteTo8, myFuncPasteTo8
Hotkey SearchVst, myFuncSearchVst
Hotkey Deactivate, myFuncDeactivate
Hotkey NonLoopedMidiClip, myFuncNonLoopedMidiClip
Hotkey CreateXFade, myFuncCreateXFade
Hotkey NewLaneAutomation, myFuncNewLaneAutomation
Hotkey AssignTrackColor, myFuncAssignTrackColor
Hotkey OpenPreferences, myFuncOpenPreferences
Hotkey LocateSidebarLabel, myFuncLocateSidebarLabel
Hotkey MidiNoteUp, myFuncMidiNoteUp
Hotkey MidiNoteDn, myFuncMidiNoteDn
Hotkey MidiOctaveUp, myFuncMidiOctaveUp
Hotkey MidiOctaveDn, myFuncMidiOctaveDn
Hotkey RandomNameSampleExporterShortcut, myFuncRandomNameSampleExporterShortcut
HotIfWinActive
Hotkey GetPluginListShortcut, myFuncGetPluginListShortcut

; -------------------------------------------------------------------------------
;
;
;
;                               ==== START ====
;
;
;
; -------------------------------------------------------------------------------

myFuncShowPluginPopupMenu(*) {
    MainMenu.Show
}

ableton(item_ableton, *) {
    Send '^f'
    SendText item_ableton
    Sleep 800
    Send '{Down}'
    Sleep 100
    Send '{Enter}'
    Sleep 500
    Send '{Esc}'
}
ableton_2(item_ableton_2, *) {
    Send '^f'
    SendText item_ableton_2
    Sleep 800
    Send '{Down 2}'
    Sleep 100
    Send '{Enter}'
    Sleep 500
    Send '{Esc}'
}
rack(item_rack, *) {
    Send '^f'
    SendText 'adg ""'
    Sleep 10
    Send '{Left}'
    SendText item_rack
    Sleep 800
    Send '{Down}'
    Sleep 100
    Send '{Enter}'
    Sleep 500
    Send '{Esc}'
}
preset(item_preset, *) {
    Send '^f'
    SendText 'adv ""'
    Sleep 10
    Send '{Left}'
    SendText item_preset
    Sleep 800
    Send '{Down}'
    Sleep 100
    Send '{Enter}'
    Sleep 500
    Send '{Esc}'
}
max(item_max, *) {
    Send '^f'
    SendText 'amxd ""'
    Sleep 10
    Send '{Left}'
    SendText item_max
    Sleep 800
    Send '{Down}'
    Sleep 100
    Send '{Enter}'
    Sleep 500
    Send '{Esc}'
}
vst(item_vst, *) {
    Send '^f'
    SendText 'vst ""'
    Sleep 10
    Send '{Left}'
    SendText item_vst
    Sleep 800
    Send '{Down}'
    Sleep 100
    Send '{Enter}'
    if WinWaitNotActive('ahk_class Ableton Live Window Class')
        WinActivate
    Sleep 100
    Send '{Esc}'
}
vst3(item_vst3, *) {
    Send '^f'
    SendText 'vst3 ""'
    Sleep 10
    Send '{Left}'
    SendText item_vst3
    Sleep 800
    Send '{Down}'
    Sleep 100
    Send '{Enter}'
    if WinWaitNotActive('ahk_class Ableton Live Window Class')
        WinActivate
    Sleep 100
    Send '{Esc}'
}
category(*) {
    MsgBox "Why don't u just disable it bro...?"
}

myFuncCloseVstWindow(*) {
    VstClass := WinGetClass('A')
    VstTitle := WinGetTitle('A')
    SetTitleMatchMode 3
    if InStr(vstClass, 'AbletonVstPlugClass') or InStr(vstClass, 'Vst3PlugWindow')
            WinClose    
}

myFuncClearAutomation(*) {
        Send '^{BackSpace}'
}

myFuncSelectAllNExport(*){
    Send '^+l'
    Sleep 100
    Send '^+r'
}

myFuncCollectAllNSave(*) {
    myLanguange := Language
    if InStr(myLanguange, 'English') {
        MenuSelect 'ahk_class Ableton Live Window Class', , '1&', 'Collect all and save'
    }
    else if InStr(myLanguange, 'Deutsch') or InStr(myLanguange, 'German') {
        MenuSelect 'ahk_class Ableton Live Window Class', , '1&', 'Alles sammeln und sichern'
    }
    else if InStr(myLanguange, 'Español') or InStr(myLanguange, 'Spanish') {
        MenuSelect 'ahk_class Ableton Live Window Class', , '1&', 'Recopilar todo y guardar'
    }
    else if InStr(myLanguange, 'Français') or InStr(myLanguange, 'French') {
        MenuSelect 'ahk_class Ableton Live Window Class', , '1&', 'Réunir et sauvegarder'
    }
    else if InStr(myLanguange, 'Italian') {
        MenuSelect 'ahk_class Ableton Live Window Class', , '1&', 'Raccogli tutto e Salva'
    }
    else if InStr(myLanguange, '日本語') or InStr(myLanguange, 'Japanese') {
        MenuSelect 'ahk_class Ableton Live Window Class', , '1&', 'すべてを集めて保存'
    }
    else if InStr(myLanguange, '中文') or InStr(myLanguange, 'Chinese') {
        MenuSelect 'ahk_class Ableton Live Window Class', , '1&', '全部收集并保存'
    }
}

myFuncDuplicateTo8(*) {
    Send '^{d 7}'
}

myFuncPasteTo8(*) {
    Send '^v'
    Sleep 10
    Send '^{d 7}'
}

myFuncSearchVst(*) {
    Send '^f'
    Sleep 10
    SendText 'vst '
}

myFuncDeactivate(*) {
    Send '{0}'
}

myFuncNonLoopedMidiClip(*) {
    Send '^+m'
    Sleep 10
    Send '^j'
}

myFuncCreateXFade(*) {
    SendEvent '^!f'
}

myFuncNewLaneAutomation(*) {
    Send '{RButton}'
    Sleep 10
    Send '{Down 2}'
    Send '{Enter}'
}

myFuncAssignTrackColor(*) {
    Send '{RButton}'
    Sleep 10
    Send '{Up 3}'
    Send '{Enter}'
}

myFuncOpenPreferences(*) {
    Send '^,'
}

myFuncLocateSidebarLabel(*) {
    MouseClick , Xpos, Ypos, , 0
    Sleep 10
    Send '{Right}' 
}

myFuncMidiNoteUp(*) {
    Send '{Up}'
}
myFuncMidiNoteDn(*) {
    Send '{Down}'
}
myFuncMidiOctaveUp(*) {
    Send '+{Up}'
}
myFuncMidiOctaveDn(*) {
    Send '+{Down}'
}

#HotIf InStr(SwapTabShiftTab, 'On') && WinActive('ahk_group Ableton')
Tab::+Tab
+Tab::Tab

#HotIf InStr(CtrlShiftZRedo, 'On') && WinActive('ahk_group Ableton')
^+z::^y

#HotIf InStr(ClearSearchBox, 'On') && WinActive('ahk_group Ableton')
^f:: {
    Send '^f'
    Sleep 10
    Send '{BackSpace}'
}

#HotIf InStr(LeftHandDelete, 'On') && WinActive('ahk_group Ableton')
~`:: {
    A_HotkeyInterval := 200
    if (A_PriorHotkey = ThisHotkey && A_TimeSincePriorHotkey < A_HotkeyInterval)
        Send '{Del}'
}

#HotIf

if InStr(AutoEnglishIme, 'On') {
    Loop {
        WinWaitActive('ahk_group Ableton')    
        ActiveId := WinGetId('A')
        WinTitle := WinGetTitle('A')
        PostMessage 0x50, 0, 67699721, , WinTitle
        WinWaitNotActive(ActiveId)
    }
}

myFuncRandomNameSampleExporterShortcut(*) {
    if InStr(RandomNameSampleExporter, 'On') {
        chars := "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        charlen := StrLen(chars)
        rndname(len) {
            Loop len {
            rnd := Random(1, charlen)
            string .= SubStr(chars, rnd, 1)
            }
            Return string
        }
        Send '^l'
        Sleep 10
        Send '^+l'
        Sleep 10
        Send '^+r'
        Sleep 200
        Send '{Enter}'
        Sleep 200
        Send rndname(RandomNameLength)
        Sleep 200
        Send '{Enter}'
    }
}

myFuncGetPluginListShortcut(*) {
    if InStr(GetPluginList, 'On') {
        Run 'python "get-plug-list.py"'
        WinWaitActive('ahk_exe python.exe')
        WinWaitClose('ahk_exe python.exe')
        Contents := FileRead('mypluglist.txt')
        Contents := Sort(Contents)
        TimeString := FormatTime(, 'yyyy-MM-dd_HH-mm-ss')
        FileDelete 'mypluglist.txt'
        FileAppend Contents, 'mypluglist_' TimeString '.txt'
        Run 'mypluglist_' TimeString '.txt'
    }
}
