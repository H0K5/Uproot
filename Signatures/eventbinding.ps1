$FileName = 'C:\Users\assessor\Desktop\'

#EVENTBINDING_CREATION
$Name = 'EVENTBINDING_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA '__FilterToConsumerBinding'"
$eventnamespace = 'root\subscription'
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|EventBinding Created|Filter: %TargetInstance.Filter%, Consumer: %TargetInstance.Consumer%, User: %TargetInstance.CreatorSID%"

Add-Signature -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#EVENTBINDING_MODIFICATION
$Name = 'EVENTBINDING_MODIFICATION'
$Query = "SELECT * FROM __InstanceModificationEvent WITHIN 1 WHERE TargetInstance ISA '__FilterToConsumerBinding'"
$eventnamespace = 'root\subscription'
$Text = @"
%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|EventBinding Modified Prev|Filter: %PreviousInstance.Filter%, Consumer: %PreviousInstance.Consumer%, User: %PreviousInstance.CreatorSID%
%PreviousInstance.Consumer%|%PreviousInstance.Filter%|%PreviousInstance.CreatorSID%
%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|EventBinding Modified New|Filter: %TargetInstance.Filter%, Consumer: %TargetInstance.Consumer%, User: %TargetInstance.CreatorSID%
"@

Add-Signature -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#EVENTBINDING_DELETION
$Name = 'EVENTBINDING_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA '__FilterToConsumerBinding'"
$eventnamespace = 'root\subscription'
$Text = "%TIME_CREATED%|UTC|N/A|UPR|Uproot|$Name|EventBinding Deleted|Filter: %TargetInstance.Filter%, Consumer: %TargetInstance.Consumer%, User: %TargetInstance.CreatorSID%"

Add-Signature -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"