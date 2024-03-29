local ID_NPC = 444444 -- ID de la criatura 


-- Esta función se llama cuando la criatura entra en combate
local function EntrarEnCombate(event, creature, target)
    creature:SendUnitYell( "¡Es la hora de ver un verdadero dragón!", 0 )
    --creature:AddAura(spell, creature)
    creature:RegisterEvent(JefeSulvus, 3 * 1000, 0) -- Segundos para cambiar de jefe
end

-- Dialogos de la dragona
local function DialogosJefe(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)  -- Cambiado a 5 para incluir más opciones de diálogo
    if Choice == 1 then
        creature:SendUnitSay("¡Te estás enfrentando al dragón más fuerte de todo WoW, Sulvus!", 0)
    elseif Choice == 2 then
        creature:SendUnitSay("¿Crees que puedes derrotarme?", 0)
    
    end
end

--Pausa
function wait(segundos)
    local start = os.time()
    repeat until os.time() > start + segundos
end



--Enrage



-- Combate del BOSS
function JefeSulvus(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:RemoveAllAuras()
    --creature:SetDisplayId(8570)
    creature:SetScale(2)
    creature:PlayDistanceSound(3520) -- Sonido entrar en combate


    --Vuelo 
    local x, y, z, o = creature:GetLocation()
    print("Coordenadas antes del movimiento:", x, y, z)

    xnueva = x +30
    creature:MoveTo(0, xnueva, y, z, true)
    print("Coordenadas después del movimiento:", x, y, znueva)
    wait(2)
    
    znueva = z +15
    creature:MoveTo(0, xnueva, y, znueva, true)


    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellConoFuego(eventid, delay, calls, creature, true) -- Cono de fuego instantáneo
    end, 2 * 1000, 1) --(segundo*1000) (cantidad de veces que lo lanza en ese tiempo)

      
    creature:RegisterEvent(DialogosJefe, 15 * 1000, 0)
end

-- Funciones de hechizos
function Boss_SpellConoFuego(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 19630, instant) -- Cono de fuego
end



-- Frases al wipear
local function ReinicioJefe(event, creature)
    creature:RemoveEvents()
    creature:SetScale(1)
    local display = creature:GetNativeDisplayId()
    creature:SetDisplayId(display)
    creature:SendUnitSay("Fallaste en el intento... ¡Vuelve en otra oportunidad!", 0)
end

-- Frases al morir el boss
local function MuereJefe(event, creature, killer)
    if killer and killer:IsPlayer() then
        killer:SendBroadcastMessage("¡Pudiste matar a la gran " .. creature:GetName() .. "!")
    end
    creature:SendUnitSay("Cromi sabe que es cuestión de tiempo para volver...", 0)
    creature:RemoveEvents()
end

-- Mensajes al matar a un jugador
local killedMessages = {
    "¿Ya murió otro? Parecen de papel... Jajaja",
    "El jugador %s no estaba preparado para enfrentarme.",
    "Ahí murió uno más...",
    "%s, suerte la próxima vez.",
    "¿Otro caído? ¡Mi poder es inquebrantable!",
    "La muerte es solo el principio...",
}

local function JugadorMuerto(event, creature, victim)
    local playerName = victim:GetName()
    local messageIndex = math.random(1, #killedMessages)
    local message = killedMessages[messageIndex]
    creature:SendUnitSay(message:format(playerName), 0)
    creature:PlayDistanceSound(3520) -- Sonido al morir alguno
end

RegisterCreatureEvent(ID_NPC, 1, EntrarEnCombate)
RegisterCreatureEvent(ID_NPC, 2, ReinicioJefe)
RegisterCreatureEvent(ID_NPC, 3, JugadorMuerto)
RegisterCreatureEvent(ID_NPC, 4, MuereJefe)
