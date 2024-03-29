local Angel = 1111111 -- ID de la criatura (400001)

function sleep(segundos)
    local start = os.time()
    repeat until os.time() > start + segundos
end

local function CombatON(event, creature, target)
    creature:CastSpell(creature, 29061, true)
    creature:CastSpell(creature:GetVictim(), 69675, true) --Tumba de hielo
    creature:CastSpell(creature:GetVictim(), 72268, true) -- Bola que tarda
    creature:SendUnitYell("¡Ustedes se la buscaron, ahora van a morir!", 0)
    creature:RegisterEvent(CambiarDragon, 2 * 1000, 0) -- Segundos para cambiar a la dragona
end

-- Diálogos de la dragona
local function Dialogo(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)  -- Cambiado a 2 para tener solo dos opciones de diálogo
    if Choice == 1 then
        creature:SendUnitSay("¡Soy la cambiaformas más fuerte!", 0)
    elseif Choice == 2 then
        creature:SendUnitSay("¿Crees que puedes derrotarme?", 0)
    end
end

-- Cambio a forma de dragón
function CambiarDragon(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:RemoveAllAuras()

    local x, y, z, o = creature:GetLocation()
    local xnueva = x - 5
    local znueva = z + 15
    creature:MoveTo(0, xnueva, y, znueva, true)

    creature:SetScale(1.5)
    sleep(0.5)
    creature:SetDisplayId(17772)
    creature:SetScale(2)
    creature:PlayDistanceSound(3520) -- Sonido al entrar en combate
    creature:RegisterEvent(Dialogo, 28 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellHielo(eventid, delay, calls, creature, false) -- hielo asesino  CADA 6 SEGUNDOS A PARTIR DE QUE ESTA EN COMBATE
    end, 6 * 1000, 0)                                               -- ILIMITADAS VECES

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellHieloInstantCUbo(eventid, delay, calls, creature, true) -- Hielo instant
    end, 8* 1000, 1)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellSombraFlecha(eventid, delay, calls, creature, true) -- Fragor de Sombra
    end, 30 * 1000, 1)

    local x, y, z, o = creature:GetLocation()
    local xnueva = x +30
    creature:MoveTo(0, xnueva, y, z, true)
    sleep(0.5)
    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellAlientoOny(eventid, delay, calls, creature, true) -- Fragor de Sombra
    end, 34 * 1000, 3)

    
    end

-- Funciones de hechizos
    function Boss_SpellHielo(eventid, delay, calls, creature, instant)
        creature:CastSpell(creature:GetVictim(), 72531, false) -- hielo asesino
    end

    function Boss_SpellHieloInstantCUbo(eventid, delay, calls, creature, instant)
        creature:CastSpell(creature:GetVictim(), 28522, true) -- Hielo instant
    end

    function Boss_SpellSombraFlecha(eventid, delay, calls, creature, instant)
        creature:CastSpell(creature:GetVictim(), 62660, true) -- Fragor de Sombra
    end--62660

    function Boss_SpellAlientoOny(eventid, delay, calls, creature, instant)
        creature:CastSpell(creature:GetVictim(), 17093, true) -- Fragor de Sombra
    end--62660






-- Frases al terminar la batalla
local function TerminaBatalla(event, creature)
    creature:RemoveEvents()
    creature:SetScale(1)
    local display = creature:GetNativeDisplayId()
    creature:SetDisplayId(display)
    creature:SendUnitSay("Fallaste en el intento... ¡Vuelve en otra oportunidad!", 0)
end

-- Frases al morir el jefe
local function DeathBoss(event, creature, killer)
    if killer and killer:IsPlayer() then
        killer:SendBroadcastMessage("¡Pudiste matar a la gran " .. creature:GetName() .. "!")
    end
    creature:SendUnitSay("Takatalvi no puede morir asi...", 0)
    creature:RemoveEvents()
end

-- Mensajes al matar a un jugador
local killedMessages = {
    "¿Ya murió otro? Parecen de papel... Jajaja",
    "El jugador %s no estaba preparado para enfrentarme.",
    "Ahí murió uno más...",
    "%s se ah muerto de nuevo, suerte la próxima vez.",
    "¿Otro caído? ¡Mi poder es inquebrantable! %s, no lo soporto",
    "La muerte es solo el principio...",
}

local function MuereAlguno(event, creature, victim)
    local playerName = victim:GetName()
    local messageIndex = math.random(1, #killedMessages)
    local message = killedMessages[messageIndex]
    creature:SendUnitSay(message:format(playerName), 0)
    creature:PlayDistanceSound(3520) -- Sonido al morir alguno
end

RegisterCreatureEvent(Angel, 1, CombatON)
RegisterCreatureEvent(Angel, 2, TerminaBatalla)
RegisterCreatureEvent(Angel, 3, MuereAlguno)
RegisterCreatureEvent(Angel, 4, DeathBoss)
