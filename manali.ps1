



get-CimInstance -ClassName Win32_ReliabilityRecords
get-eventLog -LogName Security -Newest 50
 Get-EventLog System -Source Microsoft-Windows-WinLogon -After (Get-Date).AddDays(-90) -ComputerName $env:computername                                                                                                    