---@meta

---@class property
property = {}

---A simple boolean checkbox
---
---The following function will an editable UI element to the Addon script selector when starting a new game.
---These functions return `nil` unless the game was started through the new game screen, so use them in `onCreate()` and check if `isWorldCreate` is true,
---or in `g_savedata` where the `nil` value will be overwritten with the saved value on subsequent loads of the game.
---@param text string Text to appear in checkbox. Avoid commas, anything after a comma is ignored.
---@param defaultValue boolean Default value that appears in the menu.
---@return boolean isTrue True if the value is selected by user.
function property.checkbox(text, defaultValue) end
---A slider that is limited between two numbers
---
---The following function will an editable UI element to the Addon script selector when starting a new game.
---These functions return `nil` unless the game was started through the new game screen, so use them in `onCreate()` and check if `isWorldCreate` is true,
---or in `g_savedata` where the `nil` value will be overwritten with the saved value on subsequent loads of the game.
---@param text string Text to appear in slider. Avoid commas, anything after a comma is ignored.
---@param min number Minimum value of slider.
---@param max number Maximum value of slider.
---@param increment number Increment of slider. Recommended to be kept to a number divisible by the range.
---@param defaultValue number Default value that appears on the slider.
---@return number value Value selected by user.
function property.slider(text, min, max, increment, defaultValue) end
---Send an HTTP GET request. Example:
---
---port = `3000`
---
---queryString = `/send?a=2&b=3`
---
---will send a GET request to `http://localhost:3000/send?a=2&b=3`
---
---[Query strings on Wikipedia](https://en.wikipedia.org/wiki/Query_string)
---@param port integer Port to make request to. IP is always `localhost (127.0.0.1)`
---@param queryString string Max length of 4096 characters, any more will crash the game. Must begin with `/`. Arguments start with a `?` and are separated by a `&`. A key-value pair is represented via `key=value`.
function server.httpGet(port, queryString) end
---Ban a player.
---@param peerId integer Peer to ban.
function server.banPlayer(peerId) end
---Kick a player.
---@param peerId integer Peer to kick.
function server.kickPlayer(peerId) end
---Give a player administrator privileges.
---@param peerId integer Peer to give admin.
function server.addAdmin(peerId) end
---Remove administrator privileges from a player.
---@param peerId integer Peer to remove admin.
function server.removeAdmin(peerId) end
---Authenticate a player to use benches and menus
---@param peerId integer Peer to auth.
function server.addAuth(peerId) end
---Removing authentication privileges from a player
---@param peerId integer Peer to remove auth.
function server.removeAuth(peerId) end
---Send a save command for dedicated server.
---@param saveName? string Name of save.
function server.save(saveName) end
---Get time since game start (time seen when opening Steam overlay) in milliseconds (recommended for random seeding).
---@return integer systemTime Time since game start.
function server.getTimeMillisec() end
---Get whether the game considers the tutorial active (default missions check this before they spawn).
---@return boolean tutorialCompleted True if the tutorial was completed.
function server.getTutorial() end
---Sets the tutorial to completed. (useful if you are making your own tutorial).
function server.setTutorial() end
---Gets whether the player has acknowledged the video tutorials (useful if you are makingyour own tutorial).
---@return boolean videoTutorialCompleted `true` if on a dedicated server.
function server.getVideoTutorial() end
---Returns true if the host player is a developer of the game.
---@return boolean isDev True if host is game developer.
function server.isDev() end
---Returns true if the server has the "Search and Destroy" DLC active.
---@return boolean isEnabled True if Search and Destroy DLC is enabled.
function server.dlcWeapons() end
---Returns true if the server has the "Industrial Frontier" DLC active.
---@return boolean isEnabled True if Indutrial Frontier DLC is enabled.
function server.dlcArid() end
---Returns true if the server has the "Space" DLC active.
---@return boolean isEnabled True if Space DLC is enabled.
function server.dlcSpace() end

---@alias SeasonalEvents
---| 0 None
---| 1 Halloween
---| 2 Christmas

---Returns the ID of the current active seasonal event.
---@return SeasonalEvents SeasonalEvent Active seasonal events.
function server.getSeasonalEvent() end
