function OnBGEnd(event, bg, bgId, instanceId, winner)
    -- Resto del código se mantiene igual
    
    -- Otorgar el objeto a los jugadores
    for k, player in pairs(GetPlayersInWorld()) do
        player:AddItem(21100, 10)  -- Agrega 10 del objeto con ID 21100 al inventario del jugador
        player:SendBroadcastMessage("¡Felicidades! Has recibido 10 del objeto 21100 por tu participación en la Batalla de Campo de Batalla.")
    end
end

function OnBGEndDestroy(event, bg, bgId, instanceId)
    -- Resto del código se mantiene igual
    
    -- Otorgar el objeto a los jugadores
    for k, player in pairs(GetPlayersInWorld()) do
        player:AddItem(21100, 10)  -- Agrega 10 del objeto con ID 21100 al inventario del jugador
        player:SendBroadcastMessage("¡Felicidades! Has recibido 10 del objeto 21100 por tu participación en la Batalla de Campo de Batalla.")
    end
end

RegisterBGEvent(2, OnBGEnd)
RegisterBGEvent(4, OnBGEndDestroy)
