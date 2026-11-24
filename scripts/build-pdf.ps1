$ErrorActionPreference = 'Stop'

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$outputDirectory = Join-Path $repositoryRoot 'output'
$outputFile = Join-Path $outputDirectory 'booklet.pdf'

New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null

Push-Location $repositoryRoot
try {
    & pandoc --defaults 'pdf/booklet.yaml' --output $outputFile
    if ($LASTEXITCODE -ne 0) {
        throw "Pandoc failed with exit code $LASTEXITCODE."
    }
}
finally {
    Pop-Location
}
