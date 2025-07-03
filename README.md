<div align="center">

# Ableton Live 12 Workflow Tools

<img src="https://img.shields.io/badge/Requires-AutoHotkey_v2-blue?style=flat&logo=autohotkey" alt="AHK Requirement">

</div>

> **2025-07-03 Update** -- Dude!! Dude!! Go use [ALFIL Max](https://killihu.vstskins.com/alfil-max/)!! It's way better than sticking with these old ways.

## About This Project
  
Personal [AutoHotkey](https://www.autohotkey.com/) scripts designed to optimize my workflows.  

Inspired by the concept of [Live Enhancement Suite](https://enhancementsuite.me/), these tools were developed independently to suit my production style in Ableton Live.

> **Note**: This is my *personal-use workflow helper - the code might not be perfect, but it gets the job done! Feel free to use it as a backup solution :)

## Getting Started

### 1. Install Requirements
- [AutoHotkey v2](https://www.autohotkey.com/v2/)
- [Python 3](https://www.python.org/downloads/) (optional)

### 2. Launch the Script
```
nvz_workflow-tools.ahk
```

### 3. Customize Hotkeys

Edit key bindings in:
```
HotkeyConfig.ahk
```

### 4. Configure Plugin Menu

Modify menu items in:
```
MenuConfig.txt
```

### 5. Start making DOoOoOoOoOPE tracks...

**Tip:**  The included `get-plug-list.py` script helps generate directory-based plugin lists.

Back up your messy plugin collection before resetting or upgrading the PC :)  

>**If Python script fails to run** — verify Python 3 is added to PATH!!!

## Menu Config Syntax Guide

### 1. Hierarchy
- Use `>` at line end to create submenu
- Indent with 4 spaces per level (use the `TAB` key)
- Lines containing only `-` characters create separator lines

### 2. Item Format
```
[TYPE] : [DISPLAY NAME IN LIVE BROWSER]
```
- TYPE prefixes (case-sensitive)

| TYPE | Description |
|----|----|
| `S` | Stock (Ableton built-in) |
| `R` | Rack |
| `P` | Preset |
| `M` | Max Device |
| `2` | VST2 Plugin |
| `3` | VST3 Plugin |
| `C` | Category Label (non-clickable) |

- If search results aren't in the expected order (e.g. "Limiter" appears after "Color Limiter"), add a number after the type letter to specify the position, Examples:

| TYPE | Description |
|----|----|
| `S2` | 2nd Stock result |
| `R5` | 5th Rack result |

>**Note:** Doesn't work for VST2/3, this rarely happens — if needed, try sandwiching the manufacturer name before your menu item.

### 3. Special Rules
- Lines starting with `#` are comments
- Empty lines will be ignored

### 4. Friendly Reminders
1. These scripts run smoothly on my setup, but if you're on a slower system or working with heavy projects that slow down Live:

    - Go to `nvz_workflow-tools.ahk` and locate **lines 162-192**
    - Gradually increase all `Sleep` values (in **ms**) until stable

2. Live remembers where you clicked last time. Annoying example:

    If you load "Glue Compressor", then search "Compressor", the cursor stays on "Glue Compressor" instead of the first match.

    So... I force the cursor back to top for reliability. If you hate the delay this adds: 

    - Go to `nvz_workflow-tools.ahk` and locate **lines 175-176**
    - Delete line 175 (`Sleep 300`) and 176 (`Send "{Home}"`)

## Shortcuts View

### Core Shortcuts
| Function | Hotkey |
|----|----|
| Plugin Quick Menu | Middle Mouse |
| Close VST Window | `ESC` |
| Select Loop & Export | `CTRL`+`SHIFT`+`R` |
| Collect All & Save | `CTRL`+`ALT`+`S` |
| Rapid Duplication | `ALT`+`D` |
| Search VST Plugins | `CTRL`+`SHIFT`+`F` |
| New Automation Lane | `ALT`+`A` |
| Assign Color to Clips | `ALT`+`C` |
| Quick Sidebar Label Access | `F1` |
| Create Non-looped MIDI Clip | XButton2 |
| Transpose MIDI Notes | `SHIFT`+Mouse Wheel |
  
### Remapped Shortcuts
| Function | Hotkey |
|----|----|
| Delete Automation | `CTRL`+`~` |
| Deactivate Clips | XButton1 |
| Create Crossfade | `ALT`+`F` |
| Preferences Window | `F12` |
| Toggle Loop | `F13` |
| Take Lanes Visibility | `F14` |
  
> My keyboard doesn't have F13/F14 keys, but my Razer DeathAdder V2X mouse has 2 extra programmable buttons. I've assigned F13 and F14 to those.
  
### Optional Modules
- Disable Quit Shortcut -- `CTRL`+`Q`
- Swap `TAB` and `SHIFT`+`TAB`
- Redo with `CTRL`+`SHIFT`+`Z`
- Clear Search Box -- `CTRL`+`F`
- Left-hand Deletion -- Double-press `~`
- Auto-switch to English(US) IME
- Quick Export with Randomized/Timestamp-based Names -- `ALT`+`S`
- Generate Audio Plugin Lists -- `CTRL`+`SHIFT`+`ALT`+`P`
