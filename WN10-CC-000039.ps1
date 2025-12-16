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
    STIG-ID         : WN10-CC-000039

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000039).ps1 
#>

# STEP 1: Confirm the script is running as Administrator (required to write to HKLM)

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Please run PowerShell as Administrator."
    exit 1
}

# STEP 2: Define the list of registry keys that must be configured
$Keys = @(
    "HKLM:\SOFTWARE\Classes\batfile\shell\runasuser",
    "HKLM:\SOFTWARE\Classes\cmdfile\shell\runasuser",
    "HKLM:\SOFTWARE\Classes\exefile\shell\runasuser",
    "HKLM:\SOFTWARE\Classes\mscfile\shell\runasuser"
)

# STEP 3: Define the required DWORD value (4096 / 0x00001000)
$ValueName = "SuppressionPolicy"
$ValueData = 4096

# STEP 4: Create each key if missing, then create/update the DWORD value to the required setting
foreach ($Key in $Keys) {

    # STEP 4a: Ensure the registry path exists (create it if it doesn't)
    New-Item -Path $Key -Force | Out-Null

    # STEP 4b: Create or update the required DWORD value
    New-ItemProperty -Path $Key -Name $ValueName -PropertyType DWord -Value $ValueData -Force | Out-Null
}

# STEP 5: Verify the values were applied (should show SuppressionPolicy : 4096 for each key)
Write-Host "Verification results (each should show SuppressionPolicy = 4096):"
foreach ($Key in $Keys) {
    $Result = Get-ItemProperty -Path $Key -Name $ValueName -ErrorAction SilentlyContinue
    "{0} -> {1} : {2}" -f $Key, $ValueName, ($Result.$ValueName)
}

