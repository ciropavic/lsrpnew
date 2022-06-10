ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("r1reload:checkInventory")
AddEventHandler("r1reload:checkInventory", function(typeammo,reloadSize)
    local xPlayer = ESX.GetPlayerFromId(source)
    local type = '';

    if typeammo == "AMMO_PISTOL" then
     type = Config.PistolItem;
  elseif typeammo == "AMMO_SMG" then
    type = Config.SMGItem;
  elseif typeammo == "AMMO_RIFLE" then
    type = Config.RifleItem;
  elseif typeammo == "AMMO_SHOTGUN" then
    type = Config.ShotgunItem;
  elseif typeammo == "AMMO_SNIPER" then
    type = Config.SniperItem;
  elseif typeammo == 'AMMO_MG' then
    type = Config.MGItem;
      --add more types of ammo here / agrega mas tipos de arma aqui
  end

    local xItem = xPlayer.getInventoryItem(type)

    if xItem.count >= reloadSize then
      TriggerClientEvent("r1reload:reload", source, true,reloadSize,type)
    else 
      if xItem.count > 1 then
        TriggerClientEvent("r1reload:reload", source, true,xItem.count,type)
      else  
        TriggerClientEvent("r1reload:reload", source, false,reloadSize,type)
      end
    end
    -- if xItem.count < reloadSize then
    --     TriggerClientEvent("r1reload:reload", source, false,reloadSize)
    -- elseif xItem.count > 1 then
    --     TriggerClientEvent("r1reload:reload", source, true,xItem.count)
    -- end
end)

RegisterNetEvent("r1reload:removeAmmoBox")
AddEventHandler("r1reload:removeAmmoBox", function(typeammo,reloadSize)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem(typeammo)

    xPlayer.removeInventoryItem(typeammo, reloadSize)
end)