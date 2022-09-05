Set-ExecutionPolicy Bypass

Write-Output "WebKeeper  비활성화 프로그램"
Write-Output "Made by cyberls17"

$ACL = Get-Acl -Path "C:\Program Files\Somansa\PcBoanCare\"
$ACL.SetAccessRuleProtection($true, $false)
$ACL | Set-Acl -Path "C:\Program Files\Somansa\PcBoanCare\"

$Execute = New-Object System.Security.AccessControl.FileSystemAccessRule("user","ExecuteFile", "ContainerInherit,ObjectInherit", "None", "Deny")
$ReadData = New-Object System.Security.AccessControl.FileSystemAccessRule("user", "ReadData", "ContainerInherit,ObjectInherit", "None", "Deny")
$ReadPermissions = New-Object System.Security.AccessControl.FileSystemAccessRule("user", "ReadPermissions", "ContainerInherit,ObjectInherit", "None", "Deny")
$ReadAttributes = New-Object System.Security.AccessControl.FileSystemAccessRule("user","ReadAttributes", "ContainerInherit,ObjectInherit", "None", "Deny")
$ReadExtendedAttributes = New-Object System.Security.AccessControl.FileSystemAccessRule("user","ReadExtendedAttributes", "ContainerInherit,ObjectInherit", "None", "Deny")

$ACL.SetAccessRule($Execute)
$ACL | Set-Acl -Path "C:\Program Files\Somansa\PcBoanCare\"
$ACL.SetAccessRule($ReadData)
$ACL | Set-Acl -Path "C:\Program Files\Somansa\PcBoanCare\"
$ACL.SetAccessRule($ReadPermissions)
$ACL | Set-Acl -Path "C:\Program Files\Somansa\PcBoanCare\"
$ACL.SetAccessRule($ReadAttributes)
$ACL | Set-Acl -Path "C:\Program Files\Somansa\PcBoanCare\"
$ACL.SetAccessRule($ReadExtendedAttributes)
$ACL | Set-Acl -Path "C:\Program Files\Somansa\PcBoanCare\"

Write-Output "WebKeeper가 비활성화됨"
Write-Output "WebKeeper 프로그램 종료를 위해 로그오프가 필요합니다"

Write-Host -NoNewline '아무 키나 눌러 로그오프...'
$null = $Host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown')

logoff