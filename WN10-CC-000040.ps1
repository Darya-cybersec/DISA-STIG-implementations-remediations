
<#
.SYNOPSIS
    This PowerShell script disables insecure guest logons to ensure that access to shared resources requires authentication, preventing unauthenticated access and ensuring compliance with DISA STIG WN10-CC-000040.
    
.NOTES
    Author          : Darya Murha
    LinkedIn        : www.linkedin.com/in/darya-cybersec
    GitHub          : https://github.com/Darya-cybersec
    Date Created    : 2025-16-12
    Last Modified   : 2025-16-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000040

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000040).ps1 
#>
# STEP 1: Confirm the script is running as Administrator (required to write to HKLM)
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Please run PowerShell as Administrator."
    exit 1
}

# STEP 2: Define the registry path for the LanmanWorkstation policy key
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation"

# STEP 3: Create the registry key if it does not already exist
# -Force prevents errors if the key already exists
New-Item -Path $RegPath -Force | Out-Null

# STEP 4: Set the required policy value to disable insecure guest logons
# AllowInsecureGuestAuth = 0 disables insecure guest authentication
New-ItemProperty `
    -Path $RegPath `
    -Name "AllowInsecureGuestAuth" `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

# STEP 5: Verify the setting was applied (should output AllowInsecureGuestAuth : 0)
Get-ItemProperty -Path $RegPath -Name "AllowInsecureGuestAuth"

# STEP 6: Refresh Group Policy to apply immediately 
gpupdate /force | Out-Null
Write-Host "Applied AllowInsecureGuestAuth = 0. If a scanner still flags it, reboot the system."

