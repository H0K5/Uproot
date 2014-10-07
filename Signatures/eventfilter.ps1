$FileName = 'C:\Users\assessor\Desktop\'

#EVENTFILTER_CREATION
$Name = 'EVENTFILTER_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA '__EventFilter'"
$eventnamespace = 'root\subscription'
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.Name% EventFilter Created|Namespace: %TargetInstance.EventNamespace%, Remote System: %TargetInstance.Query%, User: %TargetInstance.CreatorSID%"

Add-Signature -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#EVENTFILTER_MODIFICATION
$Name = 'EVENTFILTER_MODIFICATION'
$Query = "SELECT * FROM __InstanceModificationEvent WITHIN 1 WHERE TargetInstance ISA '__EventFilter'"
$eventnamespace = 'root\subscription'
$Text = @"
%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%PreviousInstance.Name% EventFilter Modified Previous|Namespace: %PreviousInstance.EventNamespace%, Remote System: %PreviousInstance.Query%, User: %PreviousInstance.CreatorSID%"
%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.Name% EventFilter Modified New|Namespace: %TargetInstance.EventNamespace%, Remote System: %TargetInstance.Query%, User: %TargetInstance.CreatorSID%
"@

Add-Signature -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#EVENTFILTER_DELETION
$Name = 'EVENTFILTER_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA '__EventFilter'"
$eventnamespace = 'root\subscription'
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|%TargetInstance.Name% EventFilter Deleted|Namespace: %TargetInstance.EventNamespace%, Remote System: %TargetInstance.Query%, User: %TargetInstance.CreatorSID%"

Add-Signature -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"