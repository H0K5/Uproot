$FileName = 'C:\Users\assessor\Desktop\'

#NETWORKCONNECTION_CREATION
$Name = 'NETWORKCONNECTION_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_NetworkConnection'"
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.RemoteName% Network Connection Created|ComputerName: %TargetInstance.__SERVER%, LocalSystem: %TargetInstance.LocalName%, RemoteSystem: %TargetInstance.RemoteName%, ResourceType: %TargetInstance.ResourceType%"

Add-Signature -Name $Name -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#NETWORKCONNECTION_DELETION
$Name = 'NETWORKCONNECTION_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_NetworkConnection'"
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.RemoteName% Network Connection Deleted|ComputerName: %TargetInstance.__SERVER%, LocalSystem: %TargetInstance.LocalName%, RemoteSystem: %TargetInstance.RemoteName%, ResourceType: %TargetInstance.ResourceType%"

Add-Signature -Name $Name -Query $Query -FileName $FileName -Text $Text -Type "LogFile"