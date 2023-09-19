; ※※※ THIS SCRIPT REQUIRES AUTOHOTKEY V2 ※※※

; ---- Ableton Live Workflow Tools by nova+z (aka. Nagrahtrev) ----

; AutoHotkey Documentation: https://www.autohotkey.com/docs/v2/
; Keyname List: https://www.autohotkey.com/docs/v2/KeyList.htm

; Let the Script Know Your Ableton Live Language Setting
Language := 'English'  ;; Deutsch/English/Español/Français/Italiano/日本語/简体中文

; ↓↓↓ Change Hotkey to Suit Your Preference ↓↓↓
ShowMenu := 'MButton'  ;; Display Plugin Popup Menu
ClosePlug := '~Esc'  ;; Close Activated VST Plugin Window
LeftHandDel := '``'  ;; Double Press Key to Delete
ClearEnv := '!e'  ;; Clear Automation/Envelope
SelectAllExport := '^+r'  ;; Select All and Export
CollectAllSave := '^!s'  ;; Collect All and Save
DuplicateTo8 := '!d'  ;; Duplicate to 8
PasteTo8 := '!v'  ;; Paste to 8
FindVst := '^+f'  ;; Search VST Plugin
Deactivate := 'XButton1'  ;; Deactivate Selected Clips
NewMidiClip := 'XButton2'  ;; Create Non-Looped MIDI Clip
ShowHideAll := 'F10'  ;; Show/Hide All Views
NewLaneEnv := '!a'  ;; Add Automation in New Lane (Mouse Keep Hovering)
AssignColor := '!c'  ;; Assign Color to Clips (Mouse Keep Hovering)
OpenPreferences := 'F12'  ;; Open Preferences Window

; Optional Features (On/Off)
ShiftTabToTab := 'On'  ;; Swap TAB and SHIFT + TAB
BetterRedo := 'On'  ;; Redo with CTRL + SHIFT + Z
EnglishIme := 'Off'  ;; Auto Switch to English IME (Microsoft)

; Transpose MIDI Note Easily (Also Can Tweak Knob)
MidiNoteUp := '+WheelUp'  ;; Move Up/Increase
MidiNoteDn := '+WheelDown'  ;; Move Down/Decrease
MidiOctaveUp := '^+WheelUp'  ;; Move Up an Octave/Finer Increase
MidiOctaveDn := '^+WheelDown'  ;; Move Down an Octave/Finer Decrease

; Device Loader (Use CAPSLOCK + [Num])
LoadPlug1 := '~Capslock & 1'
PlugName1 := 'EQ Eight'

LoadPlug2 := '~Capslock & 2'
PlugName2 := 'VST Pro Q-3'

LoadPlug3 := '~Capslock & 3'
PlugName3 := 'Utility'

LoadPlug4 := '~Capslock & 4'
PlugName4 := ''

LoadPlug5 := '~Capslock & 5'
PlugName5 := ''

LoadPlug6 := '~Capslock & 6'
PlugName6 := ''

LoadPlug7 := '~Capslock & 7'
PlugName7 := ''

LoadPlug8 := '~Capslock & 8'
PlugName8 := ''

LoadPlug9 := '~Capslock & 9'
PlugName9 := ''

LoadPlug10 := '~Capslock & 0'
PlugName10 := ''

; Quick Find Category/Collection
; Use 'AutoHotkey Window Spy' to Get Position (Relative to Window)
Category1 := 'F1'  ;; Red
xpos1 := 30
ypos1 := 140

Category2 := 'F2'  ;; Orange
xpos2 := 30
ypos2 := 160

Category3 := 'F3'  ;; Yellow
xpos3 := 30
ypos3 := 178

Category4 := 'F4'  ;; Green
xpos4 := 30
ypos4 := 197

Category5 := 'F5'  ;; Blue
xpos5 := 30
ypos5 := 216

Category6 := 'F6'  ;; Purple
xpos6 := 30
ypos6 := 235

Category7 := 'F7'  ;; Gray
xpos7 := 30
ypos7 := 255

Category8 := 'F8'  ;; Sample Pack Folder, etc.
xpos8 := 30
ypos8 := 654

; Plugin Popup Menu Customization
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

