# Frequently Asked Questions (FAQ)

## What are 'continuous deployment' builds?

This allows you to test out the latest development builds of Microsoft Teams.

![image](https://user-images.githubusercontent.com/11600822/213933331-572c6a10-a644-465e-9695-c8712389fe3f.png)

> **Note**:
> As of Monday, January 23, 2023 — these builds are based on Electron 16 and may change in the future.

## What are 'exploration' builds?

This allows you to test out the latest development builds of Microsoft Teams but with early access to newer versions of Electron.

![image](https://user-images.githubusercontent.com/11600822/213933127-0ba37d9b-56e8-4014-8f42-a65a051f691f.png)

> **Note**:
> As of Monday, January 23, 2023 — these builds are based on Electron 19 and may change in the future.

> **Warning**:
> These builds may be unstable due to Electron 19.
> It includes various improvements to enhance performance and stability for Windows and macOS.

# API

A few example URLs:
```
https://config.teams.microsoft.com/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=prod&audienceGroup=ring0&teamsRing=ring0&id=3a7cf1d3-06fa-4ead-bf45-a6286ff2620a&aaduserid=3a7cf1d3-06fa-4ead-bf45-a6286ff2620a&tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47&agent=TeamsBuilds
https://config.ecs.dod.teams.microsoft.us/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=dod&audienceGroup=general&teamsRing=general&agent=TeamsBuilds
https://config.ecs.gov.teams.microsoft.us/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=gcchigh&audienceGroup=general&teamsRing=general&agent=TeamsBuilds
https://config.teams.microsoft.com/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=prod&audienceGroup=general_gcc&teamsRing=general_gcc&agent=TeamsBuilds
```

| Parameter | Value |
| --- | --- |
| environment | `dev`; `life`; `prod`; `gcchigh`; `dod` |
| audienceGroup | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
| teamsRing | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
| id | Your Azure Active Directory (AAD) User ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` as the Azure Active Directory (AAD) ID which is one of our Microsoft employees who is the `Director of Product Marketing for Microsoft 365` and runs Canary (R0) builds for Microsoft Teams on a daily basis. |
| aaduserid | Your Azure Active Directory (AAD) User ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` as the Azure Active Directory (AAD) ID which is one of our Microsoft employees who is the `Director of Product Marketing for Microsoft 365` and runs Canary (R0) builds for Microsoft Teams on a daily basis. |
| tenantId | Your Directory ID or Tenant ID. <br> <br> Please see https://ms.portal.azure.com/#settings/directory: ![image](https://user-images.githubusercontent.com/11600822/214304740-77d734e1-05c7-4f7a-b1c8-9b955fcbb658.png) <br> <br> or https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview: ![image](https://user-images.githubusercontent.com/11600822/214304900-fdc61524-a495-48af-ba30-40519191720f.png) |
| agents | `Segmentation`; `TeamsBuilds`; `Segmentation,TeamsBuilds` |
