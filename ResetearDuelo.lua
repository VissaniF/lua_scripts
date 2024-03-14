local event_id = 11;

function ResetOnDuelEnd(event, winner, loser, _)

	if(event == event_id)then
		winner:ResetAllCooldowns();
		winner:SetHealth(winner:GetMaxHealth());
		winner:SetPower(winner:GetMaxPower(0));
		
		loser:ResetAllCooldowns();
		loser:SetHealth(loser:GetMaxHealth());
		loser:SetPower(loser:GetMaxPower(0));
	end
end

RegisterPlayerEvent(event_id, ResetOnDuelEnd)