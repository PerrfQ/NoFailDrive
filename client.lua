local vehicleAirTime = 0
local brokenWheelIndex = nil

local excludedVehicles = {
    "bifta",
    "sandking",
    "rebel",
    "monster",
}

CreateThread(function()
    while true do
        Wait(100)

        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player, false)

        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == player then
            local vehicleClass = GetVehicleClass(vehicle)
            local vehicleModel = GetEntityModel(vehicle)

            local isExcluded = false
            for _, model in ipairs(excludedVehicles) do
                if GetHashKey(model) == vehicleModel then
                    isExcluded = true
                    break
                end
            end

            if not (isExcluded or vehicleClass == 8 or vehicleClass == 9 or vehicleClass == 14 or vehicleClass == 15 or vehicleClass == 16 or vehicleClass == 20 or vehicleClass == 21 or vehicleClass == 22 or vehicleClass == 13) then
                if IsEntityInAir(vehicle) then
                    vehicleAirTime = vehicleAirTime + 0.1
                elseif vehicleAirTime > 1 then
                    brokenWheelIndex = math.random(0, 3)
                    BreakOffVehicleWheel(vehicle, brokenWheelIndex)
                    vehicleAirTime = 0
                else
                    vehicleAirTime = 0
                end

                if GetEntityHealth(vehicle) >= 1000 then
                    brokenWheelIndex = nil
                end
            else
                vehicleAirTime = 0 
            end
        else
            vehicleAirTime = 0
            brokenWheelIndex = nil
        end
    end
end)