; ↓↓↓ Add Main Menu Items Here ↓↓↓
; CURRENT MENU.Add 'DISPLAY NAME IN LIVE BROWSER', DEVICE TYPE(ableton/vst/vst3/preset/rack/max)
MainMenu.Add 'Utility', ableton
MainMenu.Add '-- ADD ITEM HERE --', vst

MainMenu.Add  ;; Separator Line

; ↓↓↓ Create Multi-Level Menus ↓↓↓
SubMenu1 := Menu()
; PARENT MENU.Add "CATEGORY NAME", CURRENT MENU
MainMenu.Add 'EQ', SubMenu1

; ↓↓↓ Add Sub Menu Items Here ↓↓↓
SubMenu1.Add 'EQ Eight', ableton
SubMenu1.Add 'Fabfilter Pro-Q 3', vst
SubMenu1.Add '-- ADD ITEM HERE --', ableton

SubMenu1.Add    ;; Separator Line

; ↓↓↓ Create Extra Level of Sub Menu ↓↓↓
SubMenu1_1 := Menu()
SubMenu1.Add 'Filter', SubMenu1_1

SubMenu1_1.Add 'Auto Filter', ableton
SubMenu1_1.Add '-- ADD ITEM HERE--', rack

; ----

SubMenu2 := Menu()
MainMenu.Add 'Compressor', SubMenu2

SubMenu2.Add 'Glue Compressor', ableton
SubMenu2.Add 'Fabfilter Pro-C 2', vst
SubMenu2.Add

SubMenu2_1 := Menu()
SubMenu2.Add 'Analog', SubMenu2_1

SubMenu2_1.Add 'API-2500 Stereo', vst3
SubMenu2_1.Add 'CLA-2A Mono', vst3

SubMenu2_2 := Menu()
SubMenu2.Add 'Multiband', SubMenu2_2

SubMenu2_2.Add 'OTT', preset
SubMenu2_2.Add 'Fabfilter Pro-MB', vst

; ----

; ↓↓↓ Back to Main Menu ↓↓↓
MainMenu.Add    ;; Separator Line

; Add Disabled (Gray Color) Menu Item to Categorize Following Items
MainMenu.Add '------ Tools ------', category
MainMenu.Disable '------ Tools ------'

MainMenu.Add 'Velocity', ableton
MainMenu.Add 'Arpeggiator', ableton


; -------------------------------------------------------------------------------
;                            ※※※ DON'T TOUCH ※※※
; -------------------------------------------------------------------------------

; Script Setting
InstallKeybdHook
#UseHook
#SingleInstance force
#MaxThreadsPerHotkey 2
#SuspendExempt
LShift & F11::Reload
LShift & F12::Suspend
#SuspendExempt False
CoordMode 'Mouse', 'Window'

; Only Work in Specific Window
GroupAdd 'Ableton', 'ahk_class Ableton Live Window Class'
GroupAdd 'Ableton', 'ahk_class AbletonVstPlugClass'
GroupAdd 'Ableton', 'ahk_class Vst3PlugWindow'

HotIfWinActive('ahk_group Ableton')

; Register Hotkey
Hotkey ShowMenu, myFuncShowMenu
Hotkey ClosePlug, myFuncClosePlug
Hotkey LeftHandDel, myFuncLeftHandDel
Hotkey ClearEnv, myFuncClearEnv
Hotkey SelectAllExport, myFuncSelectAllExport
Hotkey CollectAllSave, myFuncCollectAllSave
Hotkey DuplicateTo8, myFuncDuplicateTo8
Hotkey PasteTo8, myFuncPasteTo8
Hotkey FindVst, myFuncFindVst
Hotkey Deactivate, myFuncDeactivate
Hotkey NewMidiClip, myFuncNewMidiClip
Hotkey ShowHideAll, myFuncShowHideAll
Hotkey NewLaneEnv, myFuncNewLaneEnv
Hotkey AssignColor, myFuncAssignColor
Hotkey OpenPreferences, myFuncOpenPreferences

Hotkey MidiNoteUp, myFuncMidiNoteUp
Hotkey MidiNoteDn, myFuncMidiNoteDn
Hotkey MidiOctaveUp, myFuncMidiOctaveUp
Hotkey MidiOctaveDn, myFuncMidiOctaveDn

