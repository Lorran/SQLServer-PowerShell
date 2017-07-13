#This works if you cann connect to your replica name
$sqlInstance = "<LISTENER>or<One of the instances - if only one AG>"
$database = "<DBNAME>"
$AGInfo = Get-DbaAvailabilityGroup -SqlInstance $sqlInstance -

$listBackups = $AGInfo | ForEach-Object {
	Get-DbaBackupHistory -SqlInstance $_.ReplicaName -Database $database -Last
}

$listBackups | Sort-Object Start -Descending