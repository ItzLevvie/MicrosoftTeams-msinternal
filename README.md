# Welcome to the build repository for Microsoft Teams

This repository contains various builds for Microsoft Teams.

## Frequently Asked Questions (FAQ)

### Teams 1.0 — Electron

#### What are daily builds?

Preview the latest development builds of Microsoft Teams:
![image](https://github.com/ItzLevvie/MicrosoftTeams-msinternal/assets/11600822/3fe0ac84-4303-4c51-9893-f9d4460e1746)

These builds may also contain newer releases of SlimCore.

> [!NOTE]
> Installing these builds does not necessarily mean you will have access to new features.
> For more information, please visit [this blog post](https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-release-processes-why-do-i-not-see-a-feature-but/ba-p/2110426).

#### What are experimental builds?

Preview the latest development builds of Microsoft Teams but with access to new ideas which may or may not ship into daily builds:
![image](https://github.com/ItzLevvie/MicrosoftTeams-msinternal/assets/11600822/a186b022-cbd1-4343-8c20-4bf46b2aa8a1)

These builds may also contain newer releases of SlimCore.

`-E` will be displayed in the three-dot menu (`...`) > `About` > `Version`:
![image](https://user-images.githubusercontent.com/11600822/214407512-dc371d4c-9711-4fa2-ba23-3ab410fd7c9f.png)

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
```
https://config.teams.microsoft.com/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=prod&audienceGroup=ring0&teamsRing=ring0&id=3a7cf1d3-06fa-4ead-bf45-a6286ff2620a&aaduserid=3a7cf1d3-06fa-4ead-bf45-a6286ff2620a&tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47&agent=TeamsBuilds
https://config.ecs.dod.teams.microsoft.us/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=dod&audienceGroup=general&teamsRing=general&agent=TeamsBuilds
https://config.ecs.gov.teams.microsoft.us/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=gcchigh&audienceGroup=general&teamsRing=general&agent=TeamsBuilds
```

| Parameter | Value |
| --------- | ----- |
| environment | `dev`; `life`; `prod`; `gallatin`; `gcc`; `gcchigh`; `dod` |
| audienceGroup | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
| teamsRing | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
| id | Your Object ID from Microsoft Entra ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` which is the Object ID for one of our Microsoft employees who is the Senior Director of Product Marketing for Microsoft 365 and runs Canary (R0) builds of Microsoft Teams and other Microsoft 365 apps on a daily basis. <br> <br> To check what your Object ID is — please visit https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview |
| aaduserid | Your Object ID from Microsoft Entra ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` which is the Object ID for one of our Microsoft employees who is the Senior Director of Product Marketing for Microsoft 365 and runs Canary (R0) builds of Microsoft Teams and other Microsoft 365 apps on a daily basis. <br> <br> To check what your Object ID is — please visit https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview|
| tenantId | Your Tenant ID from Microsoft Entra ID. <br> <br> This repository uses `72f988bf-86f1-41af-91ab-2d7cd011db47` which is the Tenant ID for the `Microsoft` directory. <br> <br> To check what your Tenant ID is — please visit https://ms.portal.azure.com/#settings/directory: ![image](https://user-images.githubusercontent.com/11600822/277135273-923d338d-528b-4565-a06a-0c304caca06c.png) <br> <br> or https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview: ![image](https://user-images.githubusercontent.com/11600822/277133972-7a58e3c0-2fb2-4be6-9313-8aede9b89544.png) <br> <br> or https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Properties: ![image](https://user-images.githubusercontent.com/11600822/277133973-f8ce8775-90b6-425f-9663-fcc079826974.png) |
| agent (accepts only one value) <br> <br> agents (accepts multiple values separated by a comma) = | `Segmentation`; `TeamsBuilds`; `TeamsNorthstar`; `TeamsWebview2` |

Once you have built your own custom URL then you can use JSON to parse its data.
