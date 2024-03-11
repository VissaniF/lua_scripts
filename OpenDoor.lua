local Puerta = 175244 -- GobjectEntry
local Moob = 5827 -- CreatureEntry
local Guid = 2135689  -- GobjectGUID 2135690
local TiempoCierrePuerta = 5000 -- En milisegundos -- DoorCloseTime

local function CerrarPuerta(eventid, delay, repeats, gobject)
    gobject:SetGoState(0)
end

local function MoobMuere(event, creature, killer)
    local GameObjects = creature:GetGameObjectsInRange(50, Puerta)
    for key, gobject in pairs(GameObjects) do
        if gobject:GetDBTableGUIDLow() == Guid then
            gobject:SetGoState(0)
            gobject:RegisterEvent(CerrarPuerta, TiempoCierrePuerta, 1)
        end
    end
end

local function MoobVivo(event, creature)
    local GameObjects = creature:GetGameObjectsInRange(50, Puerta)
    for key, gobject in pairs(GameObjects) do
        if gobject:GetDBTableGUIDLow() == Guid then
            gobject:SetGoState(1)
            gobject:RemoveEvents()
        end
    end
end

RegisterCreatureEvent(Moob, 4, MoobMuere)
RegisterCreatureEvent(Moob, 5, MoobVivo)
