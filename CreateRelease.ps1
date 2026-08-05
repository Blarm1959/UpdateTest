<#
.SYNOPSIS
    Project Release Creator

.DESCRIPTION
    Thin wrapper around the generic
    ProjectCreateRelease.ps1 tool.

    All release creation logic resides in the generic tool.

.NOTES
    This file should remain intentionally small.
#>

[CmdletBinding(SupportsShouldProcess = $false)]
param
(
    [switch]$Minor,

    [switch]$Major,

    [string]$Version,

    [switch]$NoZip,

    [switch]$ZipOnly,

    [string]$Output,

    [switch]$DryRun,

    [switch]$Force
)

$ToolPath = Join-Path `
    -Path $PSScriptRoot `
    -ChildPath "..\PowerShellTools\Project\Release\ProjectCreateRelease.ps1"

if (-not (Test-Path -LiteralPath $ToolPath -PathType Leaf))
{
    Write-Host ""
    Write-Host "[FAIL] ProjectCreateRelease.ps1 not found." -ForegroundColor Red
    Write-Host "       Expected:"
    Write-Host "       $ToolPath"
    exit 1
}

& $ToolPath `
    -ProjectFolder $PSScriptRoot `
    -Minor:$Minor `
    -Major:$Major `
    -Version $Version `
    -NoZip:$NoZip `
    -ZipOnly:$ZipOnly `
    -Output $Output `
    -DryRun:$DryRun `
    -Force:$Force

exit $LASTEXITCODE