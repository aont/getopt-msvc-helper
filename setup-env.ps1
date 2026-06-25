# Configure the current PowerShell session so MSVC can find getopt-msvc-helper.
# Run from PowerShell with:
#   .\setup-env.ps1

$ErrorActionPreference = 'Stop'

$ProjectRoot = $PSScriptRoot
$IncludePath = Join-Path $ProjectRoot 'include'
$LibPath = Join-Path $ProjectRoot 'lib'

function Add-PathEntry {
    param(
        [Parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string]$CurrentValue,

        [Parameter(Mandatory = $true)]
        [string]$Entry
    )

    $parts = @()
    if (-not [string]::IsNullOrWhiteSpace($CurrentValue)) {
        $parts = $CurrentValue -split ';' | Where-Object { $_ -ne '' }
    }

    if ($parts -contains $Entry) {
        return ($parts -join ';')
    }

    if ($parts.Count -eq 0) {
        return $Entry
    }

    return (($parts + $Entry) -join ';')
}

$env:INCLUDE = Add-PathEntry -CurrentValue $env:INCLUDE -Entry $IncludePath
$env:LIB = Add-PathEntry -CurrentValue $env:LIB -Entry $LibPath

Write-Host "INCLUDE contains: $IncludePath"
Write-Host "LIB contains: $LibPath"
