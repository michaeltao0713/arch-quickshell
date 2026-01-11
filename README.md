# arch-quickshell

Heavy inspiration from https://github.com/snes19xx/surface-dots/tree/main/.config/quickshell/snes-hub/bar

## Setup:

Create empty text file: `.qmlls.ini` under `quickshell/`.

Create `exec-once` rule in `hyprland.conf`.

Currently relying on `pywal` for colors and `swww` for setting/changing wallpapers.

Fonts needed: `ttf-nerd-fonts-symbols`, `ttf-cascadia-code-nerd`, `ttf-fira-code` <-- Set in the settings for vscode too (fira code only)
Install 'ttf-firacode-nerd' for rendering icons in VSCode
Install `Manrope` from Google for bar text font. Might have to manually install it from the Google Fonts website.

Install `matugen` for dynamic color from wallpaper. Use with `vibrant` type for 'best' color palette.

<!-- Need to install `ddcutil`, `brightnessctl` for monitor detection and brightness control respectively. -->

## Roadmap:

 - [x] Add Hub Button
   - [ ] Add Hub Panel
     - [ ] Power Options
     - [ ] Hardware Info
     - [ ] System Info
     - [ ] Calendar
     - [ ] Bascially copy over from surface-dots
   - [ ] Change shell-wide theme when right clicking Hub Button
     - [ ] Make sure both monitors change theme if using multiple monitors
 - [x] Add Workspaces
   - [x] Support for icons
     - [x] Get fonts working properly
 - [ ] Package Stats
   - [ ] System Update
 - [ ] Add Music Controls and Currently Playing
 - [ ] Network Info and Controls
 - [ ] Bluetooth Info and Controls
 - [ ] Battery Info and Controls
 - [ ] Volume Info and Controls
 - [ ] System Tray
 - [ ] Clock
   - [ ] Displays time
   - [ ] Displays date
   - [ ] Opens Calendar on click
 - [ ] Notifications
 - [ ] Dynamic Color based on Wallpaper
   - [x] Integrate with Matugen
   - [ ] Quickshell reloads on Matugen change
   - [ ] Script to change wallpaper and set colors with matugen
 - [ ] Volume and Brightness OSDs
 - [ ] zsh instead of bash?
 - [ ] Review color of elements in light mode

