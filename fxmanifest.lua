fx_version 'cerulean'
game 'gta5'

author 'RoyaleWind'
description 'RW TIMER'
version '1.0.0'

lua54 'yes'

ui_page 'ui/ui.html'

files {
	'ui/ui.html',
	'ui/script.js',
	'ui/style.css',
	'ui/timer.png',
}

client_scripts {
	'src/cl.lua',
}
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'data.lua',
	'bridge/*.lua',
	'src/sv.lua',
}
