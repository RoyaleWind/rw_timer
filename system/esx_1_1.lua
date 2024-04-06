local id_core = "ESX_1_1"
if Data.core ~= id_core then return end

SYS          = {}
SYS.core     = nil

SYS.init     = function()
    while SYS.core == nil do
        TriggerEvent('esx:getSharedObject', function(obj) SYS.core = obj end)
        Citizen.Wait(0)
    end
    print('SYS CORE STARTED: ' .. id_core)
end

SYS.addmoney = function(id, value)
    if id == nil then return false end
    local xPlayer = SYS.core.GetPlayerFromId(id)
    if xPlayer == nil then return false end
    xPlayer.addMoney(value)
    return true
end
