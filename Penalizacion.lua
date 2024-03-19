local REWARD_ITEM_ID = 21100
local REWARD_AMOUNT = 100

local function RewardWinningTeam(battleground)
    local winner = battleground:GetWinner()
    if winner ~= 0 then
        for _, player in ipairs(battleground:GetPlayers()) do
            if player:GetTeam() == winner then
                player:AddItem(REWARD_ITEM_ID, REWARD_AMOUNT)
                player:SendBroadcastMessage("¡Felicidades! Has ganado la Batalla de JcJ y has recibido " .. REWARD_AMOUNT .. " unidades del ítem con ID " .. REWARD_ITEM_ID .. " como recompensa.")
            end
        end
    end
end

local function OnBGEnd(event, battlegroundID)
    local battleground = GetBattleground(battlegroundID)
    if battleground then
        local status = battleground:GetStatus()
        if status == "ended" then
            RewardWinningTeam(battleground)
        end
    end
end

RegisterServerEvent(15, OnBGEnd) -- Suscribirse al evento BATTLEGROUND_END
