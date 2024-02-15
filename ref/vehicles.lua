---@meta

---Spawns a vehicle component from a specific addon.
---@see server.getLocationComponentData for info on how to get ComponentID.
---@param spawnTf Transform Transform of where to spawn addon vehicle.
---@param addonIndex integer Addon index of vehicle.
---@param componentId integer Component ID of vehicle.
---@return integer vehicleId Vehicle ID of spawned vehicle.
---@return boolean isSuccess True if function successfully executed.
---@return integer[] groupVehicles All vehicles in this group
function server.spawnAddonVehicle(spawnTf, addonIndex, componentId) end
---@deprecated Used before spawnVehicle() existed. Do not use anymore
---@see server.spawnVehicle
function server.spawnVehicleSavefile() end
---Spawns a vehicle from local appdata using its filename.
---@param spawnTf Transform Transform of where to spawn vehicle.
---@param saveName string Name of vehicle on disk to spawn.
---@return integer vehicleId Vehicle ID of spawned vehicle.
---@return boolean isSuccess True if function successfully executed.
---@return integer[] groupVehicles All vehicles in this group
function server.spawnVehicle(spawnTf, saveName) end
---Sets a vehicle to despawn when out of a player's range.
---@param vehicleId integer Vehicle ID to despawn.
---@param isInstant boolean If true vehicle will instantly despawn no matter player's distance to it.
---@return boolean isSuccess True if function successfully executed.
function server.despawnVehicle(vehicleId, isInstant) end
---Sets all vehicles in a vehicle group to despawn outside of a player's range. If isInstant is true, the vehicles will instantly despawn.
---@param groupId integer Group ID of group of vehicles to despawn.
---@param isInstant boolean If true vehicle will instantly despawn no matter player's distance to it.
---@return boolean isSuccess True if function successfully executed.
function server.despawnVehicleGroup(groupId, isInstant) end
---Gets the world position of the center of a vehicle's main body. Optionally passing a voxel position will return the world position of the specified voxel on the vehicle.
---@param vehicleId integer Vehicle ID to get transform of.
---@param voxelX? number Voxel X offset of position.
---@param voxelY? number Voxel Y offset of position.
---@param voxelZ? number Voxel Z offset of position.
---@return Transform tf Transform of vehicle.
---@return boolean isSuccess True if function successfully executed.
function server.getVehiclePos(vehicleId, voxelX, voxelY, voxelZ) end
---Converts a world transform to an astronomy transform. Used for navigating in space.
---@param transformMatrix table Transform to parse.
---@return Transform astronomyTf Parsed transform.
function server.getAstroPos(transformMatrix) end
---Teleports the specified vehicle to the target world position. The vehicle is unloaded and reloaded.
---@param vehicleId integer Vehicle ID of vehicle to set transform of.
---@param newTf Transform New vehicle transform.
---@return boolean isSuccess True if function successfully executed.
function server.setVehiclePos(vehicleId, newTf) end
---Teleports the specified vehicle to the target world position. The vehicle is unloaded and reloaded.
---The vehicle is displaced by other vehicles at the arrival point.
---@param vehicleId integer Vehicle ID of vehicle to set transform of.
---@param newTf Transform New vehicle transform.
---@return boolean isSuccess True if function successfully executed.
---@return Transform actualTf Actual new transform.
function server.setVehiclePosSafe(vehicleId, newTf) end
---Teleports all vehicles in the group to the target world position. The vehicle is unloaded and reloaded.
---@param vehicleId integer Vehicle ID of vehicle in group to set transform of.
---@param newTf Transform New vehicle transform.
---@return boolean isSuccess True if function successfully executed.
function server.setGroupPos(vehicleId, newTf) end
---Teleports all vehicles in the group to the target world position. The vehicl is unloaded and reloaded.
---The vehicle is displaced by other vehicles that are not in the group at the arrival point.
---@param vehicleId integer Vehicle ID of vehicle in group to set transform of.
---@param newTf Transform New vehicle transform.
---@return boolean isSuccess True if function successfully executed.
---@return Transform actualTf Actual new transform.
function server.setGroupPosSafe(vehicleId, newTf) end
---Moves the specified vehicle to the target world position.
---@param vehicleId integer Vehicle ID of vehicle to move.
---@param newTf Transform New vehicle transform.
---@return boolean isSuccess True if function successfully executed.
function server.moveVehicle(vehicleId, newTf) end
---Moves the specified vehicle to the target world position. The vehicle is displaced by other vehicles at the arrival point.
---@param vehicleId integer Vehicle ID of vehicle to move.
---@param newTf Transform New vehicle transform.
---@return boolean isSuccess True if function successfully executed.
---@return Transform actualTf Actual new transform.
function server.moveVehicleSafe(vehicleId, newTf) end
---Moves all vehicles in the group to the target world position.
---@param vehicleId integer Vehicle ID in group to move.
---@param newTf Transform New transform of vehicle.
---@return boolean isSuccess True if function successfully executed.
function server.moveGroup(vehicleId, newTf) end
---Moves all vehicles in the group to the target world position. The vehicle is displaced by other vehicles that are not in the group at the arrival point.
---@param vehicleId integer Vehicle ID in group to move.
---@param newTf Transform New transform of vehicle.
---@return boolean isSuccess True if function successfully executed.
---@return Transform actualTf Actual new transform.
function server.moveGroupSafe(vehicleId, newTf) end
---Checks if a zone of size (x, y, z) is clear of vehicles at the provided transform.
---@param position Transform Transform to check.
---@param x number Size in X-axis.
---@param y number Size in Y-axis.
---@param z number Size in Z-axis.
---@return boolean isSuccess True if function successfully executed.
function server.isLocationClear(position, x, y, z) end
---Reloads the vehicle as if spawning from a workbench, refreshing damage and inventories act.
---@param vehicleId integer Vehicle ID of vehicle to reset.
---@return boolean isSuccess True if function successfully executed.
function server.resetVehicleState(vehicleId) end
---Cleans up all player spawned vehicles.
function server.cleanVehicles() end
---Cleans up all fallout zones.
function server.clearRadiation() end
---Returns a table of vehicle IDs in the vehicle group.
---@param groupId integer Group ID to query.
---@return integer[] vehicleIds Vehicle IDs of group.
---@return boolean isSuccess True if function successfully executed.
function server.getVehicleGroup(groupId) end

