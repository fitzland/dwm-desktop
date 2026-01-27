# 🔲 dwm-setup

![Made for Debian](https://img.shields.io/badge/Made%20for-Debian-A81D33?style=for-the-badge&logo=debian&logoColor=white)
![DWM Version](https://img.shields.io/badge/DWM-6.7-005577?style=for-the-badge&logo=c&logoColor=white)

A minimal suckless DWM 6.7 setup for Debian-based systems.  
Following the suckless philosophy with carefully selected patches — simple, efficient, and hackable.

> Modified from work by the [JustAGuy Linux](https://codeberg.org/justaguylinux) window manager collection; just for me.

## 📜 Suckless Philosophy

This setup adheres to the [suckless philosophy](https://suckless.org/philosophy/):
- **Simplicity** - Minimal code, maximum functionality
- **Clarity** - Configuration through clean C header files
- **Hackability** - Easy to understand, modify, and extend

Configuration follows the suckless way: edit `config.def.h`, remove `config.h`, then recompile — no bloated config systems.

![DWM Setup Screenshot](screenshots/dwm-screenshot.png)

---

## 🚀 Installation

### Quick Install
```bash
git clone https://github.com/fitzland/dwm-desktop.git
cd dwm-desktop
cp -R ./suckless ~/.config/
cd ~/.config/suckless/dwm && sudo make clean install
cd ~/.config/suckless/slstatus && sudo make clean install
cd ~/.config/suckless/st && sudo make clean install
```

### What Gets Installed

The installer follows the suckless approach - only what's necessary:

1. **System Update** - Updates package lists and upgrades existing packages
2. **Core Packages** - Essential X11, build tools, and suckless dependencies
3. **UI Components** - Window manager utilities (rofi, dunst, etc.)
4. **System Tools** - File manager, audio controls, power management
5. **Suckless Builds** - Compiles and installs dwm, slstatus, st, and tabbed
6. **External Tools** - Via butterscripts:
   - FT-Labs picom (compositor)
   - Nerd Fonts collection
   - LightDM display manager
   - Bashrc enhancements
7. **Optional Tools** - Additional browsers, editors, and utilities (prompted)

---

## 📦 What It Installs

### Suckless Tools & Core Components
| Component           | Purpose                          |
|---------------------|----------------------------------|
| `dwm`               | Tiling window manager (patched)  |
| `sxhkd`             | Keybinding daemon                |
| `slstatus`          | Status bar for DWM               |
| `st`                | Patched for scratchpad with transparency, scrollback, and clipboard support |
| `xorg` & tools      | Display server and utilities     |
| `build-essential`   | Compilation tools                |

### UI & System Tools
| Component           | Purpose                          |
|---------------------|----------------------------------|
| `rofi`              | App launcher + keybind viewer    |
| `dunst`             | Lightweight notifications        |
| `feh`               | Wallpaper setter                 |
| `lxappearance`      | GTK theme manager                |
| `network-manager`   | Network management applet        |
| `thunar`            | File Manager (+plugins)          |
| `pavucontrol`       | Audio control GUI                |
| `xfce4-power-manager`| Power management                |
| `flameshot`         | Screenshot tool                  |
| `qimgv`             | Lightweight image viewer         |

### External Tools (via butterscripts)
| Component           | Purpose                          |
|---------------------|----------------------------------|
| `picom` `(FT-Labs)` | Compositor with transparency     |
| Nerd Fonts          | Icon-enabled fonts               |
| LightDM             | Display manager                  |

### Optional Tools (prompted during install)
Additional browsers, editors, and utilities available through the optional tools script.


---

## 🎨 Appearance & Theming

- GTK Theme: [Qogir](https://github.com/vinceliuice/Qogir-theme)
- Icon Theme: [Qogir](https://github.com/vinceliuice/Qogir-icon-theme)

> 💡 _Special thanks to [vinceliuice](https://github.com/vinceliuice) for the excellent GTK and icon themes._

---

## 🔑 Keybindings Overview

Keybindings are split between two systems:

- `~/.config/suckless/dwm/config.def.h` for **DWM-specific keybindings** (window management, layout control, tag switching)
- `~/.config/suckless/sxhkd/sxhkdrc` for **application launchers and system commands** (programs, scripts, media keys)

This separation keeps DWM's core window management bindings in the source while allowing hot-reloadable keybinds for launching applications via sxhkd.

Launch the keybind cheatsheet anytime with:

```bash
~/.config/suckless/scripts/help
```

| Shortcut             | Action                          |
|----------------------|---------------------------------|
| `Super + Enter`      | Launch terminal (alacritty)     |
| `Super + Space`      | Launch rofi                     |
| `Super + Slash(/)`          | Open keybind help via Rofi      |
| `Super + Q`          | Close focused window            |
| `Super + Y`          | Toggle window sticky            |
| `Super + Shift + R`  | Restart DWM                     |
| `Super + Shift + L`  | Launch layout selector (rofi)   |
| `Super + Shift + F`  | Toggle fullscreen mode          |
| `Super + Shift + T`  | Toggle scratchpad terminal      |
| `Super + Shift + A`  | Toggle audio mixer (pulsemixer) |
| `Super + R`          | Toggle ranger file manager      |
| `Super + T`          | Attach focused window to tab group |
| `Super + Alt + T`    | Detach focused window from tab group |
| `Super + F`          | Launch file manager (Thunar)    |
| `Super + B`          | Launch Firefox browser          |
| `Super + E`          | Launch text editor (Geany)      |
| `Super + M`          | Toggle audio mute               |
| `Super + Insert`     | Increase volume                 |
| `Super + Delete`     | Decrease volume                 |
| `Super + Shift + Space` | Toggle floating/tiled        |
| `Super + 1–=`        | Switch to tag                   |
| `Super + Shift + 1–=`| Move window to tag              |

---

## 🧱 Layouts

Select layouts using:

```text
Super + Shift + L
```

This launches a rofi menu where you can select from available layouts.

<details>
<summary>Click to expand layout descriptions</summary>

These are the layouts included in this build, in the exact order from `config.def.h`:

- **[]= Tile** — Classic master-stack
- **[M] Monocle** — Fullscreen stacked windows
- **><> Floating** — Floating windows

</details>

---

## 📂 Configuration Files

```
~/suckless/
├── dwm/ (Dynamic Window Manager - lives here)
│   ├── patches/             # Directory for DWM patches
│   ├── config.def.h         # Default configuration (rules, keys, colors, layouts, etc.)
│   ├── config.h             # Custom configuration (included during compile)
│   ├── config.mk            # Build settings (compiler flags, install paths, X11/Freetype locations)
│   ├── drw.c                # Draw library implementation (text rendering, rectangles, colors using Xft/fontconfig)
│   ├── drw.h                # Header for drw.c (declarations for draw functions, colors, fonts)
│   ├── dwm.1                # Manual page for dwm
│   ├── dwm.c                # Core dwm logic — main(), event loop, client management, layouts, tags, input handling
│   ├── dwm.h                # Header file (declarations for main functions and structures)
│   ├── util.c               # Utility functions (e.g., error handling, string manipulation)
│   ├── util.h               # Header file (declarations for utility functions)
│   └── Keybindings.txt      # Personal cheatsheet for DWM keybindings
├── st/ (Simple Terminal - lives here)
│   └── config.def.h         # ST terminal configuration 
├── slstatus/ (Status Bar - lives here)
│   └── config.def.h         # Status bar configuration
├── sxhkd/ (Simple X Hotkey Daemon - copies to ~/.config/suckless/sxhkd/)
│   └── sxhkdrc              # Keybindings for sxhkd
├── dunst/ (Simple Notification Daemon - copies to ~/.config/suckless/dunst/)
│   └── dunstrc              # Notification settings
├── picom/ (Simple Compositor - copies to ~/.config/suckless/picom/)
│   └── picom.conf           # Compositor configuration
├── rofi/ (Simple Rofi Launcher - copies to ~/.config/suckless/rofi/)
│   └── keybinds.rasi        # Rofi keybinding cheatsheet
└── scripts/ (Utility scripts - copies to ~/.config/suckless/scripts/)
    ├── autostart.sh         # Startup script
    └── help                 # Launches keybind viewer
```

---

## 🧩 Patches Summary

| Patch                  | Category                | Version |
|------------------------|-------------------------|---------|  
| pertag                 | Structural foundation   | 6.2     |
| fullgaps-toggle        | Layout logic            | 6.2     |
| status2d               | Bar/UI                  | 6.4     |
| movestack              | Client movement         | 6.5     |
| attachbottom           | Client placement        | 6.3     |
| restartsig             | Restart ability         | 6.2     |
| preserveonrestart      | Session persistence     | 6.3     |
| fullscreen             | Window management       | 6.2     |
| focusonnetactive       | Compatibility           | 6.2     |
| cool_autostart         | Autostart               | 6.5     |
| shift-tools            | Client management       | 6.2     |
| ~~focusedontop~~       | Floating windows        | 6.6     |

---

## 📜 Patch Documentation

<details>
<summary>Click to expand Patch Documenation</summary>

### 7. `dwm-pertag-20200914-61bb8b2.diff`
**What it does:**  
Each tag remembers its own **layout, master count, and gaps settings**.

**Why it's useful:**  
This is one of the most **essential DWM patches** if you use multiple tags. It allows each workspace (tag) to have its own independent configuration instead of all tags sharing the same layout.

---

### 12. `dwm-status2d-6.4.diff`
**What it does:**  
Adds support for **color-embedded status text and a systray** in DWM’s status bar.

**Why it's useful:**  
Combines two essential features:
- Colored status text for aesthetic and information clarity.
- Systray support for handling system tray icons (volume, network, etc.), which is not natively supported in DWM.

---

### 2. `dwm-attachbottom-6.3.diff`
**What it does:**  
Newly spawned windows are added at the **bottom** of the stack instead of at the top.

**Why it's useful:**  
This can help keep your active window in focus instead of being immediately pushed out when new windows are created. Provides a more "natural" stacking order for some users.

---

### 3. `dwm-cool_autostart-6.5.diff`
**What it does:**  
Adds an **autostart mechanism** to DWM without using `.xinitrc`.

**Why it's useful:**  
You can easily manage startup scripts directly in DWM’s codebase, making it more portable (especially when using login managers instead of `startx`). This patch also gracefully re-runs your autostart scripts if DWM is restarted.

---

### 4. `dwm-focusedontop-6.6.diff`
**What it does:**  
Forces the currently focused floating window to always be on top.

**Why it's useful:**  
Prevents floating windows from accidentally being covered by tiled windows when they lose focus.

**[This is a patch created by Bakkeby for dwm-flexipatch](https://github.com/bakkeby/patches/blob/master/dwm/dwm-focusedontop-6.6.diff)**

---

### 5. `dwm-focusonnetactive-6.2.diff`
**What it does:**  
Ensures DWM correctly focuses windows that request focus via _NET_ACTIVE_WINDOW (like some app popups).

**Why it's useful:**  
Improves compatibility with external programs and scripts (e.g., notification popups, some dialogs, and xdg-open behavior).

---

### 6. `dwm-fullscreen-6.2.diff`
**What it does:**  
Adds the ability for windows to be **faked fullscreen**, which is basically just a borderless, statusbar-less window that fits the entire screen.

**Why it's useful:**  
Some applications (like browsers, video players, and games) expect to be able to go fullscreen. This patch allows DWM to handle fullscreen requests properly while maintaining window management control. Unlike true fullscreen modes that bypass the window manager entirely, this keeps DWM in control while giving applications the fullscreen experience they expect.

**Usage:** Press `Super + Shift + F` to toggle fullscreen mode for the focused window.

---

### 10. `dwm-restartsig-20180523-6.2.diff`
**What it does:**  
Adds a **restart signal handler** so you can restart DWM without logging out.

**Why it's useful:**  
Allows easy config reloads and minor changes without logging out, pairing well with `preserveonrestart`.

**Usage:** Press `Super + Shift + R` to restart DWM.

---

### 9. `dwm-preserveonrestart-6.3.diff`
**What it does:**  
Preserves window positions when restarting DWM.

**Why it's useful:**  
Critical if you like to restart DWM to reload config changes, keeping windows in place instead of resetting them.

---

### 11. `dwm-shif-tools-6.2.diff`
**What it does:**
Implements **shiftview** - viewing the next/prev tag; **shiftviewclients** - viewing the next/prev tag with a client; **shiftboth** - moving the active window to the next/prev tag and viewing it's new tag.

**Why it's useful:**
It allows you to navigate between tags quickly and to move windows around to particular tags, helping you to keep a uncluttered workspace.

**Usage:**
- `Super + I` - View tag to the left
- `Super + O` - View tag to the right
- `Super + Ctrl + I` - View tag to the left with clients
- `Super + Ctrl + O` - View tag to the right with clients
- `Super + Shift + I` - Move window to the left and view tag
- `Super + Shift + 0` - Move window to the right and view tag

---

### 13. `dwm-sticky-6.5.diff`
**What it does:**  
Adds a "sticky" flag to windows, making them visible on all tags.

**Why it's useful:**
Perfect for windows you want to always have accessible, like music players, system monitors, or communication apps. Sticky windows follow you across all workspaces.

**Usage:** Press `Super + Y` to toggle sticky mode for the focused window.

</details>

---

## ☕ Support

If this setup has been helpful, consider buying JustAGuy a coffee:

<a href="https://www.buymeacoffee.com/justaguylinux" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy me a coffee" /></a>

## 📺 Watch on YouTube

Want to see how it looks and works?  
🎥 Check out [JustAGuy Linux on YouTube](https://www.youtube.com/@JustAGuyLinux)
