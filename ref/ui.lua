---@meta

---Sends a chat message. Announce messages are not handled as commands.
---@param name string Name of announcement. Appears in left box of console.
---@param message string Message of announcement. Appears in right box of console. Has a limited length (unsure how long).
---@param peerId? integer Peer ID to send announcement to. Defaults to -1 for all peers.
function server.announce(name, message, peerId) end
---Sends a command message directly to all other scripts. Uses peerId -1 when arriving in the onCustomCommand callback.
---@param message string Command to set to other scripts. Commands such as `?reload_scripts` (commands handled by the game itself) do not work.
function server.command(message) end
---@alias NotificationType
---| 0 # newMission
---| 1 # newMissionCritical,
---| 2 # failedMission,
---| 3 # failedMissionCritical,
---| 4 # completeMission,
---| 5 # networkConnect,
---| 6 # networkDisconnect,
---| 7 # networkInfo,
---| 8 # chatMessage,
---| 9 # networkInfoCritical
---Sends a popup notification to the specified peer or peers.
---@param peerId integer Peer ID to send notification to. -1 for all players.
---@param title string Title of notification.
---@param message string Message of notification.
---@param notificationType NotificationType
function server.notify(peerId, title, message, notificationType) end
---Returns a unique ID for use with all UI functions. The UI ID can be used to track, edit and destroy UI elements.
---@return integer uiId UI ID generated.
function server.getMapID() end
---Removes all UI with specified UI ID for specified peers.
---@param peerId integer Peer IDs to remove UI ID from.
---@param uiId integer UI ID to remove.
function server.removeMapID(peerId, uiId) end
---@alias PositionType
---| 0 # fixed,
---| 1 # vehicle,
---| 2 # object
---@alias MarkerType
---| 0 # deliveryTarget,
---| 1 # survivor,
---| 2 # object,
---| 3 # waypoint,
---| 4 # tutorial,
---| 5 # fire,
---| 6 # shark,
---| 7 # ice,
---| 8 # searchRadius
---| 9 # flag1
---| 10 # flag2
---| 11 # house
---| 12 # car
---| 13 # plane
---| 14 # tank
---| 15 # heli
---| 16 # ship
---| 17 # boat
---| 18 # attack
---| 19 # defend
---Add a map marker for the specified peers. X and Z represent the worldspace location of the marker. If positionType
---is 1 or 2 (vehicle or object) then the marker will track that object or vehicle and offset it by the parent coordinates.
---@param peerId integer Peer ID to add map object to. -1 for all players.
---@param uiId integer UI ID to assign to map object.
---@param positionType PositionType Position type of map object.
---@param markerType MarkerType Marker type of map object.
---@param x number X-coordinate of object.
---@param z number Z-coordinate of object.
---@param parentLocalX number X-coordinate of parent vehicle offset.
---@param parentLocalZ number Z-coordinate of parent vehicle offset.
---@param vehicleId integer Vehicle ID of parent vehicle.
---@param objectId integer Object ID of parent object.
---@param label string Label of map object.
---@param radius number Radius of map object.
---@param hoverLabel string Label of object if hovered on with mouse.
---@param r? integer Custom color default to red. [0-255]
---@param g? integer [0-255]
---@param b? integer [0-255]
---@param a? integer [0-255]
function server.addMapObject(
	peerId,
	uiId,
	positionType,
	markerType,
	x,
	z,
	parentLocalX,
	parentLocalZ,
	vehicleId,
	objectId,
	label,
	radius,
	hoverLabel,
	r,
	g,
	b,
	a
)
end
---Removes a map object with the specified UI ID for the specified peer or peers.
---@param peerId integer Peer ID to remove map object of.
---@param uiId integer UI ID to remove map object of.
function server.removeMapObject(peerId, uiId) end

---@alias LabelTypes
---| 0 = none
---| 1 = cross
---| 2 = wreckage
---| 3 = terminal
---| 4 = military
---| 5 = heritage
---| 6 = rig
---| 7 = industrial
---| 8 = hospital
---| 9 = science
---| 10 = airport
---| 11 = coastguard
---| 12 = lighthouse
---| 13 = fuel
---| 14 = fuelSell

---Add a map label for the specified peer or peers. X Z represnt the worldspace location of the marker. Map labels appear under fog of war.
---@param peerId integer Peer ID to add map label to. -1 for all players.
---@param uiId integer UI ID to assign to map label.
---@param labelType LabelTypes Type of label to create.
---@param name string Name of map label.
---@param x number X coordinate of label.
---@param z number Z coordinate of label.
function server.addMapLabel(peerId, uiId, labelType, name, x, z) end
---Removes a map label with the specified UI ID for the specified peer or peers.
---@param peerId integer Peer ID of map label to remove from.
---@param uiId integer UI ID of map label to remove.
function server.removeMapLabel(peerId, uiId) end
---Addsa a map line between two world space matrices with the specified UI ID for the specified peers.
---@param peerId integer Peer ID of player to add map line to. -1 for all players.
---@param uiId integer UI ID to assign to map line.
---@param startTf Transform Transform of starting point of line.
---@param endTf Transform Transform of ending point of line
---@param width number Width of line.
---@param r? number Custom color default to red. Value from 0 to 255.
---@param g? number [0-255]
---@param b? number [0-255]
---@param a? number [0-255]
function server.addMapLine(peerId, uiId, startTf, endTf, width, r, g, b, a) end
---Removes a map line with the specified UI ID for the specified peer or peers.
---@param peerId integer Peer ID to remove map line from.
---@param uiId integer
function server.removeMapLine(peerId, uiId) end
---Creates a popup to the world/screen with the specified UI ID for the specified peer or peers.
---@param peerId integer Peer ID of player to add popup to. -1 for all players.
---@param uiId integer UI ID to assign to popup.
---@param name string Name of popup.
---@param isShow boolean If popup should be shown.
---@param text string Description of popup.
---@param x number X-coordinate of popup.
---@param y number Y-coordinate of popup.
---@param z number Z-coordinate of popup.
---@param renderDistance number If 0, the popup will always render,
---@param vehicleOrObjectParentId? number Optional parent for object or vehicle with x, y, z acting as the relative position.
function server.setPopup(peerId, uiId, name, isShow, text, x, y, z, renderDistance, vehicleOrObjectParentId) end
---Creates a popup to the screen with the specified UI ID for the specified peer or peers. Screen space offset ranges from (-1, -1) (bottom left) to (1, 1) (top right).
---@param peerId integer Peer ID of player to add popup to. -1 for all players.
---@param uiId integer UI ID to assign to popup.
---@param name string Name of popup.
---@param isShow boolean If popup should be shown.
---@param text string Description of popup.
---@param horizontalOffset number Horizontal offset of popup. [-1, 1]
---@param verticalOffset number Vertical offset of popup. [-1, 1]
function server.setPopupScreen(peerId, uiId, name, isShow, text, horizontalOffset, verticalOffset) end
---Removes a popup with the specified UI ID for the specified peer or peers.
---@param peerId integer Peer ID of player to remove popup from.
---@param uiId integer UI ID to remove from player.
function server.removePopup(peerId, uiId) end
