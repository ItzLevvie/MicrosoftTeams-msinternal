"use strict";

const https = require("https");

const enableLogging = false;

const getURL = "https://statics.teams.cdn.office.net";

const getPlatform = "win-x86";
const getPath = "production-windows-x86";
const getFile = "MicrosoftTeams-x86.msix";

https.get("https://config.teams.microsoft.com/config/v1/MicrosoftTeams/1415_1.0.0.0?environment=life&audienceGroup=ring3_9&teamsRing=ring3_9&agent=TeamsBuilds", (getResponse) => {
    getResponse.on("data", (getData) => {
        try {
            if (getResponse.statusCode === 200) {
                const getBuild = JSON.parse(`${getData}`).BuildSettings.WebView2.x86.latestVersion;
                https.get(getURL + "/" + getPath + "/" + getBuild + "/" + getFile, (getResponse) => {
                    if (getResponse.statusCode === 200) {
                        const getDate = new Date(getResponse.headers["last-modified"]).toLocaleString("en-US", { dateStyle: "full", timeStyle: "short", timeZone: "PST" });
                        const getMegabytes = Math.round(getResponse.headers["content-length"] / 1024 / 1024) + " MB";
                        console.log(getBuild + " (" + getPlatform + ") - published on " + getDate + " with " + getMegabytes + ": " + getURL + "/" + getPath + "/" + getBuild + "/" + getFile);
                    } else if (getResponse.statusCode === 404 && enableLogging) {
                        console.log(getPlatform + ": Sorry, but an error has occurred as we cannot find a preview build of Microsoft Teams. Please try again later.");
                    }
                }).on("error", () => {
                    if (enableLogging) {
                        console.log(getPlatform + ": Sorry, but an error has occurred as we cannot connect to the host. Please try again later.");
                    }
               });
            } else if (getResponse.statusCode === 404 && enableLogging) {
                console.log(getPlatform + ": Sorry, but an error has occurred as we cannot find a preview build of Microsoft Teams. Please try again later.");
            }
        } catch {}
    });
}).on("error", () => {
    if (enableLogging) {
        console.log(getPlatform + ": Sorry, but an error has occurred as we cannot connect to the host. Please try again later.");
    }
});
