<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Darya Murha
    LinkedIn        : www.linkedin.com/in/darya-cybersec
    GitHub          : https://github.com/Darya-cybersec
    Date Created    : 2025-25-15
    Last Modified   : 2025-25-15
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

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

# Create the policy key (if it doesn’t exist)
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
New-Item -Path $RegPath -Force | Out-Null

# Set it to exactly 32768 (32 MB)
New-ItemProperty -Path $RegPath -Name "MaxSize" -PropertyType DWord -Value 32768 -Force | Out-Null

# Verify the setting
Get-ItemProperty -Path $RegPath -Name "MaxSize" | Select-Object MaxSize
