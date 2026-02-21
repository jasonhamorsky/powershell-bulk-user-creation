# PowerShell Bulk Local User Creation

A PowerShell automation project that creates local Windows users from a CSV file with full logging, error handling, and validation.  
This project is part of my MSSA Cloud Administrator portfolio and demonstrates practical scripting, automation, and troubleshooting skills.

---

## 🚀 Overview

This script automates the creation of local Windows user accounts using data from a CSV file.  
It performs:

- CSV validation  
- User existence checks  
- Secure password conversion  
- Local user creation  
- Group assignment  
- Logging of all actions and errors  

This mirrors real-world IT automation tasks used in endpoint administration and identity management.

---

## 📁 Project Structure

---

## 📄 CSV Format

The script expects a CSV file with the following columns:

---

## 🛠 How the Script Works

1. Validates that the CSV file exists  
2. Imports user data  
3. Loops through each user  
4. Checks if the account already exists  
5. Creates the local user  
6. Adds the user to a local group  
7. Logs all actions to a log file  

---

## 📸 Screenshots

Screenshots of the script running successfully are stored in the `/images` folder.

---

## 🧪 Lessons Learned

- Importance of logging and error handling  
- How to structure a PowerShell script into logical sections  
- How to debug syntax issues (missing braces, variable scope, etc.)  
- How to validate results using `Get-LocalUser` and log files  

---

## 🔧 Next Enhancements

- Add random password generation  
- Add password complexity validation  
- Add dry-run mode (simulate without creating users)  
- Add cleanup script to remove test accounts  
- Add color-coded console output  
- Add support for Active Directory user creation (future project)

---

## 📚 Purpose of This Project

This project demonstrates:

- Practical PowerShell automation  
- Ability to build and debug scripts  
- Understanding of identity and endpoint administration  
- Real-world IT workflow documentation  
- GitHub project organization  
