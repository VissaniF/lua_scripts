ANGEL = 999999 -- esta es la ID de la creatura del angel que te revive
local Aurita = 25898
function OnGossipHello(event, player, unit)
if(player:IsAlive() == true) then -- Si el jugador esta vivo y le da clic le saldra el mensaje de abajo.
player:SendBroadcastMessage("Ya estas vivo.") 
player:RemoveAura(15007) -- Aqui lo que hace es remover el aura o el debuff que te pone cuando mueres, no me acuerdo como se llama xD 
else -- De lo contrario, si el jugador esta muerto entonces
player:ResurrectPlayer(100, true) -- te revivira con toda la vida
player:RemoveAura(15007) -- te removera el sckinners ese como se llame xD
player:AddAura(Aurita, player)
player:AddAura(48934, player)
player:AddAura(48470, player)
player:AddAura(26992, player)
player:AddAura(25898, player)
player:AddAura(48938, player)
player:AddAura(25899, player)
player:AddAura(48073, player)
player:AddAura(48162, player)
player:AddAura(48170, player)
player:AddAura(48074, player)
player:SendBroadcastMessage("Acabas de resucitar, ten mas cuidado la proxima vez.")
end
end

RegisterCreatureGossipEvent(ANGEL, 1, OnGossipHello) -- con esto registrar el evento.


