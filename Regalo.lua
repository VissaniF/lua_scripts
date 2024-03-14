local cmd_regalo = "regalo"
local cmd_quitar = "quitar"
local itemID = 21100
local cantidad_regalo = 300
local cantidad_quitar = 100

local function OnCommand(event, player, command)
    if command == cmd_regalo then
        local target = player:GetSelection() -- Obtener jugador seleccionado
        if target ~= nil then
            target:AddItem(itemID, cantidad_regalo) -- Agregar ítems al jugador seleccionado
            player:SendNotification("Se han añadido " .. cantidad_regalo .. " del ítem ID " .. itemID .. " al jugador seleccionado.") -- Notificar al GM
        else
            player:SendNotification("No has seleccionado a ningún jugador.") -- Si no se ha seleccionado ningún jugador, notificar al GM
        end
        return false
    elseif command == cmd_quitar then
        local target = player:GetSelection() -- Obtener jugador seleccionado
        if target ~= nil then
            if target:HasItem(itemID, cantidad_quitar) then -- Verificar si el jugador tiene suficientes unidades del ítem para quitar
                target:RemoveItem(itemID, cantidad_quitar) -- Quitar ítems del jugador seleccionado
                player:SendNotification("Se han quitado " .. cantidad_quitar .. " del ítem ID " .. itemID .. " al jugador seleccionado.") -- Notificar al GM
            else
                player:SendNotification("El jugador seleccionado no tiene suficientes unidades del ítem ID " .. itemID .. " para quitar.") -- Si el jugador no tiene suficientes ítems, notificar al GM
            end
        else
            player:SendNotification("No has seleccionado a ningún jugador.") -- Si no se ha seleccionado ningún jugador, notificar al GM
        end
        return false
    end
end

RegisterPlayerEvent(42, OnCommand) -- Registrar el evento para manejar los comandos de los jugadores
