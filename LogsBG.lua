local ItemPremio = 21100
local CantidadPremio = 100
-- Función para obtener la lista de jugadores ganadores de la última batalla
function getWinningPlayers(bgId, winnerTeam)
    local winningPlayers = {}
    local battleID = getBattleID(bgId, winnerTeam)
    if battleID then
        local query = CharDBQuery("SELECT `character_guid` FROM `pvpstats_players` WHERE `battleground_id` = '"..battleID.."' AND `winner` = '1';")
        if query then
            repeat
                local playerGUID = query:GetUInt32(0)
                table.insert(winningPlayers, playerGUID)
            until not query:NextRow()
        end
    end
    return winningPlayers
end

-- Función para otorgar una recompensa a los jugadores ganadores
function giveRewardToWinners(bgId, winnerTeam)
    local winningPlayers = getWinningPlayers(bgId, winnerTeam)
    if next(winningPlayers) == nil then
        print("No se encontraron jugadores ganadores.")
        return
    end

    for _, playerGUID in ipairs(winningPlayers) do
        local player = GetPlayerByGUID(playerGUID)
        if player then
            player:AddItem(ItemPremio, CantidadPremio) 
            player:SendBroadcastMessage("¡Has recibido tu recompensa por ganar la BG!") -- Mensaje de recompensa
        end
    end
end

-----
local BGS = {}

local FactionIcon = {
    [1] =  "|TInterface\\icons\\Inv_Misc_Tournaments_banner_Human.png:17|t", -- Alliance 
    [0] =  "|TInterface\\icons\\Inv_Misc_Tournaments_banner_Orc.png:17|t", -- Horde
};

local Faction = {
    [1] =  "|cff00ccffAlliance", -- Alliance 
    [0] =  "|cffff6060Horde", -- Horde
};

function getLastBattlegroundDeserter(bgType)
    local playerGuid = 0
    local query = CharDBQuery("SELECT guid FROM battleground_deserters WHERE type = '"..bgType.."' ORDER BY datatime DESC LIMIT 1;")
    if query then
        playerGuid = query:GetUInt32(0)
        return playerGuid
    end
end


function getBattleID(bgId, getWinnerTeam)
    local BattleID_final = 0;
    local BattleID = CharDBQuery("SELECT id FROM `pvpstats_battlegrounds` WHERE `type` = '"..bgId.."' AND `winner_faction` = '"..getWinnerTeam.."' ORDER BY `date` DESC LIMIT 1;")
    if (BattleID) then
        BattleID_final = BattleID:GetUInt32(0)
        return BattleID_final
    end
end

function getPlayerTopDamage(BattleID)
    local playerTopDamage = ""
    local playerTopDamageQuery = CharDBQuery("SELECT `name` FROM characters WHERE guid = (SELECT `character_guid` FROM `pvpstats_players` WHERE `battleground_id` = '"..BattleID.."' ORDER BY `score_damage_done` DESC LIMIT 1);")
    if (playerTopDamageQuery) then
        playerTopDamage = playerTopDamageQuery:GetString(0)
    end
    return playerTopDamage
end 

function getPlayerTopDamageValue(BattleID)
    local playerTopDamageValue = 0;
    local playerTopDamageValueQuery = CharDBQuery("SELECT `score_damage_done` FROM `pvpstats_players` WHERE `battleground_id` = '"..BattleID.."' ORDER BY `score_damage_done` DESC LIMIT 1")
    if (playerTopDamageValueQuery) then
        playerTopDamageValue = playerTopDamageValueQuery:GetUInt32(0)
    end
    return playerTopDamageValue
end 

function getPlayerTopHeal(BattleID)
    local playerTopHeal = ""
    local playerTopHealQuery = CharDBQuery("SELECT `name` FROM characters WHERE guid = (SELECT `character_guid` FROM `pvpstats_players` WHERE `battleground_id` = '"..BattleID.."' ORDER BY `score_healing_done` DESC LIMIT 1);")
    if (playerTopHealQuery) then
        playerTopHeal = playerTopHealQuery:GetString(0)
    end
    return playerTopHeal
end 

function getPlayerTopHealValue(BattleID)
    local playerTopHealValue = 0;
    local playerTopHealValueQuery = CharDBQuery("SELECT `score_healing_done` FROM `pvpstats_players` WHERE `battleground_id` = '"..BattleID.."' ORDER BY `score_healing_done` DESC LIMIT 1")
    if (playerTopHealValueQuery) then
        playerTopHealValue = playerTopHealValueQuery:GetUInt32(0)
    end
    return playerTopHealValue
