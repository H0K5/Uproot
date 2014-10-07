$FileName = 'C:\Users\assessor\Desktop\'

#SHARE_CREATION
$Name = 'SHARE_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_Share'"
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.Name% Share Creation|ComputerName: %TargetInstance.__SERVER%, Name: %TargetInstance.Name%, Path: %TargetInstance.Path%, Description: %TargetInstance.Description%"

Add-Signature -Name $Name -Query $Query -FileName $FileName -Text $Text -Type "LogFile" -Force

#SHARE_DELETION
$Name = 'SHARE_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_Share'"
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.Name% Share Deletion|ComputerName: %TargetInstance.__SERVER%, Name: %TargetInstance.Name%, Path: %TargetInstance.Path%, Description: %TargetInstance.Description%"

Add-Signature -Name $Name -Query $Query -FileName $FileName -Text $Text -Type "LogFile"