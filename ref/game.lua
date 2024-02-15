---@meta

---Attempts to spawn a tsunami epicentered at the target transform, only one tsunami/whirlpool can be active at a time; stronger events will override weaker ones.
---@param spawnTf Transform Tf where tsunami should spawn.
---@param magnitude number Magnitude of tsunami. [0-1]
---@return boolean isSuccess True if tsunami was spawned successfully.
function server.spawnTsunami(spawnTf, magnitude) end
---Attempts to spawna  whirlpool near the target transform, can fail based on ocean depth, only one tsunami/whirlpool can be active at a time; strong events will override weaker ones.
---@param spawnTf Transform Tf where whirlpool should spawn.
---@param magnitude number Magnitude of tsunami. [0-1]
---@return boolean isSuccess True if whirlpool was spawned successfully.
function server.spawnWhirlpool(spawnTf, magnitude) end
---Cancels the active ocean gerstner wave event (tsunami or whirlpool)
function server.cancelGerstner() end
---Spawns a tornado at the target transform
---@param spawnTf Transform Tf where tornado should spawn.
---@return boolean isSuccess True if tornado was spawned successfully.
function server.spawnTornado(spawnTf) end
---Spawns a meteor to land at the target transform.
---@param landingTf Transform Tf where meteor should land.
---@param magnitude number Magnitude of meteor. [0-1]: scales up to 20x the default size of the meteor.
---@return boolean isSuccess True if meteor was spawned successfully.
function server.spawnMeteor(landingTf, magnitude, isSpawnTsunami) end
---Spawns a meteor to land at the target location, preceded by several smaller meteors.
---@param landingTf Transform Tf where meteor shower should land.
---@param magnitude number Magnitude of meteor shower. [0-1]: scales up to 20x the default size of the meteor and number of secondary meteors..
---@return boolean isSuccess True if meteor shower was spawned successfully.
function server.spawnMeteorShower(landingTf, magnitude, isSpawnTsunami) end
---Activates the closest volcano if the volcano is in simulation range
---@param eruptionTf Transform Tf where volcano should erupt (picks closest avaible volcano).
---@return boolean isSuccess True if volcano erupted successfully.
function server.spawnVolcano(eruptionTf) end

---@class Volcano
---@field x number volcano world x
---@field y number volcano world y
---@field z number volcano world z
---@field tile_x integer tileGridX
---@field tile_y integer tileGridY

