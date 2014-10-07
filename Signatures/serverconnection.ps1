$FileName = 'C:\Users\assessor\Desktop\'

#SERVERCONNECTION_CREATION
$Name = 'SERVERCONNECTION_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_ServerConnection'"
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.ComputerName% Server Connection Created|ComputerName: %TargetInstance.__SERVER%, RemoteName: %TargetInstance.ComputerName%, NumberOfUsers: %TargetInstance.NumberOfUsers%, Shared: %TargetInstance.ShareName%, User: %TargetInstance.UserName%, ActiveTime: %TargetInstance.ActiveTime%"

Add-Signature -Name $Name -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#SERVERCONNECTION_DELETION
$Name = 'SERVERCONNECTION_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA 'Win32_ServerConnection'"
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.ComputerName% Server Connection Deleted|ComputerName: %TargetInstance.__SERVER%, RemoteName: %TargetInstance.ComputerName%, NumberOfUsers: %TargetInstance.NumberOfUsers%, Shared: %TargetInstance.ShareName%, User: %TargetInstance.UserName%, ActiveTime: %TargetInstance.ActiveTime%"

Add-Signature -Name $Name -Query $Query -FileName $FileName -Text $Text -Type "LogFile"