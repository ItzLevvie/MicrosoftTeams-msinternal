<img src="https://github.com/ItzLevvie/MicrosoftTeams-msinternal/assets/11600822/28e6240c-fc9d-4add-a479-6ef433f47396" width="256" height="256">

# Welcome to the build repository for Microsoft Teams

This repository contains multiple files:
* [defconfig](defconfig) which shows daily builds, experimental builds, preview builds, and public builds for Microsoft Teams classic.
* [defconfig2](defconfig2) which shows builds in all rings for Microsoft Teams (free), Microsoft Teams classic, Microsoft Teams (work or school), and Microsoft Teams Rooms.

This repository contains the source code for:
* [Get-MicrosoftTeams.ps1](src/Get-MicrosoftTeams.ps1) which allows you to fetch the latest builds in different environments, and different rings.
* [launch.ps1](tools/launch.ps1) which allows you to create your own `RELEASES` file.

> [!IMPORTANT]
> If you have any feedback for Microsoft Teams (free), please submit them to our [public feedback portal](https://aka.ms/teamslifefeedback), or to our [private feedback portal - only available to Microsoft employees](https://aka.ms/teamslifeinternalfeedback).
>
> If you have any feedback for Microsoft Teams (work or school), please submit them to our [public feedback portal](https://aka.ms/teamsfeedback), or to our [private feedback portal - only available to Microsoft employees](https://aka.ms/teamsinternalfeedback).

> [!NOTE]
> Installing these builds does not necessarily mean you will have access to new features.
> For more information, please visit [this blog post](https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-release-processes-why-do-i-not-see-a-feature-but/ba-p/2110426).

## Frequently Asked Questions (FAQ)

### Teams 1.0 — Microsoft Teams classic based on Electron 19.1.8

<details>
  <summary>What are daily builds?</summary>
  Preview the latest development builds of Microsoft Teams.
  These builds may also contain newer versions of SlimCore.
</details>

<details>
  <summary>What are experimental builds?</summary>
  Preview the latest development builds of Microsoft Teams but with access to new ideas which may or may not ship into daily builds. These builds may also contain newer versions of SlimCore.
  <br> <br>

  `-E` will be displayed in the three-dot menu (`...`) > `About` > `Version`:
  ![image](https://github.com/ItzLevvie/MicrosoftTeams-msinternal/assets/11600822/342163d8-da9d-441b-b2c5-b927b0eaf196)
</details>

----

### Teams 2.0 — Microsoft Teams (free) based on Microsoft Edge WebView2
### Teams 2.1 — Microsoft Teams (work or school) based on Microsoft Edge WebView2
### Teams 2.1 — Microsoft Teams Rooms based on Microsoft Edge WebView2

<details>
  <summary>What are Canary (R0) builds?</summary>
  Preview the latest development builds of Microsoft Teams.
</details>

<details>
  <summary>What are Canary SlimCore (R0s) builds?</summary>
  Preview the latest development builds of Microsoft Teams but with access to newer versions of SlimCore.
</details>

----

### How can I use this repository for my scripts?

Microsoft Teams uses Experimentation and Configuration Service (ECS) to retrieve the latest builds, experiments, feature flags, settings, and more.

<details>
  <summary>Here are a few examples:</summary>

  | Domain | Experimentation and Configuration Service (ECS) |
  | -------| ----------------- |
  | https://teams.live.com | https://config.teams.microsoft.com/config/v1/MicrosoftTeams/48_1.0.0.0?environment=life&audienceGroup=general&teamsRing=general&agent=TeamsBuilds |
  | https://teams.microsoft.com <br> <br> https://int.teams.microsoft.com <br> <br> https://devspaces.skype.com | https://config.teams.microsoft.com/config/v1/MicrosoftTeams/49_1.0.0.0?environment=prod&audienceGroup=general&teamsRing=general&agent=TeamsBuilds |
  | https://gov.teams.microsoft.us | https://config.ecs.gov.teams.microsoft.us/config/v1/MicrosoftTeams/49_1.0.0.0?environment=gcchigh&audienceGroup=general&teamsRing=general&agent=TeamsBuilds |
  | https://dod.teams.microsoft.us | https://config.ecs.dod.teams.microsoft.us/config/v1/MicrosoftTeams/49_1.0.0.0?environment=dod&audienceGroup=general&teamsRing=general&agent=TeamsBuilds |
  | https://teams.microsoftonline.cn | https://mooncake.config.teams.microsoft.com/config/v1/MicrosoftTeams/49_1.0.0.0?environment=gallatin&audienceGroup=general&teamsRing=general&agent=TeamsBuilds |
</details>

<details>
  <summary>Here are a few examples of these parameters:</summary>

  | Parameter | Value |
  | --------- | ----- |
  | `environment` | `dev`; `prod`; `life`; `gcc`; `gcchigh`; `dod`; `gallatin`; `ag08`; `ag09` |
  | `audienceGroup` | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
  | `teamsRing` | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
  | `experience` | `cdl-worker`; `react-web-client`; `multi-window`; `meeting-room` |
  | `buildType` | `production`; `container`; `local` |
  | `osPlatform` | `windows`; `mac`; `linux`; `chromeos` |
  | `id` | Your Object ID from Microsoft Entra ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` |
  | `aaduserid` | Your Object ID from Microsoft Entra ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` |
  | `tenantId` | Your Tenant ID from Microsoft Entra ID. <br> <br> This repository uses `72f988bf-86f1-41af-91ab-2d7cd011db47` |
  | `agent` | `Segmentation`; `TeamsBuilds`; `TeamsNorthstar`; `TeamsWebview2` |
</details>

----

### What are the different platform IDs?

Microsoft Teams uses platform IDs to differentiate different platforms for flighting, telemetry, and more.

<details>
  <summary>Here are a few examples:</summary>

  | Platform ID | Friendly Name |
  | ------------- | ----------- |
  | 27 | Microsoft Teams classic based on Electron (Windows) |
  | 28 | Microsoft Teams classic based on Electron (macOS) |
  | 34 | Microsoft Teams Rooms based on Electron (Windows) |
  | 35 | Microsoft Teams classic for Surface Hub based on Electron (Windows) |
  | 38 | Microsoft Teams classic for Surface Hub 2 based on Electron (Windows) |
  | 41 | Microsoft Teams classic based on Electron (Linux) |
  | 48 | Microsoft Teams (free) based on Microsoft Edge WebView2 (Windows) |
  | 49 | Microsoft Teams (work or school) based on Microsoft Edge WebView2 (Windows) |
  | 50 | Microsoft Teams (work or school) based on Microsoft Edge WebView2 (macOS) |
  | 51 | Microsoft Teams Rooms based on Microsoft Edge WebView2 (Windows) |
  | 1415 | Microsoft Teams Web (Windows, macOS, and Linux) |
  | 1416 | Microsoft Teams (Android) |
  | 1417 | Microsoft Teams (iOS) |
  | 1449 | Microsoft Teams Rooms (Android) |
  | 1454 | Microsoft Teams PWA (Linux) |
</details>

----

### How can I enable Developer Tools?

<details>
  <summary>Teams 2.0 — Microsoft Teams (free):</summary>

  You will have to create a file named `configuration.json` in `%LOCALAPPDATA%\Packages\MicrosoftTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams`:
  ```json
  {
    "core/devMenuEnabled": true
  }
  ```
</details>

<details>
  <summary>Teams 2.1 — Microsoft Teams (work or school):</summary>

  You will have to create a file named `configuration.json` in `%LOCALAPPDATA%\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams`:
  ```json
  {
    "core/devMenuEnabled": true
  }
  ```
</details>

<details>
  <summary>Teams 2.1 — Microsoft Teams Rooms:</summary>

  You will have to create a file named `configuration.json` in `%LOCALAPPDATA%\Packages\MSTeamsRooms_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams`:
  ```json
  {
    "core/devMenuEnabled": true
  }
  ```
</details>

### What does Microsoft Teams version 24040.2800.2689.5562 mean?

We use the `YYDDD.XXXX.XXXX.XXXX` version format for Teams 2.0 and Teams 2.1.

<details>
  <summary>Here is an example:</summary>

  Microsoft Teams version `24040.2800.2689.5562` is broken down into the following:
  - `24` (YY) is the year of the build.
  - `040` (DDD) is the day of the week for that year.
  - `2800` (XXXX) is automatically generated by Azure DevOps.
  - `2689` (XXXX) is the amount of builds we have created excluding servicing builds.
  - `5562` (XXXX) is automatically generated by Azure DevOps.
</details>

### What does client version 49/24020918400 mean?

We use the `XXXX/YYMMDDXXXXX` version format for React Web Client (RWC).

<details>
  <summary>Here is an example:</summary>

  Client version `49/24020918400` is broken down into the following:
  - `49` (XXXX) is the platform ID. Please see [What are the different platform IDs?](https://github.com/ItzLevvie/MicrosoftTeams-msinternal/blob/fastfood/README.md#what-are-the-different-platform-ids) for more information.
  - `24` (YY) is the year of the build.
  - `02` (MM) is the month of the build.
  - `09` (DD) is the day of the build.
  - `18400` (XXXXX) is automatically generated by Azure DevOps.
</details>
