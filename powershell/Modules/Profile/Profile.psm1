function Get-HasElevatedUser {
  $Security = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent());
  return $Security.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
}

function Get-WhereIsApplication {
  param (
    [Parameter(Mandatory = $true)]
    [String]$Name
  )

  foreach ($path in $Env:Path.Split(";")) {
    if ((Test-Path $path)) {
      Get-ChildItem $path -Filter "$($Name).exe"
    }
  }
}