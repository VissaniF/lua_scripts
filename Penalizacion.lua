local BG_DESERTER_SPELL_ID = 26013 -- ID del hechizo de desertor de campo de batalla

local function RemoveDeserterAura(event, player, _, _, _, _, _, _, _, bgMapId)
    if bgMapId and player:IsInWorld() then
        if player:HasAura(BG_DESERTER_SPELL_ID) then
            player:RemoveAura(BG_DESERTER_SPELL_ID)
            player:SendBroadcastMessage("You are no longer marked as a deserter.")
        end
    end
end

RegisterPlayerEvent(29, RemoveDeserterAura) -- Evento 29: PLAYER_BG_DESERTER_AURA_REMOVED
