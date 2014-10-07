$FileName = 'C:\Users\assessor\Desktop\'

#DRIVER_CREATION
$Name = 'DRIVER_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_SystemDriver'"
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.Name% Driver Creation|ComputerName: %TargetInstance.SystemName, Name: %TargetInstance.Name%, Path: %TargetInstance.PathName%, Caption: %TargetInstance.Caption%, ServiceType: %TargetInstance.ServiceType%, StartMode: %TargetInstance.StartMode%"

Add-Signature -Name $Name -Query $Query -FileName $FileName -Text $Text -Type "LogFile" -Force

#DRIVER_DELETION
$Name = 'DRIVER_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_SystemDriver'"
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.Name% Driver Creation|ComputerName: %TargetInstance.SystemName, Name: %TargetInstance.Name%, Path: %TargetInstance.PathName%, Caption: %TargetInstance.Caption%, ServiceType: %TargetInstance.ServiceType%, StartMode: %TargetInstance.StartMode%"

Add-Signature -Name $Name -Query $Query -FileName $FileName -Text $Text -Type "LogFile" -Force