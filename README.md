# Sublime Glitch Fixer
Fixes (actually: works around) rendering issues of Sublime Text on Windows in combination with ConEmu's Quake mode, such as https://github.com/Maximus5/ConEmu/issues/229 / https://github.com/SublimeTextIssues/Core/issues/952.

## Installation
* Download [sublime_glitch_fixer.exe](https://raw.githubusercontent.com/CherryDT/sublime-glitch-fixer/master/sublime_glitch_fixer.exe)
* Put the file in some folder where it can stay without annoying anybody
* Run it and forget about it
You won't see anything happen, but the tool will register itself to autostart when you log in from now on.
Whenever you minimize ConEmu, the tool will detect it and force Sublime Text to redraw itself. You will still see the glitch, but only for a split-second.

## Uninstallation
* Delete `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Sublime Glitch Fixer` from your registry
* Kill and delete `sublime_glitch_fixer.exe`

## Source Code
I have provided the (very old and sloppy) FreeBasic source code for reference. It needs [registry_standalone.bi](https://gist.github.com/CherryDT/b9067b5860f0f74a13c5faafb7b66832) to compile.
Please note that both the source code and the binary are provided "AS IS", without any warranty or support included!
