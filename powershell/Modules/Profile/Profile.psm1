function Get-HasElevatedUser {
    $Security = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent());
    return $Security.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
}