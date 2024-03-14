-- 				Created and programmed by Senkuma				--

function OnBountyKill(event, player, target)
	if player:HasAura(58555) then
	player:ModifyHonorPoints(200)
	player:SendBroadcastMessage("|cff610B21+200 honor points from Bounty Buff|r")
	player:SendBroadcastMessage("|cff610B21You've earned 400 honor points for killing another player!|r")
	end
end


RegisterPlayerEvent(6, OnBountyKill)