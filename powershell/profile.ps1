if ($host.Name -eq "ConsoleHost") {
  Import-Module Profile
  Import-Module PSReadLine
  Set-PSReadLineOption -PredictionSource History
}

Set-Alias -Name "whereis" -Value Get-WhereIsApplication -Option ReadOnly

$actualPath = New-Object -TypeName "System.Text.StringBuilder"

function Prompt {

  if ((Test-Path '.git')) {
    Import-Module posh-git
  }

  if ((Get-Location).Path.Split("\").Length -gt 2) {
    $_folders = (Get-Location).Path.Split("\");
    [void]$actualPath.Clear();
    [void]$actualPath.AppendFormat("..\{0}\{1}", $_folders[-2], $_folders[-1])
  }
  else {
    $_folders = (Get-Location).Path.Split("\");
    [void]$actualPath.Clear();
    [void]$actualPath.AppendFormat("{0}\", $_folders[0])
  }

  if (Get-HasElevatedUser) {
    Write-Host "[ADMIN] $($ENV:USERNAME) " -NoNewline -ForegroundColor 'red'
    $host.UI.RawUI.WindowTitle = "[Admin] $ENV:USERNAME in $($actualPath.ToString())"
  }
  else {
    #When user is not elevated
    Write-Host "$($ENV:USERNAME) " -NoNewline -ForegroundColor 'green'
    $host.UI.RawUI.WindowTitle = "$ENV:USERNAME in $($actualPath.ToString())"
  } 
  
  #User type space
  Write-Host "in $($actualPath.ToString())" -ForegroundColor "white" -NoNewline
  Write-VcsStatus
  Write-Host "`n>" -ForegroundColor "Yellow" -NoNewline

  Return " "
}
