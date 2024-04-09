local TiempoEvento = 60 --en segundos
local TiempoAnuncio = 10


local coordenadas = {
    {gob = 3705, XPos = -9112.6, YPos = 402.9254, ZPos = 92.58683, orientation = 0},
    {gob = 3706, XPos = -9114.75, YPos = 394.5991, ZPos = 92.34615, orientation = 0},
    {gob = 3706, XPos = -9102.492, YPos = 403.1439, ZPos = 92.6452, orientation = 0},
    -- Agrega más conjuntos de coordenadas según sea necesario
}


local function HandlePirataCommand(event, player, command)
    local command_args = {}
    for word in command:gmatch("%S+") do
        table.insert(command_args, word)
    end
    
    -- Verificar si el jugador es un GM
    if player == nil or not player:IsGM() then
        if player then
            player:SendBroadcastMessage("Activa GM para iniciar el evento pirata")
        end
        return false
    end

    if command_args[1] == "pirata" then
        SendWorldMessage("¡El evento pirata comenzará en 10 segundos!")
        
        --ACA TENGO QUE CREAR UNA FUNCION PARA PODER HACER ESPERAR
        --DE LO CONTRARIO HACER LA FUNCION DE LA CREACION DE OBJETOS POR SEPARADO Y DESPUES LLAMARLA
        

        for _, coords in ipairs(coordenadas) do
            player:SummonGameObject(coords.gob, coords.XPos, coords.YPos, coords.ZPos, coords.orientation, TiempoEvento)
        end
        
        SendWorldMessage("Barriles en sus posiciones, ¡Apúrate antes de que te quedes sin barriles!")
        return false
    end

end

RegisterPlayerEvent(42, HandlePirataCommand)
--anda