---@class VehicleData
---@field tags_full string
---@field tags string[]
---@field group_id integer
---@field transform Transform
---@field simulating boolean
---@field editable boolean
---@field invulnerable boolean
---@field static boolean

---Gets general data for a vehicle.
---@param vehicleId integer Vehicle ID to get data from.
---@return VehicleData vehicleData Vehicle data of vehicle.
---@return boolean isSuccess True if function successfully executed.
function server.getVehicleData(vehicleId) end

---@class LoadedVehicleData
---@field voxels integer voxel count
---@field mass number Mass in kg
---@field characters integer[] table of character IDs
---@field components LoadedVehicleDataComponents

---@class LoadedVehicleDataComponents
---@field signs VehicleSignData[]
---@field seats VehicleSeatData[]
---@field buttons VehicleButtonData[]
---@field dials VehicleDialData[]
---@field tanks VehicleTankData[]
---@field batteries VehicleBatteryData[]
---@field hoppers VehicleHopperData[]
---@field guns VehicleWeaponData[]
---@field rope_hooks VehicleRopeHookData[]

---Gets advanced data for a ***LOADED*** vehicle. Including a list of attached character object.
---@param vehicleId integer Vehicle ID
---@return LoadedVehicleData loadedVehicleData Vehicle data.
---@return boolean isSuccess True if function successfully executed.
function server.getVehicleComponents(vehicleId) end

---@class VehicleGenericData
---@field name string
---@field pos {x: number, y: number, z: number}

---@class VehicleTankData: VehicleGenericData
---@field value number
---@field values number[] Volumes of individual fluid types (cL)
---@field capacity number Capacity of tank (cL)
---@field fluid_type FluidType Type of base fluid.

---@alias FluidType
---| 0 fresh water
---| 1 diesel
---| 2 jet fuel
---| 3 air
---| 4 exhaust
---| 5 oil
---| 6 sea water
---| 7 steam
---| 8 slurry
---| 9 saturated slurry

---Returns the value of the first tank of the specified name or voxel position found on the specified vehicle.
---Stormworks uses centiLiters behind the scene and as such the values here will reflect that (1 cL = 0.1 L)
---@param vehicleId integer Vehicle ID to query.
---@param tankName string Tank to search for.
---@see FluidType Possible fluid types of tank.
---@return VehicleTankData data Vehicle tank data.
---@return boolean isSuccess True if function successfully executed.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number): data: VehicleTankData, isSuccess: boolean
function server.getVehicleTank(vehicleId, tankName) end

