# linux_ghidra_analysis.sh
DEV="/dev/sda"
EFI_PART="${DEV}1"
MOUNT="/mnt/windows"
PROJECT="/home/kali/projects/windows_analysis"
GHIDRA="/opt/ghidra/support/analyzeHeadless"

mkdir -p "$MOUNT" "$PROJECT"
mount -o ro "$DEV" "$MOUNT"
cp "$MOUNT/Windows/System32/drivers/rootkit.sys" "$PROJECT/"
cp "$MOUNT/EFI/Microsoft/Boot/bootmgfw.efi" "$PROJECT/"
umount "$MOUNT"

"$GHIDRA" "$PROJECT" windows_analysis \
    -import "$PROJECT/rootkit.sys" \
    -postScript AnalyzeDrivers.java \
    -scriptPath "/home/kali/scripts"

"$GHIDRA" "$PROJECT" uefi_analysis \
    -import "$PROJECT/bootmgfw.efi" \
    -postScript AnalyzeEFI.java \
    -scriptPath "/home/kali/scripts"
