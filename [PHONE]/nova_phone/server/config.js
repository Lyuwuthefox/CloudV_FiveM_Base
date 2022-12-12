module.exports = {
    "mumbleVoice": false,
    "pmaVoice": false,
    "oxmysql": true,
    "debug": true,
    "esx_1_1": false,
    "disabledFeatures": {
        "factionBank": false,
        "radioSpeaker": false,
        "radioContinuousTalking": false
    },
    "randomNumber": {
        "prefix": "555",
        "from": 10000,
        "to": 99999
    },
    "radio": {
        "onlyRemoveInZeroDimensionOnDeath": false,
        "restrictedFrequencys": [
            { "frequency": "1000", "jobs": ["police","ambulance"] },
            { "frequency": "1001", "jobs": ["police","fib"] }
        ]
    },
    "factionLeaders": [
        { "faction": "*", "ranks": [10, 11, 12] },
        { "faction": "LSPD", "ranks": [4] }
    ],
    "factionNumbers": [
        { "faction": "LSPD", "number": "911" }
    ],
    "dispatchJobs": ["LSPD","LSMD"],
    "dispatchJobsWithoutApp": [],
    "esx": {
        "events": {
            "getSharedObject": "esx:getSharedObject",
            "setJob": "esx:setJob",
            "playerLoaded": "esx:playerLoaded",
            "playerDeath": "esx:onPlayerDeath"
        }
    },
    "language": "de",
    "discord": {
        "username": "WS - Nova Phone",
        "color": 3447003,
        "url": "https://web-services.io/",
        "icon": "https://tobias.isfucking.pro/4zzE5A.png",
        "servername": "web.services.io"
    },
    "webhooks": {
        "bank": "",
        "radio": "",
        "dispatch": "",
        "snake": "",
        "camera": ""
    },
    "imgurId": "d9de873b35d4b03"
}