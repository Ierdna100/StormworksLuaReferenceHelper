---@meta

---@class server
server = {}

---Get the internal index of this addon.
---@return integer addonIndex Index of the addon.
---@return boolean isSuccess True if function successfully executed. If function successfully executed.
function server.getAddonIndex() end
---Get the internal index of this addon by name.
---@param name? string Get the internal index of an active addon by its name (useful if you want to spawn components from another active addon).
---@return integer addonIndex Index of the addon.
---@return boolean isSuccess True if function successfully executed. If function successfully executed.
function server.getAddonIndex(name) end
---Get the internal index of a location in the specified addon by its name (this index is local to the addon)
---@param addonIndex integer Index of the addon.
---@param name string Name of the location.
---@return integer locationIndex Index of the location.
---@return boolean isSuccess True if function successfully executed.
function server.getLocationIndex(addonIndex, name) end
---Directly spawn a location by name from the current addon, optional world transform parameter - otherwise spawns at first tile of the location type
---@param name string Name of the addon location
---@param spawnTf? Transform Spawn coordinates.
---@return boolean isSuccess True if function successfully executed. If function successfully executed.
function server.spawnNamedAddonLocation(name, spawnTf) end
---Spawn the specified mission location from the specified mission addon at the specified world coordinates.
---@param spawnAt Transform Spawn coordinates. If (x, y, z) = (0, 0, 0), it will spawn the location at a random location of the tile's type (useful for spawning missions on specific tiles)
---@param addonIndex integer Index of the addon.
---@param locationIndex integer Index of the location.
---@return Transform addonLocationTf Spawn coordinates of addon location
---@return boolean isSuccess True if function successfully executed. If function successfully executed.
function server.spawnAddonLocation(spawnAt, addonIndex, locationIndex) end
---Get the filepath of an addon
---@param addonName string Addon name
---@param isRom boolean True for dev addons stored in rom folder.
---@return string path Path-like string for addon.
---@return boolean isSuccess True if function successfully executed. If function successfully executed.
function server.getAddonPath(addonName, isRom) end

---@class Zone Generic zone class.
---@field tagsFull string Full list of tags, comma-separated values.
---@field tags string[] Full list of tags.
---@field name string Zone name.
---@field transform Transform Position.
---@field size {x: number, y: number, z: number} Size if cuboid.
---@field radius number Radius if spherical.
---@field type ZoneType Type of zone.
---@field parentVehicleId integer VehicleId to which zone is parented to.
---@field parentRelativeTransform table Parent vehicle relative position.

---@alias ZoneType
---| 0 # box
---| 1 # sphere
---| 2 # radius

---Get a table of all active env mod zones.
---@param tags? string[] Tags
---@return Zone[] ZoneList Table of zones
function server.getZones(tags) end
---Returns whether the specified world transform is within any env mod zone that matches the display name. For specific zones, using `server.isInTransformArea()` may be preferred
---@param checkAtPosition Transform Position of tf to check.
---@param zoneDisplayName string Display name of zone to check against.
---@return boolean isInZone True if the tf is in the zone.
---@return boolean isSuccess True if function successfully executed. If function successfully executed.
function server.isInZone(checkAtPosition, zoneDisplayName) end
---Get number of active addons
---@return integer count
function server.getAddonCount() end

---@class AddonData Generic addon class.
---@field name string Name of addon.
---@field path_id string Path of addon.
---@field file_store boolean Official documentation says : "is_app_data".
---@field location_count integer Number of locations

---Get a table of addon data for the specified index.
---@param addonIndex integer Index of addon.
---@return AddonData | nil addonData Returns nil if the addon cannot be found.
function server.getAddonData(addonIndex) end

---@class LocationData Generic location class.
---@field name string Location name.
---@field tile string tile filename.
---@field env_spawn_count integer Number of spawned locations.
---@field envMod boolean True if is environnement mod.
---@field component_count integer Number of components in location.

---Get table of location data for the specified location at the specified index.
---@param addonIndex integer Index of addon.
---@param locationIndex integer Index of location.
---@return LocationData|nil localationData Returns nil if the addon cannot be found.
---@return boolean isSuccess True if function successfully executed.
function server.getLocationData(addonIndex, locationIndex) end

---@class ComponentData Generic component class.
---@field tags_full string Full list of tags, comma-separated values.
---@field tags string[] Full list of tags.
---@field display_name string Display name of component.
---@field type ComponentTypes Component type.
---@field id integer ID of component.
---@field dynamic_object_type ObjectType Type of dynamic object.
---@field transform Transform Component tf.
---@field vehicle_parent_component_id integer Parent vehicle component ID.
---@field character_outfit_type OutfitType Character outfit type.

---Get a table of component (object/vehicle) data for the specified comonent at the specified location at the specified index.
---@param addonIndex integer Index of addon.
---@param locationIndex integer Index of location.
---@param componentIndex integer Index of component.
---@return ComponentData|nil componentData Component data.
---@return boolean isSuccess True if function successfully executed. -Returns nil if the addon cannot be found
function server.getLocationComponentData(addonIndex, locationIndex, componentIndex) end

---@class Component Generic component class.
---@field tags_full string Full list of tags, comma-separated values.
---@field tags string[] Full list of tags.
---@field display_name string Display name of component.
---@field type ComponentTypes Component type.
---@field transform Transform Component tf.
---@field id integer ID of component.
---@field object_id integer ID of object.
---@field group_id integer ID of group.
---@field vehicle_ids integer[] IDs of vehicles of group

---@alias ComponentTypes
---| "zone"
---| "object"
---| "character"
---| "vehicle"
---| "flare"
---| "fire"
---| "loot"
---| "button"
---| "animal"
---| "ice"

---Spawn the component (object/vehicle) at the specified component index, location and addonIndex.
---@param spawnTf Transform Tf to spawn component at.
---@param addonIndex integer Index of addon containing component.
---@param locationIndex integer Index of location of component.
---@param componentIndex integer Index of component.
---@param parentVehicleId? integer Optional for fire and zone components, parent vehicle.
---@return Component component Component data.
---@return boolean isSuccess True if function successfully executed.
function server.spawnAddonComponent(spawnTf, addonIndex, locationIndex, componentIndex, parentVehicleId) end
