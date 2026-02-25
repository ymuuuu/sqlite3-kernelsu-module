# SQLite3 KernelSU module for arm, arm64, x86 and x64

## Requirements

> **KernelSU/Sukisu users must install [`meta-overlayfs`](https://github.com/KernelSU-Modules-Repo/meta-overlayfs/releases) first.**
>
> KernelSU requires a metamodule to process module installs. Install [meta-overlayfs](https://github.com/KernelSU-Modules-Repo/meta-overlayfs/releases) and reboot, then install this module and reboot again. This module uses `skip_mount` so no OverlayFS image is built — the binary is deployed directly to `/data/adb/ksu/bin/` via `service.sh`.

## Description

This KernelSU/Sukisu module provides a statically linked and stripped `sqlite3` binary for **arm64-v8a**, **armeabi-v7a**, **x86** and **x86_64** devices.

## Tested Devices

 - arm64-v8a:
   - **Lenovo Tab M10 Plus Gen 3**
   - **Xiaomi MI 6**
   - **Samsung Galaxy S6 Edge**
 - x86_64:
   - **LDPlayer 9**
   - **Waydroid**
   
## Download

Releases: `SQLite-vX.XX.X-for-kernelsu.multi-arch.zip`

## Changelog

Check: [CHANGELOG.md](CHANGELOG.md)

## Credits

- Original module author: **Rojen Zaman** ([rojenzaman/sqlite3-magisk-module](https://github.com/rojenzaman/sqlite3-magisk-module)).
- Thanks to @jacopotediosi for the convenient SQLite [multi-arch build scripts for Android](https://github.com/jacopotediosi/sqlite3-android).

## Links
[SQLite](https://www.sqlite.org/)
