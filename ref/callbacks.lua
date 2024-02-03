---@meta
---LUA LS DOESNT CURRENTLY SUPPORT CALLBACKS, REFER TO DOCUMENTATION IN THIS FILE FOR SPECIFICS!

---Called every game tick.
---@param gameTicks integer Number of ticks that have passed this frame (normally 1, 400 while sleeping).
function onTick(gameTicks) end
---Called when the script is initialized.
---@param isWorldCreate boolean True on world generation (first game load).
function onCreate(isWorldCreate) end
---Called when the world is exited.
---Useful for saving anything that needs to persist between game loads.
---Do so in a global variable name `g_savedata`, a special variable Stormworks will keep track of between game loads.
function onDestroy() end
---Called when a command is typed into chat.
---@param fullMessage string Contains entire message including spaces.
---@param userPeerId integer ID of peer sending command. `-1` if command was executed by script.
---@param isAdmin boolean True if executer is administrator.
---@param isAuth boolean True if executer is authenticated.
---@param command string First parameter including the `?`, e.g.: `?command`.
---@param ... string vararg containing any arguments. May also be explicitly declared: see overload. use `table.pack(...)` or `{...}` to get a usable table out of it.
---@overload fun(fullMessage: string, userPeerId: integer, isAdmin: boolean, isAuth: boolean, command: string, arg1: string, arg2: string, arg3: string, ...: string)
function onCustomCommand(fullMessage, userPeerId, isAdmin, isAuth, command, ...) end
---Called when a chat message is posted.
---@param peerId integer ID of peer sending message.
---@param senderName string Name of sender.
---@param message string Message sent.
function onChatMessage(peerId, senderName, message) end
---Called when a player joins the game.
---@param steamId integer SteamID of player having joined.
---@param name string Name of player having joined.
---@param peerId integer Peer ID of player having joined.
---@param isAdmin boolean True if player is administrator.
---@param isAuth boolean True if player is authenticated.
function onPlayerJoin(steamId, name, peerId, isAdmin, isAuth) end
---Called when a player sits in a seat.
---@param peerId integer Peer ID of player sitting down.
---@param vehicleId integer Vehicle ID in which the peer sat down.
---@param seatName string Name of seat peer is sitting in.
function onPlayerSit(peerId, vehicleId, seatName) end
---Called when a player exits a seat.
---@param peerId integer Peer ID of player that was sitting down.
---@param vehicleId integer Vehicle ID in which the peer was sitting down.
---@param seatName string Name of seat peer was sitting in.
function onPlayerUnsit(peerId, vehicleId, seatName) end
---Called when a character (including players) sits in a seat.
---@param objectId integer Object ID of object sitting down.
---@param vehicleId integer Vehicle ID in which the object sat down.
---@param seatName string Name of seat object is sitting in.
function onCharacterSit(objectId, vehicleId, seatName) end
---Called when a character (including players) exits a seat.
---@param objectId integer Peer ID of object that was sitting down.
---@param vehicleId integer Vehicle ID in which the object was sitting down.
---@param seatName string Name of seat object was sitting in.
function onCharacterUnsit(objectId, vehicleId, seatName) end
---Called when a character (including players) picks up an object.
---@param objectIdActor integer Object ID of object picking up item
---@param objectIdTarget integer Object ID of object being picked up,
function onCharacterPickup(objectIdActor, objectIdTarget) end
---Called when any creature sits in a seat.
---@param objectId integer Object ID of character sitting down.
---@param vehicleId integer Vehicle ID in which the character sat down.
---@param seatName string Name of seat character is sitting in.
function onCreatureSit(objectId, vehicleId, seatName) end
---Caled when a creature gets out of a seat.
---@param objectId integer Peer ID of character that was sitting down.
---@param vehicleId integer Vehicle ID in which the character was sitting down.
---@param seatName string Name of seat character was sitting in.
function onCreatureUnsit(objectId, vehicleId, seatName) end
---Called when a character picks up a creature.
---@param objectIdActor integer Object ID of character picking up creature.
---@param objectIdTarget integer Object ID of creature being picked up.
---@param creatureType CreatureType Creature type of creature being picked up.
function onCreaturePickup(objectIdActor, objectIdTarget, creatureType) end
---Called when a character picks up an equipment item.
---@param objectIdActor integer Object ID of character picking up equipment.
---@param objectIdTarget integer Object ID of equipment being picked up.
---@param equipmentType EquipmentType Type of equipment being picked up.
function onEquipmentPickup(objectIdActor, objectIdTarget, equipmentType) end
---Called when a character drops an equipment item.
---@param objectIdActor integer Object ID of character dropping equipment.
---@param objectIdTarget integer Object ID of equipment being dropped.
---@param equipmentType EquipmentType Type of equipment being dropped.
function onEquipmentDrop(objectIdActor, objectIdTarget, equipmentType) end
---Called when player respawns.
---@param peerId integer Peer ID of player respawning.
function onPlayerRespawn(peerId) end
---Called when a player leaves the game.
---@param steamId integer Steam ID of player leaving the game.
---@param name string Name of player leaving the game.
---@param peerId integer Peer ID of player leaving the game.
---@param isAdmin boolean True if player that left was administrator.
---@param isAuth boolean True if player that left was authenticated.
function onPlayerLeave(steamId, name, peerId, isAdmin, isAuth) end
---Called when a player opens or closes their map.
---@param peerId integer Peer ID of player having interacted with their map.
---@param isOpen boolean True if player opened their map.
function onToggleMap(peerId, isOpen) end
---Called when a player dies.
---@param steamId integer Steam ID of player that died.
---@param name string Name of player that died.
---@param peerId integer Peer ID of player that died.
---@param isAdmin boolean True if player that died was administrator.
---@param isAuth boolean True if player that died was authenticated.
function onPlayerDie(steamId, name, peerId, isAdmin, isAuth) end
---Called when a vehicle group is spawned. Vehicles must still loading in locally to start simulating.
---@param groupId integer ID of group that spawned.
---@param peerId integer ID of peer that spawned group. If spawned by script, will be `-1`.
---@param x number Spawn X
---@param y number Spawn Y
---@param z number Spawn Z
---@param groupCost number Cost of group that spawned. Only calculated for player-spawned groups.
function onGroupSpawn(groupId, peerId, x, y, z, groupCost) end
---Called when a vehicle is spawned. Vehicles must still loading in locally to start simulating.
---@param vehicleId integer ID of group that spawned.
---@param peerId integer ID of peer that spawned vehicle. If spawned by script, will be `-1`.
---@param x number Spawn X
---@param y number Spawn Y
---@param z number Spawn Z
---@param groupCost number Cost of group that spawned. Only calculated for player-spawned groups.
---@param groupId integer ID of group that spawned.
function onVehicleSpawn(vehicleId, peerId, x, y, z, groupCost, groupId) end
---Called when a vehicle is despawned.
---@param vehicleId integer ID of vehicle that despawned.
---@param peerId integer ID of peer that despawned vehicle. If despawned by script, will be `-1`.
function onVehicleDespawn(vehicleId, peerId) end
---Called when a vehicle is loaded and ready to simulate.
---@param vehicleId integer Vehicle ID of vehicle ready to simulate.
function onVehicleLoad(vehicleId) end
---Called when vehicle has unloaded and is no longer simulating.
---@param vehicleId integer Vehicle ID of vehicle no longer ready to simulate.
function onVehicleUnload(vehicleId) end
---Called when vehicle is teleported or returned to workbench.
---@param vehicleId integer ID of vehicle being teleported.
---@param peerId integer ID of peer teleporting vehicle. If teleported by script, will be `-1`.
---@param x number New X position.
---@param y number New Y position.
---@param z number New Z position.
function onVehicleTeleport(vehicleId, peerId, x, y, z) end
---Called when an object (character, prop or animal) has loaded and is ready to simulate.
---@param objectId integer ID of object ready to simulate.
function onObjectLoad(objectId) end
---Called when an object (character, prop or animal) is no longer simulating.
---@param objectId integer ID of object no longer ready to simulate.
function onObjectUnload(objectId) end
---Called when a button is interacted with (still triggers on locked buttons).
---@see server.getVehicleButton to get a button's current state.
---@param vehicleId integer ID of vehicle on which button was interacted with.
---@param peerId integer ID of player having interacted with button.
---@param buttonName string Name of button having been interacted with.
---@param isPressed boolean True if the button is currently being pressed.
function onButtonPress(vehicleId, peerId, buttonName, isPressed) end
---Called when a vehicle or object is spawned by a script.
---@param id integer ID of vehicle or object that spawned.
---@param componentName string Name of component having spawned.
---@param componentType ComponentTypes
---@param addonIndex integer Internal addon index of the addon the object was spawned from.
function onSpawnAddonComponent(id, componentName, componentType, addonIndex) end
---Called when a vehicle is being damaged or rempaired.
---@param vehicleId integer ID of vehicle being damaged or repaired.
---@param damageAmount number Negative if component is being repaired.
---@param voxelX number X-axis of voxel that sustained damage relative to vehicle origin.
---@param voxelY number Y-axis of voxel that sustained damage relative to vehicle origin.
---@param voxelZ number Z-axis of voxel that sustained damage relative to vehicle origin.
---@param bodyIndex integer Index of vehicle body. `0` for main body. Useful for checking if a sub-body such as a missile should be ignored.
function onVehicleDamaged(vehicleId, damageAmount, voxelX, voxelY, voxelZ, bodyIndex) end
---Called when the HTTP request has returned.
---@param port integer Port on which the request was made.
---@param request string Original query string. [Query strings on Wikipedia](https://en.wikipedia.org/wiki/Query_string)
---@param reply string Reply from server.
function httpReply(port, request, reply) end
---Called when a fire is extinguished.
---@param fireX number X-axis of fire world coordinates.
---@param fireY number Y-axis of fire world coordinates.
---@param fireZ number Z-axis of fire world coordinates.
function onFireExtinguished(fireX, fireY, fireZ) end
---Called when 5 or more trees are detected to be on fire in a small radius.
---@param fireObjectiveId integer Used for tracking separate forest fire events.
---@param fireX number X-axis of fire's world coordinates.
---@param fireY number Y-axis of fire's world coordinates.
---@param fireZ number Z-axis of fire's world coordinates.
function onForestFireSpawned(fireObjectiveId, fireX, fireY, fireZ) end
---Called when a forest fire was extinguished (all trees were extinguished)
---@param fireObjectiveId integer Used for tracking separate forest fire events.
---@param fireX number X-axis of fire's world coordinates.
---@param fireY number Y-axis of fire's world coordinates.
---@param fireZ number Z-axis of fire's world coordinates.
function onForestFireExtinguished(fireObjectiveId, fireX, fireY, fireZ) end
---Called when a tornado is spawned.
---@param tf Transform
function onTornado(tf) end
---Called when a meteor is spawned.
---@param tf Transform
---@param magnitude number
function onMeteor(tf, magnitude) end
---Called when a tsunami is spawned.
---@param tf Transform
---@param magnitude number
function onTsunami(tf, magnitude) end
---Called when a whirlpool is spawned.
---@param tf Transform
---@param magnitude number
function onWhirlpool(tf, magnitude) end
---Called when a volcano is triggered.
---@param tf Transform
function onVolcano(tf) end
---Called when an oil spill is updated.
---@param tileX number X-axis of tile.
---@param tileY number Y-axis of tile.
---@param delta number Difference (positive or negative) of oil change.
---@param total number Remaining spilled oil.
---@param vehicleId integer Vehicle ID updating oil spill. `-1` for script command or oil tick updates,
function onOilSpill(tileX, tileY, delta, total, vehicleId) end
