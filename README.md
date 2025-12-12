# DISA-STIG-implementations-remediations

![image alt](https://github.com/Darya-cybersec/DISA-STIG-implementations-remediations/blob/27441b18f2a489ab9d1be3836b252417cd99adff/1693893578626.jpeg)

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


## Remediation Workflow

-* Scan the system with Tenable Nessus STIG policy.
-* Identify failed STIG items.
* 1. Remediate using PowerShell scripts or manual steps.
* 1. Verify success by rescanning.
