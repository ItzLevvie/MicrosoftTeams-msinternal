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
    [ValidateSet("1.0", "2.0", "2.1")]
    [string]
    $Version,

    [Parameter(Mandatory = $true)]
    [ValidateSet("Desktop", "Rooms", IgnoreCase = $false)]
    [string]
    $Client,

    [Parameter(Mandatory = $false)]
    [ValidateSet("exe", "msi", IgnoreCase = $false)]
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

$Environment = $Environment.ToLower()
$Ring = $Ring.ToLower()
$Platform = $Platform.ToLower()
$Version = $Version.ToLower()
$Type = $Type.ToLower()
$ObjectId = $ObjectId.ToLower()
$TenantId = $TenantId.ToLower()

#
if ($Environment -eq "dev") {
    $dce146e66b2e5c0e104729239cc1ae15 = "https://config.teams.microsoft.com"
}
elseif ($Environment -eq "prod") {
    $dce146e66b2e5c0e104729239cc1ae15 = "https://config.teams.microsoft.com"
}
elseif ($Environment -eq "life") {
    $dce146e66b2e5c0e104729239cc1ae15 = "https://config.teams.microsoft.com"
}
elseif ($Environment -eq "gcc") {
    $dce146e66b2e5c0e104729239cc1ae15 = "https://config.teams.microsoft.com"
}
elseif ($Environment -eq "gcchigh") {
    $dce146e66b2e5c0e104729239cc1ae15 = "https://config.ecs.gov.teams.microsoft.us"
}
elseif ($Environment -eq "dod") {
    $dce146e66b2e5c0e104729239cc1ae15 = "https://config.ecs.dod.teams.microsoft.us"
}
elseif ($Environment -eq "gallatin") {
    $dce146e66b2e5c0e104729239cc1ae15 = "https://mooncake.config.teams.microsoft.com"
}

#
if ($Ring -eq "ring0") {
    $e783048973935431707b367c535d6ea4 = "https://staticsint.teams.cdn.office.net"
}
elseif ($Ring -eq "ring0_s") {
    $e783048973935431707b367c535d6ea4 = "https://staticsint.teams.cdn.office.net"
}
elseif ($Ring -eq "ring1") {
    $e783048973935431707b367c535d6ea4 = "https://staticsint.teams.cdn.office.net"
}
elseif ($Ring -eq "ring1_5") {
    $e783048973935431707b367c535d6ea4 = "https://statics.teams.cdn.office.net"
}
elseif ($Ring -eq "ring1_6") {
    $e783048973935431707b367c535d6ea4 = "https://statics.teams.cdn.office.net"
}
elseif ($Ring -eq "ring2") {
    $e783048973935431707b367c535d6ea4 = "https://statics.teams.cdn.office.net"
}
elseif ($Ring -eq "ring3") {
    $e783048973935431707b367c535d6ea4 = "https://statics.teams.cdn.office.net"
}
elseif ($Ring -eq "ring3_6") {
    $e783048973935431707b367c535d6ea4 = "https://statics.teams.cdn.office.net"
}
elseif ($Ring -eq "ring3_9") {
    $e783048973935431707b367c535d6ea4 = "https://statics.teams.cdn.office.net"
}
elseif ($Ring -eq "general") {
    $e783048973935431707b367c535d6ea4 = "https://statics.teams.cdn.office.net"
}
elseif ($Ring -eq "general_gcc") {
    $e783048973935431707b367c535d6ea4 = "https://statics.teams.cdn.office.net"
}

#
if ($Version -eq "1.0") {
    if ($Client -eq "Desktop") {
        if ($Platform -eq "win-x64") {
            if ($Type -eq "exe") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-x64"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows_x64.exe"
                $c53cc331b8934004bd5807be1b2b345e = "27"
            }
            if ($Type -eq "msi") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-x64"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows_x64.msi"
                $c53cc331b8934004bd5807be1b2b345e = "27"
            }
        }
        if ($Platform -eq "win-x86") {
            if ($Type -eq "exe") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows.exe"
                $c53cc331b8934004bd5807be1b2b345e = "27"
            }
            if ($Type -eq "msi") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows.msi"
                $c53cc331b8934004bd5807be1b2b345e = "27"
            }
        }
        if ($Platform -eq "win-arm64") {
            if ($Type -eq "exe") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-arm64"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows_arm64.exe"
                $c53cc331b8934004bd5807be1b2b345e = "27"
            }
            if ($Type -eq "msi") {
                $bd3078f40b0117196fdb4853563084e9 = "production-windows-arm64"
                $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_windows_arm64.msi"
                $c53cc331b8934004bd5807be1b2b345e = "27"
            }
        }
        if ($Platform -eq "osx-x64 + osx-arm64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-osx"
            $e7782dde7d9e6e4f63894a63138afbb9 = "Teams_osx.pkg"
            $c53cc331b8934004bd5807be1b2b345e = "28"
        }
    }
}
elseif ($Version -eq "2.0") {
    if ($Client -eq "Desktop") {
        if ($Platform -eq "win-x64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MicrosoftTeams-x64.msix"
            $c53cc331b8934004bd5807be1b2b345e = "48"
        }
        if ($Platform -eq "win-x86") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x86"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MicrosoftTeams-x86.msix"
            $c53cc331b8934004bd5807be1b2b345e = "48"
        }
        if ($Platform -eq "win-arm64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-arm64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MicrosoftTeams-arm64.msix"
            $c53cc331b8934004bd5807be1b2b345e = "48"
        }
    }
}
elseif ($Version -eq "2.1") {
    if ($Client -eq "Desktop") {
        if ($Platform -eq "win-x64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-x64.msix"
            $c53cc331b8934004bd5807be1b2b345e = "49"
        }
        if ($Platform -eq "win-x86") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x86"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-x86.msix"
            $c53cc331b8934004bd5807be1b2b345e = "49"
        }
        if ($Platform -eq "win-arm64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-arm64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-arm64.msix"
            $c53cc331b8934004bd5807be1b2b345e = "49"
        }
        if ($Platform -eq "osx-x64 + osx-arm64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-osx"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MicrosoftTeams.pkg"
            $c53cc331b8934004bd5807be1b2b345e = "50"
        }
    }
    if ($Client -eq "Rooms") {
        if ($Platform -eq "win-x64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-Rooms-x64.msix"
            $c53cc331b8934004bd5807be1b2b345e = "51"
        }
        if ($Platform -eq "win-x86") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-x86"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-Rooms-x86.msix"
            $c53cc331b8934004bd5807be1b2b345e = "51"
        }
        if ($Platform -eq "win-arm64") {
            $bd3078f40b0117196fdb4853563084e9 = "production-windows-arm64"
            $e7782dde7d9e6e4f63894a63138afbb9 = "MSTeams-Rooms-arm64.msix"
            $c53cc331b8934004bd5807be1b2b345e = "51"
        }
    }
}

