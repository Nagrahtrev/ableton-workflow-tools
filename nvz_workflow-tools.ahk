; -------------------------------------------------------------------------------
;
;
;
;                           ==== SCRIPT SETTINGS ====
;
;
;
; -------------------------------------------------------------------------------

#Include HotkeyRegistrations.ahk
; #Include GlobalHotkeys.ahk

#Requires AutoHotkey v2.0
SetWorkingDir A_ScriptDir
InstallKeybdHook
#UseHook
#SingleInstance force
#MaxThreadsPerHotkey 2
CoordMode "Mouse", "Window"

A_TrayMenu.Insert("&Window Spy", "List of Keys", keylist)
A_TrayMenu.Insert("&Window Spy", "Documentation", doc)
A_TrayMenu.Insert("&Window Spy")

keylist(*)
{
    Run "https://www.autohotkey.com/docs/v2/KeyList.htm"
}

doc(*)
{
    Run "https://www.autohotkey.com/docs/v2/"
}

GroupAdd "Ableton", "ahk_class Ableton Live Window Class"
GroupAdd "Ableton", "ahk_class AbletonVstPlugClass"
GroupAdd "Ableton", "ahk_class Vst3PlugWindow"

RegisterHotkeys()

; -------------------------------------------------------------------------------
;
;
;
;                             ==== MENU BUILDER ====
;
;
;
; -------------------------------------------------------------------------------

menuText := FileRead(A_ScriptDir "\MenuConfig.txt")
myMenu := CreateMenuFromFile(menuText)

CreateMenuFromFile(configText)
{
    mainMenu := Menu()
    menuStack := [mainMenu]
    currentLevel := 0

    Loop parse, configText, "`n", "`r"
        {
        line := Trim(A_LoopField)

        if (line == "" or SubStr(line, 1, 1) == "#")
            continue
        
        indent := (StrLen(A_LoopField) - StrLen(LTrim(A_LoopField))) // 4

        if (indent > currentLevel + 1)
            Throw Error("Invalid indentation level at line " A_Index " (Current Level: " currentLevel ", Target Level: " indent ")")
        
        while (indent < currentLevel)
        {
            menuStack.Pop()
            currentLevel--
        }

        if RegExMatch(line, "^-+$")
        {
            menuStack[-1].Add()
            continue
        }
        
        isSubmenu := SubStr(line, -1) == ">"

        if isSubmenu
        {
            subName := Trim(SubStr(line, 1, -1))
            subMenu := Menu()
            menuStack[-1].Add(subName, subMenu)
            menuStack.Push(subMenu)
            currentLevel++
            continue
        }
        
        if RegExMatch(line, "(.*):(.*)", &match)
        {
            handler := Trim(match[1])
            name := Trim(match[2])
        } 
        else
        {
            handler := ""
            name := Trim(line)
        }
        
        if (handler == "C")
        {
            menuStack[-1].Add(name, (*) => 0)
            menuStack[-1].Disable(name)
            menuStack[-1].SetIcon(name, "Shell32.dll", 44)
            continue
        }
        
        if (isSubmenu)
        {
            ;; Done
        }
        else if (handler = "C")
        {
            ;; Done
        }
        else
        {
            callback := handler ? MenuHandler.Bind(handler, name) : (*) => ""
            menuStack[-1].Add(name, callback)
        }
    }

    return mainMenu
}

