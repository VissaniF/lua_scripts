

local npcId = 400000


-- Esta función se llama cuando la criatura entra en combate
local function OnEnterCombat(event, creature, target)
    
    --creature:CastSpell(creature, 26297, true)
    creature:CastSpell(creature, 51271, true)
    
    creature:SendUnitSay("Ustedes se la buscaron, ¡Ahora van a morir!", 0)
    
    creature:RegisterEvent(Boss_ClassPick, 6000, 0)
    
    creature:RegisterEvent(Boss_Talk, 5000, 0)
end


---==================================================
-----------------------Dialogos
---==================================================
    function Boss_Talk(eventid, delay, calls, creature)
    local Choice = math.random(1, 4)
    if Choice == 1 then
    creature:SendUnitSay("Eres escoria, incluso peor que Kaome", 0)
    end
    if Choice == 2 then
    creature:SendUnitSay("Te estas enfrentando al Jefe mas fuerte del Wow Sulvus", 0)
    end
    if Choice == 3 then
    creature:SendUnitSay("¡Oh, cómo me gustaría que lo intentaras!", 0)
    end
    if Choice == 4 then
    creature:SendUnitSay("Tienes una clase, yo puedo elegir entre 8 clases en cualquier momento. ¿Cómo te atreves a enfrentarme?", 0)
    end
    end
    
function Boss_TalkShaman(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)
    if Choice == 1 then
        creature:SendUnitSay("Ah... Chamanes, guardianes del Trueno y el Relámpago.", 0)
    end
    if Choice == 2 then
        creature:SendUnitSay("Los elementos son poderosos en la clase de Chaman.", 0)
    end
end

function Boss_TalkDK(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)
    if Choice == 1 then
        creature:SendUnitSay("Oh mi querido Rey Éxanime, luchare junto a tu lado.", 0)
    end
    if Choice == 2 then
        creature:SendUnitSay("¡La Agonía de Escarcha se alimenta!.", 0)
    end
end

function Boss_TalkPaladin(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)
    if Choice == 1 then
        creature:SendUnitSay("Ah... Paladines, guardianes de los poderes Sagrados y los verdaderos defensores de la Alianza.", 0)
    end
    if Choice ==2 then
        creature:SendUnitSay("El Poder Sagrado es fuerte en la clase de Paladín.", 0)
    end
end

function Boss_TalkDruid(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)
    if Choice == 1 then
        creature:SendUnitSay("Ah... Druidas, guardianes de la Naturaleza y todas las cosas vivientes.", 0)
    end
    if Choice == 2 then
        creature:SendUnitSay("Las Fuerzas Naturales son poderosas en la clase de Druida.", 0)
    end
end

local function Boss_TalkPriest(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)
    if Choice == 1 then
        creature:SendUnitSay("Ah... Sacerdotes, Maestros del poder Sagrado y el Enfoque Espiritual.", 0)
    end
    if Choice == 2 then
        creature:SendUnitSay("¡La Clase de Sacerdote me hace sentir vivo!", 0)
    end
end

local function Boss_TalkRogue(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)
    if Choice == 1 then
        creature:SendUnitSay("Ah... Pícaros, maestros del Sigilo y el Movimiento Oculto.", 0)
    end
    if Choice == 2 then
        creature:SendUnitSay("¡La clase de Pícaro me trae nuevas oportunidades...", 0)
    end
end

local function Boss_TalkWarrior(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)
    if Choice == 1 then
        creature:SendUnitSay("Ah... Guerreros, tanques temibles, cuerpos inpenetrables!", 0)
    end
    if Choice == 2 then
        creature:SendUnitSay("¡La fuerza del Guerrero, siéntela!", 0)
    end
end

local function Boss_TalkWarlock(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)
    if Choice == 1 then
        creature:SendUnitSay("Ah... Brujos, guardianes de la magia oscura y los secretos ocultos.", 0)
    end
    if Choice == 2 then
        creature:SendUnitSay("Las sombras que rodean la Clase de Brujo siempre permanecerán como un misterio...", 0)
    end
end

local function Boss_TalkMage(eventid, delay, calls, creature)
    local Choice = math.random(1, 2)
    if Choice == 1 then
        creature:SendUnitSay("Ah... Magos, guardianes de los 3 campos mágicos: Escarcha, Fuego y Arcano.", 0)
    end
    if Choice == 2 then
        creature:SendUnitSay("La clase de Mago es muy versátil, podría usarla nuevamente en algún momento...", 0)
    end


end
--==============================================================
----------------------------Cambio de clases
--==============================================================

