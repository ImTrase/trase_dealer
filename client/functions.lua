function SendNotification(text)
    lib.notify({ title = text, type = 'info' })
end

function ShowHelpNotification(text)
	BeginTextCommandDisplayHelp('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, false, true, -1)
end

RegisterNetEvent('trase_dealer:client:alertPD', function(coords)
	local blip = AddBlipForCoord(coords.xyz)
    SetBlipSprite(blip, 51)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 1)
    PulseBlip(blip)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Drug Sales')
    EndTextCommandSetBlipName(blip)
	ShowHelpNotification(Config.Strings['AlertPolice'])

    Wait(4 * 60000)

    RemoveBlip(blip)
end)

-- Check if it is night time or not
function isNight()
    local hour = GetClockHours()
    return hour >= 20 or hour < 6 -- Nighttime is typically from 8 PM to 6 AM
end

RegisterNetEvent('trase_dealer:client:notify', SendNotification)