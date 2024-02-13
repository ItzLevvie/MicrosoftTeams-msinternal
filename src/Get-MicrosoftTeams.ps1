param (
    [Parameter(Mandatory = $true)]
    [ValidateSet("dev", "prod", "life", "gcc", "gcchigh", "dod", "gallatin", IgnoreCase = $false)]
    [string]
    $Environment,

    [Parameter(Mandatory = $true)]
    [ValidateSet("ring0", "ring0_s", "ring1", "ring1_5", "ring1_6", "ring2", "ring3", "ring3_6", "ring3_9", "general", "general_gcc", IgnoreCase = $false)]
    [string]
    $Ring,

    [Parameter(Mandatory = $true)]
    [ValidateSet("win-x64", "win-x86", "win-arm64", "osx-x64 + osx-arm64", IgnoreCase = $false)]
    [string]
    $Platform,

    [Parameter(Mandatory = $true)]
    [ValidateSet("1.0", "2.0", "2.1", IgnoreCase = $false)]
    [string]
    $Version,

    [Parameter(Mandatory = $true)]
    [ValidateSet("Desktop", "Rooms", "Xbox", IgnoreCase = $false)]
    [string]
    $Client,

    [Parameter(Mandatory = $false)]
    [ValidateSet("exe", "msi", "msix", IgnoreCase = $false)]
    [string]
    $Type,

    [Parameter(Mandatory = $false)]
    [ArgumentCompletions("3a7cf1d3-06fa-4ead-bf45-a6286ff2620a")]
    [string]
    $ObjectId,

    [Parameter(Mandatory = $false)]
    [ArgumentCompletions("72f988bf-86f1-41af-91ab-2d7cd011db47")]
    [string]
    $TenantId
)

$ErrorActionPreference = "SilentlyContinue"
$ProgressPreference = "SilentlyContinue"

$ObjectId = $ObjectId.ToLower()
$TenantId = $TenantId.ToLower()

#
if ($Environment -eq "dev" -or $Environment -eq "prod" -or $Environment -eq "life" -or $Environment -eq "gcc") {
    $ecsUrl = "https://config.teams.microsoft.com"
}
if ($Environment -eq "gcchigh") {
    $ecsUrl = "https://config.ecs.gov.teams.microsoft.us"
}
if ($Environment -eq "dod") {
    $ecsUrl = "https://config.ecs.dod.teams.microsoft.us"
}
if ($Environment -eq "gallatin") {
    $ecsUrl = "https://mooncake.config.teams.microsoft.com"
}

#
if ($Ring -eq "ring0" -or $Ring -eq "ring0_s" -or $Ring -eq "ring1") {
    $staticsPath = "https://staticsint.teams.cdn.office.net"
    if ($Client -eq "Xbox") {
        $staticsPath = "https://statics.teams.cdn.office.net"
        if ($Ring -eq "ring0_s") {
            $Ring = "ring0"
        }
    }
}
if ($Ring -eq "ring1_5" -or $Ring -eq "ring1_6" -or $Ring -eq "ring2" -or $Ring -eq "ring3" -or $Ring -eq "ring3_6" -or $Ring -eq "ring3_9" -or $Ring -eq "general" -or $Ring -eq "general_gcc") {
    $staticsPath = "https://statics.teams.cdn.office.net"
}

#
if ($Version -eq "1.0") {
    if ($Client -eq "Desktop") {
        $platformId = "27"
        if ($Platform -eq "win-x64") {
            if ($Type -eq "exe") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-x64"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows_x64.exe"
            }
            if ($Type -eq "msi") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-x64"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows_x64.msi"
            }
            if ($Type -eq "msix") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-msix-x64"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows_x64.msix"
            }
        }
        if ($Platform -eq "win-x86") {
            if ($Type -eq "exe") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows.exe"
            }
            if ($Type -eq "msi") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows.msi"
            }
            if ($Type -eq "msix") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-msix"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows.msix"
            }
        }
        if ($Platform -eq "win-arm64") {
            if ($Type -eq "exe") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-arm64"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows_arm64.exe"
            }
            if ($Type -eq "msi") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-arm64"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows_arm64.msi"
            }
            if ($Type -eq "msix") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-msix-arm64"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows_arm64.msix"
            }
        }
        if ($Platform -eq "osx-x64 + osx-arm64") {
            $platformId = "28"
            $bd3078f40b0117196fdb4853563084e9 = "production-osx"
            $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_osx.pkg"
        }
    }
}
if ($Version -eq "2.0") {
    $platformId = "48"
    if ($Client -eq "Desktop") {
        if ($Platform -eq "win-x64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MicrosoftTeams-x64.msix"
        }
        if ($Platform -eq "win-x86") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x86"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MicrosoftTeams-x86.msix"
        }
        if ($Platform -eq "win-arm64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-arm64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MicrosoftTeams-arm64.msix"
        }
    }
    if ($Client -eq "Xbox") {
        if ($Platform -eq "win-x64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-xbox-x64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeamsPlayTogether_x64.msixbundle"
        }
        if ($Platform -eq "win-x86") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-xbox-x86"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeamsPlayTogether_x86.msixbundle"
        }
    }
}
if ($Version -eq "2.1") {
    if ($Client -eq "Desktop") {
        $platformId = "49"
        if ($Platform -eq "win-x64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-x64.msix"
        }
        if ($Platform -eq "win-x86") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x86"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-x86.msix"
        }
        if ($Platform -eq "win-arm64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-arm64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-arm64.msix"
        }
        if ($Platform -eq "osx-x64 + osx-arm64") {
            $platformId = "50"
            $bd3078f40b0117196fdb4853563084e9 = "production-osx"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MicrosoftTeams.pkg"
        }
    }
    if ($Client -eq "Rooms") {
        $platformId = "51"
        if ($Platform -eq "win-x64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-Rooms-x64.msix"
        }
        if ($Platform -eq "win-x86") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x86"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-Rooms-x86.msix"
        }
        if ($Platform -eq "win-arm64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-arm64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-Rooms-arm64.msix"
        }
    }
}