Hotkey LoadPlug1, myFuncLoadPlug1
Hotkey LoadPlug2, myFuncLoadPlug2
Hotkey LoadPlug3, myFuncLoadPlug3
Hotkey LoadPlug4, myFuncLoadPlug4
Hotkey LoadPlug5, myFuncLoadPlug5
Hotkey LoadPlug6, myFuncLoadPlug6
Hotkey LoadPlug7, myFuncLoadPlug7
Hotkey LoadPlug8, myFuncLoadPlug8
Hotkey LoadPlug9, myFuncLoadPlug9
Hotkey LoadPlug10, myFuncLoadPlug10

Hotkey Category1, myFuncCategory1
Hotkey Category2, myFuncCategory2
Hotkey Category3, myFuncCategory3
Hotkey Category4, myFuncCategory4
Hotkey Category5, myFuncCategory5
Hotkey Category6, myFuncCategory6
Hotkey Category7, myFuncCategory7
Hotkey Category8, myFuncCategory8

; Plugin Popup Menu
myFuncShowMenu(*) {
    MainMenu.Show    ;; MBUTTON, Display the Menu
}

ableton(item_ableton, *)
{
    Send '^f'
    SendText item_ableton
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

rack(item_rack, *) {
    Send '^f'
    SendText 'adg ""'
    Sleep 10
    Send '{Left}'
    SendText item_rack
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

preset(item_preset, *) {
    Send '^f'
    SendText 'adv ""'
    Sleep 10
    Send '{Left}'
    SendText item_preset
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

max(item_max, *) {
    Send '^f'
    SendText 'amxd ""'
    Sleep 10
    Send '{Left}'
    SendText item_max
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

vst(item_vst, *) {
    Send '^f'
    SendText 'vst ""'
    Sleep 10
    Send '{Left}'
    SendText item_vst
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

vst3(item_vst3, *) {
    Send '^f'
    SendText 'vst3 ""'
    Sleep 10
    Send '{Left}'
    SendText item_vst3
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

category(*) {
    MsgBox "Why Don't You Just Disable It HUH?"
}

; Close Activated Plugin Window
myFuncClosePlug(*) {
    vst_Process := WinGetProcessName('A')
    vst_Class := WinGetClass('A')
    vst_Title := WinGetTitle('A')
    
    SetTitleMatchMode 2
    if RegExMatch(vst_Process, 'Ableton') {
        if RegExMatch(vst_Class, 'AbletonVstPlugClass') or RegExMatch(vst_Class, 'Vst3PlugWindow') {
	        WinClose vst_Title 
	    }
    }
}

; Left Hand Delete
myFuncLeftHandDel(ThisHotkey) {
    A_HotkeyInterval := 200
    if (A_PriorHotkey = ThisHotkey && A_TimeSincePriorHotkey < A_HotkeyInterval) {
        Send '{Del}'
    }
    else
        Send ThisHotkey
}

; Clear Automation/Envolope
myFuncClearEnv(*) {
        Send '^{BackSpace}'
}

; Select All and Export
myFuncSelectAllExport(*){
    Send '^+l'
    Sleep 100
    Send '^+r'
}

; Collect All and Save
myLanguange := Language
myFuncCollectAllSave(*) {
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

; Duplicate to 8
myFuncDuplicateTo8(*) {
    Send '^{d 7}'
}

; Paste to 8
myFuncPasteTo8(*) {
    Send '^v'
    Sleep 10
    Send '^{d 7}'
}

; Search VST Plugin
myFuncFindVst(*) {
    Send '^f'
    Sleep 10
    SendText 'vst '
}

; Clear Search Field
Hotkey '^f', myFuncClearField
myFuncClearField(*) {
    Send '^f'
    Send '{BackSpace}'
}

; Deactivate Selected Clips
myFuncDeactivate(*) {
    Send '{Numpad0}'
}

; Create Non-Looped MIDI Clip
myFuncNewMidiClip(*) {
    Send '^+m'
    Sleep 10
    Send '^j'
}

; Show/Hide All Views
myFuncShowHideAll(*) {
    SendEvent '^!b'
    Sleep 10
    SendEvent '^!l'
    Sleep 10
    SendEvent '^!i'
    Sleep 10
    SendEvent '^!s'
    Sleep 10
    SendEvent '^!o'
    Sleep 10
    SendEvent '^!m'
    Sleep 10
    SendEvent '^!r'
}

; Add Automation in New Lane
myFuncNewLaneEnv(*) {
    WinTitle := WinGetTitle('A')
    if Instr(WinTitle,'Ableton') {
        Send '{RButton}'
        Sleep 10
        Send '{Down 2}'
        Send '{Enter}'
    }
}

; Assign Color to Clips
myFuncAssignColor(*) {
    WinTitle := WinGetTitle('A')
    if Instr(WinTitle,'Ableton') {
        Send '{RButton}'
        Sleep 10
        Send '{Up 2}'
        Send '{Enter}'
    }
}

; Open Preferences Window
myFuncOpenPreferences(*) {
    Send '^,'
}

; Transpose MIDI Note Easily
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

; Device Loader
CapsLock:: {
    KeyWait 'CapsLock'
    if (A_ThisHotkey='CapsLock') {
        SetCapsLockState !GetKeyState('CapsLock', 'T') ? True : False
    }
}

FindPlug(name) {
    Send '^f'
    SendText name
    Sleep 300
    Send '{Down}'
    Sleep 100
    Send '{Enter}'
    Sleep 500
    if (name ~= 'VST') {
        if WinWaitNotActive('ahk_class Ableton Live Window Class')
            WinActivate('ahk_class Ableton Live Window Class')
            Sleep 10
    }
    Send '{Esc}'
}

myFuncLoadPlug1(*) {
    SendEvent FindPlug(PlugName1)
}

myFuncLoadPlug2(*) {
    SendEvent FindPlug(PlugName2)
}

myFuncLoadPlug3(*) {
    SendEvent FindPlug(PlugName3)
}

myFuncLoadPlug4(*) {
    SendEvent FindPlug(PlugName4)
}

myFuncLoadPlug5(*) {
    SendEvent FindPlug(PlugName5)
}

myFuncLoadPlug6(*) {
    SendEvent FindPlug(PlugName6)
}

myFuncLoadPlug7(*) {
    SendEvent FindPlug(PlugName7)
}

myFuncLoadPlug8(*) {
    SendEvent FindPlug(PlugName8)
}

myFuncLoadPlug9(*) {
    SendEvent FindPlug(PlugName9)
}

myFuncLoadPlug10(*) {
    SendEvent FindPlug(PlugName10)
}

; Quick Find Category/Collection
myFuncCategory1(*) {
    MouseClick , xpos1, ypos1, , 0
    Sleep 10
    Send '{Right}' 
}

myFuncCategory2(*) {
    MouseClick , xpos2, ypos2, , 0
    Sleep 10
    Send '{Right}' 
}

myFuncCategory3(*) {
    MouseClick , xpos3, ypos3, , 0
    Sleep 10
    Send '{Right}' 
}

myFuncCategory4(*) {
    MouseClick , xpos4, ypos4, , 0
    Sleep 10
    Send '{Right}' 
}

myFuncCategory5(*) {
    MouseClick , xpos5, ypos5, , 0
    Sleep 10
    Send '{Right}' 
}

myFuncCategory6(*) {
    MouseClick , xpos6, ypos6, , 0
    Sleep 10
    Send '{Right}' 
}

myFuncCategory7(*) {
    MouseClick , xpos7, ypos7, , 0
    Sleep 10
    Send '{Right}' 
}

myFuncCategory8(*) {
    MouseClick , xpos8, ypos8, , 0
}

; Swap TAB and SHIFT + TAB
#HotIf InStr(ShiftTabToTab, 'On') && WinActive('ahk_group Ableton')
Tab::+Tab
+Tab::Tab

; Redo with CTRL + SHIFT + Z
#HotIf InStr(BetterRedo, 'On') && WinActive('ahk_group Ableton')
^+z::^y

#HotIf

; Auto Switch to English IME
if InStr(EnglishIme, 'On') {
    MapIme := Map('en', 67699721)
    GetCurrentImeId() {
        WinId := WinGetId('A')
        ThreadId := DllCall('GetWindowThreadProcessId', 'UInt', WinId, 'UInt', 0)
        InputLocaleId := DllCall('GetKeyboardLayout', 'UInt', ThreadId, 'UInt')
        return InputLocaleId
    }

    SetIme(ImeId) {
        WinTitle := WinGetTitle('A')
        PostMessage 0x50, 0, ImeId, , WinTitle     
    }

    Loop {
        WinWaitActive('ahk_group Ableton')    
        CurrentWinId := WinGetId('A')
        SetIme(MapIme['en'])
        WinWaitNotActive(CurrentWinId)
    }
}
