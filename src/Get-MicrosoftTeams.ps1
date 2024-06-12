param (
    [Parameter(Mandatory = $true)]
    [ValidateSet("dev", "prod", "life", "gcc", "gcchigh", "dod", "gallatin", IgnoreCase = $false)]
    [string]$Environment,

    [Parameter(Mandatory = $true)]
    [ValidateSet("ring0", "ring0_s", "ring1", "ring1_5", "ring1_6", "ring2", "ring3", "ring3_6", "ring3_9", "general", "general_gcc", IgnoreCase = $false)]
    [string]$Ring,

    [Parameter(Mandatory = $true)]
    [ValidateSet("win-x64", "win-x86", "win-arm64", "osx-x64 + osx-arm64", IgnoreCase = $false)]
    [string]$Platform,

    [Parameter(Mandatory = $true)]
    [ValidateSet("Desktop", "Rooms", "Xbox", IgnoreCase = $false)]
    [string]$Client,

    [Parameter(Mandatory = $true)]
    [ValidateSet("1.0", "2.0", "2.1", IgnoreCase = $false)]
    [string]$Version,

    [Parameter(Mandatory = $false)]
    [ValidateSet("exe", "msi", "msix", IgnoreCase = $false)]
    [string]$Type,

    [Parameter(Mandatory = $false)]
    [ArgumentCompletions("3a7cf1d3-06fa-4ead-bf45-a6286ff2620a")]
    [string]$ObjectId,

    [Parameter(Mandatory = $false)]
    [ArgumentCompletions("72f988bf-86f1-41af-91ab-2d7cd011db47")]
    [string]$TenantId
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
    $staticsUrl = "https://staticsint.teams.cdn.office.net"
    if ($Client -eq "Xbox") {
        $staticsUrl = "https://statics.teams.cdn.office.net"
        if ($Ring -eq "ring0_s") {
            $Ring = "ring0"
        }
    }
}
if ($Ring -eq "ring1_5" -or $Ring -eq "ring1_6" -or $Ring -eq "ring2" -or $Ring -eq "ring3" -or $Ring -eq "ring3_6" -or $Ring -eq "ring3_9" -or $Ring -eq "general" -or $Ring -eq "general_gcc") {
    $staticsUrl = "https://statics.teams.cdn.office.net"
}

#
if ($Version -eq "1.0") {
    if ($Client -eq "Desktop") {
        $platformId = "27"
        if ($Platform -eq "win-x64") {
            if ($Type -eq "exe") {
                $filePath = "production-windows-x64"
                $fileName = "Teams_windows_x64.exe"
            }
            if ($Type -eq "msi") {
                $filePath = "production-windows-x64"
                $fileName = "Teams_windows_x64.msi"
            }
            if ($Type -eq "msix") {
                $filePath = "production-windows-msix-x64"
                $fileName = "Teams_windows_x64.msix"
            }
        }
        if ($Platform -eq "win-x86") {
            if ($Type -eq "exe") {
                $filePath = "production-windows"
                $fileName = "Teams_windows.exe"
            }
            if ($Type -eq "msi") {
                $filePath = "production-windows"
                $fileName = "Teams_windows.msi"
            }
            if ($Type -eq "msix") {
                $filePath = "production-windows-msix"
                $fileName = "Teams_windows.msix"
            }
        }
        if ($Platform -eq "win-arm64") {
            if ($Type -eq "exe") {
                $filePath = "production-windows-arm64"
                $fileName = "Teams_windows_arm64.exe"
            }
            if ($Type -eq "msi") {
                $filePath = "production-windows-arm64"
                $fileName = "Teams_windows_arm64.msi"
            }
            if ($Type -eq "msix") {
                $filePath = "production-windows-msix-arm64"
                $fileName = "Teams_windows_arm64.msix"
            }
        }
        if ($Platform -eq "osx-x64 + osx-arm64") {
            $platformId = "28"
            $filePath = "production-osx"
            $fileName = "Teams_osx.pkg"
        }
    }
}
if ($Version -eq "2.0") {
    $platformId = "48"
    if ($Ring -eq "ring0") {
        $platformId = "49"
    }
    if ($Client -eq "Desktop") {
        if ($Platform -eq "win-x64") {
            $filePath = "production-windows-x64"
            $fileName = "MicrosoftTeams-x64.msix"
        }
        if ($Platform -eq "win-x86") {
            $filePath = "production-windows-x86"
            $fileName = "MicrosoftTeams-x86.msix"
        }
        if ($Platform -eq "win-arm64") {
            $filePath = "production-windows-arm64"
            $fileName = "MicrosoftTeams-arm64.msix"
        }
    }
    if ($Client -eq "Xbox") {
        if ($Platform -eq "win-x64") {
            $filePath = "production-windows-xbox-x64"
            $fileName = "MSTeamsPlayTogether_x64.msixbundle"
        }
        if ($Platform -eq "win-x86") {
            $filePath = "production-windows-xbox-x86"
            $fileName = "MSTeamsPlayTogether_x86.msixbundle"
        }
    }
}
if ($Version -eq "2.1") {
    if ($Client -eq "Desktop") {
        $platformId = "49"
        if ($Platform -eq "win-x64") {
            $filePath = "production-windows-x64"
            $fileName = "MSTeams-x64.msix"
        }
        if ($Platform -eq "win-x86") {
            $filePath = "production-windows-x86"
            $fileName = "MSTeams-x86.msix"
        }
        if ($Platform -eq "win-arm64") {
            $filePath = "production-windows-arm64"
            $fileName = "MSTeams-arm64.msix"
        }
        if ($Platform -eq "osx-x64 + osx-arm64") {
            $platformId = "50"
            $filePath = "production-osx"
            $fileName = "MicrosoftTeams.pkg"
        }
    }
    if ($Client -eq "Rooms") {
        $platformId = "51"
        if ($Platform -eq "win-x64") {
            $filePath = "production-windows-x64"
            $fileName = "MSTeams-Rooms-x64.msix"
        }
        if ($Platform -eq "win-x86") {
            $filePath = "production-windows-x86"
            $fileName = "MSTeams-Rooms-x86.msix"
        }
        if ($Platform -eq "win-arm64") {
            $filePath = "production-windows-arm64"
            $fileName = "MSTeams-Rooms-arm64.msix"
        }
    }
}

