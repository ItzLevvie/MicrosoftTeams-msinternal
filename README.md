# Frequently Asked Questions (FAQ)

## What are 'continuous deployment' builds?

This allows you to test out the latest development builds of Microsoft Teams.

![image](https://user-images.githubusercontent.com/11600822/214373085-6234ace7-df69-413a-9a37-c117af0b2870.png)

> **Note**:
> As of Tuesday, January 24, 2023 — these builds are based on Electron 16 and may change in the future.

> **Note**:
> Installing these builds does not necessarily mean you have access to new features earlier than everyone else.
> For more information — please visit https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-release-processes-why-do-i-not-see-a-feature-but/ba-p/2110426

## What are 'exploration' builds?

This allows you to test out the latest development builds of Microsoft Teams but with early access to newer versions of Electron.

![image](https://user-images.githubusercontent.com/11600822/213933127-0ba37d9b-56e8-4014-8f42-a65a051f691f.png)

> **Note**:
> As of Tuesday, January 24, 2023 — these builds are based on Electron 19 and may change in the future.

> **Note**:
> Installing these builds does not necessarily mean you have access to new features earlier than everyone else.
> For more information — please visit https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-release-processes-why-do-i-not-see-a-feature-but/ba-p/2110426

> **Warning**:
> These builds may be unstable due to Electron 19.
> It includes various improvements to enhance performance and stability for Windows and macOS.

# API

A few example URLs:
```
https://config.teams.microsoft.com/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=prod&audienceGroup=ring0&teamsRing=ring0&id=3a7cf1d3-06fa-4ead-bf45-a6286ff2620a&aaduserid=3a7cf1d3-06fa-4ead-bf45-a6286ff2620a&tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47&agents=TeamsBuilds
https://config.ecs.dod.teams.microsoft.us/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=dod&audienceGroup=general&teamsRing=general&agents=TeamsBuilds
https://config.ecs.gov.teams.microsoft.us/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=gcchigh&audienceGroup=general&teamsRing=general&agents=TeamsBuilds
```

| Parameter | Value |
| --- | --- |
| environment | `dev`; `life`; `prod`; `gallatin`; `gcc`; `gcchigh`; `dod` |
| audienceGroup | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
| teamsRing | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
| id | Your Object ID or User ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` which is the Object ID for one of our Microsoft employees who is currently the Director of Product Marketing for Microsoft 365 and runs Canary (R0) builds of Microsoft Teams and other Microsoft 365 apps on a daily basis. <br> <br> To check what your Object ID is — please see https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview: |
| aaduserid | Your Object ID or User ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` which is the Object ID for one of our Microsoft employees who is currently the Director of Product Marketing for Microsoft 365 and runs Canary (R0) builds of Microsoft Teams and other Microsoft 365 apps on a daily basis. |
| tenantId | Your Tenant ID or Directory ID. <br> <br> This repository uses `72f988bf-86f1-41af-91ab-2d7cd011db47` which is the Tenant ID for the Microsoft organization. <br> <br> To check what your Tenant ID is — please see https://ms.portal.azure.com/#settings/directory: ![image](https://user-images.githubusercontent.com/11600822/214304740-77d734e1-05c7-4f7a-b1c8-9b955fcbb658.png) <br> <br> or https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview: ![image](https://user-images.githubusercontent.com/11600822/214304900-fdc61524-a495-48af-ba30-40519191720f.png) <br> <br> or https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Properties: ![image](https://user-images.githubusercontent.com/11600822/214313972-9a4eeb9a-9e74-4b3a-a867-12ba70c989bc.png) |
| agents | `Segmentation`; `TeamsBuilds`; `TeamsNorthstar` |
