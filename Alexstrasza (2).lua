Alextrasza = 60000


--Pausa
function wait(segundos)
    local start = os.time()
    repeat until os.time() > start + segundos
end

----------------------------------------------------------------------------------------------------------------------
----                                     Iniciar el combate con BOSS                                              ----
----                                                                                                              ----
----------------------------------------------------------------------------------------------------------------------

local function EntrarEnCombate(event, creature, target)
    --creature:CastSpell(creature:GetVictim(), 22539) -- Lanza una bola de fuego
    creature:PlayDistanceSound(15964)
    creature:SendUnitYell( "¡Es la hora de ver un verdadero dragón!", 0 )
    creature:CastSpell(creature:GetVictim(), 42950) -- Aliento de fuego
    creature:SetScale(3)
    
    creature:RegisterEvent(Fase1, 3 * 1000, 0) -- Segundos para cambiar de jefe
end

----------------------------------------------------------------------------------------------------------------------
----                                     Dialogo de Alexstrasza                                                   ----
----                                                                                                              ----
----------------------------------------------------------------------------------------------------------------------

local function DialogosJefe(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)  -- Cambiado a 5 para incluir más opciones de diálogo
    if Choice == 1 then
        creature:SendUnitSay("¡Te estás enfrentando al dragón más fuerte de todo WoW Sulvus!", 0)
    elseif Choice == 2 then
        creature:SendUnitSay("¿Crees que puedes derrotarme?", 0)
    
    end
end

----------------------------------------------------------------------------------------------------------------------
----                                            FASES DEFINIDAS                                                   ----
----                                                                                                              ----
----------------------------------------------------------------------------------------------------------------------

function Fase1(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(27569)
    creature:SetScale(1)
    creature:PlayDistanceSound(14406)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_BroodAfflictionRed(eventid, delay, calls, creature, true)
    end, 5 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_FlameBreath(eventid, delay, calls, creature, false)
    end, 20 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_FireballVolley(eventid, delay, calls, creature, false)
    end, 4 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_FlameBuffet(eventid, delay, calls, creature, true)
    end, 3 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_RainOfFire(eventid, delay, calls, creature, true)
    end, 30 * 1000, 0)
     
    creature:RegisterEvent(Fase2, 5 * 1000, 0)
    creature:RegisterEvent(DialogosJefe, 50 * 1000, 0)
end

function Fase2(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(26752)
    creature:SetScale(1.5)
    creature:PlayDistanceSound(3524)


    creature:RegisterEvent(Fase3, 5 * 1000, 0)
    creature:RegisterEvent(DialogosJefe, 60 * 1000, 0)
end

function Fase3(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(22838)
    creature:SetScale(1.8)
    creature:PlayDistanceSound(10404)

    
    creature:RegisterEvent(Fase4, 5 * 1000, 0)
    creature:RegisterEvent(DialogosJefe, 60 * 1000, 0)
end

function Fase4(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(20510)
    creature:SetScale(3)
    creature:PlayDistanceSound(3525)

    
    creature:RegisterEvent(Fase1, 5 * 1000, 0)
    creature:RegisterEvent(DialogosJefe, 60 * 1000, 0)
end



----------------------------------------------------------------------------------------------------------------------
----                                            Funciones Hechizos                                                ----
----                                                                                                              ----
----------------------------------------------------------------------------------------------------------------------
--##FASE1##
-- Función para lanzar el Dragon Rojo A TODOS LOS ENEMIGOS DENTRO DE LAS 100YDS
function Boss_BroodAfflictionRed(eventid, delay, calls, creature, instant)
    local members = creature:GetPlayersInRange(100)
    for _, member in ipairs(members) do
        creature:CastSpell(member, 23155, true)
    end
end

-- Función para el hechizo Flame Breath
function Boss_FlameBreath(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 74403, false)
end

-- Función para el hechizo Fireball Volley
function Boss_FireballVolley(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 22425, false)
end

-- Función para el hechizo Flame Buffet
function Boss_FlameBuffet(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 25668, true)
end

-- Función para el hechizo Rain of Fire
function Boss_RainOfFire(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 31340, true)
end

--##FASE2##

----------------------------------------------------------------------------------------------------------------------
----                                     Reiniciar el jefe al wipear                                              ----
----                                                                                                              ----
----------------------------------------------------------------------------------------------------------------------

local function ReinicioJefe(event, creature)
    creature:RemoveEvents()
    creature:RemoveAllAuras()
    creature:SetScale(2)
    local display = creature:GetNativeDisplayId()
    creature:SetDisplayId(display)
    creature:SendUnitSay("Fallaste en el intento... ¡Vuelve en otra oportunidad!", 0)
    
end

----------------------------------------------------------------------------------------------------------------------
----                                     Frases al morir el boss                                                  ----
----                                                                                                              ----
----------------------------------------------------------------------------------------------------------------------


local function MuereJefe(event, creature, killer)
    if killer and killer:IsPlayer() then
        killer:SendBroadcastMessage("¡Pudiste matar a la gran " .. creature:GetName() .. "!")
    end
    creature:SendUnitSay("El vuelo rojo no prevalecerá", 0)
    creature:RemoveEvents()
    local display = creature:GetNativeDisplayId()
    creature:SetDisplayId(display)
    --local x, y, z, o = creature:GetLocation()  -- Obtenemos la posición de la criatura
    creature:CastSpell(creature, 27569, true)
    creature:SetScale(2.5)
end

----------------------------------------------------------------------------------------------------------------------
----                                     Mensajes al matar un PJ                                                  ----
----                                                                                                              ----
----------------------------------------------------------------------------------------------------------------------

local killedMessages = {
    "¿Ya murió otro? Parecen de papel... Jajaja",
    "El jugador %s no estaba preparado para enfrentarme.",
    "Ahí murió uno más...",
    "%s, suerte la próxima vez.",
    "¿Otro caído? ¡Mi poder es inquebrantable!",
    "La muerte es solo el principio mi estimado %s ...",
}
--Funcion para mencionar al PJ
local function JugadorMuerto(event, creature, victim)
    local playerName = victim:GetName()
    local messageIndex = math.random(1, #killedMessages)
    local message = killedMessages[messageIndex]
    creature:SendUnitSay(message:format(playerName), 0)
    --creature:PlayDistanceSound() -- Sonido al morir alguno
end


RegisterCreatureEvent(Alextrasza, 1, EntrarEnCombate)
RegisterCreatureEvent(Alextrasza, 2, ReinicioJefe)
RegisterCreatureEvent(Alextrasza, 3, JugadorMuerto)
RegisterCreatureEvent(Alextrasza, 4, MuereJefe)