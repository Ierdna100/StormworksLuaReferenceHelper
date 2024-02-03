---@meta

---Lua AI can be run on any character, and their resulting actions are dictated by their state and the AI Type of the seat they are attached to.
---Gun components and Camera components can be linked to a seat by naming them identically.
---
---**`Seat outputs for AI depending on seat type:`**
---- `Ship Pilot`
---	 - 0 - none
---	 - 1 - path to destination
---- `Helicopter Pilot`
---	 - 0 - none
---	 - 1 - path to destination
---	 - 2 - path to destination accurate (smaller increments for landing/takeoff)
---	 - 3 - gun run (fly at target and press the trigger hotkey when locked on)
---- `Plane Pilot`
---	 - 0 - none
---	 - 1 - path to destination
---	 - 2 - gun run (fly at target and press the trigger hotkey when locked on)
---- `Gunner`
---	 - 0 - none
---	 - 1 - path to destination
---	 - 2 - fire at target (Accounts for bullet drop / effective range when pulling the trigger)
---- `Designator`
---	 - 0 - none
---	 - 1 - path to destination
---	 - 2 - aim at target (Pulls the trigger when looking directly at target)
---@param objectId integer ID of object to set AI State to.
---@param AIState integer State that will be set to object.
function server.setAIState(objectId, AIState) end

---Sets the target destination for an AI.
---@param objectId integer ID of object to set AI State to.
---@param destinationTf Transform Tf of target the AI will point to.
function server.setAITarget(objectId, destinationTf) end

---@class TargetData
---@field character integer target character object ID
---@field x number
---@field y number
---@field z number

---Gets the target destination for an AI. Returns `nil` on failure.
---@param objectId integer ID of object to set AI State to.
---@return TargetData|nil targetData Target data.
function server.getAITarget(objectId) end

---Sets the target character for an AI. Different AIs use this data for their unique tasks.
---@param objectId integer ID of object to set AI State to.
---@param targetObjectId integer ID of target character the AI will point to.
function server.setAITargetCharacter(objectId, targetObjectId) end

---Sets the target vehicle for an AI. Different AIs use this data for their unique tasks.
---@param objectId integer ID of object to set AI State to.
---@param targetVehicleId integer ID of target vehicle the AI will point to.
function server.setAITargetVehicle(objectId, targetVehicleId) end
