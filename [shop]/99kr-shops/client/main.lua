Keys = {["E"] = 38, ["L"] = 182, ["G"] = 47}

payAmount = 0
Basket = {}

--[[ Gets the ESX library ]]--
ESX = nil 
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)

        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)
    end
end)

DrawText3D = function(x, y, z, text)
    local onScreen,x,y = World3dToScreen2d(x, y, z)
    local factor = #text / 370

    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x,y)
        DrawRect(x,y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 120)
    end
end

--[[ Requests specified model ]]--
_RequestModel = function(hash)
    if type(hash) == "string" then hash = GetHashKey(hash) end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end
end

--[[ Deletes the cashiers ]]--
DeleteCashier = function()
    for i=1, #Config.Locations do
        local cashier = Config.Locations[i]["cashier"]
        if DoesEntityExist(cashier["entity"]) then
            DeletePed(cashier["entity"])
            SetPedAsNoLongerNeeded(cashier["entity"])
        end
    end
end

Citizen.CreateThread(function()
    local defaultHash = 416176080
    for i=1, #Config.Locations do
        local cashier = Config.Locations[i]["cashier"]
        if cashier then
            cashier["hash"] = cashier["hash"] or defaultHash
            _RequestModel(cashier["hash"])
            if not DoesEntityExist(cashier["entity"]) then
                cashier["entity"] = CreatePed(4, cashier["hash"], cashier["x"], cashier["y"], cashier["z"], cashier["h"])
                SetEntityAsMissionEntity(cashier["entity"])
                SetBlockingOfNonTemporaryEvents(cashier["entity"], true)
                FreezeEntityPosition(cashier["entity"], true)
                SetEntityInvincible(cashier["entity"], true)
            end
            SetModelAsNoLongerNeeded(cashier["hash"])
        end
    end
end)


--[[ Function to trigger pNotify event for easier use :) ]]--
pNotify = function(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
        text = message,
		type = messageType,
		queue = "shopcl",
		timeout = messageTimeout,
		layout = "centerLeft"
	})
end

Marker = function(pos)
    DrawMarker(25, pos["x"], pos["y"], pos["z"] - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.75, 0.75, 0.75, 200, 200, 200, 60, false, false, 2, false, nil, nil, false)
    DrawMarker(25, pos["x"], pos["y"], pos["z"] - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 200, 200, 200, 60, false, false, 2, false, nil, nil, false)
end

--[[ Deletes the peds when the resource stops ]]--
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        TriggerServerEvent('esx:clientLog', "[99kr-shops]: Deleting peds...")
        DeleteCashier()
    end
end)



local blips = {
    {title="Shop", colour=69, id=52, x = 29.41, y = -1345.01, z = 29.5},
    {title="Shop", colour=69, id=52, x = 373.875,   y = 325.896,  z = 102.566},
    {title="Shop", colour=69, id=52, x = -3038.939, y = 585.954,  z = 6.908},
    {title="Shop", colour=69, id=52, x = -3241.927, y = 1001.462, z = 11.830},
    {title="Shop", colour=69, id=52, x = 2678.916,  y = 3280.671, z = 54.241},
    {title="Shop", colour=69, id=52, x = 1729.216,  y = 6414.131, z = 34.037},
    {title="Shop", colour=69, id=52, x = 1135.808,  y = -982.281,  z = 45.415},
    {title="Shop", colour=69, id=52, x = -1222.915, y = -906.983,  z = 11.326},
    {title="Shop", colour=69, id=52, x = -1487.553, y = -379.107,  z = 39.163},
    {title="Shop", colour=69, id=52, x = -2968.243, y = 390.910,   z = 14.043},
    {title="Shop", colour=69, id=52, x = -2968.243, y = 390.910,   z = 14.043},
    {title="Shop", colour=69, id=52, x = 1166.024,  y = 2708.930,  z = 37.157},
    {title="Shop", colour=69, id=52, x = 1392.562,  y = 3604.684,  z = 33.980},
    {title="Shop", colour=69, id=52, x = 127.830,   y = -1284.796, z = 28.280},
    {title="Shop", colour=69, id=52, x = -1393.409, y = -606.624,  z = 29.319},
    {title="Shop", colour=69, id=52, x = -559.906,  y = 287.093,   z = 81.176},
    {title="Shop", colour=69, id=52, x = -48.519,   y = -1757.514, z = 28.421},
    {title="Shop", colour=69, id=52, x = 1163.373,  y = -323.801,  z = 68.205},
    {title="Shop", colour=69, id=52, x = -707.501,  y = -914.260,  z = 18.215},
    {title="Shop", colour=69, id=52, x = -1820.523, y = 792.518,   z = 137.118},
    {title="Shop", colour=69, id=52, x = 1698.388,  y = 4924.404,  z = 41.063},
    {title="Blackmarket", colour=4, id=500, x = -448.18,  y = -2175.48,  z = 10.4},

}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)



