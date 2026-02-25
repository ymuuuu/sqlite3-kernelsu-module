bindir=/system/bin

resolve_arch_suffix() {
	case "$1" in
		arm64|arm64-v8a|aarch64) echo "arm64" ;;
		arm|armeabi|armeabi-v7a|armv7*|armv8l) echo "arm" ;;
		x64|x86_64|amd64) echo "x64" ;;
		x86|i386|i486|i586|i686) echo "x86" ;;
		*) echo "" ;;
	esac
}

selected_arch="$(resolve_arch_suffix "$ARCH")"

if [ -z "$selected_arch" ]; then
	selected_arch="$(resolve_arch_suffix "$(getprop ro.product.cpu.abi)")"
fi

if [ -z "$selected_arch" ]; then
	selected_arch="$(resolve_arch_suffix "$(uname -m)")"
fi

if [ -z "$selected_arch" ] || [ ! -f "$MODPATH$bindir/sqlite3.$selected_arch" ]; then
	ui_print "[!] Could not determine a compatible sqlite3 binary for this device"
	ui_print "[!] ARCH='$ARCH' ABI='$(getprop ro.product.cpu.abi)' UNAME='$(uname -m)'"
	abort "Installation aborted"
fi

ui_print "[0/3] Keeping necessary binary file: $MODPATH$bindir/sqlite3.$selected_arch"
cp -f "$MODPATH$bindir/sqlite3.$selected_arch" "$MODPATH$bindir/sqlite3.keep"

ui_print "[1/3] Deleting unnecessary binary files"
rm -f "$MODPATH$bindir/sqlite3.arm" "$MODPATH$bindir/sqlite3.arm64" "$MODPATH$bindir/sqlite3.x64" "$MODPATH$bindir/sqlite3.x86"

ui_print "[2/3] Restoring necessary binary file to $MODPATH$bindir/sqlite3"
mv -f "$MODPATH$bindir/sqlite3.keep" "$MODPATH$bindir/sqlite3"
set_perm "$MODPATH$bindir/sqlite3" 0 0 0755

ui_print "[3/3] Installed to $bindir"

set_perm_recursive $MODPATH 0 0 0755 0755
