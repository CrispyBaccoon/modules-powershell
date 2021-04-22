# Modules for PowerShell

## Installation
Download code inside the directory containing the .psd1 and .psm1 file:
```
___<modulename>
 \___<modulename>.psd1
  \__<modulename>.psm1
```

Move this directory to your Modules folder:
```PowerShell
"$env:windir\System32\WindowsPowerShell\v1.0\Modules\"
```
or
```PowerShell
"$env:USERPROFILE\Documents\WindowsPowerShell\Modules\"
```

Now open a new PowerShell terminal. Enter: ``` Get-Module ```, this should now display the module.
Else visit [the microsoft documentation][about_modules] for more information.

[about_modules]: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_modules?view=powershell-7.1
