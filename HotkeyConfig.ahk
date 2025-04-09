; Right-click the system tray icon and select "List of Keys" for reference
; Or Ctrl+Left-click: https://www.autohotkey.com/docs/v2/KeyList.htm


; ================================== CORE HOTKEYS ==================================

; Show custom plugin pop-up menu
ShowPluginPopupMenu := "MButton"

; Close active VST plugin window
CloseVstWindow := "~Esc"

; Delete selected automation/envelope (Remapped)
ClearAutomation := "^``"

; Select loop brace and export audio
SelectAllNExport := "^+r"

; Create shortcut for "Collect All and Save"
CollectAllNSave := "^!s"

; Duplicate clips in blocks of 8
DuplicateTo8 := "!d"

; Search VST plugins (type "vst" in search bar)
SearchVst := "^+f"

; Deactivate selection (Remapped)
Deactivate := "XButton1"

; Create non-looped MIDI clip
NonLoopedMidiClip := "XButton2"

; Create crossfade (Remapped)
CreateXFade := "!f"

; Toggle full-size clip view (Remapped)
MaximizePianoRoll := "^Tab"

; Create shortcut for "Show Automation in New Lane"
; ※ Keep mouse hovering on the knob
NewLaneAutomation := "!a"

; Create shortcut for "Assign Color to Clips"
; ※ Keep mouse hovering on track title
AssignTrackColor := "!c"

; Open preferences window (Remapped)
OpenPreferences := "F12"

; Quickly access sidebar label
; Right-click tray icon → [Window Spy] → [Mouse Position] → [Window]
LocateSidebarLabel := "F1"
    Xpos := 85
    Ypos := 180

; Transpose MIDI notes (Remapped)
MidiNoteUp := "+WheelUp"
MidiNoteDn := "+WheelDown"
MidiOctaveUp := "^+WheelUp"
MidiOctaveDn := "^+WheelDown"

; Toggle loop (Remapped)
LoopSwitch := "F13"

; Show/hide take lanes (Remapped)
ShowHideTakeLane := "F14"


; ================================== OPTIONAL FEATURES ("On" or "Off") ==================================

; Disable "Quit" shortcut
DisableCtrlQ := "On"

; Swap [TAB] and [SHIFT+TAB]
SwapTabShiftTab := "On"

; Redo with [CTRL+SHIFT+Z]
CtrlShiftZRedo := "On"

; Clear search box when using [CTRL+F]
ClearSearchBox := "Off"

; Left-hand deletion
; Double-press the [~] key
LeftHandDelete := "On"

; Auto-switch to Microsoft English(US) IME
; when Live window is active
AutoEnglishIme := "On"

; Quick export audio with randomized names
; ※ Select a time range before exporting
; ※ Manually export once to save location
RandomNameSampleExporter := "On"
    RandomNameSampleExporterShortcut := "!s"
    RandomNameLength := 6
RandomNameChangeIntoDatetime := "Off"  ;; or use timestamp-based naming
    DatetimeFormat := "yyMMdd_HHmmss"

; Generate audio plugin list from specified directory
; Save that plugin mess before migrating to a new PC
; ※ Requires Python 3 installed and added to PATH
GetPluginList := "Off"
    GetPluginListShortcut := "^+!p"
