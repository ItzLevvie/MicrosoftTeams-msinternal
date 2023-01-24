# Frequently Asked Questions (FAQ)

## What are daily builds?

This allows you to test out the latest development builds of Microsoft Teams and may include newer versions of SlimCore.

![image](https://user-images.githubusercontent.com/11600822/214418974-2b94f432-c3a0-4106-96b9-d834b8c00cad.png)

> **Note**:
> As of Tuesday, January 24, 2023, these builds are based on Electron 16 and may change in the future.

> **Note**:
> Installing these builds does not necessarily mean you will have access to new features earlier than everyone else.
> For more information, please visit https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-release-processes-why-do-i-not-see-a-feature-but/ba-p/2110426

## What are experimental builds?

This allows you to test out the latest development builds of Microsoft Teams but with early access to newer versions of Electron and may include newer versions of SlimCore.

![image](https://user-images.githubusercontent.com/11600822/214418526-80fa1214-755a-4bba-803d-fb2d46df0132.png)

You will also see `-E` in the three-dot menu (`...`) > `About` > `Version`:
![image](https://user-images.githubusercontent.com/11600822/214407512-dc371d4c-9711-4fa2-ba23-3ab410fd7c9f.png)

> **Note**:
> As of Tuesday, January 24, 2023, these builds are based on Electron 19 and may change in the future.

> **Note**:
> Installing these builds does not necessarily mean you will have access to new features earlier than everyone else.
> For more information, please visit https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-release-processes-why-do-i-not-see-a-feature-but/ba-p/2110426

> **Warning**:
> These builds may be unstable due to the move from Electron 16 to Electron 19.
> It includes various improvements to enhance performance and stability for Windows and macOS.

## How to use the API?

A few example URLs:
```
https://config.teams.microsoft.com/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=prod&audienceGroup=ring0&teamsRing=ring0&id=3a7cf1d3-06fa-4ead-bf45-a6286ff2620a&aaduserid=3a7cf1d3-06fa-4ead-bf45-a6286ff2620a&tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47&agents=TeamsBuilds
https://config.ecs.dod.teams.microsoft.us/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=dod&audienceGroup=general&teamsRing=general&agents=TeamsBuilds
https://config.ecs.gov.teams.microsoft.us/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=gcchigh&audienceGroup=general&teamsRing=general&agents=TeamsBuilds
```

| Parameter | Value |
| --------- | ----- |
| environment | `dev`; `life`; `prod`; `gallatin`; `gcc`; `gcchigh`; `dod` |
| audienceGroup | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
| teamsRing | `ring0`; `ring0_s`; `ring1`; `ring1_5`; `ring1_6`; `ring2`; `ring3`; `ring3_6`; `ring3_9`; `general`; `general_gcc` |
| id | Your Object ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` which is the Object ID for one of our Microsoft employees who is currently the Director of Product Marketing for Microsoft 365 and runs Canary (R0) builds of Microsoft Teams and other Microsoft 365 apps on a daily basis. <br> <br> To check what your Object ID is — please visit https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview |
| aaduserid | Your Object ID. <br> <br> This repository uses `3a7cf1d3-06fa-4ead-bf45-a6286ff2620a` which is the Object ID for one of our Microsoft employees who is currently the Director of Product Marketing for Microsoft 365 and runs Canary (R0) builds of Microsoft Teams and other Microsoft 365 apps on a daily basis. <br> <br> To check what your Object ID is — please visit https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview|
| tenantId | Your Tenant ID. <br> <br> This repository uses `72f988bf-86f1-41af-91ab-2d7cd011db47` which is the Tenant ID for the 'Microsoft' organization. <br> <br> To check what your Tenant ID is — please visit https://ms.portal.azure.com/#settings/directory: ![image](https://user-images.githubusercontent.com/11600822/214391221-69674575-e51a-4f63-bc42-5ee43234fdd7.png) <br> <br> or https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview: ![image](https://user-images.githubusercontent.com/11600822/214384895-7bc55699-13bc-459c-90ce-d7d8b8912b2f.png) <br> <br> or https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Properties: ![image](https://user-images.githubusercontent.com/11600822/214386052-b4a31d94-7a64-4d11-b8be-083ec2c9c1ab.png) |
| agents | `Segmentation`; `TeamsBuilds`; `TeamsNorthstar` |

Once you have built the URL, you can use JSON to parse its data.
