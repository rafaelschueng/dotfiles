$curUser= (Get-ChildItem Env:\USERNAME).Value
function Prompt {
  $ActualPath = (Get-Location).Path
  Write-Host "$($ENV:USERNAME) in $((Get-Location).Path)" -foregroundColor "white"
  Write-Host -NoNewline "" -foregroundColor "Yellow"
  $host.UI.RawUI.WindowTitle = "$ENV:USERNAME in $ActualPath"
  Return " "
}
