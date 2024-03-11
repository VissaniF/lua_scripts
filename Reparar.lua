local cmd = {"repair", "rep"}  -- Lista de comandos aceptados

local function OnCommand(event, player, command)
    for _, c in ipairs(cmd) do
        if command == c then
            player:DurabilityRepairAll(false)
            return false
        end
    end
end

RegisterPlayerEvent(42, OnCommand)
