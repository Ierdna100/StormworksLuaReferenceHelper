g_savedata = {}

firstTick = true
function onTick(gameTicks)
    firstTick = false

    if (not firstTick) then
        makeHttpRequest(matrix)
        makeHttpRequest(property)
        makeHttpRequest(server)
    end

    tickHttpManager()
end
