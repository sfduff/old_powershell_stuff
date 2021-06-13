
$FileLocation = 'w:\Scheduled_WOL_Scripts\collected\dept'

$FileTemp = Get-ChildItem -Path $FileLocation | ?{$_ -like "*.bat"}

foreach($File in $FileTemp){
  $lines = Get-Content $File | Select-Object -First 1
  $l1, $l2, $l3, $l4, $l5, $l6, $l7, $l8 = $lines.Split(' ')
  $filename = $File.Name
  $name, $ext = $filename.split('.')
  write-host $name", "$l4", "$l6", "$l8
}
