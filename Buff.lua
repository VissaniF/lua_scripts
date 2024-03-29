local cmd = {"buff", "vissani"}  -- Lista de comandos aceptados

local function Bufeandose(event, player, command)
    for _, c in ipairs(cmd) do
        if command == c then
            player:CastSpell(player, 15366, true)
            player:CastSpell(player, 16609, true)
            player:CastSpell(player, 48162, true)
            player:CastSpell(player, 48074, true)
            player:CastSpell(player, 48170, true)
            player:CastSpell(player, 43223, true)
            player:CastSpell(player, 36880, true)
            player:CastSpell(player, 467, true)
            player:CastSpell(player, 69994, true)
            player:CastSpell(player, 33081, true)
            player:CastSpell(player, 24705, true)
            player:CastSpell(player, 26035, true)
            player:CastSpell(player, 48469, true)
            player:SendNotification("Te buffeaste PT")
            return false
        end
    end
end

RegisterPlayerEvent(42, Bufeandose)
