--------------------------------------------------------------------
-------------------------Converted by Eotix#1337--------------------
--------------------------------------------------------------------

Eotix = {}

local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

Eotix.RandomStr = function(length)
	if length > 0 then
		return Eotix.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
	else
		return ''
	end
end

Eotix.RandomInt = function(length)
	if length > 0 then
		return Eotix.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

Eotix.SplitStr = function(str, delimiter)
	local result = { }
	local from  = 1
	local delim_from, delim_to = string.find( str, delimiter, from  )
	while delim_from do
		table.insert( result, string.sub( str, from , delim_from-1 ) )
		from  = delim_to + 1
		delim_from, delim_to = string.find( str, delimiter, from  )
	end
	table.insert( result, string.sub( str, from  ) )
	return result
end



-- Vehicles
Eotix.Vehicles = {
	['bagger'] = {
		['name'] = 'Bagger',
		['brand'] = 'WMC',
		['model'] = 'bagger',
		['price'] = 7800,
		['category'] = 'motorcycles',
		['hash'] = `bagger`,
		['shop'] = 'pdm',
	},
	['banshee'] = {
		['name'] = 'Banshee',
		['brand'] = 'Bravado',
		['model'] = 'banshee',
		['price'] = 720000,
		['category'] = 'sports',
		['hash'] = `banshee`,
		['shop'] = 'pdm',
	},
	['bf400'] = {
		['name'] = 'BF400',
		['brand'] = 'Nagasaki',
		['model'] = 'bf400',
		['price'] = 19000,
		['category'] = 'motorcycles',
		['hash'] = `bf400`,
		['shop'] = 'pdm',
	},
	['blade'] = {
		['name'] = 'Blade',
		['brand'] = 'Vapid',
		['model'] = 'blade',
		['price'] = 17000,
		['category'] = 'muscle',
		['hash'] = `blade`,
		['shop'] = 'pdm',
	},
	['bmx'] = {
		['name'] = 'BMX',
		['model'] = 'bmx',
		['price'] = 3000,
		['category'] = 'cycles',
		['hash'] = `bmx`,
		['shop'] = 'pdm',
	},
	['burrito3'] = {
		['name'] = 'Burrito',
		['brand'] = 'Declasse',
		['model'] = 'burrito3',
		['price'] = 38000,
		['category'] = 'vans',
		['hash'] = `burrito3`,
		['shop'] = 'pdm',
	},
	['chino'] = {
		['name'] = 'Chino',
		['brand'] = 'Vapid',
		['model'] = 'chino',
		['price'] = 17000,
		['category'] = 'muscle',
		['hash'] = `chino`,
		['shop'] = 'pdm',
	},
	['contender'] = {
		['name'] = 'Contender',
		['brand'] = 'Vapid',
		['model'] = 'contender',
		['price'] = 32000,
		['category'] = 'suvs',
		['hash'] = `contender`,
		['shop'] = 'pdm',
	},
	['cruiser'] = {
		['name'] = 'Cruiser',
		['model'] = 'cruiser',
		['price'] = 28000,
		['category'] = 'cycles',
		['hash'] = `cruiser`,
		['shop'] = 'pdm',
	},
	['habanero'] = {
		['name'] = 'Habanero',
		['brand'] = 'Emperor',
		['model'] = 'habanero',
		['price'] = 24000,
		['category'] = 'suvs',
		['hash'] = `habanero`,
		['shop'] = 'pdm',
	},
	['faggio'] = {
		['name'] = 'Faggio Sport',
		['brand'] = 'Pegassi',
		['model'] = 'faggio',
		['price'] = 3800,
		['category'] = 'motorcycles',
		['hash'] = `faggio`,
		['shop'] = 'pdm',
	},
	['fcr'] = {
		['name'] = 'FCR 1000',
		['brand'] = 'Pegassi',
		['model'] = 'fcr',
		['price'] = 24000,
		['category'] = 'motorcycles',
		['hash'] = `fcr`,
		['shop'] = 'pdm',
	},
	['glendale2'] = {
		['name'] = 'Glendale',
		['brand'] = 'Benefactor',
		['model'] = 'glendale2',
		['price'] = 25000,
		['category'] = 'sedans',
		['hash'] = `glendale2`,
		['shop'] = 'pdm',
	},
	['huntley'] = {
		['name'] = 'Huntley S',
		['brand'] = 'Enus',
		['model'] = 'huntley',
		['price'] = 33000,
		['category'] = 'suvs',
		['hash'] = `huntley`,
		['shop'] = 'pdm',
	},
	['landstalker'] = {
		['name'] = 'Landstalker',
		['brand'] = 'Dundreary',
		['model'] = 'landstalker',
		['price'] = 34000,
		['category'] = 'suvs',
		['hash'] = `landstalker`,
		['shop'] = 'pdm',
	},
	['mesa'] = {
		['name'] = 'Mesa',
		['brand'] = 'Canis',
		['model'] = 'mesa',
		['price'] = 22000,
		['category'] = 'offroad',
		['hash'] = `mesa`,
		['shop'] = 'pdm',
	},
	['pcj'] = {
		['name'] = 'PCJ-600',
		['brand'] = 'Shitzu',
		['model'] = 'pcj',
		['price'] = 27000,
		['category'] = 'motorcycles',
		['hash'] = `pcj`,
		['shop'] = 'pdm',
	},
	['premier'] = {
		['name'] = 'Premier',
		['brand'] = 'Declasse',
		['model'] = 'premier',
		['price'] = 26000,
		['category'] = 'sedans',
		['hash'] = `premier`,
		['shop'] = 'pdm',
	},
	['regina'] = {
		['name'] = 'Regina',
		['brand'] = 'Dundreary',
		['model'] = 'regina',
		['price'] = 23000,
		['category'] = 'sedans',
		['hash'] = `regina`,
		['shop'] = 'pdm',
	},
	['rumpo'] = {
		['name'] = 'Rumpo',
		['brand'] = 'Bravado',
		['model'] = 'rumpo',
		['price'] = 31000,
		['category'] = 'vans',
		['hash'] = `rumpo`,
		['shop'] = 'pdm',
	},
	['sanchez'] = {
		['name'] = 'Sanchez Livery',
		['brand'] = 'Maibatsu',
		['model'] = 'sanchez',
		['price'] = 2500,
		['category'] = 'motorcycles',
		['hash'] = `sanchez`,
		['shop'] = 'pdm',
	},
	['sandking2'] = {
		['name'] = 'Sandking SWB', 
		['brand'] = 'Annis',
		['price'] = 320000,
		['category'] = 'offroad',
		['model'] = 'sandking2',
		['hash'] = `sandking2`,
		['shop'] = 'pdm',
	},
	['stalion2'] = {
		['name'] = 'Stallion Burgershot',
		['brand'] = 'Declasse',
		['model'] = 'stalion2',
		['price'] = 40000,
		['category'] = 'muscle',
		['hash'] = `stalion2`,
		['shop'] = 'pdm',
	},
	['stanier'] = {
		['name'] = 'Stanier',
		['brand'] = 'Vapid',
		['model'] = 'stanier',
		['price'] = 22000,
		['category'] = 'sedans',
		['hash'] = `stanier`,
		['shop'] = 'pdm',
	},
	['stinger'] = {
		['name'] = 'Stinger',
		['brand'] = 'Grotti',
		['model'] = 'stinger',
		['price'] = 65500,
		['category'] = 'sportsclassic',
		['hash'] = `stinger`,
		['shop'] = 'pdm',
	},
	['stratum'] = {
		['name'] = 'Stratum',
		['brand'] = 'Zirconium',
		['model'] = 'stratum',
		['price'] = 23000,
		['category'] = 'sedans',
		['hash'] = `stratum`,
		['shop'] = 'pdm',
	},
	['sugoi'] = {
		['name'] = 'Sugoi',
		['brand'] = 'Dinka',
		['model'] = 'sugoi',
		['price'] = 670000,
		['category'] = 'sports',
		['hash'] = `sugoi`,
		['shop'] = 'pdm',
	},
	['superd'] = {
		['name'] = 'Super Diamond',
		['brand'] = 'Enus',
		['model'] = 'superd',
		['price'] = 32000,
		['category'] = 'sedans',
		['hash'] = `superd`,
		['shop'] = 'pdm',
	},
	['tampa'] = {
		['name'] = 'Tampa',
		['brand'] = 'Declasse',
		['model'] = 'tampa',
		['price'] = 23000,
		['category'] = 'muscle',
		['hash'] = `tampa`,
		['shop'] = 'pdm',
	},
	['tornado'] = {
		['name'] = 'Tornado',
		['brand'] = 'Declasse',
		['model'] = 'tornado',
		['price'] = 580000,
		['category'] = 'sportsclassic',
		['hash'] = `tornado`,
		['shop'] = 'pdm',
	},
	['vamos'] = {
		['name'] = 'Vamos',
		['brand'] = 'Declasse',
		['model'] = 'vamos',
		['price'] = 23000,
		['category'] = 'muscle',
		['hash'] = `vamos`,
		['shop'] = 'pdm',
	},
	['voodoo'] = {
		['name'] = 'Voodoo',
		['brand'] = 'Declasse',
		['model'] = 'voodoo',
		['price'] = 16000,
		['category'] = 'muscle',
		['hash'] = `voodoo`,
		['shop'] = 'pdm',
	},
	['wolfsbane'] = {
		['name'] = 'Wolfsbane',
		['brand'] = 'Western',
		['model'] = 'wolfsbane',
		['price'] = 12000,
		['category'] = 'motorcycles',
		['hash'] = `wolfsbane`,
		['shop'] = 'pdm',
	},
	['yosemite'] = {
		['name'] = 'Yosemite',
		['brand'] = 'Declasse',
		['model'] = 'yosemite',
		['price'] = 15000,
		['category'] = 'muscle',
		['hash'] = `yosemite`,
		['shop'] = 'pdm',
	},
	['zombiea'] = {
		['name'] = 'Zombie Bobber',
		['brand'] = 'Western',
		['model'] = 'zombiea',
		['price'] = 9400,
		['category'] = 'motorcycles',
		['hash'] = `zombiea`,
		['shop'] = 'pdm',
	},

}