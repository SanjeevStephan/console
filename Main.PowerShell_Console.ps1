#>
# Fetch Current Script Name
$SCRIPT_NAME = $MyInvocation.MyCommand.Name 

$CONSOLE_MAIN = $env:sample_console
$CONSOLE_HOME_DIR = $CONSOLE_MAIN.Split($SCRIPT_NAME)[0]

$CONSOLE_JSON = ReadJson("console.json")
$MENU_JSON = ReadJson("$($CONSOLE_JSON.data.path)\$($CONSOLE_JSON.data.json.menu)")

$CONSOLE_JSON_FILE = $CONSOLE_JSON.info.json
$CONSOLE_SCRIPT = "$($CONSOLE_HOME_DIR)\$($CONSOLE_JSON.info.script)"
$CONSOLE_SCRIPT_File = Split-Path -Leaf $CONSOLE_SCRIPT
 
function ReadJson($JsonFile) { $data = Get-Content -Raw "$($CONSOLE_HOME_DIR)\$JsonFile" | ConvertFrom-Json; return $data}
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