---@class VehicleSeatData: VehicleGenericData
---@field seatedId integer ID of seated object.
---@field seatedPeerId integer ID of seated peer.

---Returns the data of the first seat of the specified name or voxel position found on the specified vehicle.
---
---**`Seat outputs for AI depending on seat type:`**
---- `Ship Pilot`
---	 - `Hotkey 1`: Engine On
---	 - `Hotkey 2`: Engine Off
---	 - `Axis W`: Throttle
---	 - `Axis D`: Steering
---- `Helicopter Pilot`
---  - `Hotkey 1`: Engine On
---  - `Hotkey 2`: Engine Off
---  - `Axis W`: Pitch
---  - `Axis D`: Roll
---  - `Axis Up`: Collective
---  - `Axis Right`: Yaw
---  - `Trigger`: Shoot
---- `Plane Pilot`
---  - `Hotkey 1`: Engine On
---  - `Hotkey 2`: Engine Off
---  - `Axis W`: Pitch
---  - `Axis D`: Roll
---  - `Axis Up`: Throttle
---  - `Axis Right`: Yaw
---  - `Trigger`: Shoot
---- `Gunner`
---  - `Axis W`: Pitch
---  - `Axis D`: Yaw
---  - `Trigger`: Shoot
---- `Designator`
---  - `Axis W`: Pitch
---  - `Axis D`: Yaw
---  - `Trigger`: Designate
---@param vehicleId integer Vehicle ID of vehicle to query.
---@param seatName string Seat name to query.
---@return VehicleSeatData data Vehicle seat to search for.
---@return boolean isSuccess True if function successfully executed.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number): data: VehicleSeatData, isSuccess: boolean
function server.getVehicleSeat(vehicleId, seatName) end

---@class VehicleButtonData: VehicleGenericData
---@field on boolean True if button is pressed.

---Returns the state of the first button of the specified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to query.
---@param buttonName string Button name to search for.
---@return VehicleButtonData data Vehicle button data.
---@return boolean isSuccess True if function successfully executed.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number): data: VehicleButtonData, isSuccess: boolean
function server.getVehicleButton(vehicleId, buttonName) end

---@class VehicleSignData: VehicleGenericData

---Returns the voxel position of the first sign of the specified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to query.
---@param signName string Sign name to search for.
---@return VehicleSignData data Vehicle sign data.
---@return boolean isSuccess True if function successfully executed.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number): data: VehicleSignData, isSuccess: boolean
function server.getVehicleSign(vehicleId, signName) end

---@class VehicleDialData: VehicleGenericData
---@field value number Primary value
---@field value2 number Secondary value

---Returns the value of the first dial of the speccified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to query.
---@param dialName string Dial name to search for.
---@return VehicleDialData data Vehicle dial data.
---@return boolean isSuccess True if function successfully executed.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number): data: VehicleDialData, isSuccess: boolean
function server.getVehicleDial(vehicleId, dialName) end

---@class VehicleHopperData: VehicleGenericData
---@field values number[] Quantities of individual types of ores.
---@field capacity number Capacity of hopper.

---@alias OreTypes
---| 0 coal
---| 1 iron
---| 2 aluminium
---| 3 gold
---| 4 goldDirt
---| 5 uranium,
---| 6 ingotIron
---| 7 ingotSteel
---| 8 ingotAluminium
---| 9 ingotGoldImpure
---| 10 ingotGold
---| 11 ingotUranium

---Returns the ore count of the first hooper of the specified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to query.
---@param hopperName string Hopper name to search for.
---@return VehicleHopperData data Vehicle hopper data.
---@return boolean isSuccess True if function successfully executed.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number): data: VehicleHopperData, isSuccess: boolean
function server.getVehicleHopper(vehicleId, hopperName) end

---@class VehicleBatteryData: VehicleGenericData
---@field charge number Battery Charge level.

---Returns the data of the first battery of the specified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to query.
---@param batteryName string Battery name to search for.
---@return VehicleBatteryData data Vehicle battery data.
---@return boolean isSuccess True if function successfully executed.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number): data: VehicleButtonData, isSuccess: boolean
function server.getVehicleBattery(vehicleId, batteryName) end

