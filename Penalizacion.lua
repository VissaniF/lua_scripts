local ITEM_ID = 21100
local CANTIDAD_RECOMPENSA = 100

local function onBattlegroundEnd(event, bg, bgId, instanceId, winner)
    for _, player in ipairs(GetPlayersInWorld()) do
        if player:GetInstanceId() == instanceId then
            if winner == 1 and player:IsHorde() == 1 then
                player:AddItem(ITEM_ID, CANTIDAD_RECOMPENSA)
                player:SendNotification("Has ganado la batalla como Horda. Has recibido " .. CANTIDAD_RECOMPENSA .. " del ítem con ID " .. ITEM_ID .. ".")
            elseif winner == 0 and player:IsAlliance() == 1 then
                player:AddItem(ITEM_ID, CANTIDAD_RECOMPENSA)
                player:SendNotification("Has ganado la batalla como Alianza. Has recibido " .. CANTIDAD_RECOMPENSA .. " del ítem con ID " .. ITEM_ID .. ".")
            end
        end
    end
end

RegisterBGEvent(2, onBattlegroundEnd)


###Trabajando en este, no puedo registrar el evento de cuando sale de BG