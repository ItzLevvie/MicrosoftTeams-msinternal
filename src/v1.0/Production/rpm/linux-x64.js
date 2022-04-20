"use strict";

const https = require("https");

const enableLogging = false;

const getURL = "https://packages.microsoft.com";

const getPlatform = "linux-x64";
const getPath = "yumrepos/ms-teams";

https.get(getURL + "/" + getPath + "/", (getResponse) => {
    getResponse.on("data", (getData) => {
        if (getResponse.statusCode === 200) {
            const getLatestBuild = `${getData}`.match(/1.5.00.10453/);
            const getFile = "teams-" + getLatestBuild + "-1.x86_64.rpm";
            https.get(getURL + "/" + getPath + "/" + getFile, (getResponse) => {
                if (getResponse.statusCode === 200) {
                    const getDate = new Date(getResponse.headers["last-modified"]).toLocaleString("en-US", { dateStyle: "full", timeStyle: "short", timeZone: "PST" });
                    const getMegabytes = Math.round(getResponse.headers["content-length"] / 1024 / 1024) + " MB";
                    console.log(getLatestBuild + " (" + getPlatform + ") - published on " + getDate + " with " + getMegabytes + ": " + getURL + "/" + getPath + "/" + getFile);
                } else if (getResponse.statusCode === 404 && enableLogging) {
                    console.log(getPlatform + ": Sorry, but an error has occurred as we cannot find a production build of Microsoft Teams. Please try again later.");
                }
            }).on("error", () => {
                if (enableLogging) {
                    console.log(getPlatform + ": Sorry, but an error has occurred as we cannot connect to the host. Please try again later.");
                }
           });
        } else if (getResponse.statusCode === 404 && enableLogging) {
            console.log(getPlatform + ": Sorry, but an error has occurred as we cannot find a production build of Microsoft Teams. Please try again later.");
        }
    });
}).on("error", () => {
    if (enableLogging) {
        console.log(getPlatform + ": Sorry, but an error has occurred as we cannot connect to the host. Please try again later.");
    }
});
