if ($host.Name -eq "ConsoleHost") {
  Import-Module Profile
  Import-Module PSReadLine
  Set-PSReadLineOption -PredictionSource History
}

function Prompt {
  $ActualPath = (Get-Location).Path

  if ((Test-Path '.git')) {
    Import-Module posh-git
  }

  if (Get-HasElevatedUser) {
    Write-Host "[ADMIN] $($ENV:USERNAME) " -NoNewline -ForegroundColor 'red'
    $host.UI.RawUI.WindowTitle = "[Admin] $ENV:USERNAME in $ActualPath"
  }
  else {
    #When user is not elevated
    Write-Host "$($ENV:USERNAME) " -NoNewline -ForegroundColor 'green'
    $host.UI.RawUI.WindowTitle = "$ENV:USERNAME in $ActualPath"
  } 
  
  #User type space
  Write-Host "in $($ActualPath)" -ForegroundColor "white" -NoNewline
  Write-VcsStatus
  Write-Host "`n>" -ForegroundColor "Yellow" -NoNewline

  Return " "
}
