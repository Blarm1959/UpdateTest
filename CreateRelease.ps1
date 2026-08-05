[CmdletBinding()]
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

$Tool = Join-Path `
    $PSScriptRoot `
    "..\PowerShellTools\Project\Release\ProjectCreateRelease.ps1"

& $Tool `
    -ProjectFolder $PSScriptRoot `
    -Minor:$Minor `
    -Major:$Major `
    -Version $Version `
    -NoZip:$NoZip `
    -ZipOnly:$ZipOnly `
    -Output $Output `
    -DryRun:$DryRun `
    -Force:$Force