Get-CimInstance -ClassName Win32_ReliabilityRecords

 get-eventlog security -newest 20


param(
    [alias("CN")]
    $ComputerName="localhost"
)

$UserProperty = @{n="User";e={(New-Object System.Security.Principal.SecurityIdentifier $_.ReplacementStrings[1]).Translate([System.Security.Principal.NTAccount])}}
$TypeProperty = @{n="Action";e={if($_.EventID -eq 7001) {"Logon"} else {"Logoff"}}}
$TimeProperty = @{n="Time";e={$_.TimeGenerated}}
$MachineNameProperty = @{n="MachinenName";e={$_.MachineName}}

foreach ($computer in $ComputerName) {
    Get-EventLog System -Source Microsoft-Windows-Winlogon -ComputerName $computer | select $UserProperty,$TypeProperty,$TimeProperty,$MachineNameProperty
}