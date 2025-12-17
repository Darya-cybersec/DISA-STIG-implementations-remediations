
<#
.SYNOPSIS
    This PowerShell script disables Web Point-and-Print driver downloads to prevent printers from retrieving driver packages over HTTP, reducing the risk of unauthorized data transmission and uncontrolled updates in compliance with DISA STIG WN10-CC-000100.
    
.NOTES
    Author          : Darya Murha
    LinkedIn        : www.linkedin.com/in/darya-cybersec
    GitHub          : https://github.com/Darya-cybersec
    Date Created    : 2025-17-12
    Last Modified   : 2025-17-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000100

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000100).ps1 

    #>

# STEP 1: Ensure PowerShell is running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Please run PowerShell as Administrator."
    exit 1
}

# STEP 2: Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

# STEP 3: Create the registry key if it doesn't exist
New-Item -Path $RegPath -Force | Out-Null

# STEP 4: Create or update the required DWORD value to 1
New-ItemProperty `
  -Path $RegPath `
  -Name "DisableWebPnPDownload" `
  -PropertyType DWord `
  -Value 1 `
  -Force | Out-Null

# STEP 5: Verify the value was set correctly (should output 1)
Get-ItemProperty -Path $RegPath -Name "DisableWebPnPDownload" | Select-Object DisableWebPnPDownload

# STEP 6: Refresh Group Policy (recommended)
gpupdate /force | Out-Null
Write-Host "Applied DisableWebPnPDownload = 1. Reboot and rescan if your scanner still reports a finding."


