$ErrorActionPreference = "SilentlyContinue"
$ProgressPreference = "SilentlyContinue"

$a119da4b5a9f3e8851e58d4d9a37604a = "https://packages.microsoft.com"
$b3a439fdbf1a6ecc01de6445ee82b547 = "/repos/ms-teams/pool/main/t/teams/"
$ae633e497ada527ef7c57413d1d1ac3c = (Invoke-WebRequest -Uri "$a119da4b5a9f3e8851e58d4d9a37604a$b3a439fdbf1a6ecc01de6445ee82b547" -Method Get).Links.href -match "teams_1.5.00.\d{5}" | Select-Object -Last 1
$fe6fde81dcb0a79dd8310604ca4b266a = "linux-x64"

$f81c0741da1b5af54439d415944d3dfa = $ae633e497ada527ef7c57413d1d1ac3c.TrimStart("teams_").TrimEnd("_amd64.deb")

if ($ae633e497ada527ef7c57413d1d1ac3c) {
    $ab3b0e88a3e2899c2990b7cab3d3c26f = (Invoke-WebRequest -Uri "$a119da4b5a9f3e8851e58d4d9a37604a$b3a439fdbf1a6ecc01de6445ee82b547$ae633e497ada527ef7c57413d1d1ac3c" -Method Head)
    $c28d3d1349dbbde7c419ba13df245e25 = [string]$ab3b0e88a3e2899c2990b7cab3d3c26f.Headers["Last-Modified"]
    $6f23ddfe07c161f84ec0b19efcc96f84 = [string]$ab3b0e88a3e2899c2990b7cab3d3c26f.Headers["Content-Length"] / 1024 / 1024
    $ed87954bd831ca3d16ae52758005c27f = [System.Math]::Round($6f23ddfe07c161f84ec0b19efcc96f84)
    $bc9ca387c6d3ecefe4cbe9c390372057 = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId((Get-Date -Date $c28d3d1349dbbde7c419ba13df245e25), "Pacific Standard Time")
    $cd34ed983a00789e278cf0186c460fcf = $bc9ca387c6d3ecefe4cbe9c390372057.toString("dddd") + ", " + $bc9ca387c6d3ecefe4cbe9c390372057.toString("MMMM d") + ", " + $bc9ca387c6d3ecefe4cbe9c390372057.toString("yyyy") + " at " + $bc9ca387c6d3ecefe4cbe9c390372057.toString("h:mm tt")
    Write-Output "$f81c0741da1b5af54439d415944d3dfa ($fe6fde81dcb0a79dd8310604ca4b266a) - published on $cd34ed983a00789e278cf0186c460fcf with $ed87954bd831ca3d16ae52758005c27f MB: $a119da4b5a9f3e8851e58d4d9a37604a$b3a439fdbf1a6ecc01de6445ee82b547$ae633e497ada527ef7c57413d1d1ac3c"
}

Remove-Variable * -ErrorAction SilentlyContinue
