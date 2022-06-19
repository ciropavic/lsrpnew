local display = false


RegisterCommand("도움말",function ()
    Citizen.CreateThread(function()
        TriggerEvent("nui:on", true)
    end)
end)

RegisterCommand("help",function ()
    Citizen.CreateThread(function()
        TriggerEvent("nui:on", true)
    end)
end)

RegisterCommand("?",function ()
    Citizen.CreateThread(function()
        TriggerEvent("nui:on", true)
    end)
end)


RegisterCommand("off",function ()
    Citizen.CreateThread(function()
        TriggerEvent("nui:off", true)
    end)
end)


RegisterNUICallback("exit", function(data)
    SendNUIMessage({
        type ="ui",
        display=false
    })
    SetNuiFocus(false,false)
end)

RegisterNetEvent("nui:on")
AddEventHandler("nui:on",function (value)
    SendNUIMessage({
        type = "ui",
        display = true
    })
    SetNuiFocus(true,true)
    
end)

RegisterNetEvent("nui:off")
AddEventHandler("nui:off",function (value)
    SendNUIMessage({
        type ="ui",
        display=false
    })
end)
