; ---- Ableton Live Workflow Tools by nova+z (aka. Nagrahtrev) ----

; ※ THIS SCRIPT REQUIRES AUTOHOTKEY V2 ※
#Requires AutoHotkey v2.0

; Script Settings
InstallKeybdHook
#UseHook
#SingleInstance force
#MaxThreadsPerHotkey 2
#SuspendExempt
LShift & F11::Reload
LShift & F12::Suspend
#SuspendExempt False
CoordMode 'Mouse', 'Window'


; You can change any hotkey to suit your preferences
; Please read the documentation (https://www.autohotkey.com/docs/v2/) before customizing it
; And here is the list of keynames: https://www.autohotkey.com/docs/v2/KeyList.htm


; Disable a block of code you don't need by multi-line comments. For example:
/*
I'M COMMENTED OUT. TAT
*/


; --------------------------------------- START ---------------------------------------

; The following directives only work in specific windows
GroupAdd 'Ableton', 'ahk_class Ableton Live Window Class'
GroupAdd 'Ableton', 'ahk_class AbletonVstPlugClass'
GroupAdd 'Ableton', 'ahk_class Vst3PlugWindow'
#HotIf WinActive('ahk_group Ableton')


; --------------------------------------- DEVICE MENU CUSTOMIZATION ---------------------------------------

MButton::mainmenu.Show    ;; MBUTTON, Display the Menu

; Add main menu items here ↓↓↓
; CURRENT MENU.Add 'DISPLAY NAME IN LIVE BROWSER', DEVICE TYPE(ableton/vst/vst3/preset/rack/max)
mainmenu := Menu()

mainmenu.Add 'Utility', ableton
mainmenu.Add '-- I AM A MENU ITEM --', vst

mainmenu.Add    ;; Separator Line

; Create multi-level menus here ↓↓↓
;------------------------------------------------------;
;             menuitem                                 ;
;           /            menuitem                      ;
;          /           /                               ;
; mainmenu -- submenu1 -- submenu1_1                   ;
;          \             menuitem                      ;
;           \          /                               ;
;             submenu2 -- submenu2_1                   ;
;                      \                               ;
;                       submenu2_2 -- submenu2_2_1     ;
;                                  \                   ;
;                                    submenu2_2_2...   ;
;                                                      ;
;              Level 1     Level 2      Level 3        ;
;------------------------------------------------------;

submenu1 := Menu()    ;; Create a Submenu

mainmenu.Add 'EQ', submenu1    ;; PARENT MENU.Add "CATEGORY NAME", CURRENT MENU

submenu1.Add 'EQ Eight', ableton    ;; Add Item to Submenu
submenu1.Add 'Fabfilter Pro-Q 3', vst
submenu1.Add '-- ADD ITEM HERE --', ableton

submenu1.Add    ;; Separator Line

submenu1_1 := Menu()    ;; Create an Extra Level of Submenu

submenu1.Add 'Filter', submenu1_1

submenu1_1.Add 'Auto Filter', ableton
submenu1_1.Add '-- ADD ITEM HERE--', rack

submenu2 := Menu()

mainmenu.Add 'Compressor', submenu2

submenu2.Add 'Glue Compressor', ableton
submenu2.Add 'Fabfilter Pro-C 2', vst
submenu2.Add    ;; Separator Line

submenu2_1 := Menu()

submenu2.Add 'Analog', submenu2_1

submenu2_1.Add 'API-2500 Stereo', vst3
submenu2_1.Add 'CLA-2A Mono', vst3

submenu2_2 := Menu()

submenu2.Add 'Multiband', submenu2_2

submenu2_2.Add 'OTT', preset
submenu2_2.Add 'Fabfilter Pro-MB', vst

; Back to main menu
mainmenu.Add    ;; Separator Line

; You can add a disabled (gray color) menu item to categorize following items
mainmenu.Add '------ Tools ------', category
mainmenu.Disable '------ Tools ------'    ;; Changes it to a gray color

mainmenu.Add 'Velocity', ableton
mainmenu.Add 'Dry-Wet', rack
mainmenu.Add 'LFO Random', max


; Don't touch it :(
ableton(item_ableton, *)
{
    Send '{Ctrl Down}f{Ctrl Up}'
    SendText item_ableton
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

rack(item_rack, *)
{
    Send '{Ctrl Down}f{Ctrl Up}'
    SendText 'adg ""'
    Sleep 10
    Send '{Left}'
    SendText item_rack
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

preset(item_preset, *)
{
    Send '{Ctrl Down}f{Ctrl Up}'
    SendText 'adv ""'
    Sleep 10
    Send '{Left}'
    SendText item_preset
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

max(item_max, *)
{
    Send '{Ctrl Down}f{Ctrl Up}'
    SendText 'amxd ""'
    Sleep 10
    Send '{Left}'
    SendText item_max
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

vst(item_vst, *)
{
    Send '{Ctrl Down}f{Ctrl Up}'
    SendText 'vst ""'
    Sleep 10
    Send '{Left}'
    SendText item_vst
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

vst3(item_vst3, *)
{
    Send '{Ctrl Down}f{Ctrl Up}'
    SendText 'vst3 ""'
    Sleep 10
    Send '{Left}'
    SendText item_vst3
    Sleep 500
    Send '{Down}'
    MouseMove 180, 140, 0
}

category(*)
{
    MsgBox "Why don't you just disable it huh?"
}


; --------------------------------------- CLOSE ACTIVATED VST PLUGIN WINDOW ---------------------------------------

Esc::    ;; ESC
{
    vstprocess := WinGetProcessName('A')
    vstclass := WinGetClass('A')
    vsttitle := WinGetTitle('A')

    SetTitleMatchMode 2
    if RegExMatch(vstprocess,'Ableton')
    {
        if RegExMatch(vstclass,'AbletonVstPlugClass') or RegExMatch(vstclass,'Vst3PlugWindow')
        {
	        WinClose vsttitle 
	    }
        else
        {
            Send '{Esc}'
        }
    }
}


; --------------------------------------- LEFT HAND DELETE ---------------------------------------

~`::    ;; Double Press [`]
{
    A_HotkeyInterval := 200
    if (A_PriorHotkey != '~``' or A_TimeSincePriorHotkey > A_HotkeyInterval)
    {
        KeyWait '``'
        return
    }

    Send '{Del}'
}

^`::    ;; CTRL + [`], Clear Automation/Envolope
{
    Send '^{Del}'
}


; --------------------------------------- SWAP TAB AND SHIFT+TAB ---------------------------------------

Tab::+Tab
+Tab::Tab


; --------------------------------------- SELECT ALL AND EXPORT ---------------------------------------

^+r::    ;; CTRL + SHIFT + [R]
{
    Send '^+l'
    Sleep 100
    Send '^+r'
}


; --------------------------------------- COLLECT ALL AND SAVE ---------------------------------------

^!s::
{
    MouseClick , 20, 40, , 0
    Sleep 200
    Send '{Down 10}'
    Sleep 10
    Send '{Enter 2}'
}


; --------------------------------------- DUPLICATE/PASTE TO 8 ---------------------------------------

!d::    ;; ALT + [D], Duplicate
{
    Send '^{d 7}'
}

!v::    ;; ALT + [V], Paste
{
    Send '^v'
    Sleep 10
    Send '^{d 7}'
}


; --------------------------------------- SEARCH ONLY VST PLUGINS ---------------------------------------

^+f::    ;; CTRL + SHIFT + [F]
{
    Send '{Ctrl Down}f{Ctrl Up}'
    Sleep 10
    SendText 'vst '
}

^f::    ;; CTRL + [F], Clear Search Field
{
    Send '^f'
    Send '{BackSpace}'
}


; --------------------------------------- DEACTIVATE SELECTED CLIPS ---------------------------------------

XButton1::    ;; XBUTTON1
{
    Send '{Numpad0}'
}


; --------------------------------------- CREATE NON-LOOPED MIDI CLIP ---------------------------------------

XButton2::    ;; XBUTTON2
{
    Send '^+m'
    Sleep 10
    Send '^j'
}


; --------------------------------------- PUT MIDI NOTE EASILY (ALSO CAN TWEAK KNOB) ---------------------------------------

HotIf (*) => GetKeyState('``', 'P')

; Hold [`] + MouseWheel, Transpose by Semitone
Hotkey "WheelUp", moveup
Hotkey "WheelDown", movedn

; Hold [`] + SHIFT + MouseWheel, Transpose by Octave
Hotkey "+WheelUp", moveupoct
Hotkey "+WheelDown", movednoct

` & ~LButton::    ;; Hold [`] and Drag to Put Notes
{
    Click 'Down'
    KeyWait 'LButton'
    Click 'Up'
}

moveup(*)
{
    Send '{Up}'
}

movedn(*)
{
    Send '{Down}'
}
moveupoct(*)
{
    Send '+{Up}'
}

movednoct(*)
{
    Send '+{Down}'
}


; --------------------------------------- SHOW/HIDE ALL VIEWS ---------------------------------------

F10::    ;; F10
{
    Send '^!b'
    Sleep 10
    Send '^!l'
    Sleep 10
    Send '^!i'
    Sleep 10
    Send '^!s'
    Sleep 10
    Send '^!o'
    Sleep 10
    Send '^!m'
    Sleep 10
    Send '^!r'
}


; --------------------------------------- ADD AUTOMATION IN NEW LANE ---------------------------------------

!a::    ;; ALT + [A] (Mouse Keeps Hovering)
{
    WinTitle := WinGetTitle('A')
    if RegExMatch(WinTitle,'Ableton')
    {
        Send '{RButton}'
        Sleep 10
        Send '{Down 2}'
        Send '{Enter}'
    }
}


; --------------------------------------- ASSIGN COLOR TO CLIPS ---------------------------------------

!c::    ;; ALT + [C] (Mouse Keeps Hovering)
{
    WinTitle := WinGetTitle('A')
    if RegExMatch(WinTitle,'Ableton')
    {
        Send '{RButton}'
        Sleep 10
        Send '{Up 2}'
        Send '{Enter}'
    }
}


; --------------------------------------- QUICK FIND CATEGORIES ---------------------------------------

; Use 'AutoHotkey Window Spy' to get the position of CATEGORIES relative to the Ableton Live window
xpos1 := 30    ;; Red
ypos1 := 140

xpos2 := 30    ;; Orange
ypos2 := 160

xpos3 := 30    ;; Yellow
ypos3 := 178

xpos4 := 30    ;; Green
ypos4 := 197

xpos5 := 30    ;; Blue
ypos5 := 216

xpos6 := 30    ;; Purple
ypos6 := 235

xpos7 := 30    ;; Gray
ypos7 := 255

F1::    ;; F1
{
    MouseClick , xpos1, ypos1, , 0
    Sleep 10
    Send '{Right}' 
}

F2::    ;; F2
{
    MouseClick , xpos2, ypos2, , 0
    Sleep 10
    Send '{Right}' 
}

F3::    ;; F3
{
    MouseClick , xpos3, ypos3, , 0
    Sleep 10
    Send '{Right}' 
}

F4::    ;; F4
{
    MouseClick , xpos4, ypos4, , 0
    Sleep 10
    Send '{Right}' 
}

F5::    ;; F5
{
    MouseClick , xpos5, ypos5, , 0
    Sleep 10
    Send '{Right}' 
}

F6::    ;; F6
{
    MouseClick , xpos6, ypos6, , 0
    Sleep 10
    Send '{Right}' 
}

F7::    ;; F7
{
    MouseClick , xpos7, ypos7, , 0
    Sleep 10
    Send '{Right}' 
}

xpos8 := 30    ;; Position of Samples Folder
ypos8 := 654

F8::    ;; F8
{
    MouseClick , xpos8, ypos8, , 0
}


; --------------------------------------- SHORTCUT REPLACEMENT ---------------------------------------

^+z::^y    ;; CTRL + SHIFT + [Z], Redo

F12::^,    ;; F12, Open Preferences


; --------------------------------------- KEY MAPPING MEMO ---------------------------------------

/*
[W] - Warp/Unwarp
[e] - Lock/Unlock Envelopes
[d] - Metronome On/Off
[f] - Follow Playback
[l] - Set Locator
[C] - Capture MIDI
[v] - Re-Enable Automation
[M] - Mono Monitoring

[~] - Solo Memo Track
[!] - Solo Reference Track 1
[@] - Solo Reference Track 2

[\] - Open Plugin Windows
[[] - Clip Gain, Down
[]] - Clip Gain, Up
[{] - Clip Pitch, Down
[}] - Clip Pitch, Up

[Numpad1] - Warp Mode, Beats
[Numpad2] - Warp Mode, Tones
[Numpad3] - Warp Mode, Texture
[Numpad4] - Warp Mode, Re-Pitch
[Numpad5] - Warp Mode, Complex
[Numpad6] - Warp Mode, Complex Pro
*/


; --------------------------------------- END ---------------------------------------

#HotIf


/*
; --------------------------------------- LEGACY FEATURES ---------------------------------------

; Add Device Easily with CAPSLOCK + [AnyKey] (CapsLock will still work properly)
CapsLock::
{
    KeyWait 'CapsLock'
    if (A_ThisHotkey='CapsLock')
    {
        SetCapsLockState !GetKeyState('CapsLock', 'T') ? True : False
    }
}

#HotIf GetKeyState('CapsLock', 'P')

device(name)
{
    Send '^f'
    Send name
    Sleep 200
    Send '{Down}'
    Sleep 10
    Send '{Enter}'
    Sleep 100
    Send '{Esc}'
}

; [Keyname]::Send Device('{Text}[Device Name]')
    1::Send Device('{Text}EQ Eight')
    2::Send Device('{Text}Compressor')
    3::Send Device('{Text}OTT')
    4::Send Device('{Text} ')
    5::Send Device('{Text} ')
    6::Send Device('{Text} ')
    7::Send Device('{Text} ')
    8::Send Device('{Text}-- DEVICE NAME HERE --')
    9::Send Device('{Text} ')
    0::Send Device('{Text} ')
    q::Send Device('{Text} ')
    w::Send Device('{Text}Kontakt')
    e::Send Device('{Text}Nexus')
    r::Send Device('{Text}Serum')

#HotIf

; Auto Switch to English IME when Ableton Live is Activated
GroupAdd 'process_en', 'ahk_class Ableton Live Window Class'

MapIME := Map('EN', 67699721)

GetCurrentIMEID()
{
    WinID := WinGetID('A')
    ThreadID := DllCall('GetWindowThreadProcessId', 'UInt', WinID, 'UInt', 0)
    InputLocaleID := DllCall('GetKeyboardLayout', 'UInt', ThreadID, 'UInt')

    return InputLocaleID
}

SetIME(IMEID)
{
    WinTitle := WinGetTitle('A')
    PostMessage 0x50, 0, IMEID, , WinTitle     
}

Loop
{
    WinWaitActive('ahk_group process_en')    
    CurrentWinID := WinGetID('A')
    SetIME(MapIME['EN'])
    WinWaitNotActive(CurrentWinID)
}
*/
