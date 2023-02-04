
$csv = Import-Csv "path_csv_file" 
$json = @()

foreach ($record in $csv) {
    $obj = New-Object PSObject
    foreach ($property in $record.psobject.properties) {
        $obj | Add-Member -MemberType NoteProperty -Name $property.Name -Value $property.Value
    }
    $json += $obj | ConvertTo-Json
}

$json | Out-File "file.json"