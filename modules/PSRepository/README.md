# PSRepository Module
Module adds support for "Repository" on your local computer.
The module creates, modifies and formats Repository directories on your local computer.

# Content
Functions:
* [Get-ItemInformation](#Get-ItemInformation)
* [Get-Repository](#Get-Repository)
* [New-Repository](#New-Repository)
* [Format-Repository](#Format-Repository) ``` Still buggy ```

# <a name="Get-ItemInformation"></a>Get-ItemInformation
## Syntax
```PowerShell
Get-ItemInformation [-Item] <string> [[-Path] <string>]  [<CommonParameters>]
```

### Item
``` -Item ``` Specify the Item.
Mandatory

### Path
``` -Path ``` Specify the Path.
Set to ``` . ```; (current path)

# <a name="Get-Repository"></a>Get-Repository
## Syntax
```PowerShell
Get-Repository [[-Repository] <string>]
```

### Repository
``` -Repository ``` Specify the Repository.
When this parameter isn't specified it will show all directories in the Repository Directory.

# <a name="New-Repository"></a>New-Repository
## Syntax
```PowerShell
New-Repository [-RepositoryName] <string> [[-AddReadme] <string>] [-OnBackground]  [<CommonParameters>]
```

### RepositoryName
``` -RepositoryName ``` Specify the RepositoryName.
Mandatory

### AddReadme
``` -AddReadme ``` When set to true, this will add a README.md file to the Repository.
Set to true

### OnBackground
``` -OnBackground ``` When set to true, this will block all feedback.
Set to ``` $false ```

# <a name="Format-Repository"></a>Format-Repository
## Syntax
```PowerShell
Format-Repository [-RepositoryName] <string> [-DriveName] <string>  [<CommonParameters>]
```

### RepositoryName
``` -RepositoryName ``` Specify the RepositoryName.
Mandatory

### DriveName
``` -DriveName ``` Specify the DriveName.
Mandatory

# Dependencies
This Module depends on [PSWriteColor][WriteColor], [PSInteraction][psinteraction] and [Add-Readme][addreadme].

[WriteColor]: https://www.powershellgallery.com/packages/PSWriteColor/0.87.3
[psinteraction]: https://crispybaccoon.github.io/modules-powershell/modules/PSInteraction/
[addreadme]: https://crispybaccoon.github.io/modules-powershell/modules/Add-Readme/
