<h1 align="center">💀 USB Loot Stealer — "Daddy's Home" Edition</h1>

<p align="center">
  <img src="assets/butcher.png" width="450" alt="Billy Butcher Hacker">
</p>

<p align="center"><strong>🧠 Educational Red Team USB Payload Tool</strong><br>
Auto-loots sensitive files from a Linux system and speaks like <b>Billy Butcher</b>. 
</p>

---

## 🎤 Dramatic Voice Command

> **"Don't worry. Daddy's home."**  
> &nbsp;&nbsp;&nbsp;&nbsp;— _Billy Butcher (espeak voice intro)_

This tool doesn't just copy files.  
It **announces itself with a British gangster voice**, plays a system beep, and then **stealthily sweeps your system** like a ghost in the machine.

---

## ⚙️ What It Does

✅ Detects inserted USB drive by label (`new`)  
✅ Finds the real logged-in username  
✅ Copies sensitive files:
- `.pdf`, `.docx`, `.jpg` from Documents, Desktop, Downloads, Pictures  
- `.bash_history` for shell command trails  
✅ Logs activity to `steal.log`  
✅ Compresses all loot into a `.tar.gz` archive  
✅ Plays a bold TTS voice using `espeak`  
✅ Deletes uncompressed files after packing

---

## 📸 Demo Screenshot

```bash
==============================
 🔊 Initiating Data Extraction
==============================
🗣️ "Don't worry. Daddy's home."
🔔 *System beep*
✅ Stealing files from /home/user...
✅ Archiving and cleanup...
