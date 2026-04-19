# M365 SharePoint Provisioning & QA Automation Framework

This project simulates enterprise SharePoint Online provisioning workflows with built-in QA validation using PowerShell and JSON templates.

It is designed to model how organizations automate, test, and validate SharePoint environments at scale.

---

## Overview

This framework automates:

- SharePoint site provisioning
- Document library creation
- Permission assignment
- Metadata configuration

It also introduces a **QA validation layer** to verify deployments after provisioning.

---

## QA Validation Features

The project includes validation scripts that simulate real-world QA testing:

- ✔ Site existence validation  
- ✔ Document library verification  
- ✔ User and access validation  
- ✔ Permission group auditing  
- ✔ Multi-scenario testing support  

---

## Technologies Used

- PowerShell (PnP / SPO modules)
- SharePoint Online
- JSON configuration templates
- Script-based automation

---

## Project Structure
scripts/ # Provisioning automation logic
validation/ # QA validation scripts
tests/ # Test cases and QA scenarios
logs/ # Execution logs
templates/ # JSON provisioning templates
input/ # Request input data
output/ # Provisioning output results
docs/ # Supporting documentation


---

## How to Run

## 1. Connect to SharePoint

```powershell
Connect-SPOService -Url https://your-tenant-admin.sharepoint.com
Connect-PnPOnline -Url https://your-site-url -UseWebLogin
---
## 2. Run Provisioning script
./scripts/main.ps1
___
## 3. Run Validation Scripts
./validation/validate-site.ps1 -siteUrl "https://your-site-url"
./validation/validate-permissions.ps1 -siteUrl "https://your-site-url"

---
## 4. Sample Output
PASS: Site exists
PASS: Document library exists
INFO: Users found: 12
PASS: Permission groups validated


---

## Key Value

This project demonstrates:

- Automation of SharePoint provisioning workflows  
- QA validation of cloud environments  
- PowerShell scripting in enterprise M365 environments  
- Real-world testing and verification practices  

---

## Author

Built by Monk881 to simulate enterprise-grade SharePoint provisioning and QA validation workflows.









