$PowerToys = winget list --Accept-Source-Agreements | Where-Object {$_ -like "PowerToys*"}
If(!$PowerToys)
    {
        Winget Install Microsoft.PowerToys --source winget --scope machine
    }
Do
    {
        $SpotifyTitle = Get-Process Spotify | Select-Object -ExpandProperty MainWindowTitle
        $AwakeRunning = Get-Process PowerToys.Awake
        If($SpotifyTitle -NotLike "*Spotify*")
            {
                If(!$AwakeRunning)
                    {
                        Start-Process -FilePath "C:\Program Files\PowerToys\PowerToys.Awake.exe"
                    }
            }Elseif($AwakeRunning)
                {
                    Stop-Process -Process PowerToys.Awake
                }   
        Start-Sleep 30
    }While($True)