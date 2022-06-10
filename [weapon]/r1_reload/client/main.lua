ESX = nil

if Config.Framework == "ESX" then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
	end)
end	

local sleep = 5
local deepSleep = 100
local superDeepSleep = Config.SpamDelay
local antiSpam = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(sleep)

		if IsPedArmed(PlayerPedId(), 4|2) then
			local check, hash = GetCurrentPedWeapon(PlayerPedId(), 1)
			local clipSize = GetWeaponClipSize(hash)
			local ammoInWeapon = GetAmmoInPedWeapon(PlayerPedId(), hash)
      local reloadSize = clipSize - ammoInWeapon
      local typeammo = Config.Weapons[hash]["ammotype"]
			if Config.CheckAndApplyAmmo then
				if ammoInWeapon > clipSize then
					SetAmmoInClip(PlayerPedId(), hash, 0)
					SetPedAmmo(PlayerPedId(), hash, clipSize)
				end
			end

			if not antiSpam then
				if IsControlJustReleased(0, 45) then
					if Config.Framework == "ESX" then
						TriggerServerEvent("r1reload:checkInventory", typeammo,reloadSize)
					elseif Config.Framework == "STANDALONE" then
						TriggerEvent("r1reload:reload")
					end
				end
			end

			if Config.DisablePistolPunching then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
			 	DisableControlAction(1, 142, true)
			end
		else
			Citizen.Wait(deepSleep)
		end
	end
end)

RegisterNetEvent("r1reload:reload")
AddEventHandler("r1reload:reload", function(checkItem,reloadSize,type)
	if IsPedArmed(PlayerPedId(), 4|2) then
		if Config.Framework == "ESX" then
			if checkItem then
				local check1, hash = GetCurrentPedWeapon(PlayerPedId(), 1)
				local clipSize = GetWeaponClipSize(hash)
        -- local typeammo = Config.Weapons[hash]["ammotype"]
				local check2, ammoInClip = GetAmmoInClip(PlayerPedId(), hash)

				if ammoInClip ~= clipSize then
					TriggerServerEvent("r1reload:removeAmmoBox",type,reloadSize)
					SetAmmoInClip(PlayerPedId(), hash, 0)
					SetPedAmmo(PlayerPedId(), hash, clipSize)
				else
					if Config.NotificationStyle == "ESX" then
						ESX.ShowNotification(Config.Notifications.FullClip)
					else
						print(Config.Notifications.FullClip)
					end
					antiSpam = true
					Citizen.Wait(superDeepSleep)
					antiSpam = false
				end
			else
				if Config.NotificationStyle == "ESX" then
					ESX.ShowNotification(Config.Notifications.NotEnough)
				else
					print(Config.Notifications.NotEnough)
				end
				antiSpam = true
				Citizen.Wait(superDeepSleep)
				antiSpam = false
			end
		elseif Config.Framework == "STANDALONE" then
			local check1, hash = GetCurrentPedWeapon(PlayerPedId(), 1)
			local clipSize = GetWeaponClipSize(hash)
			local check2, ammoInClip = GetAmmoInClip(PlayerPedId(), hash)

			if ammoInClip ~= clipSize then
				SetAmmoInClip(PlayerPedId(), hash, 0)
				SetPedAmmo(PlayerPedId(), hash, clipSize)
			else
				print(Config.Notifications.FullClip)
				antiSpam = true
				Citizen.Wait(superDeepSleep)
				antiSpam = false
			end
		end
	end
end)

Citizen.CreateThread(function()
	while Config.Debug do
		Citizen.Wait(Config.DebugRefresh)

		local check, hash = GetCurrentPedWeapon(PlayerPedId(), 1)
		local clipSize = GetWeaponClipSize(hash)
		local ammoInWeapon = GetAmmoInPedWeapon(PlayerPedId(), hash)
		local check2, ammoInClip = GetAmmoInClip(PlayerPedId(), hash)
		local ammoType = GetWeapontypeModel(hash)
		local check3, maxAmmo = GetMaxAmmo(PlayerPedId(), hash)

		print(" ")
		print(" ")
		print(" ")
		print(" ")
		print(" ")
		print(" ")
		print(" ")
		print(" ")
		print("Weapon Hash  : " .. hash)
		print("Max Ammo     : " .. maxAmmo)
		print("Total Ammo   : " .. ammoInWeapon)
		print("Ammo Type    : " .. ammoType)
		print("--------------------------")
		print("Clip Size    : " .. clipSize)
		print("Ammo In clip : " .. ammoInClip)
	end
end)