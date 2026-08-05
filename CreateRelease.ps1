[CmdletBinding()]
param()

$ToolVersion = "1.0.0"

Write-Host ""
Write-Host "========================================================="
Write-Host " Blarm Generic Project Release Creator"
Write-Host " Version $ToolVersion"
Write-Host "========================================================="
Write-Host ""

$ProjectFolder = $PSScriptRoot

Write-Host "[ OK ] Project folder: $ProjectFolder"

$RequiredFiles = @(
    "release.json",
    "package.json",
    "build-info.json",
    "README.md"
)

foreach ($File in $RequiredFiles)
{
    $Path = Join-Path $ProjectFolder $File

    if (!(Test-Path $Path))
    {
        Write-Host "[FAIL] Missing required file: $File" -ForegroundColor Red
        exit 1
    }

    Write-Host "[ OK ] Found: $File"
}

try
{
    $Release = Get-Content (Join-Path $ProjectFolder "release.json") -Raw | ConvertFrom-Json
}
catch
{
    Write-Host "[FAIL] release.json is not valid JSON" -ForegroundColor Red
    exit 1
}

$Version = $null
if ($Release.release.version) { $Version = $Release.release.version }
elseif ($Release.version) { $Version = $Release.version }

if ([string]::IsNullOrWhiteSpace($Version))
{
    Write-Host "[FAIL] Could not determine current version from release.json" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Project : $($Release.project.name)"
Write-Host "Version : $Version"
Write-Host ""
Write-Host "[ OK ] Initial validation completed successfully."
