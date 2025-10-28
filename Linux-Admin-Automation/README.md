# 🐧 Linux Admin Task Automation

This project automates **common system administration tasks** on Linux using **Bash scripts**.  
It helps system administrators save time, reduce manual errors, and ensure smooth system operations by automating repetitive maintenance tasks.

---

## ⚙️ Automated Tasks

1. 🧹 **Log Cleanup**  
   Automatically delete outdated log files to free up disk space.

2. 💾 **Directory Backup**  
   Back up important directories in a compressed format to prevent data loss.

3. 🔄 **System Updates**  
   Keep the system up-to-date by automating package updates and upgrades.

4. 💿 **Disk Monitoring**  
   Monitor disk usage and send alerts before running out of space.

5. 🧰 **Service Health Check**  
   Check the status of critical services and automatically restart them if they fail.

---

💻 Tech Stack
Operating System: Linux (Ubuntu/Debian)

Language: Bash Shell Scripting

Core Utilities:

find — delete old logs

tar — compress backups

apt — update & upgrade packages

df, awk, sed — monitor disk usage

systemctl — manage and check services

mail — send email alerts

cron — schedule automation tasks

Privileges: Root or sudo access for administrative commands

📁 Project Structure
bash
Copy code
linux-admin-automation/
│
├── cleanup_logs.sh       # Deletes old log files
├── backup_data.sh        # Creates compressed backups
├── update_system.sh      # Updates and upgrades packages
├── monitor_disk.sh       # Monitors disk usage and sends alerts
├── check_services.sh     # Checks and restarts critical services
├── crontab-setup.txt     # Example cron job configurations
└── README.md             # Project documentation

👩‍💻 Author
Ritej Mule - DevOps Fresher
📧 Email: ritejmule2612@gmail.com
💼 Portfolio: https://ritejportfolio.kesug.com
