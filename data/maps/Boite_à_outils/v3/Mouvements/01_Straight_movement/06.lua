-- Lua script of map mouvement_npc_9.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function map:on_started()
    local mouvement = sol.movement.create("straight")
    mouvement:set_speed(64)
    mouvement:set_angle(math.pi / 2)
    mouvement:start(poulet)
end
