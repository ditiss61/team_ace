Get-Eventlog -log Security -After (Get-Date).AddDays(-90)   #Security event Logs
Get-Eventlog -log Security -After (Get-Date).AddDays(-90) | where {$_.InstanceId -eq 4624 -or $_.InstanceId -Eq 4634} | Out-file C:\Users\INFOTECH\Desktop\Session.txt #Login Logoff time of user
Get-eventlog -log System -EntryType Error |Out-file C:\Users\INFOTECH\Desktop\crashed.txt   #Crash report