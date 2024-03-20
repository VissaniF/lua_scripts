local npcId = 400001 -- ID de la criatura 400001
function esperar(segundos)
    local start = os.time()
    repeat until os.time() > start + segundos
end
-- Esta función se llama cuando la criatura entra en combate
local function OnEnterCombat(event, creature, target)
    creature:CastSpell(creature, 543, true)
    creature:CastSpell(creature:GetVictim(), 42940, true)
    creature:CastSpell(creature:GetVictim(), 42917, true)
    creature:SendUnitYell("¡Ustedes se la buscaron, ahora van a morir!", 0)
    creature:RegisterEvent(Boss_Sulvus, 6 * 1000, 0) -- Segundos para cambiar a la dragona
end

-- Dialogos de la dragona
local function Boss_TalkSulvus(eventid, delay, calls, creature)
    local Choice = math.random(1, 5)  -- Cambiado a 5 para incluir más opciones de diálogo
    if Choice == 1 then
        creature:SendUnitSay("¡Te estás enfrentando al dragón más fuerte de todo WoW, Sulvus!", 0)
    elseif Choice == 2 then
        creature:SendUnitSay("¿Crees que puedes derrotarme?", 0)
    elseif Choice == 3 then
        creature:SendUnitSay("¡Tu valentía no será suficiente para enfrentarte a mi poder!", 0)
    elseif Choice == 4 then
        creature:SendUnitSay("¡Prepárate para enfrentar la furia de mis llamas!", 0)
    elseif Choice == 5 then
        creature:SendUnitSay("¡Soy invencible! ¡Nadie puede igualarme!", 0)
    end
end

--Vuelo 


--Enrage



-- Combate del BOSS
function Boss_Sulvus(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(15474)
    creature:SetScale(1)
    creature:RemoveAllAuras()
    creature:PlayDistanceSound(3520) -- Sonido entrar en combate

    

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellConoFuego(eventid, delay, calls, creature, true) -- Cono de fuego instantáneo
    end, 2 * 1000, 1) --(segundo*1000) (cantidad de veces que lo lanza en ese tiempo)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellAleteo(eventid, delay, calls, creature, true) -- aleteo
    end, 10 * 1000, 1)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellFuegoEnArea(eventid, delay, calls, creature, false) -- Fuego en Área no instantáneo
    end, 15 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellFear(eventid, delay, calls, creature, false) -- Fear no instantáneo
    end, 20 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellBolaDeFuego(eventid, delay, calls, creature, false) -- Daño periódico no instantáneo
    end, 25 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellDerribo(eventid, delay, calls, creature, true) -- Barrido de cola instantáneo
    end, 30 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellLlamasFrente(eventid, delay, calls, creature, false) -- Llamas en frente no instantáneo
    end, 35 * 1000, 0)
    
    creature:RegisterEvent(Boss_TalkSulvus, 28 * 1000, 0)
end

-- Funciones de hechizos
function Boss_SpellConoFuego(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 19630, instant) -- Cono de fuego
end

function Boss_SpellFuegoEnArea(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 8000, instant) -- Fuego en Área piso
end

function Boss_SpellFear(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 39048, instant) -- Fear
end

function Boss_SpellBolaDeFuego(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 38836, instant) -- Daño periódico
end

function Boss_SpellAleteo(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 12882, instant) -- Escudo de hielo
end

function Boss_SpellDerribo(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 15847, instant) -- Barrido de cola
end

function Boss_SpellLlamasFrente(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 18435, instant) -- Llamas en frente
end


-- Frases al wipear
local function OnLeaveCombat(event, creature)
    creature:RemoveEvents()
    creature:SetScale(1)
    local display = creature:GetNativeDisplayId()
    creature:SetDisplayId(display)
    creature:SendUnitSay("Fallaste en el intento... ¡Vuelve en otra oportunidad!", 0)
end

-- Frases al morir el boss
local function OnDied(event, creature, killer)
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

local function OnKilledPlayer(event, creature, victim)
    local playerName = victim:GetName()
    local messageIndex = math.random(1, #killedMessages)
    local message = killedMessages[messageIndex]
    creature:SendUnitSay(message:format(playerName), 0)
    creature:PlayDistanceSound(3520) -- Sonido al morir alguno
end

RegisterCreatureEvent(npcId, 1, OnEnterCombat)
RegisterCreatureEvent(npcId, 2, OnLeaveCombat)
RegisterCreatureEvent(npcId, 3, OnKilledPlayer)
RegisterCreatureEvent(npcId, 4, OnDied)