function Boss_ClassPick(eventid, delay, calls, creature)
    creature:RemoveEvents()

        --Para forzar que las clases se elijan 1 por 1 sin repetirse hacemos un contador con un condicional
        --  local classCounter = 1
        --  quitamos el choice = math.random
        --  Agregamos en vez de if choice == 1 then ponemos if classCounter == 1 then
        --  Para hacer que pegue la vuelta lo cerramos con 

        --classCounter = classCounter + 1
        --    if classCounter > 5 then
        --        classCounter = 1 -- Reiniciar el contador si ya hemos pasado por todas las clases
        --    end

    local Choice = math.random(1, 9)
    
    if Choice == 1 then
        creature:SendUnitYell("¡Siente el poder del mejor chamán de todo Azeroth!", 0)
        creature:RegisterEvent(Boss_Shaman, 1000, 0)
        creature:CastSpell(creature, 2894, true) -- Tira elemental
        creature:CastSpell(creature, 2484, true) -- Se tira escudo de relampago ni bien aparece
        creature:CastSpell(creature:GetVictim(), 51533, true) -- Lanza los lobos
    elseif Choice == 2 then
        creature:SendUnitYell("¡Siente el poder del mejor paladín de todo Azeroth!", 0)
        creature:RegisterEvent(Boss_Paladin, 1000, 0)
        creature:CastSpell(creature:GetVictim(), 53407, true)-- Lanza Sentencia sobre el objetivo
        creature:CastSpell(creature:GetVictim(), 10308, true)-- Lanza sentencia
    elseif Choice == 3 then
        creature:SendUnitYell("¡Siente el poder del mejor druida de todo Azeroth!", 0)
        creature:RegisterEvent(Boss_Druid, 1000, 0)
        creature:CastSpell(creature:GetVictim(), 33831, true)--33831 Arbolitos
        creature:CastSpell(creature, 33763, true)
        creature:CastSpell(creature, 33763, true)
        creature:CastSpell(creature, 33763, true) -- Lanza Flor de Vida 3 veces sobre sí mismo
    elseif Choice == 4 then
        creature:SendUnitYell("¡Siente el poder de la mejor sacerdotisa de todo Azeroth!", 0)
        creature:RegisterEvent(Boss_Priest, 1000, 0)
        creature:CastSpell(creature:GetVictim(), 10890, true) -- Lanza alarido 
        creature:CastSpell(creature:GetVictim(), 32375, true) -- Lanza Dispell en masa
        creature:CastSpell(creature:GetVictim(), 32375, true) -- 2 veces
    elseif Choice == 5 then
        creature:SendUnitYell("¡Siente el poder de la mejor pícara de todo Azeroth!", 0)
        creature:RegisterEvent(Boss_Rogue, 1000, 0)
        creature:CastSpell(creature, 26889, true)
        creature:CastSpell(creature, 31224, true)
        
        -- Obtener solo criaturas vivas y hostiles dentro de un rango de 30 yardas
        local enemies = creature:GetCreaturesInRange(30, nil, 1, 1)
        
        local count = 0
        for _, enemy in ipairs(enemies) do
            if enemy:GetEntry() ~= creature:GetEntry() then
                creature:CastSpell(enemy, 36554, true)-- Lanza Paso de la Sombra sobre los enemigos cercanos
                creature:CastSpell(enemy, 48691, true)
                count = count + 1
                if count >= 3 then
                    break
                end
            end
        end
        
        creature:CastSpell(creature, 43547, true) -- Lanza Hacer Picadillo sobre sí mismo
    elseif Choice == 6 then
        creature:SendUnitYell("¡Siente el poder del mejor guerrero de todo Azeroth!", 0)
        creature:RegisterEvent(Boss_Warrior, 1000, 0)
        creature:CastSpell(creature, 71, true) -- Se lanza actitud defensiva
        creature:CastSpell(creature, 23920, true) -- Se lanza reflejo de hechizos
        creature:CastSpell(creature:GetVictim(), 25264, true) -- Le tira al enemigo un atronar
    elseif Choice == 7 then
        creature:SendUnitYell("¡Siente el poder del mejor brujo de todo Azeroth!", 0)
        creature:RegisterEvent(Boss_Warlock, 1000, 0)
        creature:CastSpell(creature, 47889, true) -- Escudo de brujo
        creature:CastSpell(creature:GetVictim(), 30146, true)--30146
    elseif Choice == 8 then
        creature:SendUnitYell("¡Siente el poder de la mejor maga de todo Azeroth!", 0)
        creature:RegisterEvent(Boss_Mage, 1000, 0)
        creature:CastSpell(creature:GetVictim(), 29963, true) -- Lanza una linda polimorfia masiva :D
    elseif Choice == 9 then
        creature:SendUnitYell("¡Siente el poder del mejor caballero de la muerte de todo Azeroth!", 0)
        creature:RegisterEvent(Boss_DK, 1000, 0)
        creature:CastSpell(creature:GetVictim(), 49203, true) 
        creature:CastSpell(creature:GetVictim(), 49206, true)
        creature:CastSpell(creature:GetVictim(), 49938, true) -- 2 veces
    end
