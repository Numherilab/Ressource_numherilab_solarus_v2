-- Lua script of map camera/02.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()
camera_shake = require("scripts/scripts_tutoriel/camera_shake")

function tremblementdeterre:on_activated()
camera_shake:shake(map:get_camera())
end