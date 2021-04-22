# Add-Readme module
Module creates README.md files.

## Syntax
```PowerShell
Add-Readme [[-FileName] <string>] [[-Content] <string>] [-Edit] [-NoLog]  [<CommonParameters>]
```

### FileName
``` -FileName ``` Specify the filename.
Set to ``` README.md ```

### Content
``` -Content ``` Specify content to redirect to the ``` .md ``` file.
Set to ``` $null ```

### Edit
``` -Edit ``` When set to true, opens ``` .md ``` file in notepad.
Set to ``` $false ```

### NoLog
``` -NoLog ``` When set to true, doesn't display log:
```
[<time>] Created file '<filepath>\<filename>.md'
```
Set to ``` $false ```

## Dependencies
This Module depends on [SmartLogging Module by Manuel][smartlog].

[smartlog]: https://www.powershellgallery.com/packages/SmartLogging/1.1.4
