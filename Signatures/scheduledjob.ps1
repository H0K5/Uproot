$FileName = 'C:\Users\assessor\Desktop\'

#SCHEDULEDJOB_CREATION
$Name = 'SCHEDULEDJOB_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_ScheduledJob'"
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.JobId% Scheduled Job Created|ComputerName: %TargetInstance.__SERVER%, JobId: %TargetInstance.JobId%, Command: %TargetInstance.Command%, InteractWithDesktop: %TargetInstance.InteractWithDesktop%, StartTime: %TargetInstance.StartTime%"

Add-Signature -Name $Name -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#SCHEDULEDJOB_DELETION
$Name = 'SCHEDULEDJOB_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_ScheduledJob'"
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.JobId% Scheduled Job Deleted|ComputerName: %TargetInstance.__SERVER%, JobId: %TargetInstance.JobId%, Command: %TargetInstance.Command%, InteractWithDesktop: %TargetInstance.InteractWithDesktop%, StartTime: %TargetInstance.StartTime%"

Add-Signature -Name $Name -Query $Query -FileName $FileName -Text $Text -Type "LogFile"