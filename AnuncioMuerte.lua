local Class = {
    [1] = "C79C6E", -- Warrior
    [2] = "F58CBA", -- Paladin
    [3] = "ABD473", -- Hunter
    [4] = "FFF569", -- Rogue
    [5] = "FFFFFF", -- Priest
    [6] = "C41F3B", -- Death Knight
    [7] = "0070DE", -- Shaman
    [8] = "69CCF0", -- Mage
    [9] = "9482C9", -- Warlock
    [11] = "FF7d0A" -- Druid
};

local GENDER = { [0] = "him",
				 [1] = "her"};
			
local killtable = {}

local function Player_killStreak_Func(event, pPlayer, pKilled)

	local NAME = pPlayer:GetName()
	local NAME2 = pKilled:GetName()
	
	if(NAME ~= NAME2) then
	if(killtable[NAME] == nil) then
		killtable[NAME] = 0
	end
	killtable[NAME] = killtable[NAME] + 1
	if(killtable[NAME2] ~= nil) then
		killtable[NAME2] = 0
	end
	if(killtable[NAME]%5 == 0) then
		pPlayer:CastSpell(pPlayer, 58555)
		for k, v in ipairs(GetPlayersInWorld()) do
		v:SendBroadcastMessage("|cFF"..Class[pPlayer:GetClass()]..""..NAME.."|r|cff00BFFF has a killstreak of "..killtable[NAME].." and has earned the Bounty buff! Kill "..GENDER[pPlayer:GetGender()].." to earn a|r |cffB18904Grand Chest of the Fallen|r|cff00BFFF!|r")
			end
		end
	end
end


local function Player_logIn_Func(event, pPlayer)
	-- killstreak fades on relog
	--killtable[pPlayer:GetName()] = nil
end

RegisterPlayerEvent(6, Player_killStreak_Func) -- OnPvPKill(Player, Killed)
RegisterPlayerEvent(3, Player_logIn_Func) -- OnLogIn(Player)