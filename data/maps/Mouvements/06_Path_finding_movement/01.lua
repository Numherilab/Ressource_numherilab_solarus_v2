-- Lua script of map mouvement_npc_14.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function map:on_started()
    local movement = sol.movement.create("path_finding")
    movement:set_speed(50)
    movement:set_target(hero)
    movement:start(bob)
end
