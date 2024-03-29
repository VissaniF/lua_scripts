Alextrasza = 777778


--Pausa
function wait(segundos)
    local start = os.time()
    repeat until os.time() > start + segundos
end


--Combat
local function EntrarEnCombate(event, creature, target)
    --creature:CastSpell(creature:GetVictim(), 22539) -- Lanza una bola de fuego
    creature:PlayDistanceSound(15964)
    creature:SendUnitYell( "¡Es la hora de ver un verdadero dragón!", 0 )
    creature:CastSpell(creature:GetVictim(), 42950) -- Aliento de fuego
    creature:SetScale(2.3)
    
    creature:RegisterEvent(Fase1, 5 * 1000, 0) -- Segundos para cambiar de jefe
end


--Dialogo
local function DialogosJefe(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)  -- Cambiado a 5 para incluir más opciones de diálogo
    if Choice == 1 then
        creature:SendUnitSay("¡Te estás enfrentando al dragón más fuerte de todo WoW Sulvus!", 0)
    elseif Choice == 2 then
        creature:SendUnitSay("¿Crees que puedes derrotarme?", 0)
    
    end
end
----------------------------------------------------------------------------------------------------------------------
----                                            LLAMAMIENTO A FASES                                                ----
----        Se llama a la siguiente fase si pasan determinado tiempo dentro de una fase.                           ----                                                                 ----
----------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------
----                                            FASES DEFINIDAS                                                ----
----                                                                                                              ----
----------------------------------------------------------------------------------------------------------------------

function Fase1(eventid, delay, calls, creature)
    creature:RemoveEvents()
    
    creature:SetDisplayId(27569)
    creature:SetScale(0.6)
    creature:PlayDistanceSound(14406)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_Spellfase1(eventid, delay, calls, creature, true)
    end, 10 * 1000, 0)
    
    creature:RegisterEvent(function(eventid, delay, calls, creature)
        local spellID = 23153
        local range = 30

        local enemyPlayers = creature:GetPlayersInRange(range)
        if #enemyPlayers > 0 then
            local randomIndex = math.random(1, #enemyPlayers)
            local targetPlayer = enemyPlayers[randomIndex]
            creature:CastSpell(targetPlayer, spellID, true)
        end
    end, 18 * 1000, 0) -- azul

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellDragonRojo(eventid, delay, calls, creature, true)
    end, 23 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellBarridoDeCola(eventid, delay, calls, creature, true)
    end, 15 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellViento(eventid, delay, calls, creature, true)
    end, 20 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellAlientoLlamas(eventid, delay, calls, creature, false, 2000)
    end, 12 * 1000, 0)

    creature:RegisterEvent(Fase2, 100 * 1000, 0)
    
    creature:RegisterEvent(DialogosJefe, 60 * 1000, 0)
end

function Fase2(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetScale(0.8)
    creature:SetDisplayId(11380)
    creature:PlayDistanceSound(3524)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_Spellfase2(eventid, delay, calls, creature, true)
    end, 10 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellDragonBronce(eventid, delay, calls, creature, true)
    end, 10 * 1000, 1)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellLanzaLlamas(eventid, delay, calls, creature, true)
    end, 15 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellLlamasAcumulables(eventid, delay, calls, creature, true)
    end, 19 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellSacudidaAlas(eventid, delay, calls, creature, false)
    end, 30 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellLatigazoCola(eventid, delay, calls, creature, true)
    end, 25 * 1000, 0)
    
    creature:RegisterEvent(Fase3, 100 * 1000, 0)
    
    creature:RegisterEvent(DialogosJefe, 60 * 1000, 0)
end

