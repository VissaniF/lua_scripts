local function AnnounceBossKilled (event, killer, killed)
    if (killed:IsWorldBoss() == true) then
        if (killer:GetGender() == 0) then
            local message = "|CFF7BBEF7[Jefe Muerto]|r:|cffff0000 "..killer:GetName().."|r junto a su grupo mató a: |CFF18BE00"..killed:GetName().."|r !!!"
            SendWorldMessage(message)
        else
            local message = "|CFF7BBEF7[Jefe Muerto]|r:|cffff0000 "..killer:GetName().."|r junto a su grupo mató a: |CFF18BE00"..killed:GetName().."|r !!!"
            SendWorldMessage(message)
        end
    end
end
RegisterPlayerEvent(7, AnnounceBossKilled)