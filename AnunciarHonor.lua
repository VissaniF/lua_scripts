-- 				Created and programmed by Senkuma				--
	--			 Unfinished works kinda meh atm				--

local function OnKillPlayer(event, player, target)

local nearobj1 = player:GetNearestGameObject(40)
local nearobj2 = player:GetNearestGameObject(39)

	if target:GetTeam() == 1 then
	player:SummonGameObject(40, target:GetX(), target:GetY(), target:GetZ(), target:GetO(), 15)
	player:ModifyHonorPoints(400)
	player:SendBroadcastMessage("|cff610B21You've earned 400 honor points for killing another player!|r")
	
	elseif target:HasAura(58555) then
	player:SummonGameObject(42, target:GetX(), target:GetY(), target:GetZ(), target:GetO(), 15)
	target:RemoveAura(58555)
	nearobj1:Despawn()
	nearobj2:Despawn()
end

local nearobj1 = player:GetNearestGameObject(40)
local nearobj2 = player:GetNearestGameObject(39)

	if target:GetTeam() == 0 then
	player:SummonGameObject(39, target:GetX(), target:GetY(), target:GetZ(), target:GetO(), 15)
	player:ModifyHonorPoints(400)
	player:SendBroadcastMessage("|cff610B21You've earned 400 honor points for killing another player!|r")

	elseif target:HasAura(58555) then
	player:SummonGameObject(42, target:GetX(), target:GetY(), target:GetZ(), target:GetO(), 15)
	target:RemoveAura(58555)
	nearobj1:Despawn()
	nearobj2:Despawn()
	end
end

RegisterPlayerEvent(6, OnKillPlayer)
