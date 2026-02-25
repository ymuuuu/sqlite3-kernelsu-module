#!/system/bin/sh
MODDIR=${0%/*}

# Install sqlite3 directly into KernelSU's bin directory which is always
# present in the su PATH — no overlayfs or metamodule required.
KSU_BIN=/data/adb/ksu/bin

mkdir -p "$KSU_BIN"
cp -f "$MODDIR/system/bin/sqlite3" "$KSU_BIN/sqlite3"
chmod 755 "$KSU_BIN/sqlite3"
chown 0:0 "$KSU_BIN/sqlite3"