end
--=======================================================
-------------------------ENRAGE
--=======================================================

function CheckEnrage(eventid, delay, calls, creature)
    if creature:IsInCombat() then -- Verificar si la criatura está en combate
        local inCombatTime = creature:GetCombatTime() -- Obtener el tiempo que la criatura ha estado en combate
        if inCombatTime >= 60000 then -- Si el tiempo en combate es al menos 1 minuto (60000 ms)
            creature:CastSpell(creature, 72143, true) -- Lanzar el hechizo de enrage
            creature:RemoveEvents() -- Detener la verificación una vez que se lanza el enrage
        end
    end
end


--=======================================================
-------------------------Shaman
--=======================================================
function Boss_Shaman(eventid, delay, calls, creature)
    creature:RemoveEvents() -- Elimina cualquier evento previo asociado a la criatura
    creature:SetDisplayId(4527) -- Cambia la apariencia de la criatura al modelo visual correspondiente al chamán
    creature:SetScale(3) -- Aumenta el tamaño de la criatura al doble
    creature:RemoveAllAuras()
    creature:SetEquipmentSlots(44094, 44094, 0)
    creature:RegisterEvent(Boss_SpellShamanChain, 11000, 0) -- Registra un evento para lanzar el hechizo de cadena del chamán después de 11 segundos, sin repetición
    creature:RegisterEvent(Boss_SpellShamanTotem, 13000, 0) -- Registra un evento para lanzar el hechizo de tierra del chamán después de 13 segundos, sin repetición
    creature:RegisterEvent(Boss_SpellShamanFrost, 14000, 0) -- Registra un evento para lanzar el hechizo de helada del chamán después de 14 segundos, sin repetición
    creature:RegisterEvent(Boss_SpellShamanBuff, 5000, 0)
    creature:RegisterEvent(Boss_SpellShamanAnsias, 6000, 0)
    creature:RegisterEvent(Boss_SpellShamanEmpujar, 10000, 0) -- Registra un evento para lanzar el hechizo de aumento de poder del chamán después de 5 segundos, sin repetición
    creature:RegisterEvent(Boss_ClassPick, 30000, 0) -- Registra un evento para seleccionar la clase del jefe después de 30 segundos, sin repetición
    creature:RegisterEvent(Boss_TalkShaman, 18000, 0) -- Registra un evento para el diálogo específico del chamán después de 15 segundos, sin repetición
    creature:RegisterEvent(Boss_Talk, 25000, 0)
     -- Registra un evento de diálogo general después de 30 segundos, sin repetición
end


function Boss_SpellShamanChain(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 16033, true)
    --creature:SetScale(3) -- Lanza el hechizo de cadena del chamán en el objetivo actual
end

function Boss_SpellShamanAnsias(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 2825, true)
    
     -- Lanza el hechizo de tormenta de truenos
end--2825

function Boss_SpellShamanEmpujar(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 59159, true)
    
end

-- Define una función para lanzar el hechizo de tierra del chamán
function Boss_SpellShamanTotem(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 2484, true)
    
end

-- Define una función para lanzar el hechizo de helada del chamán
function Boss_SpellShamanFrost(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 34353, true)
    
end

-- Define una función para lanzar el hechizo de aumento de poder del chamán
function Boss_SpellShamanBuff(event, delay, calls, creature)
    creature:CastSpell(creature, 10431, true)
    
