param(
    [string]$index=0
)


$sno  = 0
$json_loop_menu = $MENU_JSON.menu[$index]

$SCRIPT_NAME = $MyInvocation.MyCommand.Name
$toal_menu_to_include = $json_loop_menu.Length - 1 
$no_of_time_script_called = 0

if($json_loop_menu -ne "empty")
{
    for ($i = 0; $i -le $toal_menu_to_include; $i++) 
    {
        $json_menu          = $json_loop_menu[$i].title
        $json_code          = $json_loop_menu[$i].code
        $json_menu_desc     = $json_loop_menu[$i].desc
        #$currentScriptFullPath = ReadJsonPath($pathFromJson)
        Write-Host "|    |          |       |    ├    ├──[ $json_code" -ForegroundColor Yellow -NoNewline
        Write-Host "$i ] $json_menu " -ForegroundColor Cyan -NoNewline
        Write-Host "-> $json_menu_desc" -ForegroundColor Cyan
        #  . $currentScriptFullPath # Loads the PowerSchell Scripts 
    }
    #    Write-Host "|    |          |       |         | " -ForegroundColor Cyan
         Write-Host "|    |          |       |    ├    └──[ PRESS ] Any json_code Numb From $json_code$sno to  $json_code$toal_menu_to_include " -ForegroundColor Yellow
         Write-Host "|    |          |       |    ├      " -ForegroundColor Cyan  
} else { Write-Host "Looking For [ superuser.ps1 ] at $ct" -ForegroundColor Red -BackgroundColor Black }



$no_of_time_script_called = $no_of_time_script_called + 1

if($no_of_time_script_called -ne $toal_menu_to_include)
{
    Write-Host "|    |          |       |    └────[ Status ]  Script Terminated -> $SCRIPT_NAME " -ForegroundColor Cyan
}
 