$logfilepath1="D:\Script target\Securitylog.txt"                                #log stored in this location
$logfilepath2="D:\Script target\Logged_on&off.txt"                              #log stored in this location 
$logfilepath3 = "D:\Script target\Application_log.txt"                          #log stored in this location 
$logfilepath4 = "D:\Script target\Crash_log.txt"                                #log stored in this location 

    $A = Get-EventLog Security -After (Get-Date).AddDays(-90)                                                              # Security logs from last 3 month
     $B = Get-EventLog Security -after (get-date).AddDays(-90) | where {$_.InstanceId -eq 4624 -or $_.InstanceId -eq 4634} #Logged ON and OFF logs from last 3 month
    $C = Get-EventLog Application -After (Get-Date).AddDays(-90)                                                           # Application logs from last 3 month
     $D = Get-EventLog System -EntryType Error                                                                             #system Crash  data  from last 3 month

$A >> $logfilepath1
$B >> $logfilepath2
$C >> $logfilepath3
$D >> $logfilepath4

cd "D:\Script target"
ls
cd ..