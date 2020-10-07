echo "Welcome to TietoEVRY Windows Dignostic Advisor"

echo "NOTE-Make sure that PowerShell is Opened as Administartor"

echo "Setting Execution policy"
Set-ExecutionPolicy RemoteSigned
#To execute a shell script setting the execution policy. 

$ThreeMonthsAgo = (Get-Date).AddDays(-90)
echo "Creating Login/Logout Logs for last 3 months..Writing in progress"
Get-EventLog Security -after $ThreeMonthsAgo  | where {$_.InstanceId -eq 4662} |Export-Csv -Path C:\LoginLogoutLogsFor3Months.csv
echo "Created Login/Logout Log report successfully at C:\LoginLogoutLogsFor3Months.csv" 

echo "Creating Security Logs for last 3 months..Writing in progress"
Get-EventLog Security -After $ThreeMonthsAgo  |Export-Csv -Path C:\SecurityLogsFor3Months.csv
echo "Created Security Log report successfully at C:\SecurityLogsFor3Months.csv" 

echo "Creating System Crash Logs for last 3 months..Writing in progress"
Get-CimInstance -ClassName Win32_ReliabilityRecords |Export-Csv -Path C:\SystemCrashLogsFor3Months.csv
echo "Created System Crash Logs report successfully at C:\SystemCrashLogsFor3Months.csv"


