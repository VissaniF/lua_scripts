local MoobEntry = 125 -- CreatureEntry del moob que debe morir
local MoobGUID = 4000332 -- GUID del moob específico
local ChestEntry = 185119 -- GameObjectEntry del cofre que debe aparecer
local ChestGUID = 2135755 -- GUID del cofre que debe aparecer

local function ShowChest(creature)
    local chest = creature:FindGameObject(ChestEntry, ChestGUID)
    if chest then
        chest:ShowToSet(creature:GetZoneId(), 0) -- Muestra el cofre
    end
end

local function HideChest(creature)
    local chest = creature:FindGameObject(ChestEntry, ChestGUID)
    if chest then
        chest:HideFromSet(creature:GetZoneId(), 0) -- Oculta el cofre
    end
end

local function OpenChest(event, creature, killer)
    if creature:GetEntry() == MoobEntry and creature:GetGUIDLow() == MoobGUID then
        local chest = creature:FindGameObject(ChestEntry, ChestGUID)
        if chest then
            chest:SetVisibleTo(creature:GetZoneId(), true, 0) -- Hace visible el cofre para todas las facciones
            chest:SetState(0) -- Abre el cofre
        end
    end
end

local function CloseChest(event, creature)
    if creature:GetEntry() == MoobEntry and creature:GetGUIDLow() == MoobGUID then
        local chest = creature:FindGameObject(ChestEntry, ChestGUID)
        if chest then
            chest:SetVisibleTo(creature:GetZoneId(), false, 0) -- Oculta el cofre para todas las facciones
            chest:SetState(1) -- Cierra el cofre
        end
    end
end

local function OnCreatureDeath(event, creature, killer)
    if creature:GetEntry() == MoobEntry and creature:GetGUIDLow() == MoobGUID then
        ShowChest(creature) -- Muestra el cofre cuando el moob muere
    end
end

local function OnCreatureSpawn(event, creature)
    if creature:GetEntry() == MoobEntry and creature:GetGUIDLow() == MoobGUID then
        HideChest(creature) -- Oculta el cofre cuando el moob está vivo
    end
end

RegisterCreatureEvent(MoobEntry, 5, OpenChest) -- Cuando el moob muere
RegisterCreatureEvent(MoobEntry, 6, CloseChest) -- Cuando el moob revive
RegisterCreatureEvent(MoobEntry, 4, OnCreatureDeath) -- Cuando el moob muere
RegisterCreatureEvent(MoobEntry, 5, OnCreatureSpawn) -- Cuando el moob revive
