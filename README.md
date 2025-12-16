# DISA-STIG-implementations-remediations

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/2cbeecb7-c2ef-4ada-afc3-f81c5bb5bcec" />

**DISA STIG** stands for Defense Information Systems Agency Security Technical Implementation Guide. It is a set of technical guidelines that organizations can use to configure their information systems in a secure manner. STIGs are developed by the Defense Information Systems Agency (DISA), an agency of the United States Department of Defense.

**The benefits of implementing DISA STIGs include:**

* Increased security: STIGs help to reduce the risk of unauthorized access, modification, or destruction of sensitive information. This is done by providing specific instructions on how to configure information systems to mitigate known security risks.
* Compliance: Many organizations are required to comply with specific security standards, such as the Federal Information Security Management Act (FISMA). STIGs can help organizations to demonstrate compliance with these standards by providing a comprehensive set of security controls.
* Reduced risk of liability: By implementing STIGs, organizations can reduce their risk of being held liable for data breaches or other security incidents. This is because STIGs can help to show that the organization took reasonable steps to protect its information systems.
* Improved efficiency: STIGs can help organizations to improve their efficiency by providing a standardized approach to security configuration. This can help to reduce the time and resources required to manage security.

## High-Priority STIG Controls

This table briefly lists my top priority controls (based on severity, exploitability, and minimal user disruption). Each links to a more detailed page in the `docs/` folder.

| STIG ID(s)                      | Summary                                                 | Link                                                         |
|---------------------------------|---------------------------------------------------------|--------------------------------------------------------------|
| WN10-AU-000500 / -000505 / -000510  | Increase event log sizes to meet STIG thresholds        | *[Event Log Sizes](./docs/STIG-EventLogSizes.md)*             |
| WN10-00-000155                  | Disable Windows PowerShell 2.0                          | *[Disable PS2](./docs/STIG-DisablePS2.md)*                                       |
| WN10-AC-000005 / -000010 / -000015 | Enforce account lockout policy (3 attempts, 15 min lock) | *[Account Lockout](./docs/STIG-AccountLockout.md)*                                    |
| WN10-AC-000035 / -000040        | Require 14+ character passwords and enable complexity      | *[Password Complexity](./docs/STIG-PasswordComplexityRemediation.md)*                                       |
| WN10-CC-000180 / -000185 / -000190 | Disable AutoPlay/AutoRun for all drives               | *[Disable AutoPlay](./docs/STIG-DisableAutoPlay.md)*                                       |
| WN10-00-000145                  | Enable Data Execution Prevention (DEP) in “OptOut” mode | *[Configure DEP](./docs/STIG-ConfigureDEP.md)*                                       |
| WN10-CC-000038                  | Disable WDigest authentication                          | *[Disable WDigest](./docs/STIG-DisableWDigest.md)*                                       |
| WN10-00-000175                  | Disable Secondary Logon Service                         | *[Disable Secondary Logon](./docs/STIG-DisableSecondaryLogon.md)*                |


<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/2cbeecb7-c2ef-4ada-afc3-f81c5bb5bcec" />


# Defense Information Systems Agency - Security Technical Implementation Guides (DISA - STIGs)

[STIG Remediation Template](https://github.com/behan101/DISA-STIGs/blob/main/stig_remediation_template.ps1)

**Windows 11 STIG Remediation Scripts:**

[WN11-AU-000050](https://github.com/behan101/DISA-STIGs/blob/main/WN11-AU-000050_Remediation_Script.ps1)

[WN11-CC-000005](https://github.com/behan101/DISA-STIGs/blob/main/WN11-CC-000005_Remediation_Script.ps1)

[WN11-CC-000090](https://github.com/behan101/DISA-STIGs/blob/main/WN11-CC-000090_Remediation_Script.ps1)

[WN11-CC-000315](https://github.com/behan101/DISA-STIGs/blob/main/WN11-CC-000315_Remediation_Script.ps1)

[WN11-EP-000310](https://github.com/behan101/DISA-STIGs/blob/main/WN11-EP-000310_Remediation_Script.ps1)

[WN11-CC-000197](https://github.com/behan101/DISA-STIGs/blob/main/WN11-CC-000197_Remediation_Script.ps1)

[WN11-SO-000220](https://github.com/behan101/DISA-STIGs/blob/main/WN11-SO-000220_Remediation_Script.ps1)

[WN11-SO-000230](https://github.com/behan101/DISA-STIGs/blob/main/WN11-SO-000230_Remediation_Script.ps1)

[WN11-UR-000070](https://github.com/behan101/DISA-STIGs/blob/main/WN11-UR-000070_Remediation_Script.ps1)

[WN11-CC-000285](https://github.com/behan101/DISA-STIGs/blob/main/WN11-CC-000285_Remediation_Script.ps1)


##  Scenario

An internal audit has revealed that various Windows 11 machines have numerous failures in regards to Windows Compliance Checks. I have been tasked to remediate these vulnerabilities using automation and confirm that the STIG has been successfully implemented.

###  Discovery

- Scan the virtual machine associated with the Windows Compliance Check failures using tenable.
- Select Audits and discover the STIG-ID associated with the failure.
- Research remediation for the STIG-ID.

---

## Steps Taken

### 1. Perform a vulnerability scan using Tenable using the Windows Compliance Checks.
<img width="1557" height="908" alt="image" src="https://github.com/user-attachments/assets/a8dbe6c2-0469-466e-8563-65045d4a9ec7" />

---

### 2. Searched the STIG-ID using Tenable Audits.

Searched for `STIG-ID` within the Tenable Audits database (https://www.tenable.com/audits).


---

### 3. Researched the solution.

After searching for the specified STIG-ID within the Tenable Audit database, the solution to remediate the vulnerbility was given in steps. 

---

### 4. Used the Stig Remediation Template to write a PowerShell script solution.

---

### 5. Using PowerShell ISE, I began the process of testing and executing the script.

---

### 6. Remediation Validation post PowerShell Script execution.

**Remediation Validation:**

After executing the script, I validate the changes by finding the policy on the Windows machine and checking the values. I then scanned the machine using Tenable again and checked the results with the STIG-ID remediated in the script. When the scan results did not have the STIG-ID as a failure for compliance, I confirmed that the vulnerability has been remediated.

---

## Summary

The vulnerability with the associated STIG-ID has been identified using Tenable. The scan was configured internally on the Local-Scan-Engine-01 with the target specified as the private IP address of the virtual machine. Administrative credentials were given so that the scan would be thorough. The compliance audit used in the scan was configured to the appropriate operating system and version (DISA Microsoft Windows 11 STIG v2r4). All plugins were disabled with the exception of the Windows Compliance Checks (Plugin ID: 24760) in order to expedite the scanning process and reduce resource consumption. The identified STIG-ID compliance failure was then remediated using PowerShell scripting and the `STIG Remediation Template` . After the script executed, the remediation validation process began with looking up the policy configuration in the Registry Editor of the machine. The machine was then restarted before another scan was conducted using the same parameters in Tenable. The results were confirmed to have passed the compiance check associated with the STIG-ID.

---

## Response Taken

The InfoSec / SecOps department was then notified and sent the documentation and scripts for review and deployment.

---

## Remediation Workflow

* Scan the system with Tenable Nessus STIG policy.
* Identify failed STIG items.
* Remediate using PowerShell scripts or manual steps.
* Verify success by rescanning.