MenuHandler(handler, name, *)
{
    if RegExMatch(handler, "^(S|R|P|M)(\d*)$", &match)
    {
        typeMap := Map(
            "S", ["", false],
            "R", ["adg `"`"", false],
            "P", ["adv `"`"", false],
            "M", ["amxd `"`"", false]
        )

        if (typeObj := typeMap.Get(match[1], ""))
        {
            dnCount := match[2] ? Integer(match[2]) : 1
            genericLoader(name, typeObj[1], dnCount, typeObj[2])
            return
        }
    }

    switch handler
    {
        case "2": genericLoader(name, "vst `"`"", 1, true)
        case "3": genericLoader(name, "vst3 `"`"", 1, true)
        case "?": eg(name)
        case "???": omgitis(name)
    }
}

genericLoader(itemName, prefix := "", dnCount := 1, needWinCheck := false)
{
    Send "^f"
    Sleep 50
    if (prefix != "")
    {
        SendText prefix
        Sleep 10
        Send "{Left}"
    }
    SendText itemName
    Sleep 800
    Send "{Down}"
    Sleep 300
    Send "{Home}"
    Sleep 100
    Loop (dnCount - 1)
    {
        Send "{Down}"
        Sleep 50
    }
    Sleep 200
    Send "{Enter}"
    if (needWinCheck)
    {
        if WinWaitNotActive("ahk_class Ableton Live Window Class")
            WinActivate
        Sleep 100
    }
    Sleep 500
    Send "{Esc}"
}

eg(*)
{
    MsgBox "You selected an example item."
}

omgitis(*)
{
    Result := MsgBox("*", "*", "YesNo")
    if Result = "Yes"
    {
        Result := MsgBox("IS THIS YOUR ASSHOLE?", "*", "YesNo")
        if Result = "Yes"
            MsgBox("BOOM💥", "💥")
        else
            MsgBox("YOU'RE RIGHT, IT'S MINE.", ":(")
    }
    else
    {
        Result := MsgBox("***", "***", "YesNo")
        if Result = "Yes"
            MsgBox("SAN-BAI ASSHOLE💥💥💥", "💥💥💥")
        else
            MsgBox("YOU SEE SEE YOU, ONE DAY DAY, JUST KNOW NO NO NO!", ">:(")
    }
}

; -------------------------------------------------------------------------------
;
;
;
;                            ==== HOTKEY ACTIONS ====
;
;
;
; -------------------------------------------------------------------------------

MyFuncShowPluginPopupMenu(*)
{
    myMenu.Show()
}

MyFuncCloseVstWindow(*)
{
    vstClass := WinGetClass("A")
    SetTitleMatchMode 3
    if InStr(vstClass, "AbletonVstPlugClass") or InStr(vstClass, "Vst3PlugWindow")
        WinClose
    SetTitleMatchMode 2
}

MyFuncClearAutomation(*)
{
    Send "^{BackSpace}"
}

MyFuncSelectAllNExport(*)
{
    Send "^+l"
    Sleep 100
    Send "^+r"
}

MyFuncCollectAllNSave(*)
{
    MenuSelect "ahk_class Ableton Live Window Class", , "1&", "15&"
}

MyFuncDuplicateTo8(*)
{
    Send "^{d 7}"
}

MyFuncSearchVst(*)
{
    Send "^f"
    Sleep 10
    SendText "vst "
}

MyFuncDeactivate(*)
{
    Send "{0}"
}

MyFuncNonLoopedMidiClip(*)
{
    Send "^+m"
    Sleep 10
    Send "^j"
}

MyFuncCreateXFade(*)
{
    SendEvent "^!f"
}

MyFuncMaximizePianoRoll(*)
{
    SendEvent "^!e"  
}

MyFuncNewLaneAutomation(*)
{
    Send "{RButton}"
    Sleep 10
    Send "{Down 2}"
    Send "{Enter}"
}

MyFuncAssignTrackColor(*)
{
    Send "{RButton}"
    Sleep 10
    Send "{Up 3}"
    Send "{Enter}"
}

MyFuncOpenPreferences(*)
{
    Send "^,"
}

MyFuncLocateSidebarLabel(*)
{
    MouseClick , Xpos, Ypos, , 0
    Sleep 10
    Send "{Right}" 
}

MyFuncMidiNoteUp(*)
{
    Send "{Up}"
}

MyFuncMidiNoteDn(*)
{
    Send "{Down}"
}

MyFuncMidiOctaveUp(*)
{
    Send "+{Up}"
}

MyFuncMidiOctaveDn(*)
{
    Send "+{Down}"
}

MyFuncLoopSwitch(*)
{
    Send "^l"
}

MyFuncShowHideTakeLane(*)
{
    SendEvent "^!u"
}

#HotIf WinActive("ahk_group Ableton")

if InStr(DisableCtrlQ, "On")
{
    ^q::return
}

if InStr(SwapTabShiftTab, "On")
{
    +Tab::Tab
    Tab::+Tab
}

if InStr(CtrlShiftZRedo, "On")
{
    ^+z::^y
}

if InStr(ClearSearchBox, "On")
{
    ^f::
    {
        Send "^f"
        Sleep 10
        Send "{BackSpace}"
    }
}

#HotIf InStr(LeftHandDelete, "On") && WinActive("ahk_group Ableton")

~`::
{
    A_HotkeyInterval := 200
    if (A_PriorHotkey = ThisHotkey && A_TimeSincePriorHotkey < A_HotkeyInterval)
        Send "{Del}"
}

#HotIf

if InStr(AutoEnglishIme, "On")
{
    enIME := 0x4090409
    defaultIME := 0
    currentIME := defaultIME

    SetTimer CheckAbletonFocus, 500
    CheckAbletonFocus()
    {
        global currentIME, defaultIME
        try
        {
            if WinActive("ahk_group Ableton")
            {
                if (currentIME != enIME)
                {
                    activeHwnd := WinGetID("A")
                    PostMessage(0x50, 0, enIME, , activeHwnd)
                    currentIME := enIME
                }
            } 
            else
            {
                if (currentIME != defaultIME)
                {
                    activeHwnd := WinGetID("A")
                    PostMessage(0x50, 0, defaultIME, , activeHwnd)
                    currentIME := defaultIME
                }
            }
        }
        catch
        {
            Sleep 500
        }
    }
}

MyFuncRandomNameSampleExporterShortcut(*)
{
    if InStr(RandomNameSampleExporter, "On")
    {
        Send "^l"
        Sleep 50
        Send "^+l"
        Sleep 50
        Send "^+r"
        Sleep 200
        Send "{Enter}"
        Sleep 500

        if InStr(RandomNameChangeIntoDatetime, "Off")
        {
            chars := "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
            charLen := StrLen(chars)
            RndName(len)
            {
                Loop len
                {
                rnd := Random(1, charLen)
                string .= SubStr(chars, rnd, 1)
                }
                Return string
            }
            Send RndName(RandomNameLength)
        }
        else if InStr(RandomNameChangeIntoDatetime, "On")
            SendInput FormatTime( , DatetimeFormat)

        Sleep 500
        Send "{Enter}"
    }
}

MyFuncGetPluginListShortcut(*)
{
    if InStr(GetPluginList, "On")
    {
        Run "python `"get-plug-list.py`""
        if WinWait("ahk_exe python.exe")
            WinWaitClose

        latestFile := ""
        latestTime := 0
        targetDir := A_ScriptDir

        Loop Files targetDir "\*.txt"
        {
            if RegExMatch(A_LoopFileName, "^mypluglist_.+\.txt$")
            {
                currentTime := A_LoopFileTimeCreated
                if (currentTime == "")
                    continue
                if (currentTime > latestTime)
                {
                    latestTime := currentTime
                    latestFile := A_LoopFileFullPath
                }
            }
        }

        if FileExist(latestFile)
            Run '"' latestFile '"'
        else
            MsgBox "No matching files found."
    }
}