---Get a list of volcano data.
---@return Volcano|Volcano[] Volcanos (NB: Unclear if return is array or not. Official documentation doesn't say.)
function server.getVolcanos() end
---Gets the blended oil amount at the target location.
---@param checkAtPosition Transform Tf of where to check for oil spill.
---@return number oilAmount Quantity of oil spilled.
function server.getOilSpill(checkAtPosition) end
---Sets the oil spill amount at the target location, the amount is blended across nearby tiles.
---@param tf Transform
---@param amount number
function server.setOilSpill(tf, amount) end
---Sets the oil spill amount at the target location, this amount is blended across nearby tiles.
---@param position Transform Tf of where to set oil spill amount.
---@param magnitude number Magnitude of oil spill.
function server.spawnExplosion(position, magnitude) end

---@alias GameSettingsEnum
---| "third_person" Type: bolean
---| "third_person_vehicle" Type: boolean
---| "vehicle_damage" Type: boolean
---| "player_damage" Type: boolean
---| "npc_damage" Type: boolean
---| "sharks" Type: boolean
---| "fast_travel" Type: boolean
---| "teleport_vehicle" Type: boolean
---| "rogue_mode" Type: boolean
---| "auto_refuel" Type: boolean
---| "megalodon" Type: boolean
---| "map_show_players" Type: boolean
---| "map_show_vehicles" Type: boolean
---| "show3d_waypoints" Type: boolean
---| "show_name_plates" Type: boolean
---| "day_length" Type: number
---| "night_length" Type: number
---| "infinite_money" Type: boolean
---| "settings_menu" Type: boolean
---| "unlock_all_islands" Type: boolean
---| "infinite_batteries" Type: boolean
---| "infinite_fuel" Type: boolean
---| "engine_overheating" Type: boolean
---| "no_clip" Type: boolean
---| "map_teleport" Type: boolean
---| "cleanup_vehicle" Type: boolean
---| "clear_fow" Type: boolean; clear fog of war
---| "vehicle_spawning" Type: boolean
---| "photo_mode" Type: boolean
---| "respawning" Type: boolean
---| "settings_menu_lock" Type: boolean
---| "despawn_on_leave" Type: boolean; despawn player characters when they leave a server
---| "unlock_all_components" Type: boolean
---| "override_weather" Type: boolean

---Set a game setting.
---@param gameSetting GameSettingsEnum GameSetting to set.
---@param value boolean|number New value of gameSetting.
function server.setGameSetting(gameSetting, value) end
---Returns a table of game settings indexed by the GameSetting string. May be accessed inline: `server.getGameSettings().thirdPerson`
---@return GameSettings gameSettings Table of all gamesettings
function server.getGameSettings() end

---@class GameSettings
---@field third_person boolean
---@field third_person_vehicle boolean
---@field vehicle_damage boolean
---@field player_damage boolean
---@field npc_damage boolean
---@field sharks boolean
---@field fast_travel boolean
---@field teleport_vehicle boolean
---@field rogue_mode boolean
---@field auto_refuel boolean
---@field megalodon boolean
---@field map_show_players boolean
---@field map_show_vehicles boolean
---@field show3d_waypoints boolean
---@field show_name_plates boolean
---@field day_length number
---@field night_length number
---@field infinite_money boolean
---@field settings_menu boolean
---@field unlock_all_islands boolean
---@field infinite_batteries boolean
---@field infinite_fuel boolean
---@field engine_overheating boolean
---@field no_clip boolean
---@field map_teleport boolean
---@field cleanup_vehicle boolean
---@field clear_fow boolean clear fog of war
---@field vehicle_spawning boolean
---@field photo_mode boolean
---@field respawning boolean
---@field settings_menu_lock boolean
---@field despawn_on_leave boolean despawn player characters when they leave a server
---@field unlock_all_components boolean
---@field override_weather boolean

---Sets game money and research points.
---@param money number Set money to game.
---@param researchPoints integer Set research points to game.
function server.setCurrency(money, researchPoints) end
---Get game money.
---@return number amount Money in game.
function server.getCurrency() end
---Get game research points.
---@return integer amount Research points in game.
function server.getResearchPoints() end
---Get number of days since game start.
---@return integer daysSurvived Days since game start.
function server.getDateValue() end
---Get current game date.
---@return integer day Day
---@return integer month Month
---@return integer year Year
function server.getDate() end

---@class Clock
---@field hour integer
---@field minute integer
---@field daylight_factor number [0-1]
---@field percent number [0-1]

---Get the current game time.
---@return Clock clock GameTime (time shown on UI).
function server.getTime() end

---@class Weather
---@field fog number fog factor [0-1]
---@field rain number rain factor [0-1]
---@field snow number snow factor [0-1]
---@field wind number wind factor [0-1]
---@field temp number temp factor [0-1]

---Get the current game weather at a location.
---@param position Transform Check weather at this position
---@return Weather weather Current weather.
function server.getWeather(position) end
---Sets the custom weather.
---@param fog number [0-1]
---@param rain number [0-1]
---@param wind number [0-1]
function server.setWeather(fog, rain, wind) end

---@alias AudioMood
---| 0 none
---| 1 mainMenu
---| 2 moodNormal
---| 3 moodMissionMid
---| 4 moodMissionHigh

---Sets the target audio mood. Mood tracks naturally decrease over time. -1 for all peers.
---@param peerId integer Peers to set audio mood to.
---@param audioMood AudioMood Audio mood to set.
function server.setAudioMood(peerId, audioMood) end
---Returns the world position of a random ocean tile within the selected search range.
---@param position Transform Tf of center of search area.
---@param minSearchRange number Minimum return distance.
---@param maxSearchRange number Maximum return distance.
---@return Transform resultTf Tf of randomly selected tile.
---@return boolean isSuccess True if function successfully executed.
function server.getOceanTransform(position, minSearchRange, maxSearchRange) end
---Returns the generated ocean floor height offset of a tile.
---This is not terrain height and does not include mesh height.
---It is advised to only use this for ocean tiles.
---@param position Transform Tf of position to check.
---@return number height Height at specified tf in meters.
function server.getOceanFloor(position) end
---Returns the position of a random tile of type `tileName` closest to the supplied location.
---@param position Transform Tf of center of search area.
---@param tileName string Type of tile to search for.
---@param searchRadius? number Defaults to 50 000m.
---@return Transform transformMatrix Tf of random tile.
---@return boolean isSuccess True if function successfully executed.
function server.getTileTransform(position, tileName, searchRadius) end

---@class TileData
---@field name string Name of tile
---@field sea_floor number Height of seafloor
---@field cost number Cost of tile
---@field purchased boolean True if it was purchased

---@class StartingTileData
---@field name string Name of tile
---@field x integer
---@field y integer
---@field z integer

---Returns the data for the tile at the specified location.
---@param position Transform Tf of tile to check.
---@return TileData tileData Data of tile at specified tf.
---@return boolean isSuccess True if function successfully executed.
function server.getTile(position) end
---Returns the data for the tile selected at the start tile in the game settings.
---@return StartingTileData tileData Data of starting tile.
function server.getStartTile() end
---Returns whether the tile at the given world coordinates is player owned.
---@param position Transform Tf of tile to check.
---@return boolean isPurchased True if it was purchased.
function server.getTilePurchased(position) end
---Returns the current inventory amounts for the tile resource depot.
---@param position Transform Tf of tile to check.
---@return number coal Coal quantity.
---@return number uranium Uranium quantity.
---@return number diesel Diesel quantity.
---@return number jetFuel Jet fuel quantity.
---@return number solidPropellant Solid propellant quantity.
function server.getTileInventory(position) end
---Sets the inventory amounts for the tile resource depot.
---@param position Transform Tf of tile to .
---@param coal number Coal quantity.
---@param uranium number Uranium quantity.
---@param diesel number Diesel quantity.
---@param jetFuel number Jet fuel quantity.
---@param solidPropellant number Solid propellant quantity.
function server.setTileInventory(position, coal, uranium, diesel, jetFuel, solidPropellant) end
---Returns whether matrixObject is whitin zoneSize of matrixZone.
---@param objectTf Transform Tf of item to check if in area.
---@param zoneTf Transform Tf of area to check if matrixObject is in.
---@param zoneSizeX number Size of matrixZone in X-axis.
---@param zoneSizeY number Size of matrixZone in Y-axis.
---@param zoneSizeZ number Size of matrixZone in Z-axis.
---@return boolean isInArea True if matrixObject is within matrixZone with set parameters.
function server.isInTransformArea(objectTf, zoneTf, zoneSizeX, zoneSizeY, zoneSizeZ) end
---Returns a table of waypoints that form a path from start to end, matching required tags.
---Tags should be separated by commas with no spaces.
---@param startTf Transform Start of path.
---@param endTf Transform Target of path.
---@param requiredTags string Comma-separated values of tags required.
---@param avoidedTags string Comma-separated values of tags ingored.
---@return {x: number, z: number}[] path Generated table of waypoints.
function server.pathfind(startTf, endTf, requiredTags, avoidedTags) end
---Returns a table of waypoints tagged with oceanPath, that form a path from start to end.
---This function is the same as passing "oceanPath" to
---@see server.pathfind
---@param startTf Transform Start of path.
---@param endTf Transform End of path.
---@return {x: number, z:number}[] path Generated table of waypoints.
function server.pathfindOcean(startTf, endTf) end
---Returns a table of underground oil deposit positions.
---@return {x: number, y: number, z: number, r: number, oil: number}[] oilDeposits Table of existing oil deposits.
function server.getOilDeposits() end

---@deprecated Used before you could access individual tiles. Do not use anymore.
---@see server.getStartTile
function server.getStartIsland() end