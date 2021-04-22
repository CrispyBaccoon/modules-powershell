function Add-Readme() {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string] $FileName = 'README.md',

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Content = $null,

        [Parameter(ValueFromPipelineByPropertyName)]
        [switch] $Edit = $false,

        [Parameter(ValueFromPipelineByPropertyName)]
        [switch] $NoLog = $false
    )

    Begin {
        $lines = @()
    }

    Process {
        if (-not $Content) {
            $Content = @' 
'@
        }

        $lines += $Content
    }

    End {
        $path = (Get-Location)
        $filePath = Join-Path $path $FileName

        $utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($false)

        if ($lines -and $lines.Count -gt 1) {
            [System.IO.File]::WriteAllLines($filePath, $lines, $utf8NoBomEncoding) > $null
        } else {
            [System.IO.File]::WriteAllText($filePath, $lines, $utf8NoBomEncoding) > $null
        }

        if ($NoLog -ne $true) { Log info "Created file '${filePath}'" }

        if ($Edit) {
            $null = notepad.exe $filePath
        }
    }
}

function Edit-Readme() { Add-Readme -Edit }

New-Alias adr Add-Readme
New-Alias edr Edit-Readme