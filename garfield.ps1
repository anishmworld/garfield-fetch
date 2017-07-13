param
(
	[String]
	$DateStart,
	[String]
	$DateFinish
)

Function ParseDateStr
{
  param
  (
	[String]
	$s
  )
  return Get-Date `
           -Year ($s.substring(0,4)) `
           -Month $s.substring(5,2) `
           -Day $s.substring(8,2) `
           -Hour 0 -Minute 0 -Second 0
}

Function pause ($message)
{
    # Check if running Powershell ISE
    if ($psISE)
    {
        Add-Type -AssemblyName System.Windows.Forms
        [System.Windows.Forms.MessageBox]::Show("$message")
    }
    else
    {
        Write-Host "$message" -ForegroundColor Yellow
        $x = $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}

$start = ( ParseDateStr $DateStart )
$finish = ( ParseDateStr $DateFinish )
$today = (Get-Date).toString("yyyy-MM-dd")

if ($start.toString("yyyy-MM-dd") -le $finish.toString("yyyy-MM-dd"))
{
	if ($start.toString("yyyy-MM-dd") -lt '1978-06-19')
	{
		pause "The earliest comic is on 19th June, 1978. `nEnter the dates on or after that. `nPress any key to exit"
		exit
	}

	if ($start.toString("yyyy-MM-dd") -gt $today)
	{
		pause "The dates are in the future. `nTardis doesn't support this script... Yet. `nPress any key to exit"
		exit
	}
	
	if ($finish.toString("yyyy-MM-dd") -gt $today)
	{
		pause "The Finish date is in the future. `nTardis doesn't support this script... Yet. `nPress any key to exit"
		exit
	}

	$URLstub = 'https://d1ejxu6vysztl5.cloudfront.net/comics/garfield'
	$delta = New-TimeSpan -Days 1

	for ($d = $start; $d -le $finish; $d +=$delta)
	{
		$date = $d.toString("yyyy-MM-dd")
		$year = $d.ToString("yyyy")
		$file = @($date, 'gif') -join '.'
		$URL = @($URLstub, $year, $file) -join '/'
		Write-Host 'Downloading comic on: ' $date
		Invoke-WebRequest -Uri $URL -OutFile $file
	}
}
else
{
	pause "The Start Date cannot be after End Date. `nPress any key to exit"
	exit
}
