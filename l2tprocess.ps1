function l2tprocess{
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory=$TRUE)]
                [string]$InputPath,
            [Parameter(Mandatory=$TRUE)]
                [string]$OutputFile,
            [Parameter(Mandatory=$FALSE)]
                [datetime]$StartDate,
            [Parameter(Mandatory=$FALSE)]
                [datetime]$EndDate
        )

    $code = @"
        namespace Uproot{
            public class log2timeline
            {
                public string Date;
                public string Time;
                public string Timezone;
                public string MACB;
                public string source;
                public string sourcetype;
                public string type;
                public string shortdes;
                public string description;
            }
        }
"@

    try{
        [Uproot.log2timeline].IsPublic | Out-Null
    }catch{
        Add-Type -TypeDefinition $code
    }
    
    $header = 'Date|Time|Timezone|MACB|source|sourcetype|type|shortdes|description'
    
    $header | Add-Content -Path $InputPath
    
    foreach($line in (Get-Content $OutputFile)){
        $itemArray = $line.split('|')
        $DateTime = ([Datetime]::FromFileTime($itemArray[0])).ToUniversalTime() 
        $props = @{
            'Date' = $DateTime.ToShortDateString();
            'Time' = $DateTime.Hour.ToString() + ":" + $DateTime.Minute.ToString() + ":" + $DateTime.Second.ToString();
            'Timezone' = $itemArray[1];
            'MACB' = $itemArray[2];
            'source' = $itemArray[3];
            'sourcetype' = $itemArray[4];
            'type' = $itemArray[5];
            'shortdes' = $itemArray[6];
            'description' = $itemArray[7]
        }
        $obj = New-Object -TypeName Uproot.log2timeline -Property $props
        $StartSpan = New-TimeSpan -Start $StartDate -End $obj.Date
        $EndSpan = New-TimeSpan -Start $obj.Date -End $EndDate
        if(($StartSpan.Days -ge 0) -and ($EndSpan.Days -ge 0)){
            $csv = $obj.Date + "|" + $obj.Time + "|" + $obj.Timezone + "|" + $obj.MACB + "|" + $obj.source + "|" + $obj.sourcetype + "|" + $obj.type + "|" + $obj.shortdes + "|" + $obj.description
            $csv | Add-Content -Path $OutputFile
        }
    }
}
#l2tprocess -StartDate 10/03/2014 -EndDate 10/10/2014