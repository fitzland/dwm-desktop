# Gemini Instructions for Suckless Configuration

This document outlines the conventions and procedures for the Gemini AI assistant to follow when managing this repository of suckless configuration files.

## Core Mandates & Philosophy

1.  **Understand First:** Before making any changes, thoroughly analyze the existing configuration, scripts, and file structures to understand the established conventions.
2.  **Suckless Philosophy:** Adhere to the suckless philosophy of simplicity, clarity, and minimalism. Changes should be clean, efficient, and easy to understand.
3.  **Compilation is Key:** All suckless utilities in this repository (`dwm`, `st`, `slstatus`, etc.) are built from source. After any modification to a utility's source code or `config.h` file, you **must** recompile it to apply the changes.
4.  **Safety and Stability:** Prioritize the stability and functionality of the system. When proposing changes, explain the benefits and any potential risks.
5.  **Distribution Awareness:** My primary operating system is **Debian Linux**. I occasionally use **Arch Linux**. Ensure that any tools or commands you use are compatible with both, prioritizing Debian conventions.

## Workflow for Modifying a Utility (e.g., `dwm`, `st`)

1.  **Locate the Configuration:** Identify the correct configuration file, which is typically `config.h` in the utility's respective directory.
2.  **Modify the Code:** Apply the requested changes directly to the source files or `config.h`.
3.  **Compile from Source:** Navigate to the utility's directory and run `sudo make install`. I will handle the sudo password prompt. For example, to compile `dwm`:
    ```bash
    cd dwm && sudo make install
    ```
4.  **Explain the Outcome:** After compilation, confirm that the build was successful. Inform me about any actions I need to take to see the changes (e.g., "You will need to restart DWM for the changes to take effect.").

## Patch Management

*   **Location:** Patches are stored in the `patches/` subdirectory within each tool's folder (e.g., `dwm/patches/`).
*   **Application:** Use the `patch` command to apply `.diff` files. For example:
    ```bash
    patch < patches/some-new-patch.diff
    ```
*   **Documentation:** If adding a new patch, please note its source or purpose if it is not obvious from the filename.

## General Recommendations

I am open to recommendations that will improve my setup. Please feel free to suggest:

*   **New Patches:** Interesting patches that add useful functionality without excessive bloat.
*   **Configuration Tweaks:** Adjustments to `config.h` files for improved performance, usability, or aesthetics.
*   **Scripting Enhancements:** Improvements to any of the shell scripts in the `scripts/` directory.
*   **Bug Fixes:** Solutions for any instabilities or issues you might identify.

When making a recommendation, please provide a clear rationale for why you are suggesting the change.