#
$e49bb609ef26353d2c308ca6beb0de8f = 0
while ($e49bb609ef26353d2c308ca6beb0de8f -le 32) {
    try {
        $dfd1dfb880a3f7093614df7cc6364a33 = (Invoke-RestMethod -Uri "$dce146e66b2e5c0e104729239cc1ae15/config/v1/MicrosoftTeams/$($c53cc331b8934004bd5807be1b2b345e)_1.0.0.0?environment=$Environment&audienceGroup=$Ring&teamsRing=$Ring&id=$ObjectId&tenantId=$TenantId&agent=TeamsBuilds" -Method Get).BuildSettings
        if ($Version -eq "1.0") {
            if ($Client -eq "Desktop") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $a553ddde23e7dad4144c98d2e342ba31 = $dfd1dfb880a3f7093614df7cc6364a33.Desktop.windows64.latestVersion
                }
                if ($Platform -eq "osx-x64 + osx-arm64") {
                    $a553ddde23e7dad4144c98d2e342ba31 = $dfd1dfb880a3f7093614df7cc6364a33.Desktop.osx.latestVersion
                }
            }
        }
        elseif ($Version -eq "2.0") {
            if ($Client -eq "Desktop") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $a553ddde23e7dad4144c98d2e342ba31 = $dfd1dfb880a3f7093614df7cc6364a33.WebView2.x64.latestVersion
                }
            }
        }
        elseif ($Version -eq "2.1") {
            if ($Client -eq "Desktop") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $a553ddde23e7dad4144c98d2e342ba31 = $dfd1dfb880a3f7093614df7cc6364a33.WebView2Canary.x64.latestVersion
                }
                if ($Platform -eq "osx-x64 + osx-arm64") {
                    $a553ddde23e7dad4144c98d2e342ba31 = $dfd1dfb880a3f7093614df7cc6364a33.WebView2Canary.macOS.latestVersion
                }
            }
            if ($Client -eq "Rooms") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $a553ddde23e7dad4144c98d2e342ba31 = $dfd1dfb880a3f7093614df7cc6364a33.WebView2Canary.MTRW.x64.latestVersion
                    if ($null -eq $a553ddde23e7dad4144c98d2e342ba31) {
                        $a553ddde23e7dad4144c98d2e342ba31 = $dfd1dfb880a3f7093614df7cc6364a33.WebView2Canary.x64.latestVersion
                    }
                }
            }
        }
        if ($a553ddde23e7dad4144c98d2e342ba31) {
            $b0d2ed7ea6bb774a6b2c75f7f3a121eb = (Invoke-WebRequest -Uri "$e783048973935431707b367c535d6ea4/$bd3078f40b0117196fdb4853563084e9/$a553ddde23e7dad4144c98d2e342ba31/$e7782dde7d9e6e4f63894a63138afbb9" -Method Head)

            $2d12ae434d57fdb66f008265c8629877 = [string]$b0d2ed7ea6bb774a6b2c75f7f3a121eb.Headers["Last-Modified"]
            $5285c2f58cbd36531882b608e7e478e2 = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId((Get-Date -Date $2d12ae434d57fdb66f008265c8629877), "Pacific Standard Time")
            $e1e240488e5eef1f776376b0ebf7609a = (Get-Date -Date $5285c2f58cbd36531882b608e7e478e2 -Format "dddd, MMMM d, yyyy") + " at " + (Get-Date -Date $5285c2f58cbd36531882b608e7e478e2 -Format "h:mm tt")

            $abad549e7d030b408b70f72f08de798a = [string]$b0d2ed7ea6bb774a6b2c75f7f3a121eb.Headers["Content-Length"] / 1024 / 1024
            $e0167d390ca0b503d10f31ed2ded6eb4 = [System.Math]::Round($abad549e7d030b408b70f72f08de798a)

            Write-Output "  $a553ddde23e7dad4144c98d2e342ba31 ($Platform) - published on $e1e240488e5eef1f776376b0ebf7609a with $e0167d390ca0b503d10f31ed2ded6eb4 MB: $e783048973935431707b367c535d6ea4/$bd3078f40b0117196fdb4853563084e9/$a553ddde23e7dad4144c98d2e342ba31/$e7782dde7d9e6e4f63894a63138afbb9"
        }
        break
    }
    catch {
        $e49bb609ef26353d2c308ca6beb0de8f++
    }
}