#
$maxAttempts = 0
while ($maxAttempts -le 32) {
    try {
        if ($ObjectId -and $TenantId) {
            $TeamsBuilds = (Invoke-RestMethod -Uri "$ecsUrl/config/v1/MicrosoftTeams/$($platformId)_1.0.0.0?environment=$($Environment)&audienceGroup=$($Ring)&teamsRing=$($Ring)&id=$($ObjectId)&tenantId=$($TenantId)&agent=TeamsBuilds" -Method Get).BuildSettings
        }
        else {
            $TeamsBuilds = (Invoke-RestMethod -Uri "$ecsUrl/config/v1/MicrosoftTeams/$($platformId)_1.0.0.0?environment=$($Environment)&audienceGroup=$($Ring)&teamsRing=$($Ring)&agent=TeamsBuilds" -Method Get).BuildSettings
        }
        if ($Version -eq "1.0") {
            if ($Client -eq "Desktop") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $buildVersion = $TeamsBuilds.Desktop.windows64.latestVersion
                }
                if ($Platform -eq "osx-x64 + osx-arm64") {
                    $buildVersion = $TeamsBuilds.Desktop.osx.latestVersion
                }
            }
        }
        if ($Version -eq "2.0") {
            if ($Client -eq "Desktop") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $buildVersion = $TeamsBuilds.WebView2.x64.latestVersion
                }
            }
            if ($Client -eq "Xbox") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86") {
                    $buildVersion = $TeamsBuilds.GamebarWidget.x64.latestVersion
                }
            }
        }
        if ($Version -eq "2.1") {
            if ($Client -eq "Desktop") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $buildVersion = $TeamsBuilds.WebView2Canary.x64.latestVersion
                }
                if ($Platform -eq "osx-x64 + osx-arm64") {
                    $buildVersion = $TeamsBuilds.WebView2Canary.macOS.latestVersion
                }
            }
            if ($Client -eq "Rooms") {
                if ($Platform -eq "win-x64" -or $Platform -eq "win-x86" -or $Platform -eq "win-arm64") {
                    $buildVersion = $TeamsBuilds.WebView2Canary.MTRW.x64.latestVersion
                    if ($null -eq $buildVersion) {
                        $buildVersion = $TeamsBuilds.WebView2Canary.x64.latestVersion
                    }
                }
            }
        }
        if ($buildVersion) {
            $fileUrl = (Invoke-WebRequest -Uri "$staticsUrl/$filePath/$buildVersion/$fileName" -Method Head)

            $fileLastModified = [string]$fileUrl.Headers["Last-Modified"]
            $convertDateToPST = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId((Get-Date -Date $fileLastModified), "Pacific Standard Time")
            $formatDate = (Get-Date -Date $convertDateToPST -Format "dddd, MMMM d, yyyy") + " at " + (Get-Date -Date $convertDateToPST -Format "h:mm tt")

            $convertFileSizeToMB = [string]$fileUrl.Headers["Content-Length"] / 1024 / 1024
            $roundFileSize = [System.Math]::Round($convertFileSizeToMB)

            Write-Output "  $buildVersion ($Platform) - published on $formatDate with $roundFileSize MB: $staticsUrl/$filePath/$buildVersion/$fileName"
        }
        break
    }
    catch {
        $maxAttempts++
    }
}
