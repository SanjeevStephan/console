# Add the Path of the Console Menu in the Environment-Variables such that when you type in the terminal.
# It Should Display Back the Path of the Console

<#

┌──(superuser㉿192.168.29.218)-[C:\Users\Samst]
└─$ PS>echo $env:sample_console
C:\Users\Samst\OneDrive\Documents\GitHub\console\Sample.PowerShell_CONSOLE_MAIN.ps1

#>
# Fetch Current Script Name
$SCRIPT_NAME = $MyInvocation.MyCommand.Name 

$CONSOLE_MAIN = $env:sample_console
$CONSOLE_HOME_DIR = $CONSOLE_MAIN.Split($SCRIPT_NAME)[0]
$CONSOLE_JSON = Get-Content -Raw "$($CONSOLE_HOME_DIR)\console.json" | ConvertFrom-Json
$CONSOLE_JSON_FILE = $CONSOLE_JSON.info.json
$CONSOLE_SCRIPT = "$($CONSOLE_HOME_DIR)\$($CONSOLE_JSON.info.script)"
$CONSOLE_SCRIPT_File = Split-Path -Leaf $CONSOLE_SCRIPT

function GetFullPath($pathPointerFromConfigFile) { return "$CONSOLE_HOME_DIR$pathPointerFromConfigFile" }
$CONSOLE_ASCII = GetFullPath($CONSOLE_JSON.info.ascii)


# Verify 'ctperuser.ps1' exists on the path '$env:ctperuser'
if(Test-Path $CONSOLE_MAIN) 
{
    Write-Host "[ Found ] $CONSOLE_MAIN" -ForegroundColor Black -BackgroundColor Green 
    type $CONSOLE_ASCII
    Write-Host "├────$SCRIPT_NAME" -ForegroundColor White
#  Write-Host "Microsoft.PowerShell_profile.ps1"

    . $CONSOLE_SCRIPT
} 
else { Write-Host "[ MISSING ] $SCRIPT_NAME at $CONSOLE_MAIN" -ForegroundColor Black -BackgroundColor Red }

Write-Host "└────────[ Status ]  Script Terminated -> $SCRIPT_NAME " -ForegroundColor Cyan
