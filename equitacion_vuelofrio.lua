
function MountSpeed(event, player)
	if player:GetLevel() == 1 then
	player:LearnSpell(33388)
	player:LearnSpell(54197)
	player:LearnSpell(33391)
	player:LearnSpell(34090)
	player:LearnSpell(34091)
	end
end


RegisterPlayerEvent(30, MountSpeed)