# DWM Patch Summary

This document summarizes the status of patches applied to your DWM configuration.

1  cool_autostart
2  restartsig
3  attachbottom
4  focusnetactive
5  togglefloatingcenter
6  fullscreen
7  vanitygaps
8  shift-tools
9  movestack
10 pertag
11 status2d


| Patch File                                    | Status                       | Notes                                                                                                                                                                                                                                                                                                                                                      |
| :-------------------------------------------- | :--------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `dwm-cool_autostart-6.5.diff`                 | Applied Cleanly              | Allows DWM to manage autostarted processes and gracefully terminate them.                                                                                                                                                                                                                                                                                |
| `dwm-alwayscenter-20200625-f04cac6.diff`      | Applied Cleanly              | New floating windows open in the center.                                                                                                                                                                                                                                                                                                                   |
| `dwm-attachbottom-6.3.diff`                   | Applied with Manual Fixes    | Modified `dwm.c`. Hunk #5 failed; manually replaced `attach(c);` with `attachbottom(c);` in the `updategeom` function to ensure new clients attach to the bottom of the stack when monitors are removed.                                                                                                                                           |
| `dwm-focusedontop-6.6.diff`                   | Applied with Manual Fixes    | Modified `dwm.c` (cleanly) and `config.h`. `config.def.h` hunks failed; manually added `static const int focusedontoptiled = 1;` and adjusted `rules` array entries in `config.h` to include the `alwaysontop` field (defaulting to 0) for proper configuration.                                                                                                 |
| `dwm-focusonnetactive-6.2.diff`               | Applied Cleanly              | Improves integration with applications requesting focus.                                                                                                                                                                                                                                                                                                   |
| `dwm-fullscreen-6.2.diff`                     | Applied Cleanly              | Improves fullscreen handling.                                                                                                                                                                                                                                                                                                                              |
| `dwm-movestack-20211115-a786211.diff`         | Applied with Manual Fixes    | Created `movestack.c`. `config.def.h` hunks failed; manually added `#include "movestack.c"` and the `movestack` keybindings (`MODKEY|ShiftMask, XK_j/k`) to `config.h`. This patch is implemented by including a separate C file.                                                                                                                                  |
| `dwm-windowfollow-20221002-69d5652.diff`      | Applied Cleanly (with fuzz)  | Mouse focus follows windows moved between monitors.                                                                                                                                                                                                                                                                                                        |
| `dwm-pertag-20200914-61bb8b2.diff`            | Applied with Manual Fixes    | Modified `dwm.c`. Hunk #5 failed; manually inserted per-tag initialization code into the `createmon` function to remember layout settings on a per-tag basis.                                                                                                                                                                                          |
| `dwm-restartsig-20180523-6.2.diff`            | Applied with Manual Fixes    | Modified `dwm.c`. Hunks failed in `dwm.c`; manually added `sighup` and `sigterm` function declarations and merged the restart logic into the `quit` function, ensuring clean DWM restarts while preserving `cool_autostart`'s process termination.                                                                                              |
| `dwm-preserveonrestart-6.3.diff`              | Applied with Manual Fixes    | Modified `dwm.c`. Hunk #3 failed; manually inserted code into the `manage` function to retrieve and apply saved client information (tags and monitor) upon DWM restart, ensuring clients resume their previous state.                                                                                                                                   |

**Note:** The `dwm-vanitygaps-6.2.diff` patch was **skipped** because the `vanitygaps.c` file already exists in your DWM directory, indicating that this functionality is likely already present in your build.
