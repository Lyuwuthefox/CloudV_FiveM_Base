fx_version "adamant"
game "gta5"

author 'dnzscripts <help@dnz.wtf>'
description 'license.dnz.wtf'

client_scripts {
	'config.lua',
	"dnz_amenuv2_load.lua"
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	"dnz_amenuv2_module.lua"
}

ui_page 'html/ui.html'

files {
	"html/*.*",
	"html/img/*.*"
}