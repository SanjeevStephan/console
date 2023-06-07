$script_path = GetFullPath($MENU_JSON.info.script)
$argument = 1
Invoke-Expression "& `"$script_path`" -index $argument"
