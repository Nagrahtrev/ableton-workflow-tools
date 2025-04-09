#Include HotkeyConfig.ahk

RegisterHotkeys()
{
    HotIfWinActive('ahk_group Ableton')
    Hotkey ShowPluginPopupMenu, MyFuncShowPluginPopupMenu
    Hotkey CloseVstWindow, MyFuncCloseVstWindow
    Hotkey ClearAutomation, MyFuncClearAutomation
    Hotkey SelectAllNExport, MyFuncSelectAllNExport
    Hotkey CollectAllNSave, MyFuncCollectAllNSave
    Hotkey DuplicateTo8, MyFuncDuplicateTo8
    Hotkey SearchVst, MyFuncSearchVst
    Hotkey Deactivate, MyFuncDeactivate
    Hotkey NonLoopedMidiClip, MyFuncNonLoopedMidiClip
    Hotkey CreateXFade, MyFuncCreateXFade
    Hotkey MaximizePianoRoll, MyFuncMaximizePianoRoll
    Hotkey NewLaneAutomation, MyFuncNewLaneAutomation
    Hotkey AssignTrackColor, MyFuncAssignTrackColor
    Hotkey OpenPreferences, MyFuncOpenPreferences
    Hotkey LocateSidebarLabel, MyFuncLocateSidebarLabel
    Hotkey MidiNoteUp, MyFuncMidiNoteUp
    Hotkey MidiNoteDn, MyFuncMidiNoteDn
    Hotkey MidiOctaveUp, MyFuncMidiOctaveUp
    Hotkey MidiOctaveDn, MyFuncMidiOctaveDn
    Hotkey LoopSwitch, MyFuncLoopSwitch
    Hotkey ShowHideTakeLane, MyFuncShowHideTakeLane
    Hotkey RandomNameSampleExporterShortcut, MyFuncRandomNameSampleExporterShortcut
    HotIfWinActive
    Hotkey GetPluginListShortcut, MyFuncGetPluginListShortcut
}