




$Dependency_to_include = $CONSOLE_JSON.dependency.script
$Dependency_path       = $CONSOLE_JSON.dependency.path
$Total_Dependency = $Dependency_to_include.Length - 1 # Minus '1' to prevent for loop from displaying empty file-path

$SCRIPT_NAME = $MyInvocation.MyCommand.Name 


if(Test-Path $CONSOLE_SCRIPT)
{
     Write-Host "|    |          ├ Loading ] Dependencies From JSON File : $CONSOLE_JSON_FILE " -ForegroundColor Yellow
    
    for ($i = 0; $i -le $Total_Dependency; $i++) 
    {
      # Write-Host "|    |          ├  DEBUG ] Counting Total Objects : $i"
        $Dependency_File_from_JSON   = $Dependency_to_include[$i].file
        $currentScriptFullPath       = "$(GetFullPath($Dependency_path))\$Dependency_File_from_JSON"
        Write-Host "|    |          ├ Loaded ] $currentScriptFullPath " -ForegroundColor Cyan
      
        if(Test-Path $currentScriptFullPath)
        {
             . $currentScriptFullPath # Loads the PowerSchell Scripts
        }
    }
        Write-Host "|    |          | " -ForegroundColor Cyan
        Write-Host "|    |          └──[ JSON ] Finished Loading Scripts From JSON File : $CONSOLE_JSON_FILE " -ForegroundColor Yellow
    
} else { Write-Host "Looking For [ $CONSOLE_SCRIPT_File ] at $CONSOLE_SCRIPT" -ForegroundColor Red -BackgroundColor Black }

        Write-Host "|    |           " -ForegroundColor Cyan
# =============================== 5.SuperUser Terminated =====================================
        Write-Host "|    |" -ForegroundColor Cyan
        Write-Host "|    └───[ Status ]  Script Terminated -> $SCRIPT_NAME" -ForegroundColor Cyan
        Write-Host "|    " -ForegroundColor Cyan

