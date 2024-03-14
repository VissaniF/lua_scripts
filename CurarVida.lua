-- 				Created and programmed by Senkuma				--

local function commandlist(event, unit, msg, Type, lang)
	if(msg == "curar") then
		unit:ResetAllCooldowns();
		unit:SetHealth(unit:GetMaxHealth());
		unit:SetPower(unit:GetMaxPower(0));
		unit:SendBroadcastMessage("You have been healed.")
	end
end


RegisterPlayerEvent(18, commandlist)