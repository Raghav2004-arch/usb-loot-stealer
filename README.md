# 🧠 USB Loot Script (Educational Project)

> ⚠️ **Ethical Hacking Project – For Educational Use Only**  
> Do not use without explicit permission. This project is intended for Red Team labs, demos, or educational environments.

## 📂 What It Does

- Detects USB drive (`/media/$USER/dicky`)
- Copies `.pdf`, `.docx`, `.jpg` from user's:
  - Documents
  - Downloads
  - Desktop
  - Pictures
- Copies `.bash_history`
- Compresses and logs the loot silently

## 🚀 How to Use

1. Label your USB as `dicky`
2. Save `steal.sh` to the USB root
3. Make it executable:
   ```bash
   chmod +x steal.sh
# usb-loot-stealer
