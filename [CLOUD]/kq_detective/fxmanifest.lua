fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Detective tools by KuzQuality'
version '1.3.0'

ui_page 'html/index.html'

--
-- Files
--

files {
    'html/js/jquery.js',
    'html/js/jquery-ui.js',
    'html/fonts/pen.otf',
    'html/img/*.png',
    'html/index.html',
}


--
-- Server
--

server_scripts {
    'config.lua',
    'server/server.lua',
}

--
-- Client
--

client_scripts {
    'config.lua',
    'locale/locale.lua',
    'client/editable/settings.lua',
    'client/client.lua',
    'client/functions.lua',
    'client/editable/editable.lua',
    'client/editable/target.lua',
    'client/editable/esx.lua',
    'client/editable/qb.lua',
}

escrow_ignore {
    'config.lua',
    'locale/locale.lua',
    'client/editable/editable.lua',
    'client/editable/target.lua',
    'client/editable/settings.lua',
    'client/editable/esx.lua',
    'client/editable/qb.lua',
    'server/server.lua',
}

dependency '/assetpacks'