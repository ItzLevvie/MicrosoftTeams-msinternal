$ErrorActionPreference = "SilentlyContinue"
$ProgressPreference = "SilentlyContinue"

$a119da4b5a9f3e8851e58d4d9a37604a = "https://statics.teams.cdn.office.net"
$b3a439fdbf1a6ecc01de6445ee82b547 = "production-windows-arm64"
$ae633e497ada527ef7c57413d1d1ac3c = "Teams_windows_arm64.msi"
$fe6fde81dcb0a79dd8310604ca4b266a = "win-arm64"

for (($fda625b81e647d7c6acd91aed9ae8ecd = [int](Get-Content -Path "..\..\.github\ci\v1.0\Continuous Deployment\msi\$fe6fde81dcb0a79dd8310604ca4b266a.txt")), ($f62d19962ff48160c9e1e0332e7ef11c = $fda625b81e647d7c6acd91aed9ae8ecd + 512); $fda625b81e647d7c6acd91aed9ae8ecd -le $f62d19962ff48160c9e1e0332e7ef11c; $fda625b81e647d7c6acd91aed9ae8ecd++) {
    if ($fda625b81e647d7c6acd91aed9ae8ecd -match "^([0-9][0-9][0-9][5-9][0-9])$") {
        $ab3b0e88a3e2899c2990b7cab3d3c26f = (Invoke-WebRequest -Uri "$a119da4b5a9f3e8851e58d4d9a37604a/$b3a439fdbf1a6ecc01de6445ee82b547/1.5.00.$fda625b81e647d7c6acd91aed9ae8ecd/$ae633e497ada527ef7c57413d1d1ac3c" -Method Head)
        if ($ab3b0e88a3e2899c2990b7cab3d3c26f) {
            $c05e6f4daf8c300393e85febda03e9fc = @()
            $c05e6f4daf8c300393e85febda03e9fc += $fda625b81e647d7c6acd91aed9ae8ecd
            Write-Output "$c05e6f4daf8c300393e85febda03e9fc" > "..\..\.github\ci\v1.0\Continuous Deployment\msi\$fe6fde81dcb0a79dd8310604ca4b266a.txt"
            $c28d3d1349dbbde7c419ba13df245e25 = [string]$ab3b0e88a3e2899c2990b7cab3d3c26f.Headers["Last-Modified"]
            $6f23ddfe07c161f84ec0b19efcc96f84 = [string]$ab3b0e88a3e2899c2990b7cab3d3c26f.Headers["Content-Length"] / 1024 / 1024
            $ed87954bd831ca3d16ae52758005c27f = [System.Math]::Round($6f23ddfe07c161f84ec0b19efcc96f84)
            $bc9ca387c6d3ecefe4cbe9c390372057 = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId((Get-Date -Date $c28d3d1349dbbde7c419ba13df245e25), "Pacific Standard Time")
            $cd34ed983a00789e278cf0186c460fcf = $bc9ca387c6d3ecefe4cbe9c390372057.toString("dddd") + ", " + $bc9ca387c6d3ecefe4cbe9c390372057.toString("MMMM d") + ", " + $bc9ca387c6d3ecefe4cbe9c390372057.toString("yyyy") + " at " + $bc9ca387c6d3ecefe4cbe9c390372057.toString("h:mm tt")
            $ab3b0e88a3e2899c2990b7cab3d3c26f = $null
        }
    }
}

Write-Output "1.5.00.$c05e6f4daf8c300393e85febda03e9fc ($fe6fde81dcb0a79dd8310604ca4b266a) - published on $cd34ed983a00789e278cf0186c460fcf with $ed87954bd831ca3d16ae52758005c27f MB: $a119da4b5a9f3e8851e58d4d9a37604a/$b3a439fdbf1a6ecc01de6445ee82b547/1.5.00.$c05e6f4daf8c300393e85febda03e9fc/$ae633e497ada527ef7c57413d1d1ac3c"
