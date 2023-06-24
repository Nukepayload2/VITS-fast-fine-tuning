$files = Get-ChildItem *.wav
$i = 1
foreach ($file in $files) {
    Rename-Item $file.FullName -NewName "YourName_$i.wav"
    $i++
}