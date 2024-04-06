local PlayerTimes = {}

Citizen.CreateThread(function()
    SYS.init()
end)

function GetTime(pid, callback)
    local identifier = Get_Identifier(pid)
    MySQL.single('SELECT `time` FROM `rw_timer` WHERE `identifier` = ?', { identifier }, function(row)
        if row then
            local time = row.time
            callback(time)
        else
            NewTime(identifier)
            callback(Data.time)
        end
    end)
end

function UpdateTime(pid, newTime)
    local identifier = Get_Identifier(pid)
    MySQL.update('UPDATE rw_timer SET time = ? WHERE identifier = ?', { newTime, identifier })
end

function NewTime(identifier)
    MySQL.execute('INSERT INTO `rw_timer` (identifier, time) VALUES (?, ?)', { identifier, Data.time })
end

RegisterNetEvent('rw_timer:start')
AddEventHandler('rw_timer:start', function()
    local pid = source
    PlayerTimes[pid] = os.time()
    GetTime(pid, function(time)
        TriggerClientEvent("rw_timer:time", pid, time)
    end)
end)

RegisterNetEvent('rw_timer:end')
AddEventHandler('rw_timer:end', function()
    local pid = source
    local currentTime = os.time()
    if PlayerTimes[pid] then
        local elapsedTime = currentTime - PlayerTimes[pid]
        GetTime(pid, function(time)
            local savedTime = time
            if elapsedTime >= savedTime then
                if SYS.core == nil then
                    print("SYS.core == nil [CORE NOT FOUND]")
                    return
                end
                UpdateTime(pid, Data.time)
                PlayerTimes[pid] = currentTime
                SYS.addmoney(pid, Data.money)
                TriggerClientEvent("rw_timer:time", pid, Data.time)
            end
        end)
    end
end)

AddEventHandler('playerDropped', function()
    local pid = source
    if PlayerTimes[pid] then
        local currentTime = os.time()
        local elapsedTime = currentTime - PlayerTimes[pid]
        GetTime(pid, function(time)
            local newTime = time - elapsedTime
            if newTime < 0 then
                newTime = 0
            end
            UpdateTime(pid, newTime)
        end)
        PlayerTimes[pid] = nil
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000 * 60)
        for i, _ in pairs(PlayerTimes) do
            local currentTime = os.time()
            local elapsedTime = currentTime - PlayerTimes[i]
            GetTime(i, function(time)
                local newTime = time - elapsedTime
                if newTime < 0 then
                    newTime = 0
                end
                UpdateTime(i, newTime)
            end)
        end
    end
end)
