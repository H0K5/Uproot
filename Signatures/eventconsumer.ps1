$ComputerName = (gc env:computername)
$FileName = 'C:\Users\assessor\Desktop\' + $ComputerName + '.txt'


#ActiveScriptEventConsumer
#ActiveScriptEventConsumer_CREATION
$Name = 'ActiveScriptEventConsumer_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA 'ActiveScriptEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = "%TargetInstance.Name%|%TargetInstance.ScriptEngine%|%TargetInstance.ScriptFileName%|%TargetInstance.ScriptText%|%TargetInstance.MachineNameName%"

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#ActiveScriptEventConsumer_MODIFICATION
$Name = 'ActiveScriptEventConsumer_MODIFICATION'
$Query = "SELECT * FROM __InstanceModificationEvent WITHIN 1 WHERE TargetInstance ISA 'ActiveScriptEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = @"
%PreviousInstance.Name%|%PreviousInstance.ScriptEngine%|%PreviousInstance.ScriptFileName%|%PreviousInstance.ScriptText%|%PreviousInstance.MachineNameName%
%TargetInstance.Name%|%TargetInstance.ScriptEngine%|%TargetInstance.ScriptFileName%|%TargetInstance.ScriptText%|%TargetInstance.MachineNameName%
"@

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#ActiveScriptEventConsumer_DELETION
$Name = 'ActiveScriptEventConsumer_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA 'ActiveScriptEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = "%TargetInstance.Name%|%TargetInstance.ScriptEngine%|%TargetInstance.ScriptFileName%|%TargetInstance.ScriptText%|%TargetInstance.MachineNameName%"

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#CommandLineEventConsumer
#CommandLineEventConsumer_CREATION
$Name = 'CommandLineEventConsumer_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA 'CommandLineEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = "%TargetInstance.Name%|%TargetInstance.CommandLineTemplate%|%TargetInstance.ExecutablePath%|%TargetInstance.RunInteractively%|%TargetInstance.WorkingDirectory%"

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#CommandLineEventConsumer_MODIFICATION
$Name = 'CommandLineEventConsumer_MODIFICATION'
$Query = "SELECT * FROM __InstanceModificationEvent WITHIN 1 WHERE TargetInstance ISA 'CommandLineEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = @"
%PreviousInstance.Name%|%PreviousInstance.CommandLineTemplate%|%PreviousInstance.ExecutablePath%|%PreviousInstance.RunInteractively%|%PreviousInstance.WorkingDirectory%
%TargetInstance.Name%|%TargetInstance.CommandLineTemplate%|%TargetInstance.ExecutablePath%|%TargetInstance.RunInteractively%|%TargetInstance.WorkingDirectory%
"@

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#CommandLineEventConsumer_DELETION
$Name = 'CommandLineEventConsumer_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA 'CommandLineEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = "%TargetInstance.Name%|%TargetInstance.CommandLineTemplate%|%TargetInstance.ExecutablePath%|%TargetInstance.RunInteractively%|%TargetInstance.WorkingDirectory%"

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"


#LogFileEventConsumer
#LogFileEventConsumer_CREATION
$Name = 'LogFileEventConsumer_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA 'LogFileEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = "%TargetInstance.Name%|%TargetInstance.Filename%|%TargetInstance.Text%"

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#LogFileEventConsumer_MODIFICATION
$Name = 'LogFileEventConsumer_MODIFICATION'
$Query = "SELECT * FROM __InstanceModificationEvent WITHIN 1 WHERE TargetInstance ISA 'LogFileEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = @"
%PreviousInstance.Name%|%PreviousInstance.Filename%|%PreviousInstance.Text%"
%TargetInstance.Name%|%TargetInstance.Filename%|%TargetInstance.Text%
"@

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#LogFileEventConsumer_DELETION
$Name = 'LogFileEventConsumer_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA 'LogFileEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = "%TargetInstance.Name%|%TargetInstance.Filename%|%TargetInstance.Text%"

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"


#NTEventLogEventConsumer
#NTEventLogEventConsumer_CREATION
$Name = 'NTEventLogEventConsumer_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA 'NTEventLogEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = "%TargetInstance.Name%|%TargetInstance.UNCServerName%|%TargetInstance.SourceName%|%TargetInstance.InsertionStringTemplates%|%TargetInstance.EventID%"

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#NTEventLogEventConsumer_MODIFICATION
$Name = 'NTEventLogEventConsumer_MODIFICATION'
$Query = "SELECT * FROM __InstanceModificationEvent WITHIN 1 WHERE TargetInstance ISA 'NTEventLogEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = @"
%PreviousInstance.Name%|%PreviousInstance.UNCServerName%|%PreviousInstance.SourceName%|%PreviousInstance.InsertionStringTemplates%|%PreviousInstance.EventID%
%TargetInstance.Name%|%TargetInstance.UNCServerName%|%TargetInstance.SourceName%|%TargetInstance.InsertionStringTemplates%|%TargetInstance.EventID%
"@

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#NTEventLogEventConsumer_DELETION
$Name = 'NTEventLogEventConsumer_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA 'NTEventLogEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = "%TargetInstance.Name%|%TargetInstance.UNCServerName%|%TargetInstance.SourceName%|%TargetInstance.InsertionStringTemplates%|%TargetInstance.EventID%"

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"


#SMTPEventConsumer
#SMTPEventConsumer_CREATION
$Name = 'SMTPEventConsumer_CREATION'
$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 1 WHERE TargetInstance ISA 'SMTPEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = "%TargetInstance.Name%|%TargetInstance.ToLine%|%TargetInstance.Subject%|%TargetInstance.SMTPServer%|%TargetInstance.ReplyToLine%|%TargetInstance.Message%|%TargetInstance.FromLine%|%TargetInstance.CcLine%|%TargetInstance.BccLine%"

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#SMTPEventConsumer_MODIFICATION
$Name = 'SMTPEventConsumer_MODIFICATION'
$Query = "SELECT * FROM __InstanceModificationEvent WITHIN 1 WHERE TargetInstance ISA 'SMTPEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = @"
%PreviousInstance.Name%|%PreviousInstance.ToLine%|%PreviousInstance.Subject%|%PreviousInstance.SMTPServer%|%PreviousInstance.ReplyToLine%|%PreviousInstance.Message%|%PreviousInstance.FromLine%|%PreviousInstance.CcLine%|%PreviousInstance.BccLine%
%TargetInstance.Name%|%TargetInstance.ToLine%|%TargetInstance.Subject%|%TargetInstance.SMTPServer%|%TargetInstance.ReplyToLine%|%TargetInstance.Message%|%TargetInstance.FromLine%|%TargetInstance.CcLine%|%TargetInstance.BccLine%
"@

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"

#SMTPEventConsumer_DELETION
$Name = 'SMTPEventConsumer_DELETION'
$Query = "SELECT * FROM __InstanceDeletionEvent WITHIN 1 WHERE TargetInstance ISA 'SMTPEventConsumer'"
$eventnamespace = 'root\subscription'
$Text = "%TargetInstance.Name%|%TargetInstance.ToLine%|%TargetInstance.Subject%|%TargetInstance.SMTPServer%|%TargetInstance.ReplyToLine%|%TargetInstance.Message%|%TargetInstance.FromLine%|%TargetInstance.CcLine%|%TargetInstance.BccLine%"

Add-Signature -ComputerName $ComputerName -Name $Name -EventNamespace $EventNamespace -Query $Query -FileName $FileName -Text $Text -Type "LogFile"