local cmd = {"reparar", "rep"}  -- Lista de comandos aceptados

local function OnCommand(event, player, command)
    for _, c in ipairs(cmd) do
        if command == c then
            player:DurabilityRepairAll(false)
            player:SendNotification("Se han reparado tus articulos")
            return false
        end
    end
end

RegisterPlayerEvent(42, OnCommand)
