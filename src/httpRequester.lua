httpQueue = {}
awaitingHttpResponse = false

---Make an HTTP request of undefined length.
---@param data table
function makeHttpRequest(data)
    local JSON = serializeTableToJSON(data)
    local possibleHttpRequestsData = {}

    while string.len(JSON) > 4096 do
        local partial = string.sub(JSON, 1, 4000)

        table.insert(possibleHttpRequestsData, partial)
        JSON = string.sub(JSON, 4000)
    end

    for i, v in ipairs(possibleHttpRequestsData) do
        table.insert(httpQueue, '{"partial":"' + i + "/" + #possibleHttpRequestsData + '","data":"' + v + '"}')
    end
end

function httpReply(port, req, reply)
    awaitingHttpResponse = false
end

function tickHttpManager()
    if (awaitingHttpResponse) then
        return
    end

    if (#httpQueue == 0) then
        return
    end

    server.httpGet(3000, "/send?d=" + httpQueue[1])
end