---@class VehicleWeaponData: VehicleGenericData
---@field ammo integer Ammo of weapon.
---@field capacity integer Capacity of weapon.

---Returns the data of the first weapon component of the specified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to query.
---@param name string Weapon name to search for.
---@return VehicleWeaponData data Vehicle weapon data.
---@return boolean isSuccess True if function successfully executed.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number): data: VehicleWeaponData, isSuccess: boolean
function server.getVehicleWeapon(vehicleId, name) end

---@class VehicleRopeHookData: VehicleGenericData

---Returns the data of the first rope anchor component of the specified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to query.
---@param name string Rope hook name to search for.
---@return VehicleRopeHookData data Vehicle rope hook data.
---@return boolean isSuccess True if function successfully executed.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number): data: VehicleRopeHookData, isSuccess: boolean
function server.getVehicleRopeHook(vehicleId, name) end

---Applies a set fluid action to the first tank of the specified name or voxel position found on the specified vehicle.
---Fluid of the same state (gas or liquid) as the target type will be cleared when this function is triggered, therefore to fully clear a tank call this function twice:
---Once for gases and once for liquids. Stormworks uses centiLiters behind the scenes and as such values here should reflect that (1 cL = 0.1 L)
---@param vehicleId integer Vehicle ID to set tank data of.
---@param tankName string Tank name to look for.
---@param amount number Amount of fluid to set.
---@param fluidType FluidType Type of fluid to set.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number, amount: number, fluidType: FluidType)
function server.setVehicleTank(vehicleId, tankName, amount, fluidType) end

---Overrides the inputs to the first seat of the specified vehicle name or voxel position found on the specified vehicle. A seated player will prevent overrides.
---@param vehicleId integer Vehicle ID to set seat data of.
---@param seatName string Seat name to look for.
---@param axisW number W-axis value [-1, 1]
---@param axisD number D-axis value [-1, 1]
---@param axisUp number Up/Down axis value [-1, 1]
---@param axisRight number Right/left axis value [-1, 1]
---@param button1 boolean Button 1 value [T/F]
---@param button2 boolean Button 2 value [T/F]
---@param button3 boolean Button 3 value [T/F]
---@param button4 boolean Button 4 value [T/F]
---@param button5 boolean Button 5 value [T/F]
---@param button6 boolean Button 6 value [T/F]
---@param trigger boolean Trigger value [T/F]
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number, axisW: number, axisD: number, axisUp: number, axisRight: number, button1: boolean, button2: boolean, button3: boolean, button4: boolean, button5: boolean, button6: boolean, trigger: boolean)
function server.setVehicleSeat(
	vehicleId,
	seatName,
	axisW,
	axisD,
	axisUp,
	axisRight,
	button1,
	button2,
	button3,
	button4,
	button5,
	button6,
	trigger
)
end

---Applies a press action to the first button of the specified name or voxel position found on the specified points.
---@param vehicleId integer Vehicle ID to press button of.
---@param buttonName string Name of button to search for.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number)
function server.pressVehicleButton(vehicleId, buttonName) end

---Applies a set number action to the first keypad to the specified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to set keypad value of.
---@param keypadName string Keypad name to search for.
---@param value number First value to set.
---@param value2? number Second value to set.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number, value: number, value2?: number)
function server.setVehicleKeypad(vehicleId, keypadName, value, value2) end

---Sets the number of a specific type of mineral objects inside a hopper of the specified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to set hopper data of.
---@param hopperName string Hopper name to look for.
---@param amount number Amount of ore to set.
---@param oreType OreTypes Type of ore to set.
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number, amount: number, oreType: OreTypes)
function server.setVehicleHopper(vehicleId, hopperName, amount, oreType) end

---Applies a set charge action to the first battery of the specified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to set battery data of.
---@param batteryName string Battery name to look for.
---@param amount number Amount of battery charge to set. [0-1]
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number, amount: number)
function server.setVehicleBattery(vehicleId, batteryName, amount) end

---Applies a set ammo action to the first weapon component of the specified name or voxel position found on the specified vehicle.
---@param vehicleId integer Vehicle ID to set weapon data of.
---@param name string Weapon name to look for.
---@param amount integer Amount of ammo to set. {0, 1}
---@overload fun(vehicleId: integer, voxelX: number, voxelY: number, voxelZ: number, amount: integer)
function server.setVehicleWeapon(vehicleId, name, amount) end

