
<#
.SYNOPSIS
    This PowerShell script enables logging of command-line arguments for process creation events to enhance auditing and forensic visibility, improving the ability to detect, analyze, and investigate malicious activity in compliance with DISA STIG WN10-CC-000066.
    
.NOTES
    Author          : Darya Murha
    LinkedIn        : www.linkedin.com/in/darya-cybersec
    GitHub          : https://github.com/Darya-cybersec
    Date Created    : 2025-16-12
    Last Modified   : 2025-16-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000066

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000066).ps1 

    #>

  # STEP 1: Confirm the script is running as Administrator (required to write to HKLM)
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Please run PowerShell as Administrator."
    exit 1
}

# STEP 2: Define the registry path for the Audit policy key
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"

# STEP 3: Create the registry key if it does not already exist
# -Force prevents errors if the key already exists
New-Item -Path $RegPath -Force | Out-Null

# STEP 4: Set the required value to enable command-line logging for process creation events
# 1 = Enabled (include command line data)
New-ItemProperty `
    -Path $RegPath `
    -Name "ProcessCreationIncludeCmdLine_Enabled" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

# STEP 5: Verify the setting was applied (should output ProcessCreationIncludeCmdLine_Enabled : 1)
Get-ItemProperty -Path $RegPath -Name "ProcessCreationIncludeCmdLine_Enabled"

# STEP 6: Refresh Group Policy to apply immediately 
gpupdate /force | Out-Null
Write-Host "Applied ProcessCreationIncludeCmdLine_Enabled = 1. If a scanner still flags it, reboot the system."