end 

function getPlayerTopKills(BattleID)
    local playerTopKills = ""
    local playerTopKillsQuery = CharDBQuery("SELECT `name` FROM characters WHERE guid = (SELECT `character_guid` FROM `pvpstats_players` WHERE `battleground_id` = '"..BattleID.."' ORDER BY `score_honorable_kills` DESC LIMIT 1);")
    if (playerTopKillsQuery) then
        playerTopKills = playerTopKillsQuery:GetString(0)
    end
    return playerTopKills
end 

function getPlayerTopKillsValue(BattleID)
    local playerTopKillsValue = 0;
    local playerTopKillsValueQuery = CharDBQuery("SELECT `score_honorable_kills` FROM `pvpstats_players` WHERE `battleground_id` = '"..BattleID.."' ORDER BY `score_honorable_kills` DESC LIMIT 1")
    if (playerTopKillsValueQuery) then
        playerTopKillsValue = playerTopKillsValueQuery:GetUInt32(0)
    end
    return playerTopKillsValue
end 

function AnnBGEnd(bgId, bgName, teamName, getWinnerTeam, BattleID, instanceId)
    local playerTopKills = ""
    local amountTopKills = 0
    local playerTopHeal = ""
    local amountTopHeal = 0
    local playerTopDamage = ""
    local amountTopDamage = 0    

    if BattleID == nil then
        BattleID = getBattleID(bgId, getWinnerTeam)
    end

    playerTopKills = getPlayerTopKills(BattleID) or "Ninguem"
    amountTopKills = getPlayerTopKillsValue(BattleID) or 0
    
    playerTopDamage = getPlayerTopDamage(BattleID) or "Ninguem"
    amountTopDamage = getPlayerTopDamageValue(BattleID) or 0
    
    playerTopHeal = getPlayerTopHeal(BattleID) or "Ninguem"
    amountTopHeal = getPlayerTopHealValue(BattleID) or 0

    if BGS[BattleID] ~= true then
        BGS[BattleID] = true

        for k,player in pairs(GetPlayersInWorld()) do
            player:SendBroadcastMessage("|cffFF4500"..FactionIcon[1].." "..bgName.." "..FactionIcon[0].." - Winner: "..teamName..".\n|cffff0000TOP Killer: "..playerTopKills.." ("..amountTopKills.." kills).|r\nTOP Damage: "..playerTopDamage.." ("..amountTopDamage..").|r\n|cff00FF7FTOP Heal: "..playerTopHeal.." ("..amountTopHeal..").")
        end
    end
end

function OnBGEnd(event, bg, bgId, instanceId, winner)
    local bgName = bg:GetName()
    local getWinnerTeam = bg:GetWinner() or winner
    local teamName = Faction[getWinnerTeam] or Faction[bg:GetWinner()]
    local BattleID = 0
    local BattleIDResult = CharDBQuery("SELECT id FROM `pvpstats_battlegrounds` WHERE `type` = '"..bgId.."' AND `winner_faction` = '"..getWinnerTeam.."' ORDER BY `date` DESC LIMIT 1;")
    if (BattleIDResult) then
        BattleID = BattleIDResult:GetUInt32(0) or getBattleID(bgId, getWinnerTeam)

        if (BattleID) then
            AnnBGEnd(bgId, bgName, teamName, getWinnerTeam, BattleID, instanceId)
            giveRewardToWinners(bgId, getWinnerTeam) -- Llama a la función para otorgar recompensas a los ganadores
        end
    end
end

function OnBGEndDestroy(event, bg, bgId, instanceId)
    local bgName = bg:GetName()
    local getWinnerTeam = bg:GetWinner() or winner
    local teamName = Faction[getWinnerTeam] or Faction[bg:GetWinner()]
    local BattleID = 0
    local BattleIDResult = CharDBQuery("SELECT id FROM `pvpstats_battlegrounds` WHERE `type` = '"..bgId.."' AND `winner_faction` = '"..getWinnerTeam.."' ORDER BY `date` DESC LIMIT 1;")
    if (BattleIDResult) then
        BattleID = BattleIDResult:GetUInt32(0) or getBattleID(bgId, getWinnerTeam)

        if (BattleID) then
            AnnBGEnd(bgId, bgName, teamName, getWinnerTeam, BattleID, instanceId)
            giveRewardToWinners(bgId, getWinnerTeam) -- Llama a la función para otorgar recompensas a los ganadores
        end
    end
end

RegisterBGEvent(2, OnBGEnd)
RegisterBGEvent(4, OnBGEndDestroy)
