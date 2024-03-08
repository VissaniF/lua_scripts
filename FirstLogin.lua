
local Team = {
	[0] = "Alianza",
	[1] = "Horda"
};
local Races = {
	[1] = "Humano",
	[2] = "Orco",
	[3] = "Enano",
	[4] = "Elfo de la noche",
	[5] = "No muerto",
	[6] = "Tauren",
	[7] = "Gnomo",
	[8] = "Troll",
	[10] = "Elfo de Sangre",
	[11] = "Draenei"
};
local Classes = {
        [1] = "C79C6E", 
        [2] = "F58CBA",
        [3] = "ABD473",
        [4] = "FFF569",
        [5] = "FFFFFF",
        [6] = "C41F3B",
        [7] = "0070DE",
        [8] = "69CCF0",
        [9] = "9482C9",
        [11] = "FF7d0A"
};	

function FirstLogin (event, player)
SendWorldMessage("Bienvenido "..player:GetName()..", "..Races[player:GetRace()].."|cFF"..Classes[player:GetClass()]..""..player:GetClassAsString().."|r lucha por la "..Team[player:GetTeam()]..". Tu viaje acaba de comenzar.");
	player:AddItem(49284, 1)	-- Custom Item
	end

RegisterPlayerEvent(30, FirstLogin)