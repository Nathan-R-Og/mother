$url = "https://sourceforge.net/projects/cc65/files/cc65-snapshot-win32.zip"
$output = "C:/Users/$env:USERNAME/Downloads/cc65.zip"
$prg = "C:/Program Files/cc65/"
$prg_bin = "C:/Program Files/cc65/bin"
Invoke-WebRequest -UserAgent "Wget" -Uri $url -OutFile $output
Expand-Archive -Path $output -DestinationPath $prg -Force
$CurrentPath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
$NewPath = "$CurrentPath;$prg_bin"
[System.Environment]::SetEnvironmentVariable("Path", $NewPath, "Machine")
"Successfully installed to $prg!"