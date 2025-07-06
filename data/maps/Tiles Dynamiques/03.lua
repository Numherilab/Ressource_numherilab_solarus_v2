-- Lua script of map tile dynamic npc.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function map:on_started()

function Harry_potter:on_interaction()
    game:start_dialog("tile_dynamic.harry_potter.magie")
    sol.timer.start(map, 200, function()
        map:set_entities_enabled("map_tile_tile_dynamic_escalier", true)
        game:start_dialog("tile_dynamic.harry_potter.tadam")
    end)
end
end