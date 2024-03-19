ANGELUCHO = 999998 -- ID de la criatura del ángel que te revive
local MapID_Alliance = 0
local XPos_Alliance = -8622,457
local YPos_Alliance = 774,5229
local ZPos_Alliance = 96,65421
local Posicion = 0
local MapID_Horde = 1
local XPos_Horde = 2098.639
local YPos_Horde = -4620.466
local ZPos_Horde = 58.7846

function OnGossipHello(event, player, creature)
    if player:IsAlive() then
        player:SendBroadcastMessage("Ya estás vivo.")
    else
        player:ResurrectPlayer(100, true) -- Revive al jugador con toda la vida
        player:RemoveAura(15007) -- Remueve el aura que se aplica al morir
        --player:AddAura(Aurita, player) -- Asegúrate de reemplazar 'Aurita' con el ID correcto del aura que deseas aplicar

        

        -- Teletransportar al jugador a las coordenadas según su facción
        if player:GetTeam() == 0 then -- Alianza
            player:Teleport(MapID_Alliance, XPos_Alliance, YPos_Alliance, ZPos_Alliance, Posicion)
        else -- Horda
            player:Teleport(MapID_Horde, XPos_Horde, YPos_Horde, ZPos_Horde, Posicion)
        end
        player:SendBroadcastMessage("Acabas de resucitar. Ten más cuidado la próxima vez.")
    end
end

RegisterCreatureGossipEvent(ANGELUCHO, 1, OnGossipHello)