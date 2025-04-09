<div align="center">

# Ableton Live 12 Workflow Tools

<img src="https://img.shields.io/badge/Requires-AutoHotkey_v2-blue?style=flat&logo=autohotkey" alt="AHK Requirement">

</div>

## About This Project
  
Personal AutoHotkey scripts designed to optimize Ableton Live 12 workflows.  

Inspired by the concept of [Live Enhancement Suite](https://enhancementsuite.me/), these tools were developed independently to suit my production style in Ableton Live.

> **Note**: This is my *personal-use workflow helper - the code might not be perfect, but it gets the job done! Feel free to use it as a backup solution :)

## Getting Started

**1. Install Requirements**
- [AutoHotkey v2](https://www.autohotkey.com/v2/)
- [Python 3](https://www.python.org/downloads/) (optional)

**2. Launch the Script**  
```
nvz_workflow-tools.ahk
```

**3. Customize Hotkeys**  
- Edit key bindings in:
```
HotkeyConfig.ahk
```

**4. Configure Plugin Menu**  
- Modify menu items in:
```
MenuConfig.txt
```

**5. Start making DOoOoOoOoOPE tracks...**

>**Tip:**  The included `get-plug-list.py` script helps generate directory-based plugin lists.
>
>Back up your messy plugin collection before resetting or upgrading the PC :)  

>**If Python script fails to run:**  Verify Python 3 is added to PATH!!!


## Features

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

### Optional Modules
- Disable Quit Shortcut -- `CTRL`+`Q`
- Swap `TAB` and `SHIFT`+`TAB`
- Redo with `CTRL`+`SHIFT`+`Z`
- Clear Search Box -- `CTRL`+`F`
- Left-hand Deletion -- Double-press `~`
- Auto-switch to English(US) IME
- Quick Export with Randomized/Timestamp-based Names -- `ALT`+`S`
- Generate Audio Plugin Lists -- `CTRL`+`SHIFT`+`ALT`+`P`

---
