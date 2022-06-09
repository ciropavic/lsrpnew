-- Local
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local PlayerData = {}
local CurrentAction = nil
local GUI                       = {}
GUI.Time                        = 0
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local times 					= 0
local userProperties = {}
local this_Garage = {}
local bilhete = false
local placa = ""
local vehi = ""
local locktime = false
local podespawn = false
local umavez = 0
local count = 0
local lastvehicle = nil
local onecall = true
local isOut = {}
local _color1={}
local _color2={}
local checkcars = {
	[1] = {value = 0, model = "", plate = "", vehicle = {}},
	[2] = {value = 0, model = "", plate = "", vehicle = {}},
	[3] = {value = 0, model = "", plate = "", vehicle = {}},
	[4] = {value = 0, model = "", plate = "", vehicle = {}},
	[5] = {value = 0, model = "", plate = "", vehicle = {}},
	[6] = {value = 0, model = "", plate = "", vehicle = {}},
	[7] = {value = 0, model = "", plate = "", vehicle = {}},
	[8] = {value = 0, model = "", plate = "", vehicle = {}},
	[9] = {value = 0, model = "", plate = "", vehicle = {}},
	[10] = {value = 0, model = "", plate = "", vehicle = {}},
	[11] = {value = 0, model = "", plate = "", vehicle = {}},
	[12] = {value = 0, model = "", plate = "", vehicle = {}},
	[13] = {value = 0, model = "", plate = "", vehicle = {}},
	[14] = {value = 0, model = "", plate = "", vehicle = {}},
	[15] = {value = 0, model = "", plate = "", vehicle = {}},
	[16] = {value = 0, model = "", plate = "", vehicle = {}},
	[17] = {value = 0, model = "", plate = "", vehicle = {}},
	[18] = {value = 0, model = "", plate = "", vehicle = {}},
	[19] = {value = 0, model = "", plate = "", vehicle = {}},
	[20] = {value = 0, model = "", plate = "", vehicle = {}},
	[21] = {value = 0, model = "", plate = "", vehicle = {}},
	[22] = {value = 0, model = "", plate = "", vehicle = {}},
	[23] = {value = 0, model = "", plate = "", vehicle = {}},
	[24] = {value = 0, model = "", plate = "", vehicle = {}},
	[25] = {value = 0, model = "", plate = "", vehicle = {}},
	[26] = {value = 0, model = "", plate = "", vehicle = {}},
	[27] = {value = 0, model = "", plate = "", vehicle = {}},
	[28] = {value = 0, model = "", plate = "", vehicle = {}},
	[29] = {value = 0, model = "", plate = "", vehicle = {}},
	[30] = {value = 0, model = "", plate = "", vehicle = {}},
	[31] = {value = 0, model = "", plate = "", vehicle = {}},
	[32] = {value = 0, model = "", plate = "", vehicle = {}},
	[33] = {value = 0, model = "", plate = "", vehicle = {}},
	[34] = {value = 0, model = "", plate = "", vehicle = {}},
	[35] = {value = 0, model = "", plate = "", vehicle = {}},
	[36] = {value = 0, model = "", plate = "", vehicle = {}},
	[37] = {value = 0, model = "", plate = "", vehicle = {}},
	[38] = {value = 0, model = "", plate = "", vehicle = {}},
	[39] = {value = 0, model = "", plate = "", vehicle = {}},
	[40] = {value = 0, model = "", plate = "", vehicle = {}},
	[41] = {value = 0, model = "", plate = "", vehicle = {}},
	[42] = {value = 0, model = "", plate = "", vehicle = {}},
	[43] = {value = 0, model = "", plate = "", vehicle = {}},
	[44] = {value = 0, model = "", plate = "", vehicle = {}},
	[45] = {value = 0, model = "", plate = "", vehicle = {}},
	[46] = {value = 0, model = "", plate = "", vehicle = {}},
	[47] = {value = 0, model = "", plate = "", vehicle = {}},
	[48] = {value = 0, model = "", plate = "", vehicle = {}},
	[49] = {value = 0, model = "", plate = "", vehicle = {}},
	[50] = {value = 0, model = "", plate = "", vehicle = {}},
}

