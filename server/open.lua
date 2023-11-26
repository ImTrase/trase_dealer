-- Can add dispatch system here.
function AlertPolice(coords)
    local Police = GetActivePolice()
    for k, v in pairs(Police) do
        TriggerClientEvent('trase_dealer:client:alertPD', v, coords)
    end
end

-- Can add an option to return a multiplier to add, must return a valid integer so for e.g. 25 = 25% increase.
function ShouldAddMultiplier(target)
    return false
end

-- Should return a bool, if returns true it will decline the sell.
function ShouldDeny(target)
    local targetped = GetPlayerPed(target)
    local targetcoords = GetEntityCoords(targetped)
    for k, v in pairs(Config.BlacklistedLocations) do
        local dist = #(targetcoords.xyz - v.xyz)
        if (dist <= v.w) then
            return true
        end
    end
    return false
end