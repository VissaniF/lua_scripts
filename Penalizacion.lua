local CofreItem = 23333
local CofreItemLoser = 123

local function TerminaBG(event, bg, bgId, instanceId, winner) -- horda = 0 | alianza = 1
    local losers
    if winner == 0 then
        losers = 1
    else
        losers = 0
    end
    local map = bg:GetMap()

    -- recompensas winners
    local PlayerWinners = map:GetPlayers(winner) -- Â¿winner = team ganador?
    for k, player in pairs(PlayerWinners) do
        player:AddItem(CofreItem)
    end
    
    -- recompensas perdedores
    local PlayersLosers = map:GetPlayers(losers)
    for k, player in pairs(PlayerWinners) do
        player:AddItem(CofreItemLoser)
    end
end

RegisterBGEvent(2, TerminaBG)