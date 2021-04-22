function Get-ItemInformation() {
param (
    [Parameter(Mandatory=$true)][string]$Item,
    [string]$Path = "."
)
$ItemFullPath = $Path + "\" + $Item
$ItemInfoObject = Get-Item $ItemFullPath
#If ($ItemInfoObject.Exists -ne $true) { exit }

$Attributes = $ItemInfoObject.Attributes

# Information if Item is a Directory
if ($Attributes -contains "Directory") { 
$information = Write-Colour -Text ( "---------------------------( Information )---------------------------" ) -Color DarkCyan
$information += Write-Colour -Text ( "`n" + "Item Name: " ), ( $ItemInfoObject.Name ) -Color Green, White
$information += Write-Colour -Text ( "`n" + "Directory: " ), ( ($ItemInfoObject.FullName).Replace($ItemInfoObject.Name,"~") ) -Color Green, White
$information += Write-Colour -Text ( "`n" + "Root: " ), ( $ItemInfoObject.Root.Name ) -Color Green, White
$information += Write-Colour -Text ( "`n" + "Contains .md: " ), ( Test-Path $ItemFullPath\*.md ) -Color Green, White

return $information
    }

# Information if Item does not contain Directory Attribute
if ($Attributes -notcontains "Directory") {
$information = "---------------------------( Information )---------------------------"



return $information
    }

}



function Get-Repository() {
param (
    [string]$Repository
)
$RepoPath = "$env:USERPROFILE\Documents\Repository\"

if ((Test-Path -Path $RepoPath) -eq $false ){md $RepoPath}

if ($Repository -ne "") { 
    if ( Test-Path $RepoPath/$Repository ) {     
    Get-ItemInformation -Item $Repository -Path $RepoPath


    } else { 
    Write-Colour -Text "Get-Repository: " -Color DarkCyan
    Write-Colour -Text "Error: ", "Repository not found" -Color Red, White 
    Write-Colour -Text "Repository: $Repository does not exist" -Color Yellow
    }
} else { Get-ChildItem -Path $RepoPath -Name -Directory }


}


function New-Repository() {
param ( 
    [Parameter(Mandatory=$true)][string]$RepositoryName,
    [switch]$OnBackground = $false,
    [string]$AddReadme = $true
)
$RepoPath = "$env:USERPROFILE\Documents\Repository\"

if ((Test-Path -Path $RepoPath) -eq $false ){md $RepoPath}

New-Item -Path $RepoPath -Name $RepositoryName -ItemType Directory > $null

say "Created Repository" "~($RepositoryName)~"

# Check if OnBackground is specified
if ($OnBackground -ne $true) {
    cd $RepoPath\$RepositoryName 
    if ($AddReadme) { Add-Readme -NoLog } 
    }


}

function Format-Repository() {
param (
    [Parameter(Mandatory=$true)][string]$RepositoryName,
    [Parameter(Mandatory=$true)][string]$DriveName
)
$RepoPath = "$env:USERPROFILE\Documents\Repository\"

if ((Test-Path -Path $RepoPath) -eq $false ){md $RepoPath}

$DriveRoot = $RepoPath + $RepositoryName

New-PSDrive -Name $DriveName -PSProvider FileSystem -Root $DriveRoot -Description "PSDrive for $RepositoryName"


}