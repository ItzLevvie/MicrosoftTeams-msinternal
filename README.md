# Welcome to the build repository for Microsoft Teams

This repository contains various builds for Microsoft Teams.

## Frequently Asked Questions (FAQ)

### Teams 1.0 — Electron

#### What are daily builds?

Preview the latest development builds of Microsoft Teams:
![image](https://github.com/ItzLevvie/MicrosoftTeams-msinternal/assets/11600822/c7076795-93a6-4843-b0e3-174a5e45d4f5)

These builds may also contain newer versions of SlimCore.

> [!NOTE]
> Installing these builds does not necessarily mean you will have access to new features.
> For more information, please visit [this blog post](https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-release-processes-why-do-i-not-see-a-feature-but/ba-p/2110426).

#### What are experimental builds?

Preview the latest development builds of Microsoft Teams but with access to new ideas which may or may not ship into daily builds:
![image](https://github.com/ItzLevvie/MicrosoftTeams-msinternal/assets/11600822/b6029708-8dd8-4a3a-a43e-49167687d6ce)

These builds may also contain newer versions of SlimCore.

`-E` will be displayed in the three-dot menu (`...`) > `About` > `Version`:
![image](https://github.com/ItzLevvie/MicrosoftTeams-msinternal/assets/11600822/342163d8-da9d-441b-b2c5-b927b0eaf196)

> [!NOTE]
> Installing these builds does not necessarily mean you will have access to new features.
> For more information, please visit [this blog post](https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-release-processes-why-do-i-not-see-a-feature-but/ba-p/2110426).

### Teams 2.0 & 2.1 — Microsoft Edge WebView2

#### What are Canary (R0) builds?

Preview the latest development builds of Microsoft Teams.

> [!NOTE]
> Installing these builds does not necessarily mean you will have access to new features.
> For more information, please visit [this blog post](https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-release-processes-why-do-i-not-see-a-feature-but/ba-p/2110426).

#### What are Canary SlimCore (R0s) builds?

Preview the latest development builds of Microsoft Teams but with access to newer versions of SlimCore.

> [!NOTE]
> Installing these builds does not necessarily mean you will have access to new features.
> For more information, please visit [this blog post](https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-release-processes-why-do-i-not-see-a-feature-but/ba-p/2110426).

### How to use the API?

Microsoft Teams has an API that queries for builds whenever it checks for updates.

Here are a few examples:
| Domain | Experimentation and Configuration Service (ECS) |
| -------| ----------------- |
| https://teams.live.com | https://config.teams.microsoft.com/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=life&teamsRing=general&agent=TeamsBuilds |
| https://teams.microsoft.com | https://config.teams.microsoft.com/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=prod&teamsRing=general&agent=TeamsBuilds |
| https://gov.teams.microsoft.us | https://config.ecs.gov.teams.microsoft.us/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=gcchigh&teamsRing=general&agent=TeamsBuilds |
| https://dod.teams.microsoft.us | https://config.ecs.dod.teams.microsoft.us/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=dod&teamsRing=general&agent=TeamsBuilds |
| https://teams.microsoftonline.cn | https://mooncake.config.teams.microsoft.com/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=gallatin&teamsRing=general&agent=TeamsBuilds |

| Parameter | Value |
| --------- | ----- |
| `environment` | `life`; `prod`; `gcc`; `gcchigh`; `dod`; `gallatin` |
| `teamsRing` | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
| `id` | Your Object ID from Microsoft Entra ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` which is the Object ID for one of our Microsoft employees who is the Senior Director of Product Marketing for Microsoft 365 and runs Canary (R0) builds of Microsoft Teams and other Microsoft 365 apps on a daily basis. <br> <br> To check what your Object ID is — please visit https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview |
| `tenantId` | Your Directory ID or Tenant ID from Microsoft Entra ID. <br> <br> This repository uses `72f988bf-86f1-41af-91ab-2d7cd011db47` which is the Directory ID or Tenant ID for the `Microsoft` directory. <br> <br> To check what your Tenant ID is — please visit https://ms.portal.azure.com/#settings/directory: ![image](https://user-images.githubusercontent.com/11600822/277135273-923d338d-528b-4565-a06a-0c304caca06c.png) <br> <br> or https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview: ![image](https://user-images.githubusercontent.com/11600822/277133972-7a58e3c0-2fb2-4be6-9313-8aede9b89544.png) <br> <br> or https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Properties: ![image](https://user-images.githubusercontent.com/11600822/277133973-f8ce8775-90b6-425f-9663-fcc079826974.png) |
| `agent` (accepts only one value) <br> <br> `agents` (accepts multiple values separated by a comma) | `Segmentation`; `TeamsBuilds`; `TeamsNorthstar`; `TeamsWebview2` |

Once you have built your own custom URL then you can use JSON to parse its data.
