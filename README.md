# Welcome to the build repository for Microsoft Teams

This repository contains multiple files:
* [defconfig](defconfig) which shows public builds, preview builds, experimental builds, and daily builds for Microsoft Teams classic (work or school).
* [defconfig2](defconfig2) which shows builds in all rings for Microsoft Teams (free), Microsoft Teams classic (work or school), Microsoft Teams (work or school), and Microsoft Teams Rooms.

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

### Teams 1.0 — Microsoft Teams classic (work or school) built on Electron 19.1.8

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

### Teams 2.0 — Microsoft Teams (free) & Teams 2.1 — Microsoft Teams (work or school) built on Microsoft Edge WebView2

<details>
  <summary>What are Canary (R0) builds?</summary>
  Preview the latest development builds of Microsoft Teams.
</details>

<details>
  <summary>What are Canary SlimCore (R0s) builds?</summary>
  Preview the latest development builds of Microsoft Teams but with access to newer versions of SlimCore.
</details>

### Placeholder

Microsoft Teams uses its own Experimentation and Configuration Service (ECS) which contains feature flags.

Here are a few examples:
| Domain | Experimentation and Configuration Service (ECS) |
| -------| ----------------- |
| https://teams.live.com | https://config.teams.microsoft.com/config/v1/MicrosoftTeams/48_1.0.0.0?environment=life&audienceGroup=general&teamsRing=general&agent=TeamsBuilds |
| https://teams.microsoft.com <br> <br> https://int.teams.microsoft.com | https://config.teams.microsoft.com/config/v1/MicrosoftTeams/49_1.0.0.0?environment=prod&audienceGroup=general&teamsRing=general&agent=TeamsBuilds |
| https://gov.teams.microsoft.us | https://config.ecs.gov.teams.microsoft.us/config/v1/MicrosoftTeams/49_1.0.0.0?environment=gcchigh&audienceGroup=general&teamsRing=general&agent=TeamsBuilds |
| https://dod.teams.microsoft.us | https://config.ecs.dod.teams.microsoft.us/config/v1/MicrosoftTeams/49_1.0.0.0?environment=dod&audienceGroup=general&teamsRing=general&agent=TeamsBuilds |
| https://teams.microsoftonline.cn | https://mooncake.config.teams.microsoft.com/config/v1/MicrosoftTeams/49_1.0.0.0?environment=gallatin&audienceGroup=general&teamsRing=general&agent=TeamsBuilds |

| Parameter | Value |
| --------- | ----- |
| `environment` | `dev`; `prod`; `life`; `gcchigh`; `dod`; `gallatin` |
| `audienceGroup` | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
| `teamsRing` | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc`  |
| `id` | Your Object ID from Microsoft Entra ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a`. |
| `tenantId` | Your Tenant ID from Microsoft Entra ID. <br> <br> This repository uses `72f988bf-86f1-41af-91ab-2d7cd011db47` |
| `agent` | `Segmentation`; `TeamsBuilds`; `TeamsNorthstar`; `TeamsWebview2` |

Once you have built your own custom URL then you can use JSON to parse its data.
