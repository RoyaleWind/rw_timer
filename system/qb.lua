local id_core = "qb"
if Data.core ~= id_core then return end

SYS          = {}
SYS.core     = nil

SYS.init     = function()
    SYS.core = exports['qb-core']:GetCoreObject()
    print('SYS CORE STARTED: ' .. id_core)
end

SYS.addmoney = function(id, value)
    if id == nil then return false end
    local xPlayer = SYS.core.Functions.GetPlayer(id)
    xPlayer.addMoney(Data.type, value, Data.reason)
    return true
end