end
--=======================================================
-------------------------DK
--=======================================================
function Boss_DK(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(25337) 
    creature:SetScale(3)
    creature:RemoveAllAuras()
    creature:SetEquipmentSlots(33475, 0, 0)
    creature:RegisterEvent(Boss_SpellAtraccion, 5000, 0)
    creature:RegisterEvent(Boss_SpellAntimagia, 8000, 0)
    creature:RegisterEvent(Boss_SpellCadena, 8000, 3)--45524 Cadena
    creature:RegisterEvent(Boss_SpellDeflagacion, 8000, 2)--51328 Deflagacion
    creature:RegisterEvent(Boss_SpellbuffDK, 10000, 0)--57623 buff
    creature:RegisterEvent(Boss_SpellArmadura, 10000, 0)--51271 Armadura
    creature:RegisterEvent(Boss_SpellEjercito, 11000, 2)--42650 Ejercito
    creature:RegisterEvent(Boss_SpellEntereza, 11000, 0)--48792 Entereza
    creature:RegisterEvent(Boss_SpellExplocion_aullante, 6000, 0)--51411 Explocion_aullante
    creature:RegisterEvent(Boss_SpellCongelar, 9000, 2)--49203 Congelar
    creature:RegisterEvent(Boss_SpellLevantar_muerto, 3000, 5)--46584 Levantar_muerto
    creature:RegisterEvent(Boss_SpellPestilencia, 9000, 2)--50842 Pestilencia
    creature:RegisterEvent(Boss_SpellPresencia, 9000, 2)--48263 Presencia escarcha
    creature:RegisterEvent(Boss_SpellMuerte_descomposicion, 6000, 2)--49938 Muerte_descomposicion
    creature:RegisterEvent(Boss_SpellToque_helado, 4000, 0)--49909 Toque_helado


    creature:RegisterEvent(Boss_ClassPick, 40000, 0)
    creature:RegisterEvent(Boss_TalkDK, 18000, 0) 
    creature:RegisterEvent(Boss_Talk, 25000, 0)
end

function Boss_SpellLevantar_muerto(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 46584, true)
end

function Boss_SpellPestilencia(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 50842, true)
end

function Boss_SpellPresencia(eventid, delay, calls, creature)
    creature:CastSpell(creature, 48263, true)
end

function Boss_SpellToque_helado(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 49909, true)
end

function Boss_SpellMuerte_descomposicion(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 49938, true)
end

function Boss_SpellCongelar(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 49203, true)
end

function Boss_SpellExplocion_aullante(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 51411, true)
end

function Boss_SpellEntereza(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 48792, true)
end

function Boss_SpellEjercito(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 42650, true)
end

function Boss_SpellArmadura(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 51271, true)
end

function Boss_SpellbuffDK(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 57623, true)
end

function Boss_SpellDeflagacion(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 51328, true)
end

function Boss_SpellCadena(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 45524, true)
end

function Boss_SpellAtraccion(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 49576, true)
end


function Boss_SpellAntimagia(event, delay, calls, creature)
    creature:CastSpell(creature, 48707, true)
end
--=======================================================
-------------------------Paladin
--=======================================================
function Boss_Paladin(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(23889)
    creature:SetScale(4)
    creature:RemoveAllAuras()
    creature:CastSpell(creature, 54043, 1)
    creature:SetEquipmentSlots(40343, 0, 0) -- Equipo el arma principal

    -- Tiempos de duración de cada hechizo
    local duration_Alitas = 2000 -- 2 segundos
    local duration_Martillo = 1500 -- 1.5 segundos
    local duration_Shock = 1500 -- 1.5 segundos

    -- Registra los eventos con los tiempos ajustados
    creature:RegisterEvent(Boss_SpellPaladinCons, 10000, 3) -- Instantáneo
    creature:RegisterEvent(Boss_SpellPaladinMartillo, 10000 + duration_Alitas, 1) -- Comienza después de Alitas
    creature:RegisterEvent(Boss_SpellPaladinAlitas, 10000, 0)
    creature:RegisterEvent(Boss_SpellPaladinSacro, 10000, 0) -- 2 segundos de duración
    creature:RegisterEvent(Boss_SpellPaladinReckoning, 10000 + duration_Alitas, 0) -- Comienza después de Alitas
    creature:RegisterEvent(Boss_SpellPaladinSeal, 10000 + duration_Alitas, 0) -- Comienza después de Alitas
    creature:RegisterEvent(Boss_SpellPaladinShock, 10000 + duration_Alitas + duration_Martillo, 1) -- Comienza después de Martillo
    creature:RegisterEvent(Boss_SpellPaladinShield, 10000 + duration_Alitas + duration_Shock, 0)
    creature:RegisterEvent(Boss_SpellPaladinTormentaDivina, 8000, 2) -- Comienza después de Shock
    creature:RegisterEvent(Boss_ClassPick, 30000, 0)
    creature:RegisterEvent(Boss_TalkPaladin, 18000, 0)
    creature:RegisterEvent(Boss_Talk, 25000, 0)
end


function Boss_SpellPaladinAlitas(eventid, delay, calls, creature)
creature:CastSpell(creature, 31884, true)
end

function Boss_SpellPaladinTormentaDivina(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 53385, true)
end

function Boss_SpellPaladinSacro(eventid, delay, calls, creature)
creature:CastSpell(creature, 53601, true)
end

function Boss_SpellPaladinCons(eventid, delay, calls, creature)
creature:CastSpell(creature, 27173, true)
end

function Boss_SpellPaladinMartillo(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 10308, true)
end

function Boss_SpellPaladinReckoning(eventid, delay, calls, creature)
creature:CastSpell(creature, 20178, true)
end

function Boss_SpellPaladinSeal(eventid, delay, calls, creature)
creature:CastSpell(creature, 31801, true)
end

function Boss_SpellPaladinShock(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 27174, true)
end

function Boss_SpellPaladinShield(eventid, delay, calls, creature)
creature:CastSpell(creature, 642, true)
end

--=======================================================
-------------------------Druida
--=======================================================

function Boss_Druid(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(5927)
    creature:SetScale(3)
    creature:SetEquipmentSlots(47911, 0, 0)
    creature:RemoveAllAuras()
    creature:RegisterEvent(Boss_SpellDruidStarfire, 10000, 0) --26986--
    creature:RegisterEvent(Boss_SpellDruidCripple, 12000, 0) --20812--
    creature:RegisterEvent(Boss_SpellDruidLifebloom, 7000, 0) --33763--
    creature:RegisterEvent(Boss_SpellDruidNatures, 19000, 0) --27009--
    creature:RegisterEvent(Boss_SpellDruidLluvia, 25000, 0)
    creature:RegisterEvent(Boss_SpellDruidTifon, 7000, 0)
    creature:RegisterEvent(Boss_SpellDruidCiclon, 7000, 0)--33786
    creature:RegisterEvent(Boss_SpellDruidHuracan, 7000, 1) -- 48467
    creature:RegisterEvent(Boss_SpellDruidRejuvenecer, 7000, 2) --48441
    creature:RegisterEvent(Boss_ClassPick, 30000, 0)
    creature:RegisterEvent(Boss_TalkDruid, 18000, 0)
    creature:RegisterEvent(Boss_Talk, 25000, 0)
end

function Boss_SpellDruidStarfire(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 26986, true)
end

function Boss_SpellDruidCiclon(eventid, delay, calls, creature)
    -- Obtener solo criaturas vivas y hostiles dentro de un rango de 30 yardas
    local enemies = creature:GetCreaturesInRange(30, nil, 1, 1)
    
    if #enemies > 0 then
        local randomIndex = math.random(1, #enemies)
        local target = enemies[randomIndex]
        creature:CastSpell(target, 33786, true) -- Lanza Ciclón sobre un enemigo aleatorio cercano
    else
        print("No hay enemigos cercanos para lanzar Ciclón.")
    end
end

function Boss_SpellDruidHuracan(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 48467, true)
end

function Boss_SpellDruidCripple(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 20812, true)
end

function Boss_SpellDruidRejuvenecer(eventid, delay, calls, creature)
    creature:CastSpell(creature, 48441, true)
end

function Boss_SpellDruidTifon(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 61384, true)
end

function Boss_SpellDruidLifebloom(eventid, delay, calls, creature)
    creature:CastSpell(creature, 33763, true)
    creature:CastSpell(creature, 33763, true)
    creature:CastSpell(creature, 33763, true)
end

function Boss_SpellDruidLluvia(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 53201, true) -- Lanza el hechizo especial del druida en el objetivo actual
end

function Boss_SpellDruidNatures(eventid, delay, calls, creature)
    creature:CastSpell(creature, 27009, true)
end


--=======================================================
-------------------------sacerdote
--=======================================================

function Boss_Priest(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(7274)
    creature:SetScale(4)
    creature:SetEquipmentSlots(32830, 0, 0)
    creature:RemoveAllAuras()
    creature:CastSpell(creature, 15473, true) -- Se tira sombras del sacer
    creature:RegisterEvent(Boss_SpellPriestNova, 8000, 0) -- 48078
    creature:RegisterEvent(Boss_SpellPriestSmite, 10000, 0) -- 25364
    creature:RegisterEvent(Boss_SpellPriestalarido_psiquico, 8000, 0)--10890 alarido_psiquico
    creature:RegisterEvent(Boss_SpellPriestHorror, 8000, 0)--64044 Horror
    creature:RegisterEvent(Boss_SpellPriestPeste_Devoradora, 8000, 0)--25467 Peste_Devoradora
    creature:RegisterEvent(Boss_SpellPriestSilencio, 8000, 0)--15487 Silencio
    creature:RegisterEvent(Boss_SpellPriestToque_Vampirico, 8000, 0)--48160 Toque_Vampirico
    creature:RegisterEvent(Boss_SpellPriestDispel, 6000, 3) -- 32375
    creature:RegisterEvent(Boss_SpellPriestPain, 10000, 0)
    creature:RegisterEvent(Boss_SpellPriestTortura, 9000, 2)   --53023
    creature:RegisterEvent(Boss_SpellSanacion, 1500, 1, creature)
    creature:RegisterEvent(Boss_SpellPriestBuff, 10000, 1)
    creature:RegisterEvent(Boss_SpellEscudo, 15000, 2) -- 25368
    creature:RegisterEvent(Boss_ClassPick, 30000, 0)
    creature:RegisterEvent(Boss_TalkPriest, 18000, 0)
    creature:RegisterEvent(Boss_Talk, 25000, 0)
end

function Boss_SpellPriestalarido_psiquico(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 10890, true)
end

function Boss_SpellPriestHorror(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 64044, true)
end

function Boss_SpellPriestSilencio(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 15487, true)
end

function Boss_SpellPriestPeste_Devoradora(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 25467, true)
end

function Boss_SpellPriestToque_Vampirico(eventid, delay, calls, creature)
    creature:CastSpell(creature, 48160, true)
end

function Boss_SpellSanacion(eventid, delay, calls, creature)
    creature:CastSpell(creature, 25222, true)
end

function Boss_SpellPriestBuff(eventid, delay, calls, creature)
    creature:CastSpell(creature, 48161, true)
end

function Boss_SpellEscudo(eventid, delay, calls, creature)
    creature:CastSpell(creature, 48066, true)
end


function Boss_SpellPriestTortura(eventid, delay, calls, creature)
    creature:CastSpell(creature, 53023, true)
end


function Boss_SpellPriestNova(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 48078, true)
end
--credits to nymphx of mmowned--
function Boss_SpellPriestSmite(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 25364, true)
end

function Boss_SpellPriestDispel(eventid, delay, calls, creature)
creature:CastSpell(creature, 32375, true)
end

function Boss_SpellPriestPain(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 25368, true)
end

--=======================================================
-------------------------picaro
--=======================================================
function Boss_Rogue(eventid, delay, calls, creature)
    creature:RemoveEvents()
    creature:SetDisplayId(26365)
    creature:SetScale(5)
    creature:SetEquipmentSlots(19347, 19347, 0)
    creature:RemoveAllAuras()
    creature:RegisterEvent(Boss_SpellRogueBlind, 11000, 0) --2094--
    creature:RegisterEvent(Boss_SpellRogueGhostly, 6000, 0) --14278--
    creature:RegisterEvent(Boss_SpellRoguePasoSombra, 15000, 0)--36554--
    creature:RegisterEvent(Boss_SpellRogueAbanico, 8000, 0)--51723--
    creature:RegisterEvent(Boss_SpellRogueEvacion, 8000, 0)  --26669
    creature:RegisterEvent(Boss_ClassPick, 30000, 0)
    creature:RegisterEvent(Boss_TalkRogue, 18000, 0)
    creature:RegisterEvent(Boss_Talk, 25000, 0)
end

function Boss_SpellRogueBlind(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 2094, true)
end

function Boss_SpellRogueEvacion(eventid, delay, calls, creature)
    creature:CastSpell(creature, 26669, true)
end

function Boss_SpellRogueGhostly(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 14278, true)
end

function Boss_SpellRogueAbanico(eventid, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 51723, true)
end

function Boss_SpellRoguePasoSombra(eventid, delay, calls, creature)
    -- Obtener todos los enemigos cercanos
    local enemies = creature:GetCreaturesInRange(30, nil, 1, 0)

    -- Verificar si hay enemigos para atacar
    if #enemies > 0 then
        -- Seleccionar aleatoriamente un enemigo de la lista
        local randomIndex = math.random(1, #enemies)
        local target = enemies[randomIndex]

        -- Atacar al enemigo seleccionado con Paso de la Sombra y Envoscada
        creature:CastSpell(target, 36554, true)  -- Paso de la Sombra
        creature:CastSpell(target, 48691, true)  -- Envoscada

        -- Reducir la vida del objetivo seleccionado en un 50%
        local currentHealth = target:GetHealth()
        local newHealth = currentHealth * 0.5
        target:SetHealth(newHealth)
    else
        -- No hay enemigos cercanos, no hacer nada
        print("No hay enemigos cercanos para atacar.")
    end
end




--=======================================================
-------------------------guerrero
--=======================================================
function Boss_Warrior(eventid, delay, calls, creature)
creature:RemoveEvents()
creature:SetDisplayId(17452)
creature:SetScale(4,5)
creature:SetEquipmentSlots(19890, 19349, 0)
creature:RemoveAllAuras()
creature:RegisterEvent(Boss_SpellWarriorClap, 15000, 0) --25264--
creature:RegisterEvent(Boss_SpellWarriorRend, 9000, 0) --25208--
creature:RegisterEvent(Boss_SpellWarriorMortal, 13000, 0) --30330--
creature:RegisterEvent(Boss_SpellWarriorCharge, 16000, 0)
creature:RegisterEvent(Boss_SpellWarriorReflejo, 10000, 0)
creature:RegisterEvent(Boss_SpellWarriorBuff, 16000, 0)--47436
creature:RegisterEvent(Boss_SpellWarriorFear, 25000, 2)--5246
creature:RegisterEvent(Boss_SpellWarriorRemolino, 3000, 1) --11578--
creature:RegisterEvent(Boss_ClassPick, 30000, 0)
creature:RegisterEvent(Boss_TalkWarrior, 18000, 0)
creature:RegisterEvent(Boss_Talk, 25000, 0)
end

function Boss_SpellWarriorBuff(eventid, delay, calls, creature)
creature:CastSpell(creature, 47436, true)
end

function Boss_SpellWarriorReflejo(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 23920, true)--23920
end

function Boss_SpellWarriorClap(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 25264, true)
end

function Boss_SpellWarriorFear(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 5246, true)
end

function Boss_SpellWarriorCharge(eventid, delay, calls, creature)
    local enemies = creature:GetCreaturesInRange(30, nil, 1, 1) -- Obtener enemigos vivos y hostiles dentro de un rango de 30 yardas
    local count = 0
    for _, enemy in ipairs(enemies) do
        local distance = creature:GetDistance(enemy)
        if distance >= 5 and distance <= 30 then -- Verificar si el enemigo está dentro del rango especificado
            creature:CastSpell(enemy, 11578, true) -- Lanzar el hechizo de carga al enemigo dentro del rango
            count = count + 1
            break -- Salir del bucle después de lanzar el hechizo a un solo enemigo
        end
    end
end


function Boss_SpellWarriorRemolino(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 46924, true)
end

function Boss_SpellWarriorRend(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 25208, true)
end

function Boss_SpellWarriorMortal(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 30330, true)
end

function Boss_SpellWarriorCharge(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 11578, true)
end


--=======================================================
-------------------------brujo
--=======================================================

function Boss_Warlock(eventid, delay, calls, creature)
creature:RemoveEvents()
creature:SetDisplayId(16642)
creature:SetScale(3)
creature:SetEquipmentSlots(11932, 0, 0)
creature:RemoveAllAuras()
creature:RegisterEvent(Boss_SpellWarlockRain, 16000, 0) --27212--
creature:RegisterEvent(Boss_SpellWarlockAgony, 10000, 0) --11712--
creature:RegisterEvent(Boss_SpellWarlockIdiocy, 9000, 0) --1010--
creature:RegisterEvent(Boss_SpellWarlockBrutal, 9000, 0)
creature:RegisterEvent(Boss_SpellWarlockMeteorito, 9000, 0)--28884 --Meteorito--
creature:RegisterEvent(Boss_SpellWarlockMaldicion, 9000, 0) -- 47843
creature:RegisterEvent(Boss_SpellWarlockEscudo, 9000, 1)--47893
creature:RegisterEvent(Boss_SpellWarlockDrenar, 9000, 1)--47857 Drenar vida
creature:RegisterEvent(Boss_SpellWarlockCoil, 11000, 0) --17926--
creature:RegisterEvent(Boss_ClassPick, 30000, 0)
creature:RegisterEvent(Boss_TalkWarlock, 18000, 0)
creature:RegisterEvent(Boss_Talk, 25000, 0)
end

function Boss_SpellWarlockEscudo(eventid, delay, calls, creature)
creature:CastSpell(creature, 47893, true)
end

function Boss_SpellWarlockMeteorito(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 28884, true)
end

function Boss_SpellWarlockRain(eventid, delay, calls, creature)
creature:CastSpell(creature, 27212, true)
end

function Boss_SpellWarlockBrutal(eventid, delay, calls, creature)
creature:CastSpell(creature, 67049, true)
end

function Boss_SpellWarlockDrenar(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 47857, true)
end

function Boss_SpellWarlockMaldicion(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 47843, true)
end

function Boss_SpellWarlockCoil(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 17926, true)
end

function Boss_SpellWarlockAgony(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 11712, true)
end

function Boss_SpellWarlockIdiocy(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 47867, true) --Maldicion de la fatalidad
end

function Boss_SpellWarlockCoil(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 17926, true)
end


--=======================================================
-------------------------mago
--=======================================================

function Boss_Mage(eventid, delay, calls, creature)
creature:RemoveEvents()
creature:SetDisplayId(30863)
creature:SetScale(4)
creature:SetEquipmentSlots(11932, 0, 0)
creature:RemoveAllAuras()
creature:RegisterEvent(Boss_SpellMageExplosion, 10000, 0) --27082--
creature:RegisterEvent(Boss_SpellMageCone, 15000, 0) --10161--
creature:RegisterEvent(Boss_SpellMageAliento, 12000, 0) --6131--
creature:RegisterEvent(Boss_SpellMageArcane, 10000, 4)--42897
creature:RegisterEvent(Boss_SpellMageLance, 8000, 0) --30455--
creature:RegisterEvent(Boss_SpellMageOnyxia, 8000, 0)
creature:RegisterEvent(Boss_SpellMageVentisca, 8000, 2)--42940
creature:RegisterEvent(Boss_SpellMageEscarcha, 8000, 0)--43008
creature:RegisterEvent(Boss_SpellMageEscudo, 8000, 0)--43020
creature:RegisterEvent(Boss_ClassPick, 30000, 0)
creature:RegisterEvent(Boss_TalkMage, 18000, 0)
creature:RegisterEvent(Boss_Talk, 25000, 0)
end

function Boss_SpellMageExplosion(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 27082, true)
end

function Boss_SpellMageVentisca(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 42940, true)
end

function Boss_SpellMageEscarcha(eventid, delay, calls, creature)
creature:CastSpell(creature, 43008, true)
end

function Boss_SpellMageEscudo(eventid, delay, calls, creature)
creature:CastSpell(creature, 43020, true)
end

function Boss_SpellMageOnyxia(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 18392, true)
end

function Boss_SpellMageArcane(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 42897, true)
end

function Boss_SpellMageCone(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 10161, true)
end

function Boss_SpellMageAliento(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 42950, true)
end

function Boss_SpellMageLance(eventid, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 30455, true)
end

--============================================================--




local function OnLeaveCombat(event, creature)
       creature:RemoveEvents()
    creature:SetScale(1)
    local display = creature:GetNativeDisplayId()
    creature:SetDisplayId(display)
    creature:SetEquipmentSlots(11932, 0, 0)
    
    creature:SendUnitSay("Fallaste en el intento... Vuelve en otra oportunidad jajaja", 0)
end

local function OnDied(event, creature, killer)
    if(killer:GetObjectType() == "Player") then
        killer:SendBroadcastMessage("Pudiste matar al gran " ..creature:GetName().."!")
    end
    creature:SendUnitSay("Volvere... Espero que esten preparados para entonces...", 0)
    creature:RemoveEvents()
end


local killedMessages = {
    "¿Ya murió otro? Parecen de papel... Jajaja",
    "El jugador %s no estaba preparado para enfrentarme.",
    "Ahí murió uno más...",
    "%s, suerte la proxima vez.",
    "¿Otro caído? Mi poder es inquebrantable.",
    "La muerte es solo el principio...",
}

local function OnKilledPlayer(event, creature, victim)
    local playerName = victim:GetName()
    local messageIndex = math.random(1, #killedMessages)
    local message = killedMessages[messageIndex]

    creature:SendUnitSay(message:format(playerName), 0)
    creature:PlayDistanceSound(9250)
end


MoobEntry = 300000
local BOSSSecundario = 300000
local function InvocarBoss(event, creature, killer)
    if killer and killer:IsPlayer() then
        local x, y, z, t = creature:GetLocation()
        local summonboss = creature:SummonCreature(BOSSSecundario, x, y, z, t, 20000)
        if summonboss then
            summonboss:AttackStart(killer)
        end
    end
end
RegisterCreatureEvent(MoobEntry, 4, InvocarBoss)
RegisterCreatureEvent(npcId, 1, OnEnterCombat)
RegisterCreatureEvent(npcId, 2, OnLeaveCombat)
RegisterCreatureEvent(npcId, 3, OnKilledPlayer)
RegisterCreatureEvent(npcId, 4, OnDied)