-- End Local
-- Initialise ESX

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

-- End ESX Initialisation
--- Generate map blips
RegisterNetEvent('kuana:checkveh')
AddEventHandler('kuana:checkveh', function(xxx, yyy, zzz)
        local xxx = xxx + 0.0
        local zzz = zzz + 0.0
		local yyy = yyy + 0.0
				blipm = AddBlipForCoord(xxx, yyy, zzz)
        			
    				SetBlipSprite (blipm, 66)
    				SetBlipDisplay(blipm, 4)
    				SetBlipScale  (blipm, 0.8)
   					SetBlipColour (blipm, 59)
    				SetBlipAsShortRange(blipm, true)
    				BeginTextCommandSetBlipName("STRING")
    				AddTextComponentString("Lost Car")
					EndTextCommandSetBlipName(blipm)
end)

RegisterCommand('차량위치', function(source, args, rawCommand)
	print(rawCommand)
	print(string.len(rawCommand))
	local placa = rawCommand:sub(14,21)

	print('kuanaDEbug',placa)
	local elements = {
				
	}
	if PlayerData.job ~= nil then
		if placa ~= "" then
			ESX.TriggerServerCallback('kuana:checkOwnerOfVehicle', function(vehicles)
				print(json.encode(vehicles))
				print(placa)
				if vehicles ~= nil then

					print('AAAAAAAAAAAAAAA')
					for _,v in pairs(vehicles) do
						local hashVehicule = v.vehicle.model
						local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
						local labelvehicle
						carname = ""..v.target..""
						local plate = v.plate

					
						table.insert(elements, {label ="Ver Dono" , value = "carowner"})
						table.insert(elements, {label ="Modelo: "..vehicleName , value = vehicleName})
						table.insert(elements, {label ="Placa: "..placa , value = "placa"})
						if v.lock == "nao" then
							table.insert(elements, {label ="Portas: Destrancadas" , value = "unlock"})
						elseif v.lock == "sim" then
							table.insert(elements, {label ="Portas: Trancadas" , value = "lock"})
						end
						if not blipmapa then
							table.insert(elements, {label ="Colocar no GPS" , value = "gps"})
						else
							table.insert(elements, {label ="Remover do GPS" , value = "gps2"})
						end
					end
					ESX.UI.Menu.CloseAll()
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'findcar',
						{
							title    = "",
							align    = 'right',
							elements = elements,
						},
						function(data, menu)
				
							
							if data.current.value == 'gps' then
								blipmapa = true
								RemoveBlip(blipm)
								TriggerServerEvent('kuana:checkvehi', placa)
								menu.close()
							elseif data.current.value == 'gps2' then
								blipmapa = false
								RemoveBlip(blipm)
								menu.close()
							elseif data.current.value == 'carowner' then
								local elements3 = {

								}
								ESX.TriggerServerCallback('kuana:checkcarowner', function(owner)
									for _,v in pairs(owner) do
										table.insert(elements3, {label ="Nome: "..v.names , value = "name"})
										if v.sex == "M" then
											table.insert(elements3, {label ="Sexo: Homem" , value = "sex"})
										else
											table.insert(elements3, {label ="Sexo: Mulher" , value = "sex"})
										end
										table.insert(elements3, {label ="Altura: "..v.height.." cm" , value = "height"})
										table.insert(elements3, {label ="Voltar" , value = "back"})
									end

									ESX.UI.Menu.Open(
										'default', GetCurrentResourceName(), 'findcarowner',
										{
											title    = "",
											align    = 'right',
											elements = elements3,
										},
										function(data2, menu2)
											if data2.current.value == "back" then
												menu2.close()
											end
										end,
										function(data2, menu2)
											menu2.close()											
										end
									)									
								end, carname)
							end
						end,
						function(data, menu)
							menu.close()
							
						end
					)
					---
				else
					print('BBBBBBBBBBBB')
					placa = nil
				end
			end, placa)	
		else
			ESX.ShowNotification("~r~Comando errado~w~: /procarro [placa] ")
		end
	else
		ESX.ShowNotification("Precisas de ser da ~b~Policia~w~ para fazer isso.")
	end
end)