Import-Module .\modules\permissions.psm1

function Prompt {
  
  $ActualPath = (Get-Location).Path
  
  if(Get-HasElevatedPermission){
    Write-Host "$($ENV:USERNAME)" -NoNewline -ForegroundColor 'green'
  } else {
    Write-Host "$($ENV:USERNAME)" -NoNewline -ForegroundColor 'red'
  }
  Write-Host "in $((Get-Location).Path)" -foregroundColor "white"
  Write-Host -NoNewline "" -foregroundColor "Yellow"

  $host.UI.RawUI.WindowTitle = "$ENV:USERNAME in $ActualPath"
  Return " "
}
