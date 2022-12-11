fx_version 'cerulean'
game 'gta5'

lua54 'yes'

description 'ESX Ambulance Job'
version '1.2.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua',
	'client/job.lua',
	'client/vehicle.lua',
}

dependencies {
	'es_extended',
	'esx_skin',
	'esx_vehicleshop'
}
