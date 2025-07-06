-- Lua script of map tile_dynamic_npc_2.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

function Harry_potter:on_interaction()
    game:start_dialog("tile_dynamic.harry_potter.magie_2")
    sol.timer.start(map, 200, function()
        map:set_entities_enabled("rocher_", false)
        game:start_dialog("tile_dynamic.harry_potter.tadam")
    end)
end
