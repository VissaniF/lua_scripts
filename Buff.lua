local GMrank = 3

local function Buffcommand(event, unit, msg, Type, lang)
	if(msg == "Vissani") then
        unit:CastSpell(unit, 15366, true)
        unit:CastSpell(unit, 16609, true)
        unit:CastSpell(unit, 48162, true)
        unit:CastSpell(unit, 48074, true)
        unit:CastSpell(unit, 48170, true)
        unit:CastSpell(unit, 43223, true)
        unit:CastSpell(unit, 36880, true)
        unit:CastSpell(unit, 467, true)
        unit:CastSpell(unit, 69994, true)
        unit:CastSpell(unit, 33081, true)
        unit:CastSpell(unit, 24705, true)
        unit:CastSpell(unit, 26035, true)
        unit:CastSpell(unit, 48469, true)
        unit:SendAreaTriggerMessage("You have been buffed!") 
	if(unit:GetGMRank() >= GMrank)then
		unit:CastSpell(unit,35874, true)
		unit:CastSpell(unit,35912, true)
		unit:CastSpell(unit,38734, true)
		end
	end
	return false;
end
RegisterPlayerEvent(18, Buffcommand)