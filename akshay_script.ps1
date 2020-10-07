Get-CimInstance -ClassName Win32_ReliabilityRecords
Get-EventLog -LogName Security -Newest 50
Get-EventLog -ComputerName $Computer System -Source Microsoft-Windows-Winlogon ` | select $UserProperty,$TypeProperty,$TimeProperty