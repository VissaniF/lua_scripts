local function VerificarYEliminarItem(guid)
    local requiredItemCount = 50
    local itemId = 21100

    local player = GetPlayerByGUID(guid)

    if player then
        local playerItemCount = player:GetItemCount(itemId)
        if playerItemCount >= requiredItemCount then
            -- Eliminar 50 unidades del ítem
            player:RemoveItem(itemId, requiredItemCount)
            return true
        else
            return false
        end
    else
        print("El jugador no está en línea.")
        return false
    end
end

local function ObtenerDesertorCampoBatalla()
    local consulta = CharDBQuery("SELECT guid FROM battleground_deserters ORDER BY datetime DESC LIMIT 1;")
    
    if consulta then
        if consulta:GetRowCount() > 0 then
            local guid = consulta:GetUInt32(0)
            return guid
        else
            print("No se encontraron desertores de campos de batalla.")
            return nil
        end
    else
        print("Error al consultar la base de datos.")
        return nil
    end
end

local function EnviarMensajeSancion(guid)
    local tieneSuficientesItems = VerificarYEliminarItem(guid)
    local jugador = GetPlayerByGUID(guid)

    if jugador then
        if tieneSuficientesItems then
            jugador:SendBroadcastMessage("Abandonaste el campo de batalla y serás sancionado. Se te han eliminado 50 del ítem 21100.")
        else
            jugador:SendBroadcastMessage("Abandonaste el campo de batalla y serás sancionado, pero no tienes suficientes del ítem 21100 para ser sancionado.")
        end
    else
        print("No se pudo encontrar al jugador en línea.")
    end
end

-- Obtener el GUID del desertor del campo de batalla
local desertorGUID = ObtenerDesertorCampoBatalla()
if desertorGUID then
    EnviarMensajeSancion(desertorGUID)
else
    print("No se pudo obtener información del desertor del campo de batalla.")
end
