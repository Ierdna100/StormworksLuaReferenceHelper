g_savedata = {}

firstTick = true
function onTick(gameticks)
    if (firstTick) then
        server.announce("[Hi]", "INITIALIZED")
    end
    firstTick = false
    tickHttpManager()
end

function onCustomCommand(fullMessage, userPeerId, isAdmin, isAuth, command, ...)
    if (command == "?send") then
		local toSend = matrix
		local count = 0
		for _ in pairs(toSend) do count = count + 1 end
		server.announce("[LENGTH]", count)
        makeHttpRequest(toSend)
    end
end

--- Parse table t
--- @param t table table to parse
--- @return string
function serializeTableToJSON(t)
	local JSON = '{'

	local blockData, isList = __serializeTableToJSON(t)
	if isList then
		JSON = JSON .. '\\"table\\":'.. '[' .. blockData .. ']'
	else
		JSON = JSON .. '\\"table\\":' .. '{' .. blockData .. '}'
	end

	return JSON .. '}'
end

---NEVER CALL THIS, call the one above
function __serializeTableToJSON(t)
	local JSON = ""
	local lastk

	for k, v in pairs(t) do
		lastk = k
		local kname = ""

		if type(k) ~= "number" then
			kname = '\\"' .. tostring(k) .. '\\":'
		end

		vtype = type(v)

		if vtype == 'nil' then
			JSON = JSON .. kname .. 'null,'
		elseif vtype == 'number' then
			JSON = JSON .. kname .. v .. ","
		elseif vtype == "string" then
			JSON = JSON .. kname .. '"' .. v .. '",'
		elseif vtype == "boolean" then
			JSON = JSON .. kname .. (v and 'true' or 'false') .. ","
		elseif vtype == "table" then
			local blockData, isList = __serializeTableToJSON(v)
			if isList then
				JSON = JSON .. kname .. '[' .. blockData .. '],'
			else
				JSON = JSON .. kname .. '{' .. blockData .. '},'
			end
        elseif vtype == "function" then
            JSON = JSON .. kname .. '\\"_function\\",'
		end
	end

	JSON = string.sub(JSON, 1, -2)

	return JSON, type(lastk) == "number"
end

httpQueue = {}
awaitingHttpResponse = false

---Make an HTTP request of undefined length.
---@param data table
function makeHttpRequest(data)
    local JSON = serializeTableToJSON(data)
    local possibleHttpRequestsData = {}

    while string.len(JSON) > 0 do
        local partial = string.sub(JSON, 1, 4000)

        table.insert(possibleHttpRequestsData, partial)
        JSON = string.sub(JSON, 4000)
    end

    for i, v in ipairs(possibleHttpRequestsData) do
        table.insert(httpQueue, '{"partial":"' ..  i .. "/" .. #possibleHttpRequestsData ..'","data":"' .. v .. '"}')
    end
end

function httpReply(port, req, reply)
    server.announce("[test]", "received reply")
    awaitingHttpResponse = false
end

function tickHttpManager()
    if (awaitingHttpResponse) then
        return
    end

    if (#httpQueue == 0) then
        return
    end

    server.announce("[Ref Helper]", "sending")
	--server.announce("[test]", httpQueue[1])
    server.httpGet(3000, "/send?d=" .. httpQueue[1])
	table.remove(httpQueue, 1)
end