function Fase3(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(20510)
    creature:SetScale(1.8)
    creature:PlayDistanceSound(10404)

    

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        BossAlientoOscuro(eventid, delay, calls, creature, true)
    end, 15 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_Spellfase3(eventid, delay, calls, creature, true)
    end, 10 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellDragonNegro(eventid, delay, calls, creature, true)
    end, 11 * 1000, 1)
    
    creature:RegisterEvent(function(eventid, delay, calls, creature)
        local spellID = 23174
        local range = 30

        local enemyPlayers = creature:GetPlayersInRange(range)
        if #enemyPlayers > 0 then
            local randomIndex = math.random(1, #enemyPlayers)
            local targetPlayer = enemyPlayers[randomIndex]
            creature:CastSpell(targetPlayer, spellID, true)
        end
    end, 18 * 1000, 1)    

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellArcanoArea(eventid, delay, calls, creature, false)
    end, 25 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellInvocaJugadorEnemigo(eventid, delay, calls, creature, true)
    end, 120 * 1000, 1)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellInterceptar(eventid, delay, calls, creature, true)
    end, 45 * 1000, 1)
    
    
    creature:RegisterEvent(Fase4, 100 * 1000, 0)
    -- Registro de evento para diálogos del jefe
    creature:RegisterEvent(DialogosJefe, 60 * 1000, 0)
end

function Fase4(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(22838)
    creature:SetScale(1.5)
    creature:PlayDistanceSound(3525)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_Spellfase4(eventid, delay, calls, creature, true)
    end, 25 * 1000, 0)
    
    
    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellDragonVerde(eventid, delay, calls, creature, true)
    end, 10 * 1000, 1)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellEmpuja(eventid, delay, calls, creature, false)
    end, 20 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellVenenoArea(eventid, delay, calls, creature, false)
    end, 35 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellNaturaleza(eventid, delay, calls, creature, true)
    end, 40 * 1000, 0)

    creature:RegisterEvent(function(eventid, delay, calls, creature)
        Boss_SpellReduceVida(eventid, delay, calls, creature, false)
    end, 60 * 1000, 1)

    creature:RegisterEvent(Fase1, 100 * 1000, 0)
    
    creature:RegisterEvent(DialogosJefe, 60 * 1000, 0)
end



----------------------------------------------------------------------------------------------------------------------
----                                            Funciones Hechizos                                                ----
----                                                                                                              ----
----------------------------------------------------------------------------------------------------------------------

--Tira un poder arcano casteable a todos los del area                           FASE4
function Boss_SpellArcanoArea(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 38523, false)
end

--Sacude las alas y pega                                                        FASE3
function Boss_SpellSacudidaAlas(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 23339, false)
    creature:PlayDistanceSound(10905, 50)
end--

--Empuja con las alas a los que estan en frente                                 FASE2
function Boss_SpellEmpuja(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 18500, false)
    creature:PlayDistanceSound(5059, 50)
end

--Pega con la cola a los pjs que estan atras                                    FASE3
function Boss_SpellBarridoDeCola(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 68867, true) 
    creature:PlayDistanceSound(3520, 50)--
end

--Hechizo de veneno unitarget que queda en area                                 FASE3
function Boss_SpellVenenoArea(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 59122, false)
end


--Aliento de llamas                                                             FASE1
function Boss_SpellAlientoLlamas(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 56908, false)
end

-- Función para lanzar el Dragon Rojo                                           FASE1
function Boss_SpellDragonRojo(eventid, delay, calls, creature, instant)
    local members = creature:GetPlayersInRange(100)
    for _, member in ipairs(members) do
        creature:CastSpell(member, 23155, true)
    end
end

-- Función para lanzar la Lanza de Llamas                                       FASE1
function Boss_SpellLanzaLlamas(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 23023, true)
end

-- Función para lanzar Llamas Acumulables                                       FASE1
function Boss_SpellLlamasAcumulables(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 23341, true) 
end

-- Función para invocar un Esbirro ,                                             FASE4
function Boss_SpellEsbirro(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 23174, true)
end

-- Función para reducir la vida del objetivo  23310,                            FASE4
function Boss_SpellReduceVida(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 23310, true)
end

-- Función para lanzar el Dragon Bronce                                         FASE2
function Boss_SpellDragonBronce(eventid, delay, calls, creature, instant)
    local members = creature:GetPlayersInRange(100)
    for _, member in ipairs(members) do
        creature:CastSpell(member, 23170, true)
    end
end

-- Función para lanzar el Dragon Negro                                          FASE3
function Boss_SpellDragonNegro(eventid, delay, calls, creature, instant)
    local members = creature:GetPlayersInRange(100)
    for _, member in ipairs(members) do
        creature:CastSpell(member, 23154, true)
    end
