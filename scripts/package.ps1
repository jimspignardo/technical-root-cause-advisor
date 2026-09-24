$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$manifest = Get-Content -Raw (Join-Path $root 'manifest.json') | ConvertFrom-Json
$files = [System.Collections.Generic.HashSet[string]]::new()
[void]$files.Add('manifest.json')

function Add-PackageFile([string]$relative) {
    if ([IO.Path]::IsPathRooted($relative) -or $relative -match '(^|[/\\])\.\.([/\\]|$)') {
        throw "Unsafe package path: $relative"
    }
    if (-not (Test-Path -LiteralPath (Join-Path $root $relative) -PathType Leaf)) {
        throw "Missing package file: $relative"
    }
    [void]$files.Add($relative)
}

foreach ($icon in @($manifest.icons.color, $manifest.icons.outline)) {
    Add-PackageFile $icon
    $bytes = [IO.File]::ReadAllBytes((Join-Path $root $icon))
    if ($bytes.Length -lt 8 -or [BitConverter]::ToString($bytes[0..7]) -ne '89-50-4E-47-0D-0A-1A-0A') {
        throw "Invalid PNG: $icon"
    }
}
if (-not $manifest.copilotAgents.declarativeAgents) { throw 'No declarative agents found.' }
foreach ($reference in $manifest.copilotAgents.declarativeAgents) {
    Add-PackageFile $reference.file
    $definition = Get-Content -Raw (Join-Path $root $reference.file) | ConvertFrom-Json
    if (-not $definition.instructions) { throw 'Agent instructions are empty.' }
    if ($definition.id -ne $reference.id) { throw 'Agent identifiers do not match.' }
    foreach ($skill in $definition.agent_skills) {
        $relative = "$($skill.folder)/SKILL.md"
        Add-PackageFile $relative
        $content = Get-Content -Raw (Join-Path $root $relative)
        $name = ($skill.folder -split '/')[-1]
        if ($content -notmatch "(?m)^name: $([regex]::Escape($name))\s*$") {
            throw "Skill name does not match folder: $relative"
        }
    }
}
$destination = Join-Path $root 'dist'
New-Item -ItemType Directory -Force -Path $destination | Out-Null
$archivePath = Join-Path $destination 'technical-root-cause-advisor.zip'
$stream = [IO.File]::Open($archivePath, [IO.FileMode]::Create)
$archive = [IO.Compression.ZipArchive]::new($stream, [IO.Compression.ZipArchiveMode]::Create)
try {
    foreach ($relative in ($files | Sort-Object)) {
        [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, (Join-Path $root $relative), $relative.Replace('\', '/')) | Out-Null
    }
} finally {
    $archive.Dispose()
    $stream.Dispose()
}
Write-Host "Validated and packaged $($files.Count) files: $archivePath"
