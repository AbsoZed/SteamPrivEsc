# SteamPrivEsc

Simple tool collection for escalation to NT AUTHORITY\SYSTEM from recently disclosed Steam Client Zero Day

PS Script will check for existence of payloads and previous exploit attempts and adapt accordingly. It will download the necessary binaries from this repo - it is not necessary to download RegLN or NC.exe from this package unless the host lacks internet access.

Demonstration:

![](demo.gif)


# PLEASE NOTE:
Though it should be common sense, this script downloads and executes executables from within this repository. Please feel free to check the hashes of the executables using the powershell command:
```
Get-FileHash -Algorithm SHA256 <Executable>
```

The files were downloaded from the following links:
```
NC.exe: https://eternallybored.org/misc/netcat/netcat-win32-1.11.zip
```
```
RegLN.exe: https://github-production-release-asset-2e65be.s3.amazonaws.com/50280961/6d205980-534b-11e9-993e-d2b1ae3f0578?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20190812%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20190812T134902Z&X-Amz-Expires=300&X-Amz-Signature=0736ccd5d6408f9efdd286ff63066646429bbccc902135691a34ef293512cb6c&X-Amz-SignedHeaders=host&actor_id=17788335&response-content-disposition=attachment%3B%20filename%3Dregln-x64.exe&response-content-type=application%2Foctet-stream
```


