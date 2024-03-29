local EVENT_ONGOSSIPHELLO       = 1
local EVENT_ONGOSSIPSELECT      = 2

local NPC_MULTIVENDOR           = 200000
local VENDOR_ID1                = 350002
local VENDOR_ID2                = 500017
local VENDOR_ID3                = 500016
local VENDOR_ID4                = 500015

--Encantamiento: 51313
--Pesca: 45542
--Alquimia: 51304
--Herrería: 51300
--Ingeniería: 51306
--Herboristería: 50300
--Inscripción: 45363
--Joyería: 51311
--Peletería: 51302
--Minería: 50310
--Desuello: 50305
--Sastrería: 51309
--Cocina: 51296
--Primeros auxilios: 51294


-- Función para enseñar la profesión de peletería al nivel máximo (450)
local function TeachAndLevelUpLeatherworking(player)
    local maxSkillLevel = 450
    local skillID = 165 -- ID de la habilidad de Peletería
    local spellID = 51302 -- ID del hechizo para aprender Peletería

    if (player:HasSkill(skillID)) then
        player:SendBroadcastMessage("¡Ya tienes la profesión de Peletería!")
    else
        player:LearnSpell(spellID) -- Aprender el hechizo de Peletería
        player:AdvanceSkill(skillID, maxSkillLevel) -- Subir la habilidad de peletería al nivel máximo
        player:SendBroadcastMessage("¡Felicidades! Ahora tienes la profesión de Peletería al nivel máximo.")

        --player:SendBroadcastMessage("¡Todas las recetas de Peletería han sido aprendidas!")
    end
end


local function MultiVendorOnGossipHello(event, player, creature)
    player:GossipClearMenu()
    player:GossipMenuAddItem(1, "Item Custom", 1, 1)
    player:GossipMenuAddItem(1, "Cuellos", 1, 2)
    player:GossipMenuAddItem(1, "Arcos", 1, 3)
    player:GossipMenuAddItem(1, "Libros", 1, 4)
    player:GossipMenuAddItem(3, "Teletransportar a Ventormenta", 1, 5)
    player:GossipMenuAddItem(6, "Aprender Peleteria", 1, 6) -- Agregar opción para enseñar Peletería
    player:GossipMenuAddItem(4, "Close", 4, 100)
    player:GossipSendMenu(1, creature, 1)
end

local function MultiVendorOnGossipSelect(event, player, creature, sender, intid, code, menu_id)
    if (intid == 1) then
        player:SendListInventory(creature, VENDOR_ID1) 
    elseif (intid == 2) then
        player:SendListInventory(creature, VENDOR_ID2)
    elseif (intid == 3) then
        player:SendListInventory(creature, VENDOR_ID3)
    elseif (intid == 4) then
        player:SendListInventory(creature, VENDOR_ID4)
    elseif (intid == 5) then
        -- Teletransportar al jugador a Ventormenta
        player:Teleport(0, -8622.457, 774.5229, 96.65421, 0)
    elseif (intid == 6) then
        -- Enseñar Peletería al jugador y subirla a nivel 450
        TeachAndLevelUpLeatherworking(player)
    elseif (intid == 100) then
        player:GossipComplete()
    end
end

RegisterCreatureGossipEvent(NPC_MULTIVENDOR, EVENT_ONGOSSIPHELLO, MultiVendorOnGossipHello)
RegisterCreatureGossipEvent(NPC_MULTIVENDOR, EVENT_ONGOSSIPSELECT, MultiVendorOnGossipSelect)
