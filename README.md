# DISA-STIG-implementations-remediations
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/2cbeecb7-c2ef-4ada-afc3-f81c5bb5bcec" />


This project demonstrates the process of performing a **DISA STIG** compliance assessment on a Windows 10 virtual machine using Tenable Nessus. An initial STIG scan was conducted to identify failed security controls. Based on the scan results, PowerShell was used to remediate the failed STIG findings by applying secure configuration changes to the system. 

This project highlights hands-on experience with vulnerability scanning, STIG compliance, and Windows security hardening.

---

**DISA STIG** stands for Defense Information Systems Agency Security Technical Implementation Guide. It is a set of technical guidelines that organizations can use to configure their information systems in a secure manner. STIGs are developed by the Defense Information Systems Agency (DISA), an agency of the United States Department of Defense.

---

## The benefits of implementing DISA STIGs include:

* Increased security: STIGs help to reduce the risk of unauthorized access, modification, or destruction of sensitive information. This is done by providing specific instructions on how to configure information systems to mitigate known security risks.
* Compliance: Many organizations are required to comply with specific security standards, such as the Federal Information Security Management Act (FISMA). STIGs can help organizations to demonstrate compliance with these standards by providing a comprehensive set of security controls.
* Reduced risk of liability: By implementing STIGs, organizations can reduce their risk of being held liable for data breaches or other security incidents. This is because STIGs can help to show that the organization took reasonable steps to protect its information systems.
* Improved efficiency: STIGs can help organizations to improve their efficiency by providing a standardized approach to security configuration. This can help to reduce the time and resources required to manage security.

---

##  Scenario

An internal audit has revealed that various Windows 11 machines have numerous failures in regards to Windows Compliance Checks. I have been tasked to remediate these vulnerabilities using automation and confirm that the STIG has been successfully implemented.

---

##  Remediation Workflow

- Scan the virtual machine with a Windows 10 STIG Audit Policy using Tenable.
- View scan results in Audits tab and discover the STIG-ID associated with the failure.
- Research remediation for the STIG-ID.
- Implement the fix using PowerShell.
- Rescan to confirm the implementation success.

---

## Windows 10 STIG Remediation Scripts:

[WN10-AU-000050](https://github.com/Darya-cybersec/DISA-STIG-implementations-remediations/blob/main/WN10-AU-000500.ps1)  The Application event log size must be configured to 32768 KB or greater.

[WN10-AU-000005](https://github.com/Darya-cybersec/DISA-STIG-implementations-remediations/blob/main/WN10-AU-000505.ps1)  The Security event log size must be configured to 1024000 KB or greater.

[WN10-CC-000038](https://github.com/Darya-cybersec/DISA-STIG-implementations-remediations/blob/main/WN10-CC-000038.ps1)  WDigest Authentication must be disabled.

[WN10-CC-000039](https://github.com/Darya-cybersec/DISA-STIG-implementations-remediations/blob/main/WN10-CC-000039.ps1)  Run as different user must be removed from context menus.

[WN10-CC-000040](https://github.com/Darya-cybersec/DISA-STIG-implementations-remediations/blob/main/WN10-CC-000040.ps1)  Insecure logons to an SMB server must be disabled.

[WN10-CC-000066](https://github.com/Darya-cybersec/DISA-STIG-implementations-remediations/blob/main/WN10-CC-000066.ps1)  Command line data must be included in process creation events.

[WN10-CC-000180](https://github.com/Darya-cybersec/DISA-STIG-implementations-remediations/blob/main/WN10-CC-000180.ps1)  Autoplay must be turned off for non-volume devices.

[WN10-CC-000197](https://github.com/Darya-cybersec/DISA-STIG-implementations-remediations/blob/main/WN10-CC-000197.ps1)  Microsoft consumer experiences must be turned off.

[WN11-UR-000070](https://github.com/behan101/DISA-STIGs/blob/main/WN11-UR-000070_Remediation_Script.ps1)

[WN11-CC-000285](https://github.com/behan101/DISA-STIGs/blob/main/WN11-CC-000285_Remediation_Script.ps1)





