Import-Module Profile

function Prompt {
  $ActualPath = (Get-Location).Path

  if(Get-HasElevatedUser){
    Write-Host " $($ENV:USERNAME) " -NoNewline -ForegroundColor 'red'
    $host.UI.RawUI.WindowTitle = "[Admin] $ENV:USERNAME in $ActualPath"
  } else {
    #When user is not elevated
    Write-Host "$($ENV:USERNAME) " -NoNewline -ForegroundColor 'green'
    $host.UI.RawUI.WindowTitle = "$ENV:USERNAME in $ActualPath"
  }
  
  #User type space
  Write-Host "in $((Get-Location).Path)" -foregroundColor "white"
  Write-Host -NoNewline "" -foregroundColor "Yellow"

  Return " "
}
