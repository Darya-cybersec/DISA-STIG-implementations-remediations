<#
.SYNOPSIS
    This PowerShell script disables WDigest authentication to prevent plaintext credentials from being stored in LSASS, mitigating the risk of credential theft and ensuring compliance with DISA STIG WN10-CC-000038.

.NOTES
    Author          : Darya Murha
    LinkedIn        : www.linkedin.com/in/darya-cybersec
    GitHub          : https://github.com/Darya-cybersec
    Date Created    : 2025-16-12
    Last Modified   : 2025-16-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000038

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000038).ps1 
#>

# STEP 1: Define the registry path for WDigest
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest"

# STEP 2: Create the registry key if it does not already exist
# -Force ensures no error if the key already exists
New-Item -Path $RegPath -Force | Out-Null


# STEP 3: Create or update the UseLogonCredential DWORD value
# Setting this value to 0 disables plaintext credential storage
New-ItemProperty `
    -Path $RegPath `
    -Name "UseLogonCredential" `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null


# STEP 4: Verify that the registry value was set correctly
# This should return: UseLogonCredential : 0
Get-ItemProperty -Path $RegPath -Name "UseLogonCredential"


# STEP 5: Inform the administrator that a reboot is required
Write-Host "WDigest configuration applied successfully."
Write-Host "A system reboot is required for the change to take full effect."


