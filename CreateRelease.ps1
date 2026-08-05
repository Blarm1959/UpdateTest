<#
    UpdateTest Release Creator

    Thin wrapper around the generic ProjectCreateRelease tool.
#>

[CmdletBinding()]
param(
    [switch]$Minor,
    [switch]$Major,
    [string]$Version,
    [switch]$NoZip,
    [switch]$ZipOnly,
    [string]$Output,
    [switch]$DryRun,
    [switch]$Force,
    [switch]$Verbose
)

$Tool = Join-Path $PSScriptRoot "..\PowerShellTools\Project\Release\ProjectCreateRelease.ps1"

& $Tool `
    -Minor:$Minor `
    -Major:$Major `
    -Version $Version `
    -NoZip:$NoZip `
    -ZipOnly:$ZipOnly `
    -Output $Output `
    -DryRun:$DryRun `
    -Force:$Force `
    -Verbose:$Verbose