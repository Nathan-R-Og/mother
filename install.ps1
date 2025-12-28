$url = "https://sourceforge.net/projects/cc65/files/cc65-snapshot-win32.zip"
$output = "C:/Users/natha/Downloads/downloaded_file.zip"
Invoke-WebRequest -UserAgent "Wget" -Uri $url -OutFile $output