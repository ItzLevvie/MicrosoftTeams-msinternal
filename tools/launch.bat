@echo off
(
    echo URLs for the latest continuous deployment build of Microsoft Teams:
    node "src\Continuous Deployment\exe\win-x64.js"
    node "src\Continuous Deployment\msi\win-x64.js"
    node "src\Continuous Deployment\exe\win-x86.js"
    node "src\Continuous Deployment\msi\win-x86.js"
    node "src\Continuous Deployment\exe\win-arm64.js"
    node "src\Continuous Deployment\msi\win-arm64.js"
    node "src\Continuous Deployment\pkg\osx-x64.js"
    echo:
    echo URLs for the latest exploration build of Microsoft Teams:
    node "src\Exploration\exe\win-x64.js"
    node "src\Exploration\msi\win-x64.js"
    node "src\Exploration\exe\win-x86.js"
    node "src\Exploration\msi\win-x86.js"
    node "src\Exploration\exe\win-arm64.js"
    node "src\Exploration\msi\win-arm64.js"
    node "src\Exploration\pkg\osx-x64.js"
    echo:
    echo URLs for the latest preview build of Microsoft Teams:
    node "src\Preview\exe\win-x64.js"
    node "src\Preview\msi\win-x64.js"
    node "src\Preview\exe\win-x86.js"
    node "src\Preview\msi\win-x86.js"
    node "src\Preview\exe\win-arm64.js"
    node "src\Preview\msi\win-arm64.js"
    node "src\Preview\pkg\osx-x64.js"
    node "src\Preview\deb\linux-x64.js"
    echo:
    echo URLs for the latest production build of Microsoft Teams:
    node "src\Production\exe\win-x64.js"
    node "src\Production\msi\win-x64.js"
    node "src\Production\exe\win-x86.js"
    node "src\Production\msi\win-x86.js"
    node "src\Production\exe\win-arm64.js"
    node "src\Production\msi\win-arm64.js"
    node "src\Production\pkg\osx-x64.js"
    node "src\Production\deb\linux-x64.js"
) > defconfig