#
$i = 0
while ($i -le 32) {
    try {
        $dfd1dfb880a3f7093614df7cc6364a33 = (Invoke-RestMethod -Uri "$ecsUrl/config/v1/MicrosoftTeams/$($platformId)_1.0.0.0?environment=$Environment&audienceGroup=$Ring&teamsRing=$Ring&id=$ObjectId&tenantId=$TenantId&agent=TeamsBuilds" -Method Get).BuildSettings
        if ($Version -eq "1.0") {
            if ($Client -eq "Desktop") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $buildVersion = $dfd1dfb880a3f7093614df7cc6364a33.Desktop.windows64.latestVersion
                }
                if ($Platform -eq "osx-x64 + osx-arm64") {
                    $buildVersion = $dfd1dfb880a3f7093614df7cc6364a33.Desktop.osx.latestVersion
                }
            }
        }
        if ($Version -eq "2.0") {
            if ($Client -eq "Desktop") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $buildVersion = $dfd1dfb880a3f7093614df7cc6364a33.WebView2.x64.latestVersion
                }
            }
            if ($Client -eq "Xbox") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86") {
                    $buildVersion = $dfd1dfb880a3f7093614df7cc6364a33.GamebarWidget.x64.latestVersion
                }
            }
        }
        if ($Version -eq "2.1") {
            if ($Client -eq "Desktop") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $buildVersion = $dfd1dfb880a3f7093614df7cc6364a33.WebView2Canary.x64.latestVersion
                }
                if ($Platform -eq "osx-x64 + osx-arm64") {
                    $buildVersion = $dfd1dfb880a3f7093614df7cc6364a33.WebView2Canary.macOS.latestVersion
                }
            }
            if ($Client -eq "Rooms") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $buildVersion = $dfd1dfb880a3f7093614df7cc6364a33.WebView2Canary.MTRW.x64.latestVersion
                    if ($null -eq $buildVersion) {
                        $buildVersion = $dfd1dfb880a3f7093614df7cc6364a33.WebView2Canary.x64.latestVersion
                    }
                }
            }
        }
        if ($buildVersion) {
            $b0d2ed7ea6bb774a6b2c75f7f3a121eb = (Invoke-WebRequest -Uri "$staticsPath/$bd3078f40b0117196fdb4853563084e9/$buildVersion/$e7782dde7d9e6e4f63894a63138afbb9" -Method Head)

            $2d12ae434d57fdb66f008265c8629877 = [string]$b0d2ed7ea6bb774a6b2c75f7f3a121eb.Headers["Last-Modified"]
            $5285c2f58cbd36531882b608e7e478e2 = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId((Get-Date -Date $2d12ae434d57fdb66f008265c8629877), "Pacific Standard Time")
            $e1e240488e5eef1f776376b0ebf7609a = (Get-Date -Date $5285c2f58cbd36531882b608e7e478e2 -Format "dddd, MMMM d, yyyy") + " at " + (Get-Date -Date $5285c2f58cbd36531882b608e7e478e2 -Format "h:mm tt")

            $abad549e7d030b408b70f72f08de798a = [string]$b0d2ed7ea6bb774a6b2c75f7f3a121eb.Headers["Content-Length"] / 1024 / 1024
            $e0167d390ca0b503d10f31ed2ded6eb4 = [System.Math]::Round($abad549e7d030b408b70f72f08de798a)

            Write-Output "  $buildVersion ($Platform) - published on $e1e240488e5eef1f776376b0ebf7609a with $e0167d390ca0b503d10f31ed2ded6eb4 MB: $staticsPath/$bd3078f40b0117196fdb4853563084e9/$buildVersion/$e7782dde7d9e6e4f63894a63138afbb9"
        }
        break
    }
    catch {
        $i++
    }
}
