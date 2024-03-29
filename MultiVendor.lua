local EVENT_ONGOSSIPHELLO       = 1
local EVENT_ONGOSSIPSELECT      = 2

local NPC_MULTIVENDOR           = 200000
local VENDOR_ID1                = 350002
local VENDOR_ID2                = 500017
local VENDOR_ID3                = 500016
local VENDOR_ID4                = 500015

local function MultiVendorOnGossipHello(event, player, creature)
    player:GossipClearMenu()
    player:GossipMenuAddItem(1, "Item Custom", 1, 1)
    player:GossipMenuAddItem(1, "Cuellos", 1, 2)
    player:GossipMenuAddItem(1, "Arcos", 1, 3)
    player:GossipMenuAddItem(1, "Libros", 1, 4)
    player:GossipMenuAddItem(3, "Teletransportar a Ventormenta", 1, 5) -- Icono, nombre , nose, posicion
    player:GossipMenuAddItem(4, "Close", 4, 100) -- 
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
        -- Teletransporte del jugador a las coordenadas especificadas
        player:Teleport(0, -8622.457, 774.5229, 96.65421, 0)
    elseif (intid == 100) then
        player:GossipComplete()
    end
end

RegisterCreatureGossipEvent(NPC_MULTIVENDOR, EVENT_ONGOSSIPHELLO, MultiVendorOnGossipHello)
RegisterCreatureGossipEvent(NPC_MULTIVENDOR, EVENT_ONGOSSIPSELECT, MultiVendorOnGossipSelect)
