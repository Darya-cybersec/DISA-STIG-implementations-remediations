
<#
.SYNOPSIS
    This PowerShell script disables AutoPlay for non-volume devices to prevent automatic execution of potentially malicious content when removable media is connected, ensuring compliance with DISA STIG WN10-CC-000180.
    
.NOTES
    Author          : Darya Murha
    LinkedIn        : www.linkedin.com/in/darya-cybersec
    GitHub          : https://github.com/Darya-cybersec
    Date Created    : 2025-17-12
    Last Modified   : 2025-17-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000180

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000180).ps1 

    #>
# STEP 1: Confirm the script is running as Administrator (required to write to HKLM)
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Please run PowerShell as Administrator."
    exit 1
}

# STEP 2: Define the registry path for the Windows Explorer policy key
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"

# STEP 3: Create the registry key if it does not already exist
# -Force prevents errors if the key already exists
New-Item -Path $RegPath -Force | Out-Null

# STEP 4: Define the policy value name and required value data (1 = Enabled)
# IMPORTANT: Replace this with the exact value name from your STIG finding if different
$ValueName = "NoAutoplayfornonVolume"
$ValueData = 1

# STEP 5: Create or update the DWORD value to the required setting
New-ItemProperty `
    -Path $RegPath `
    -Name $ValueName `
    -PropertyType DWord `
    -Value $ValueData `
    -Force | Out-Null

# STEP 6: Verify the setting was applied (should output the value as 1)
Get-ItemProperty -Path $RegPath -Name $ValueName

# STEP 7: Refresh Group Policy to apply immediately
gpupdate /force | Out-Null
Write-Host "Applied $ValueName = $ValueData. If the UI/policy doesn't reflect immediately, log off/on or reboot."
