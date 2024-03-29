itemID = 21100                          --Aca pones el ID de tu token
cantidad_regalo = 10                    --Aca pones la cantidad de tokens que le queres dar

local MapID_Alliance = 0
local XPos_Alliance = -8622.457
local YPos_Alliance = 774.5229
local ZPos_Alliance = 96.65421

local Posicion = 0
local MapID_Horde = 1
local XPos_Horde = 2098.639
local YPos_Horde = -4620.466
local ZPos_Horde = 58.7846

local ZonaDeseada = 12                   -- ID la zona de evento


function esperar(segundos)
    local start = os.time()
    repeat until os.time() > start + segundos
end

local function eventoHandler(event, player, command)
    if (command:lower() == "evento") then                               --nombre del comando
        local dado = math.random(1, 100) -- Tirar un dado entre 1 y 100
        player:SendBroadcastMessage("Has tirado los dados y recibiste " .. dado .. " .")
        
        if (dado < 50) then
            player:SendBroadcastMessage("¡Has perdido!, Te teletransportaras a tu mall en 5 segundos...")
            esperar(1)
            player:SendBroadcastMessage("Te teletransportaras a tu mall en 4 segundos...")
            esperar(2)
            player:SendBroadcastMessage("Te teletransportaras a tu mall en 2 segundos...")
            esperar(2)
            if (player:GetTeam() == 0) then -- Alianza
                player:Teleport(MapID_Alliance, XPos_Alliance, YPos_Alliance, ZPos_Alliance, Posicion)
            elseif (player:GetTeam() == 1) then -- Horda
                player:Teleport(MapID_Horde, XPos_Horde, YPos_Horde, ZPos_Horde, Posicion)
            end
            player:SendBroadcastMessage("Suerte la próxima.")
            return false
            
        else
            player:SendBroadcastMessage("¡Has ganado! Ahora recibiras tu premio.")
            esperar(4)
            player:AddItem(itemID, cantidad_regalo) -- Agregar ítems al jugador que tiró el dado
            player:SendNotification("¡¡¡Felicitaciones!!!")
            player:SendNotification("Se han añadido " .. cantidad_regalo .. " Tokens PVP a tu inventario.")
            return false
        end
    end
end

local function registerEventoEvent()
    RegisterPlayerEvent(41, function(event, player, command) -- Registro del evento de comando del jugador
        local playerZone = player:GetZoneId()
        if playerZone == ZonaDeseada then
            eventoHandler(event, player, command)
            return false
        else
            player:SendBroadcastMessage("¡No estás en la zona adecuada para usar este comando!")
            return false
        end
    end)
end



registerEventoEvent() -- Llama a la función para registrar el evento