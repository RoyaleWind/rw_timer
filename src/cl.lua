Timer = nil

RegisterNetEvent('rw_timer:time')
AddEventHandler('rw_timer:time', function(time)
    Timer = time
    UI_upadate_time(Timer)
end)


Citizen.CreateThread(function()
    while Timer == nil do
        Citizen.Wait(1000);
        TriggerServerEvent("rw_timer:start")
    end
    while true do
        Citizen.Wait(1000);
        Timer = Timer - 1
        if Timer < 0 then
            Timer = 0
            TriggerServerEvent("rw_timer:end")
        end
        UI_upadate_time(Timer)
    end
end)


function UI_upadate_time(time)
    SendNUIMessage({
        action = "time",
        val = time
    })
end
