function OnBountyKill(evento, jugador, objetivo)
	if jugador:HasAura(58555) then
	jugador:ModifyHonorPoints(200)
	jugador:SendBroadcastMessage("|cff610B21+200 puntos de honor del Beneficio de Recompensa|r")
	jugador:SendBroadcastMessage("|cff610B21¡Has ganado 400 puntos de honor por matar a otro jugador!|r")
	end
end


RegisterPlayerEvent(6, OnBountyKill)