end

-- Función para lanzar el Dragon Verde                                          FASE4
function Boss_SpellDragonVerde(eventid, delay, calls, creature, instant)
    local members = creature:GetPlayersInRange(100)
    for _, member in ipairs(members) do
        creature:CastSpell(member, 23169, true)
    end
end

-- Función para lanzar el Dragon Azul                                           FASE1
function Boss_SpellDragonAzul(eventid, delay, calls, creature, instant)
    creature:CastSpell(creature:GetVictim(), 23153, true) -- Dragon Azul
end

--Invoca jugador Enemigo hacia su rango                                         FASE2
function Boss_SpellInvocaJugadorEnemigo(eventid, delay, calls, creature, instant)        
    creature:CastSpell(creature:GetVictim(), 20279, true) 
end

-- Latigazo de cola                                                             FASE3
function Boss_SpellLatigazoCola(eventid, delay, calls, creature, instant)        
    creature:CastSpell(creature:GetVictim(), 45122, true) 
end

-- Cae sobre el objetivo y le tira un hechizo                                   FASE3
function Boss_SpellInterceptar(eventid, delay, calls, creature, instant)        
    creature:CastSpell(creature:GetVictim(), 4336, true)
    wait(0.5)
    creature:CastSpell(creature:GetVictim(), 6435, true) 
end

--Los lanza
function Boss_SpellViento(eventid, delay, calls, creature, instant)        
    creature:CastSpell(creature:GetVictim(), 31475, true) 
end

function Boss_SpellNaturaleza(eventid, delay, calls, creature, instant)        
    creature:CastSpell(creature:GetVictim(), 38230, true) 
end
--------------------------------------------------------------------------------------------
-----------------------------------BASICOS-------------------------------------------------
function Boss_Spellfase1(eventid, delay, calls, creature, instant)     --arcano   
    creature:CastSpell(creature:GetVictim(), 32053, false) 
end

function Boss_Spellfase2(eventid, delay, calls, creature, instant)     --fuego  
    creature:CastSpell(creature:GetVictim(), 32054, false) 
end

function BossAlientoOscuro(eventid, delay, calls, creature, instant)     --aliento oscuro
    creature:CastSpell(creature:GetVictim(), 75956, false) 
end

function Boss_Spellfase3(eventid, delay, calls, creature, instant)        --sombra
    creature:CastSpell(creature:GetVictim(), 58678, false) 
end

function Boss_Spellfase4(eventid, delay, calls, creature, instant)       --veneno 
    creature:CastSpell(creature:GetVictim(), 57088, false) 
end

--------------------------------------------------------------------------------------------


--Reiniciar el jefe al wipear
local function ReinicioJefe(event, creature)
    creature:RemoveEvents()
    creature:RemoveAllAuras()
    creature:SetScale(2)
    local display = creature:GetNativeDisplayId()
    creature:SetDisplayId(display)
    creature:SendUnitSay("Fallaste en el intento... ¡Vuelve en otra oportunidad!", 0)
    
end


-- Frases al morir el boss
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
    creature:SetScale(2)
end


--Mensajes al matar un PJ
local killedMessages = {
    "¿Ya murió otro? Parecen de papel... Jajaja",
    "El jugador %s no estaba preparado para enfrentarme.",
    "Ahí murió uno más...",
    "%s , suerte la próxima vez.",
    "¿Otro caído? ¡Mi poder es inquebrantable!",
    "La muerte es solo el principio mi estimado %s ...",
}
--Funcion para mencionar al PJ
local function JugadorMuerto(event, creature, victim)
    local playerName = victim:GetName()
    local messageIndex = math.random(1, #killedMessages)
    local message = killedMessages[messageIndex]
    creature:SendUnitSay(message:format(playerName), 0)
    creature:PlayDistanceSound(3520) -- Sonido al morir alguno
end


RegisterCreatureEvent(Alextrasza, 1, EntrarEnCombate)
RegisterCreatureEvent(Alextrasza, 2, ReinicioJefe)
RegisterCreatureEvent(Alextrasza, 3, JugadorMuerto)
RegisterCreatureEvent(Alextrasza, 4, MuereJefe)