
$files_path = 'w:\Scheduled WOL Scripts\collected\labs'

$file_directory = Get-ChildItem -Path $files_path | ?{$_ -like "*.bat"}

foreach( $file_item in $file_directory )
{
    $file_line = Get-Content -path $files_path\$file_item | Select-Object -First 1

    # poweroff wol  -ip  193.63.141.46 -subnet 255.255.255.0 -mac 2C4D54D079A9
    $word_1, $word_2, $word_33, $word_4, $word_5, $word_6, $word_7, $word_8 = $file_line.Split(' ')

    $file_name = $file_item.Name
    $name_part, $ext_part = $file_name.split('.')
    write-host $name_part", "$word_4", "$word_6", "$word_8
}
