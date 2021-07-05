# WOL Checkins - SFDUFF 12/07/2017
# scheduled to run client side to update powerbi api endpoint

$colItems = get-wmiobject -class "Win32_NetworkAdapterConfiguration" -namespace "root\CIMV2" -computername "." -filter "IPEnabled = true"
foreach ($objItem in $colItems) {
      $StrIP = $objItem.IPAddress[0]
      $SubNe = $objItem.IPSubnet[0]
      $MacAd = $colItems.MACAddress.Replace(':','')
}

$Lab = ""
if ($env:DESIGNATION -eq "LAB")   { $Lab = $env:ROOM }

# PowerBI post
$endpoint = "https://api.powerbi.com/beta/e5aafe7c-971b-4ab7-b039-141ad36acec0/datasets/97f340f6-3367-4506-87c7-0542c9bd4e4d/rows?key=OmoU8AKdUq5KZGzMldkdBtjPlRQ7OgaeL3LtA%2FhAXPHyT4PjJMuDY2YRe0QKbX2jDKwWRcSYK6ozPj7fWOQfrw%3D%3D"

$now = Get-Date -Format yyyy-MM-dd'T'HH:mm:ss
$payload = ConvertTo-Json @{host=$env:computername;mac=$MacAd;ip=$StrIP;subnet=$SubNe;timestamp=$now;lab=$Lab}
$payload = '['+$payload+']'

$hashing_delay = Get-Random -Minimum 1 -Maximum 60
Start-Sleep $hashing_delay

Invoke-RestMethod -Method Post -Uri "$endpoint" -Body ($payload)
