WS = {}

-- inbuild ratelimit will only send a webhook every 5secs due to mass discord request on file errors
WS.debug = {
    enabled = true, -- sends error log
    webhook = "https://discord.com/api/webhooks/1054120097586888744/iJODc7AUyEu8-viX5j13T2WqS9UCvnAJJlnxxd0jXXTMKZuDYzJLU_6oSDBh0BuyUEem"
}

WS.validClientFiles = {
    "main.lua",
    "client.lua"
}