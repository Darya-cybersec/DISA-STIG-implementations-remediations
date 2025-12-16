<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 1024000 KB (1000 MB).

.NOTES
    Author          : Darya Murha
    LinkedIn        : www.linkedin.com/in/darya-cybersec
    GitHub          : https://github.com/Darya-cybersec
    Date Created    : 2025-16-12
    Last Modified   : 2025-16-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Create the Registry Path 

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"
New-Item -Path $RegPath -Force | Out-Null

# Set the Required Registry Value (1,024,000 KB)

New-ItemProperty `
  -Path $RegPath `
  -Name "MaxSize" `
  -PropertyType DWord `
  -Value 1024000 `
  -Force | Out-Null

# Verify the Configuration

Get-ItemProperty -Path $RegPath -Name "MaxSize"
