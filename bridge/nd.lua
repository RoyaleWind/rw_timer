local id_core = "nd"
if Data.core ~= id_core then return end

SYS          = {}
SYS.core     = nil

SYS.init     = function()
    SYS.core = exports["ND_Core"]
    print('SYS CORE STARTED: ' .. id_core)
end

SYS.addmoney = function(id, value)
    if id == nil then return false end
    local xPlayer = SYS.core.getPlayer(id)
    local success = xPlayer.addMoney(Data.type, value, Data.reason)
    return success
end