---@alias RopeType
---| 0 rope
---| 1 hose
---| 2 electric cable
---| 3 suspension cable

---Spawns a rope between two rope anchors on the specified vehicles at the provided voxel locations.
---@param vehicleId1 integer Vehicle ID of first vehicle to connect rope to.
---@param voxelX1 number Voxel X-value of rope connection point in first vehicle.
---@param voxelY1 number Voxel Y-value of rope connection point in first vehicle.
---@param voxelZ1 number Voxel Z-value of rope connection point in first vehicle.
---@param vehicleId2 integer Vehicle ID of second vehicle to connect rope to.
---@param voxelX2 number Voxel X-value of rope connection point in second vehicle.
---@param voxelY2 number Voxel Y-value of rope connection point in second vehicle.
---@param voxelZ2 number Voxel Z-value of rope connection point in second vehicle.
---@param length number Length of rope to set.
---@param ropeType RopeType Type of rope to set.
function server.spawnVehicleRope(
	vehicleId1,
	voxelX1,
	voxelY1,
	voxelZ1,
	vehicleId2,
	voxelX2,
	voxelY2,
	voxelZ2,
	length,
	ropeType
)
end
---Get the number of burning surfaces on a specified vehicle.
---@param vehicleId integer Vehicle ID to query.
---@return integer surfaceCount Number of surfaces on fire.
---@return boolean isSuccess True if function successfully executed.
function server.getVehicleFireCount(vehicleId) end
---Set the default block tooltip of a vehicle to display some text. Blocks with unique tooltips will override this tooltip.
---@param vehicleId integer Vehicle ID to set tooltip of.
---@param text string New tooltip.
---@return boolean isSuccess True if function successfully executed.
function server.setVehicleTooltip(vehicleId, text) end
---Applies impact damage to a vehicle at the specified voxel location.
---@param vehicleId integer Vehicle ID to add damage to.
---@param damage number Damage to set. Negative means repairing the vehicle. [-100, 100]
---@param voxelX number Voxel X-value of where to damage.
---@param voxelY number Voxel Y-value of where to damage.
---@param voxelZ number Voxel Z-value of where to damage.
---@param radius number Radius to damage (m)
---@return boolean isSuccess True if function successfully executed.
function server.addDamage(vehicleId, damage, voxelX, voxelY, voxelZ, radius) end
---Returns whether the specified vehicle has finished loading and is simulating.
---@param vehicleId integer Vehicle to query.
---@return boolean isSimulating True if the vehicle is currently simulating.
---@return boolean isSuccess True if function successfully executed.
function server.getVehicleSimulating(vehicleId) end
---Returns whether the specified vehicle is loading, simulating or unloading.
---@param vehicleId integer Vehicle ID to query.
---@return boolean isLocal True if vehicle is un/loading.
---@return boolean isSuccess True if function successfully executed.
function server.getVehicleLocal(vehicleId) end
---Sets a vehicle's global transponder to active. (All vehicles have a global transponder that can be active even if a vehicle is not loaded).
---@param vehicleId integer Vehicle ID to set transponder data of.
---@param isActive boolean Set to true if transponder should be active.
---@return boolean isSuccess True if function successfully executed.
function server.setVehicleTransponder(vehicleId, isActive) end
---Sets a vehicle to be editable by players. If a vehicle is spawned by a script it will not have a parent workbench until edited by one.
---@param vehicleId integer Vehicle ID to set editability of.
---@param isEditable boolean Set to true if vehicle should be editable.
---@return boolean isSuccess True if function successfully executed.
function server.setVehicleEditable(vehicleId, isEditable) end
---Sets a vehicle to be invulnerable to damage.
---@param vehicleId integer Vehicle ID to set invulnerability of.
---@param isInvulnerable boolean Set to true if vehicle should be invulnerable.
---@return boolean isSuccess True if function successfully executed.
function server.setVehicleInvulnerable(vehicleId, isInvulnerable) end
---Sets a vehicle to be shown on the map.
---@param vehicleId integer Vehicle ID to set showOnMap status of.
---@param isShowOnMap boolean Set to true if vehicle should appear on map.
---@return boolean isSuccess True if function successfully executed.
function server.setVehicleShowOnMap(vehicleId, isShowOnMap) end
