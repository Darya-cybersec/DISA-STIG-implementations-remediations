
<#
.SYNOPSIS
    This PowerShell script disables Microsoft Consumer Experiences to prevent the automatic installation of suggested apps and notifications, helping organizations maintain controlled application execution in compliance with DISA STIG WN10-CC-000197.
    
.NOTES
    Author          : Darya Murha
    LinkedIn        : www.linkedin.com/in/darya-cybersec
    GitHub          : https://github.com/Darya-cybersec
    Date Created    : 2025-17-12
    Last Modified   : 2025-17-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000197

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000197).ps1 

    #>

   # STEP 1: Ensure PowerShell is running as Administrator 
   if (-not ([Security.Principal.WindowsPrincipal] 
   [Security.Principal.WindowsIdentity]::GetCurrent()
   ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { 
   Write-Error "Please run PowerShell as Administrator." 
   exit 1 } 
   
   # STEP 2: Set registry path 
   $RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" 
   
   # STEP 3: Create key if missing 
   New-Item -Path $RegPath -Force | Out-Null 
   
   # STEP 4: Set the exact DWORD Tenable checks
   New-ItemProperty 
    -Path $RegPath 
    -Name "DisableWindowsConsumerFeatures" 
    -PropertyType DWord 
    -Value 1 
    -Force | Out-Null 
    
   # STEP 5: Verify 
   Get-ItemProperty -Path $RegPath -Name
   "DisableWindowsConsumerFeatures" | Select-Object 
   DisableWindowsConsumerFeatures 
   
   # STEP 6: Refresh policy 
   gpupdate /force | Out-Null Write-Host "Done. Reboot if Tenable still reports failed, then rescan."
