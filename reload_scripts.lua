function reloadElunaEngine(event, player, command)
  if command == "reluna" or command == "reloadscripts" then 
	if player == nil or player:IsGM() then -- console or gm
		ReloadEluna()
		return false
	else
		player:SendBroadcastMessage("Activa GM para usar el comando")
	end
  end
end

RegisterPlayerEvent(42, reloadElunaEngine)