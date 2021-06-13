# Read everything.csv and post to powerbi

# foreach($line in Get-Content .\file.txt) {

foreach( $file_line in Get-Content .\everything.csv )
{
    write-host $file_line = $file_line.split(',')
}


<#

[
{
"subnet" :"AAAAA555555",
"host" :"AAAAA555555",
"mac" :"AAAAA555555",
"ip" :"AAAAA555555",
"username" :"AAAAA555555",
"timestamp" :"2018-02-13T11:48:38.646Z",
"lab" :"AAAAA555555"
}
]

#>
